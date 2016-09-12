#ifndef DATAGOAL_H
#define DATAGOAL_H

#include <QObject>

class DataGoal : public QObject
{
    Q_OBJECT

    signals:

    public slots:

    public:
        explicit DataGoal(QString nom, QString idgoal, QObject *parent = 0);
        Q_PROPERTY(QString nom READ nom)
        QString nom() const {return m_nom;}

        Q_PROPERTY(QString idgoal READ idgoal)
        QString idgoal() const{return m_idgoal;}

    private:
        QString m_idgoal;
        QString m_nom;
};

#endif // DATAGOAL_H
