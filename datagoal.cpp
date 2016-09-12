#include "datagoal.h"

DataGoal::DataGoal(QString nom, QString idgoal, QObject *parent) : QObject(parent)
{
    m_nom = nom;
    m_idgoal = idgoal;
}
