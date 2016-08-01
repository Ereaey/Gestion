#include "data.h"

Data::Data()
{

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
