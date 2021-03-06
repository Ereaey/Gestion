#include "loading.h"
#include <QDebug>
#include <assert.h>
#include <QDirIterator>

Loading::Loading(Data *d, autoCompletGoal *a, autoCompletUser *u)
{
    //m_listDrives = QDir::drives();
    m_listDrives += QFileInfo("C:/fichiersGestion");
    m_data = d;
    m_sizeCurrent = 0;
    m_sizeAll = 100;
    m_finish = false;
    m_a = a;
    m_u = u;
}

int Loading::currentSize()
{
    int i;
    mutex.lock();
    i = m_sizeCurrent;
    mutex.unlock();
    return i;
}

int Loading::allSize()
{
    int i;
    mutex.lock();
    i = m_sizeAll;
    mutex.unlock();
    return i;
}

void Loading::loadFiles()
{
    QStringList t;
    t.append("externalID*.csv");
    t.append("internalID*.csv");
    t.append("Plans_de_communautes_*.csv");
    t.append("ssl_goal_pressi*.csv");
    t.append("ssl_membre_pressi*.csv");
    t.append("Audits_des_documents_*.csv");
    t.append("Liste_de_communautés_*.csv");
    QString file;
    foreach(const QFileInfo& FileInfo, m_listDrives)
    {
         QDirIterator it(FileInfo.filePath(), t, QDir::Files, QDirIterator::Subdirectories);
         while (it.hasNext())
         {
             file = it.next();
             if (file.contains("externalID"))
                if (m_pathMembersExternal.lastModified() < QFileInfo(file).lastModified())
                    m_pathMembersExternal = QFileInfo(file);

            if (file.contains("internalID"))
               if (m_pathMembersInternal.lastModified() < QFileInfo(file).lastModified())
                   m_pathMembersInternal = QFileInfo(file);

            if (file.contains("Plans_de_communautes_"))
              m_pathDomaines.push_back(QFileInfo(file));

            if (file.contains("Liste_de_communautés_"))
              m_pathCommu.push_back(QFileInfo(file));

            if (file.contains("ssl_goal_pressi"))
             if (m_pathGoal.lastModified() < QFileInfo(file).lastModified())
                 m_pathGoal = QFileInfo(file);

             if (file.contains("ssl_membre_pressi"))
                if (m_pathGoalMembers.lastModified() < QFileInfo(file).lastModified())
                    m_pathGoalMembers = QFileInfo(file);

            if (file.contains("Audits_des_documents_"))
               m_pathDocuments.push_back(QFileInfo(file));

         }
    }
    if (!m_pathMembersExternal.isReadable())
        emit error();
}

void Loading::loadMember()
{
    FileCSV fileInterne(m_pathMembersInternal.absoluteFilePath());
    setMessageLoading("Chargement des membres internes.. 0 / " + QString::number(fileInterne.getNumberLines()));
    emit currentActionChanged();
    for (int i = 1; i < fileInterne.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileInterne.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        QString id = fileInterne.getData(i, 0);
        QString nom =  fileInterne.getData(i, 1);
        QString prenom =  fileInterne.getData(i, 2);

        m_data->addUser(id, nom, prenom);
        m_u->addUser(nom + " " + prenom, id);
        m_u->addUser(prenom + " " + nom, id);

        setMessageLoading("Chargement des membres internes.. " + QString::number(i) + " / " + QString::number(fileInterne.getNumberLines()));
    }

    FileCSV fileExterne(m_pathMembersExternal.absoluteFilePath());
    setMessageLoading("Chargement des membres externes.. 0 / " + QString::number(fileExterne.getNumberLines()));
    emit currentActionChanged();
    for (int i = 1; i < fileExterne.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileExterne.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        QString id = fileExterne.getData(i, 0);
        QString nom =  fileExterne.getData(i, 1);
        QString prenom =  fileExterne.getData(i, 2);

        m_data->addUser(id, nom, prenom);

        m_u->addUser(nom + " " + prenom, id);
        m_u->addUser(prenom + " " + nom, id);

        setMessageLoading("Chargement des membres.. " + QString::number(i) + " / " + QString::number(fileExterne.getNumberLines()));
    }
}

