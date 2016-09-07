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
        communautes[nameCommu]->domainesGoalModificateurs[g].push_back(d);
        communautes[nameCommu]->domainesGoal[g].push_back(d);
    }

    for (int i = 0; i < GOALsLecteurs.size(); i++)
    {
        QString g = GOALsLecteurs[i].replace(" ", "");
        communautes[nameCommu]->domainesGoalLecteurs[g].push_back(d);
        if (GOALsmodificateurs.contains(g))
        {
            communautes[nameCommu]->domainesDoublon.push_back(d);
            //qDebug() << g << GOALsmodificateurs;
        }
        else
            communautes[nameCommu]->domainesGoal[g].push_back(d);
    }
    domainesV.push_back(d);
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

void Data::drawTree(QString goal)
{
    for (int key = 0; key < domainesV.size(); key++)
    {
        domainesV[key]->t->setIsOpen(false);
        domainesV[key]->t->setIsSelect(false);
    }
    if (goal.isEmpty())
        return;
    for(int i = 0; i < c_actu->domainesGoal[goal].size(); i++)
    {
        c_actu->domainesGoal[goal][i]->t->setIsSelect(true);
        if (c_actu->domainesGoal[goal][i]->id_parent != 0)
            recursiveOpen(c_actu->domainesGoal[goal][i]->id_parent);
    }
}

void Data::recursiveOpen(int id)
{
    domaines[id]->t->setIsOpen(true);
    if (domaines[id]->id_parent != 0)
        recursiveOpen(domaines[id]->id_parent);
}
