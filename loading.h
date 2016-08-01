#ifndef LOADING_H
#define LOADING_H

#include <QMutex>
#include <QThread>
#include <QFile>
#include <QDir>
#include <QFileInfo>
#include "data.h"
#include "filecsv.h"

class Loading : public QThread
{
    Q_OBJECT
    Q_PROPERTY(QString messageLoading READ messageLoading NOTIFY currentActionChanged)
    Q_PROPERTY(QString messageLoadingGlobal READ messageLoadingGlobal NOTIFY currentMessageChanged)
    Q_PROPERTY(int currentSize READ currentSize)
    Q_PROPERTY(int allSize READ allSize)
    Q_PROPERTY(bool finish READ finish NOTIFY finishChanged)

    public:
        Loading(Data *d);
        void loadFiles();
        //QML - Variables
        QString messageLoading();
        int currentSize();
        int allSize();
        QString messageLoadingGlobal() const
        {
            return m_messageLoadingGlobal;
        }
        bool finish() const
        {
            return m_finish;
        }

    Q_SIGNALS:
        void error();
        void currentActionChanged();
        void currentMessageChanged();
        void globalAction();
        void finishChanged();

    public slots:
        void load();

    protected:
        void run();

    private:
        void loadCommu();
        void loadMember();
        void loadGoal();
        void loadDocuments();
        void loadGoalMember();
        void loadDomaines();
        void setMessageLoading(QString message);

        QFileInfoList m_listDrives;

        QFileInfo m_pathDomaines;
        QFileInfo m_pathMembersInternal;
        QFileInfo m_pathMembersExternal;
        QFileInfo m_pathGoal;
        QFileInfo m_pathDocuments;
        QFileInfo m_pathCommu;
        //QFileInfo m_pathFiles;
        QFileInfo m_pathGoalMembers;

        bool m_loadDocuments;
        bool m_loadGoalMembers;
        int m_sizeAll;
        int m_sizeCurrent;//Size load

        Data *m_data;

        QString m_messageLoading;
        QString m_messageLoadingGlobal;

        QMutex mutex;

        bool m_finish;
};

#endif // LOADING_H
