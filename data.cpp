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
    userNomPrenom[u->nom + " " + u->prenom].push_back(u);
    userPrenomNom[u->prenom + " " + u->nom].push_back(u);
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
    communautes[name]->name = name;/*
    for (int i = 0; i < goals.size(); i++)
        communautes[name]->goalsMembers.push_back(goalNom[goals[i]]);*/
}

void Data::addDomaineGoal(Domaine *d, Goal *g, int grade)
{
    for (int i = 0; i < g->users.size(); i++)
    {
        addDomaineUser(d, "-" + g->users[i]->ID, grade);
    }
}

void Data::addDomaineUser(Domaine *d, QString user, int grade)
{
    if (user.isEmpty())
        return;
    QString id = user.split("-")[1].remove(" ");
    if (!d->commu->users.contains(id))
    {
        if (userId.contains(id))
        {
            UserCommu *uc = new UserCommu;
            uc->user = userId[id];
            d->commu->users[id] = uc;
            d->commu->usersInconnu.push_back(uc);
        }
        else
        {
            return;
        }
    }
    if (grade == RESPONSABLE)
    {
        d->commu->users[id]->domainesResponsable.push_back(d);
        d->responsable = d->commu->users[id];
    }
    else if (grade == GESTIONNAIRES)
        d->commu->users[id]->domainesGestionnaire.push_back(d);
    else if (grade == MODIFICATEURS_GOAL)
        d->commu->users[id]->domainesModificateurGOAL.push_back(d);
    else if (grade == LECTEURS_GOAL)
        d->commu->users[id]->domainesLecteurGOAL.push_back(d);
    else if (grade == MODIFICATEURS)
        d->commu->users[id]->domainesModificateur.push_back(d);
    else if (grade == LECTEURS)
        d->commu->users[id]->domainesLecteur.push_back(d);
}

void Data::addDomaine(QString nameCommu, QString nameDomaine, QString IdDomaine, QString IdDomaineParent, QStringList GOALsmodificateurs, QStringList GOALsLecteurs, QString responsable, QStringList gestionnaires, QStringList modificateurs, QStringList lecteurs)
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
        qDebug() << "bug commu";
        QStringList l;
        addCommunaute(nameCommu, l);
    }
    communautes[nameCommu]->domaines[d->nom] = d;
    communautes[nameCommu]->domainesKey[IdDomaine] = d;
    d->commu = communautes[nameCommu];

    if (d->id_parent == 0)
        communautes[nameCommu]->root = d;

    addDomaineUser(d, responsable, RESPONSABLE);

    for (int i = 0; i < GOALsmodificateurs.size(); i++)
    {
        QString g = GOALsmodificateurs[i].replace(" ", "");
        if (g != "" && !goalNom.contains(g))
        {
            Goal *go = new Goal;
            go->nom = g;
            go->etat = "Non trouvé";

            goalNom[g] = go;
            communautes[nameCommu]->goalsInexistants.append(go);
        }
        if (goalNom.contains(g))
        {
            addDomaineGoal(d, goalNom[g], MODIFICATEURS_GOAL);
            communautes[nameCommu]->domainesGoalModificateurs[g].push_back(d);
            communautes[nameCommu]->domainesGoal[g].push_back(d);
            communautes[nameCommu]->goals[g] = goalNom[g];
        }
    }

    for (int i = 0; i < GOALsLecteurs.size(); i++)
    {
        QString g = GOALsLecteurs[i].replace(" ", "");
        if (g != "" && !goalNom.contains(g))
        {
            Goal *go = new Goal;
            go->nom = g;
            go->etat = "Non trouvé";

            goalNom[g] = go;
            communautes[nameCommu]->goalsInexistants.append(go);
        }
        if (goalNom.contains(g))
        {
            addDomaineGoal(d, goalNom[g], LECTEURS_GOAL);
            communautes[nameCommu]->domainesGoalLecteurs[g].push_back(d);
            communautes[nameCommu]->goals[g] = goalNom[g];
            if (GOALsmodificateurs.contains(g))
                communautes[nameCommu]->domainesDoublon.push_back(d);
            else
                communautes[nameCommu]->domainesGoal[g].push_back(d);
        }
    }

    for (int i = 0; i < gestionnaires.size(); i++)
        addDomaineUser(d, gestionnaires[i], GESTIONNAIRES);

    for (int i = 0; i < modificateurs.size(); i++)
        addDomaineUser(d, modificateurs[i], MODIFICATEURS);

    for (int i = 0; i < lecteurs.size(); i++)
        addDomaineUser(d, lecteurs[i], LECTEURS);


    domainesV.push_back(d);
}