void Loading::loadGoal()
{
    FileCSV fileGoal(m_pathGoal.absoluteFilePath());
    setMessageLoading("Chargement des goals.. 0 / " + QString::number(fileGoal.getNumberLines()));
    emit currentActionChanged();
    for (int i = 2; i < fileGoal.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileGoal.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        QString id = fileGoal.getData(i, 0);
        QString nom =  fileGoal.getData(i, 1);
        QString etat =  fileGoal.getData(i, "D");
        QString idResp =  fileGoal.getData(i, "K");

        m_data->addGoal(nom, id, idResp, etat);
        m_a->addGoal(nom);

        setMessageLoading("Chargement des goals.. " + QString::number(i) + " / " + QString::number(fileGoal.getNumberLines()));

    }
}

void Loading::loadCommu()
{
    for (int i = 0; i < m_pathCommu.size(); i++)
    {
    FileCSV fileCommu(m_pathCommu[i].absoluteFilePath());
    qDebug() << QString::number(fileCommu.getNumberLines());
    setMessageLoading("Chargement des communautes.. 0 / " + QString::number(fileCommu.getNumberLines()));
    emit currentActionChanged();
    for (int i = 1; i < fileCommu.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileCommu.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        QString nom =  fileCommu.getData(i, 1);
        QStringList goals =  fileCommu.getData(i, "Y").split(",");

        m_data->addCommunaute(nom, goals);


        setMessageLoading("Chargement des communautes.. "+  QString::number(i) + " / " + QString::number(fileCommu.getNumberLines()));

    }
    }
}

void Loading::loadGoalMember()
{
    //qDebug() << m_pathGoalMembers.absoluteFilePath();
    FileCSV fileGoalMember(m_pathGoalMembers.absoluteFilePath());
    setMessageLoading("Chargement des membres appartenant au goal.. 0 / " + QString::number(fileGoalMember.getNumberLines()));
    emit currentActionChanged();
    for (int i = 2; i < fileGoalMember.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileGoalMember.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        QString id = fileGoalMember.getData(i, 0);
        QString nom =  fileGoalMember.getData(i, 2);

        m_data->addGoalMember(id, nom);

        setMessageLoading("Chargement des membres appartenant au goal.. " + QString::number(i) + " / " + QString::number(fileGoalMember.getNumberLines()));
    }
}

void Loading::loadDomaines()
{
    for (int i = 0; i < m_pathDomaines.size(); i++)
    {
    //qDebug() << m_pathGoalMembers.absoluteFilePath();
    FileCSV fileDomaines(m_pathDomaines[i].absoluteFilePath());
    setMessageLoading("Chargement des domaines.. 0 / " + QString::number(fileDomaines.getNumberLines()));
    emit currentActionChanged();
    for (int i = 1; i < fileDomaines.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileDomaines.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();

        QString idDomaine = fileDomaines.getData(i, "A");
        QString idDomaineParent =  fileDomaines.getData(i, "D");
        QString nomCommu =  fileDomaines.getData(i, "AN");
        QString nomDomaine =  fileDomaines.getData(i, "B");
        QString responsable =  fileDomaines.getData(i, "L");
        QStringList GoalsModifs =  fileDomaines.getData(i, "Z").split(",");
        QStringList GoalsLecteur =  fileDomaines.getData(i, "AD").split(",");
        QStringList GoalsGest =  fileDomaines.getData(i, "O").split(",");
        QStringList Gestionnaires =  fileDomaines.getData(i, "M").split(",");
        QStringList Modificateurs =  fileDomaines.getData(i, "X").split(",");
        QStringList Lecteurs =  fileDomaines.getData(i, "AB").split(",");

        QString niveau =  fileDomaines.getData(i, "C");
        QString asser =  fileDomaines.getData(i, "S");
        QString synchro =  fileDomaines.getData(i, "T");

        m_data->addDomaine(nomCommu, nomDomaine, idDomaine, idDomaineParent, GoalsModifs, GoalsLecteur, GoalsGest, responsable, Gestionnaires, Modificateurs, Lecteurs, niveau, asser, synchro);

        setMessageLoading("Chargement des domaines.. " + QString::number(i) + " / " + QString::number(fileDomaines.getNumberLines()));
    }
    }
}

