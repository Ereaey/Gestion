#include "datadomaines.h"

DataDomaines::DataDomaines(QObject *parent) : QObject(parent)
{

}

void DataDomaines::addDomaine(QString name, QString id)
{
    m_domaines.append(new DataDomaine(name, id));
    emit refreshDomaine();
}

void DataDomaines::deleteDomaine(QString id)
{
    for (unsigned int i = 0; i < m_domaines.size(); i++)
    {
        if (((DataDomaine*)m_domaines[i])->iddomaine() == id)
        {
            m_domaines.removeAt(i);
            emit refreshDomaine();
            return;
        }
    }
}

void DataDomaines::copy(QString id)
{
    QApplication::clipboard()->setText(id);
}
