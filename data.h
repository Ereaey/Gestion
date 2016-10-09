#ifndef DATA_H
#define DATA_H

#include <QString>
#include <QMap>
#include <QVector>
#include <QDate>
#include "treeitem.h"
#include "treemodel.h"

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
    QDate dateCreation;
    QDate dateModif;
    QString version;
    QString id;
};

struct UserCommu
{
    User *user;

    QVector<Domaine*> domainesDoublon;
    //QVector<Domaine*> domainesPerimee;

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

struct Communaute;

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
    TreeItem *t;
    Communaute *commu;
};

struct Communaute
{
    QString name;
    NoteCommu *note;

    Domaine *root;
    Model rootTree;

    QVector<Goal*> goalsMembers;

    QMap<QString, UserCommu*> users;
    QMap<QString, Domaine*> domaines;
    QMap<QString, Domaine*> domainesKey;
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
    QVector<UserCommu*> usersNonTrouve;

    QVector<UserCommu*> usersPerimee;//Date dépassée
    QVector<Domaine*> domainesPerimee;//Date dépassée user


    QVector<Document*> documentsVide;//Sans PJ
    QVector<Document*> documentsSurcharge;//Sans PJ
    QMap<int, Document*> documentsConfidentialitees;
    QMap<int, QVector<Document*>> documentsPJ;
};

enum typeDoc{C0, C1, C2, C3, C4};
enum statutDoc{Publie, Annule, Travail};

class Data : public QObject
{
    Q_OBJECT
    public:
        Data(Model* tree);
        void addUser(QString identifiant, QString nom, QString prenom);
        void addGoal(QString nom, QString ID, QString identifiantResponsable, QString etat);
        void addGoalMember(QString idGoal, QString idMember);
        void addCommunaute(QString name, QStringList goals);
        void addDomaine(QString nameCommu, QString nameDomaine, QString IdDomaine, QString IdDomaineParent,
                        QStringList GOALsmodificateurs, QStringList GOALsLecteurs, QString responsable);
        void addDocument(QString name, QString idDomaine, QString version, QString proprietaire, QString id,
                         QString dateCreation, QString dateModif, QString nbPj, QString namePj);
        QMap<QString, Communaute*> getCommus(){ return communautes;}
        void setCurrentCommu(QString name);
        Communaute* getCurrentCommu(){return c_actu;}

    public slots:
        void generateTree();
        void generateData();
        void drawTree(QString goal, bool modif, bool lecteur);
        void drawTree(QString domaine);

    private:
        void recursiveOpen(int id);
        QMap<QString, User*> userId;
        QMap<QString, QVector <User*>> userPrenomNom;
        QMap<QString, QVector<User*>> userNomPrenom;

        QMap<QString, Goal*> goalId;
        QMap<QString, Goal*> goalNom;

        QMap<QString, Communaute*> communautes;
        Communaute* c_actu;

        QMap<int, Domaine*> domaines;
        QVector<Domaine*> domainesV;

        Model* treeMo;
};

#endif // DATA_H
