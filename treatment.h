#ifndef TREATMENT_H
#define TREATMENT_H

#include "data.h"
#include <QThread>
#include "datacommu.h"
#include <QVariant>
#include "datagoal.h"

class Treatment : public QThread
{
    Q_OBJECT
    Q_PROPERTY(bool finish READ finish NOTIFY finishChanged)
    Q_PROPERTY(QVariant commu READ commu NOTIFY refreshCommu)
    Q_PROPERTY(QVariant result READ result NOTIFY refreshResult)

    enum t{SEARCH_GOAL_MODIF, SEARCH_GOAL_LECT, SEARCH_GOAL, SEARCH_GOAL_VIDE};
    public:
        Treatment(Data *d);
        Q_INVOKABLE void searchGoal(QString goal, bool modificateur, bool lecteur);
        bool finish() const;
        QVariant result() const{return QVariant::fromValue(m_result);}
        QVariant commu() const{return QVariant::fromValue(m_commu);}
        Q_INVOKABLE void setCommu(QString name);
        Q_INVOKABLE void load();
        Q_INVOKABLE void searchGoalsVide();


    private:
        Data *m_data;
        bool m_finish;
        int m_type;
        QString m_goal;
        QString m_currentAction;
        QString m_currentCommu;
        QList<QObject*> m_commu;
        QList<QObject*> m_result;

    Q_SIGNALS:
        void finishChanged();
        void refreshCommu();
        void refreshResult();

    public slots:

    protected:
        void run();

};

#endif // TREATMENT_H
