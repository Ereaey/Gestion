#include "data.h"
#include "qdebug.h"

Data::Data(Model* tree)
{
    treeMo = tree;
}

void Data::addUser(QString identifiant, QString nom, QString prenom)
{
    User *u = new User;
    u->ID = identifiant;
    u->nom = nom;
    u->prenom = prenom;

    userId[u->ID] = u;
    userNomPrenom[u->nom + " " + u->prenom] = u;
    userPrenomNom[u->prenom + " " + u->nom] = u;
}

void Data::addGoal(QString nom, QString ID, QString identifiantResponsable, QString etat)
{
    Goal *g = new Goal;
    g->nom = nom;
    g->etat = etat;
    g->responsable = userId[identifiantResponsable];
    g->ID = ID;

    goalId[g->ID] = g;
    goalNom[g->nom] = g;
}

void Data::addGoalMember(QString idGoal, QString idMember)
{
    if (goalId.contains(idGoal) && userId.contains(idMember))
        goalId[idGoal]->users.append(userId[idMember]);
    else
        return;
}

void Data::addCommunaute(QString name, QStringList goals)
{
    communautes[name] = new Communaute;
    communautes[name]->name = name;
    for (int i = 0; i < goals.size(); i++)
        communautes[name]->goalsMembers.push_back(goalNom[goals[i]]);
}

void Data::addDomaine(QString nameCommu, QString nameDomaine, QString IdDomaine, QString IdDomaineParent, QStringList GOALsmodificateurs, QStringList GOALsLecteurs, QString responsable)
{
    Domaine *d = new Domaine;
    d->id = IdDomaine.toInt();
    d->nom = nameDomaine;
    d->id_parent = IdDomaineParent.toInt();

    domaines[d->id] = d;
    if (domaines.contains(d->id_parent))
    {
        domaines[d->id_parent]->enfants.push_back(d);
        d->parent = domaines[d->id_parent];
    }
    if (!communautes.contains(nameCommu))
    {
        QStringList l;
        addCommunaute(nameCommu, l);
    }
    communautes[nameCommu]->domaines[d->nom] = d;
    communautes[nameCommu]->domainesKey[IdDomaine] = d;
    d->commu = communautes[nameCommu];
    if (d->id_parent == 0)
    {
        communautes[nameCommu]->root = d;
    }

    QString r = responsable.split('-')[1];
    r.replace(" ", "");

    if (!communautes[nameCommu]->users.contains(r))
    {
        UserCommu *uC = new UserCommu;
        uC->user = userId[r];

        communautes[nameCommu]->users[r] = uC;
        communautes[nameCommu]->usersInconnu.push_back(uC);
    }

    d->responsable = communautes[nameCommu]->users[r];
    communautes[nameCommu]->users[r]->domainesResponsable.push_back(d);

    for (int i = 0; i < GOALsmodificateurs.size(); i++)
    {
        QString g = GOALsmodificateurs[i].replace(" ", "");
        if (goalNom.contains(g))
        {
            communautes[nameCommu]->domainesGoalModificateurs[g].push_back(d);
            communautes[nameCommu]->domainesGoal[g].push_back(d);
            communautes[nameCommu]->goals[g] = goalNom[g];
        }
    }

    for (int i = 0; i < GOALsLecteurs.size(); i++)
    {
        QString g = GOALsLecteurs[i].replace(" ", "");
        if (goalNom.contains(g))
        {
            communautes[nameCommu]->domainesGoalLecteurs[g].push_back(d);
            communautes[nameCommu]->goals[g] = goalNom[g];
            if (GOALsmodificateurs.contains(g))
                communautes[nameCommu]->domainesDoublon.push_back(d);
            else
                communautes[nameCommu]->domainesGoal[g].push_back(d);
        }
    }
    domainesV.push_back(d);
}

void Data::generateData()
{
    foreach (QString key, communautes.keys())
    {
        foreach(QString name, communautes[key]->goals.keys())
        {
            if (communautes[key]->goals[name]->users.size() == 0)
                communautes[key]->goalsVides.append(communautes[key]->goals[name]);
        }
    }
}

void Data::generateTree()
{
    for (int key = 0; key < domainesV.size(); key++)
    {
        TreeItem *t = new TreeItem(domainesV[key]->nom, domainesV[key]->id);
        domainesV[key]->t = t;
        //t->setIsOpen(true);
        if (domainesV[key]->id_parent != 0)
            domainesV[key]->parent->t->addChildItem(t);
        else
        {
            treeMo->setRoot(t);
            c_actu = domainesV[key]->commu;
        }
    }
}

void Data::drawTree(QString goal, bool modif, bool lecteur)
{
    for (int key = 0; key < domainesV.size(); key++)
    {
        domainesV[key]->t->setIsOpen(false);
        domainesV[key]->t->setIsSelect(false);
    }
    if (goal.isEmpty())
        return;
    if (modif == true && lecteur == true)
    {
        for(int i = 0; i < c_actu->domainesGoal[goal].size(); i++)
        {
            c_actu->domainesGoal[goal][i]->t->setIsSelect(true);
            if (c_actu->domainesGoal[goal][i]->id_parent != 0)
                recursiveOpen(c_actu->domainesGoal[goal][i]->id_parent);
        }
    }
    else if (modif == true && lecteur == false)
    {
        for(int i = 0; i < c_actu->domainesGoalModificateurs[goal].size(); i++)
        {
            c_actu->domainesGoalModificateurs[goal][i]->t->setIsSelect(true);
            if (c_actu->domainesGoalModificateurs[goal][i]->id_parent != 0)
                recursiveOpen(c_actu->domainesGoalModificateurs[goal][i]->id_parent);
        }
    }
    else
    {
        for(int i = 0; i < c_actu->domainesGoalLecteurs[goal].size(); i++)
        {
            c_actu->domainesGoalLecteurs[goal][i]->t->setIsSelect(true);
            if (c_actu->domainesGoalLecteurs[goal][i]->id_parent != 0)
                recursiveOpen(c_actu->domainesGoalLecteurs[goal][i]->id_parent);
        }
    }
}

void Data::drawTree(QString domaine)
{
    for (int key = 0; key < domainesV.size(); key++)
    {
        domainesV[key]->t->setIsOpen(false);
        domainesV[key]->t->setIsSelect(false);
    }
    if (domaine.isEmpty())
        return;
    if (c_actu->domainesKey.contains(domaine))
    {
        c_actu->domainesKey[domaine]->t->setIsSelect(true);
        if (c_actu->domainesKey[domaine]->id_parent != 0)
            recursiveOpen(c_actu->domainesKey[domaine]->id_parent);
    }
}

void Data::recursiveOpen(int id)
{
    domaines[id]->t->setIsOpen(true);
    if (domaines[id]->id_parent != 0)
        recursiveOpen(domaines[id]->id_parent);
}

void Data::setCurrentCommu(QString name)
{
    c_actu = communautes[name];
    treeMo->setRoot(c_actu->root->t);
}