void Data::addDocument(QString name, QString idDomaine, QString version, QString proprietaire, QString id, QString dateCreation, QString dateModif, QString nbPj, QString namePj)
{
    if (domaines.contains(idDomaine.toInt()))
    {
        if (id.isEmpty())
            return;
        if (version.isEmpty())
            return;
        if (name.isEmpty())
            return;
        if (proprietaire.isEmpty())
            return;

        Document *d = new Document;
        d->nom = name;
        d->domaine = domaines[idDomaine.toInt()];
        d->version = version;
        d->dateCreation = QDate::fromString(dateCreation, "dd/MM/yyyy");
        d->dateModif = QDate::fromString(dateModif, "dd/MM/yyyy");
        d->nombresPJ = nbPj.toInt();
        if (!namePj.isEmpty())
            d->nombresPJ++;
        if (d->nombresPJ == 0)
        {
            d->domaine->commu->documentsVide.push_back(d);
        }
        if (d->nombresPJ > 50)
        {
            d->domaine->commu->documentsSurcharge.push_back(d);
        }

        d->domaine->commu->documents[id] = d;

        if (domaines[idDomaine.toInt()]->commu->users.contains(proprietaire.split("-")[1].remove(" ")))
            d->proprietaire = domaines[idDomaine.toInt()]->commu->users[proprietaire.split("-")[1].remove(" ")];
        else
        {
            QString pro = proprietaire.split("-")[1].remove(" ");
            if (!userId.contains(pro))
            {
                userId[pro] = new User;
                userId[pro]->nom = proprietaire.split("-")[0];
                userId[pro]->prenom = "(Utilisateur inconnu)";
                userId[pro]->ID = pro;
                //d->domaine->commu->usersNonTrouve.push_back(userId[pro]);
            }
            UserCommu *uC = new UserCommu;
            uC->user = userId[pro];

            domaines[idDomaine.toInt()]->commu->users[pro] = uC;
            domaines[idDomaine.toInt()]->commu->usersInconnu.push_back(uC);

            d->proprietaire = domaines[idDomaine.toInt()]->commu->users[proprietaire.split("-")[1].remove(" ")];
        }
        d->id = id;
        domaines[idDomaine.toInt()]->documents.append(d);
    }
}

void Data::generateData()
{
    foreach (QString key, communautes.keys())
    {
        foreach(QString name, communautes[key]->goals.keys())
        {
            if (communautes[key]->goals[name]->users.size() == 0 && !communautes[key]->goals[name]->ID.isEmpty())
                communautes[key]->goalsVides.append(communautes[key]->goals[name]);
            if (communautes[key]->goals[name]->etat != "OPERATIONNEL")
                communautes[key]->goalsInexistants.append(communautes[key]->goals[name]);
        }
        foreach(QString name, communautes[key]->domaines.keys())
        {
            if (communautes[key]->domaines[name]->documents.size() == 0 && communautes[key]->domaines[name]->enfants.size() == 0)
                communautes[key]->domainesVides.append(communautes[key]->domaines[name]);
            if (communautes[key]->domaines[name]->documents.size() > 10)
                communautes[key]->domainesPlein.append(communautes[key]->domaines[name]);
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