void Loading::loadDocuments()
{
    for (int i = 0; i < m_pathDocuments.size(); i++)
    {
    FileCSV fileDocuments(m_pathDocuments[i].absoluteFilePath());
    //qDebug() << m_pathGoalMembers.absoluteFilePath();
    //FileCSV fileDocuments(m_pathDocuments.absoluteFilePath());
    //qDebug() << m_pathDocuments.absoluteFilePath();
    setMessageLoading("Chargement des documents.. 0 / " + QString::number(fileDocuments.getNumberLines()));
    //emit currentActionChanged();
    for (int i = 1; i < fileDocuments.getNumberLines(); i++)
    {
        mutex.lock();
        m_sizeAll = fileDocuments.getNumberLines();
        m_sizeCurrent = i;
        mutex.unlock();
        int nb = 0;
        bool a = false;
        bool b = false;

        nb = fileDocuments.getData(i, "AZ").toInt(&a) + fileDocuments.getData(i, "BA").toInt(&b);
        if (a == false && b == false)
            nb = 0;

        m_data->addDocument(fileDocuments.getData(i, "D"),
                            fileDocuments.getData(i, "T"),
                            fileDocuments.getData(i, "B"),
                            fileDocuments.getData(i, "H"),
                            fileDocuments.getData(i, "A"),
                            fileDocuments.getData(i, "M"),
                            fileDocuments.getData(i, "O"),
                            fileDocuments.getData(i, "AI"),
                            fileDocuments.getData(i, "AD"),
                            nb, fileDocuments.getData(i, "AL"), fileDocuments.getData(i, "C"));

        setMessageLoading("Chargement des documents.. " + QString::number(i) + " / " + QString::number(fileDocuments.getNumberLines()));
    }
    }
}

void Loading::load()
{
    start();
}

void Loading::setMessageLoading(QString message)
{
    mutex.lock();
    m_messageLoading = message;
    mutex.unlock();
}

QString Loading::messageLoading()
{
    QString m;
    mutex.lock();
    m = m_messageLoading;
    mutex.unlock();
    return m;
}

void Loading::run()
{
    QMutex m;
    emit currentActionChanged();
    m_messageLoadingGlobal = "Recherche des fichiers...";
    emit currentMessageChanged();
    loadFiles();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 1 / 6";
    setMessageLoading("Chargement des membres..");
    emit currentMessageChanged();
    emit currentActionChanged();
    loadMember();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 2 / 6";
    setMessageLoading("Chargement des goals..");
    emit currentMessageChanged();
    emit currentActionChanged();
    loadGoal();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 3 / 6";
    setMessageLoading("Chargement des membres appartenant au goal..");
    emit currentMessageChanged();
    emit currentActionChanged();
    loadGoalMember();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 4 / 5";
    setMessageLoading("Chargement des communautes..");
    emit currentMessageChanged();
    emit currentActionChanged();
    loadCommu();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 5 / 6";
    setMessageLoading("Chargement des domaines..");
    emit currentMessageChanged();
    emit currentActionChanged();
    loadDomaines();
    mutex.lock();
    m_sizeCurrent = 0;
    mutex.unlock();
    m_messageLoadingGlobal = "Chargements des fichiers... 6 / 6";
    setMessageLoading("Chargement des documents..");
    emit currentMessageChanged();
    emit currentActionChanged();
    //m.lock();
    loadDocuments();
    //m.unlock();
    m_data->generateData();
    m_data->setCurrentCommu(m_data->getCommus().last()->name);
    m_finish = true;
    emit finishChanged();
    delete m_file;
}
