#ifndef DATA_H
#define DATA_H

#include <QString>
#include <QMap>
#include <QVector>
#include <QDate>

struct UserCommu;
struct Domaine;

struct User
{
    QString ID;
    QString nom, prenom;
};

struct Goal
{
    QString nom;
    QString ID;
    QVector<User*> users;
    User *responsable;
    QString etat;
};

struct Document
{
    QString nom;
    int Confidentialitee;
    int nombresPJ;
    UserCommu *proprietaire;
    Domaine *domaine;
    int statutDoc;
    QDate date;
};

struct Domaine
{
    QString nom;
    int id, id_parent;
    UserCommu *responsable;
    QVector<Document*> documents;
    QVector<Document*> documentsVide;
    QVector<Document*> documentsPlein;

    Domaine *parent;
    QVector<Domaine*> enfants;
};

struct UserCommu
{
    User *user;

    QVector<Domaine*> domainesDoublon;
    QVector<Domaine*> domainesPerimee;

    QVector<Domaine*> domainesResponsable;
    QVector<Domaine*> domainesGestionnaire;
    QVector<Domaine*> domainesModificateur;
    QVector<Domaine*> domainesLecteur;

    QVector<Domaine*> domainesModificateurGOAL;//via goal
    QVector<Domaine*> domainesLecteurGOAL;//via goal
};


struct NoteCommu
{

};

struct Communaute
{
    QString name;
    NoteCommu *note;

    Domaine *root;

    QVector<Goal*> goalsMembers;

    QMap<QString, UserCommu*> users;
    QMap<QString, Domaine*> domaines;
    QMap<QString, Goal*> goals;
    QMap<QString, Document*> documents;

    QVector<Goal*> goalsVides;
    QVector<Goal*> goalsInexistants;

    QMap<QString, QVector<Domaine*>> domainesGoalModificateurs;
    QMap<QString, QVector<Domaine*>> domainesGoalLecteurs;
    QMap<QString, QVector<Domaine*>> domainesGoal;

    QVector<Domaine*> domainesVides;
    QVector<Domaine*> domainesPlein;//+10 documents

    QVector<Domaine*> domainesDoublon;
    QVector<UserCommu*> usersDoublon;

    QVector<UserCommu*> usersInconnu;//Plus dans les membres de la communauté

    QVector<UserCommu*> usersPerimee;//Date dépassée
    QVector<Domaine*> domainesPerimee;//Date dépassée user


    QVector<Document*> documentsVide;//Sans PJ
    QMap<int, Document*> documentsConfidentialitees;
    QMap<int, QVector<Document*>> documentsPJ;
};

enum typeDoc{C0, C1, C2, C3, C4};
enum statutDoc{Publie, Annule, Travail};

class Data
{
    public:
        Data();
        void addUser(QString identifiant, QString nom, QString prenom);
        void addGoal(QString nom, QString ID, QString identifiantResponsable, QString etat);
        void addGoalMember(QString idGoal, QString idMember);
        void addCommunaute(QString name, QStringList goals);
        void addDomaine(QString nameCommu, QString nameDomaine, QString IdDomaine, QString IdDomaineParent, QStringList GOALsmodificateurs, QStringList GOALsLecteurs,
                        QString responsable);

    private:
        QMap<QString, User*> userId;
        QMap<QString, User*> userPrenomNom;
        QMap<QString, User*> userNomPrenom;

        QMap<QString, Goal*> goalId;
        QMap<QString, Goal*> goalNom;

        QMap<QString, Communaute*> communautes;
};

#endif // DATA_H
