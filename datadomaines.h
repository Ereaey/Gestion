#ifndef DATADOMAINES_H
#define DATADOMAINES_H

#include <QObject>
#include <QVariant>
#include "datadomaine.h"

class DataDomaines : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant domaines READ domaines NOTIFY refreshDomaine)

    public:
        explicit DataDomaines(QObject *parent = 0);
        QVariant domaines() const{return QVariant::fromValue(m_domaines);}
        Q_INVOKABLE void addDomaine(QString name, QString id);

    signals:
        void refreshDomaine();

    public slots:

    private:
        QList<QObject*> m_domaines;

};

#endif // DATADOMAINES_H
