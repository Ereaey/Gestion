#include "datadomaines.h"

DataDomaines::DataDomaines(QObject *parent) : QObject(parent)
{

}

void DataDomaines::addDomaine(QString name, QString id)
{
    m_domaines.append(new DataDomaine(name, id));
    emit refreshDomaine();
}
