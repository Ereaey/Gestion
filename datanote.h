#ifndef DATANOTE_H
#define DATANOTE_H

#include <QObject>
#include "data.h"

class DataNote : public QObject
{
    Q_OBJECT
    public:
        explicit DataNote(Data *d, QObject *parent = 0);


        Q_PROPERTY(int note READ note NOTIFY noteChanged)
        Q_PROPERTY(int nbUser READ nbUser NOTIFY nbUserChanged)
        Q_PROPERTY(int nbDomaine READ nbDomaine NOTIFY nbDomaineChanged)
        Q_PROPERTY(int nbDocument READ nbDocument NOTIFY nbDocumentChanged)
        Q_PROPERTY(int nbGoal READ nbGoal NOTIFY nbGoalChanged)
        Q_PROPERTY(int niveau READ niveau NOTIFY niveauChanged)

        int note()
        {
            return m_d->getCurrentCommu()->note;
        }
        int nbUser()
        {
            return m_d->getCurrentCommu()->users.size();
        }
        int nbDomaine()
        {
            return m_d->getCurrentCommu()->domaines.size();
        }
        int nbDocument()
        {
            return m_d->getCurrentCommu()->documents.size();
        }
        int nbGoal()
        {
            return m_d->getCurrentCommu()->goals.size();
        }
        int niveau()
        {
            return m_d->getCurrentCommu()->niveau;
        }

    Q_SIGNALS:
        void noteChanged();
        void  nbUserChanged();
        void  nbDomaineChanged();
        void  nbDocumentChanged();
        void nbGoalChanged();
        void niveauChanged();
        //void refreshResult();

    public slots:
        void test();

    private:
        Data *m_d;
};

#endif // DATANOTE_H
