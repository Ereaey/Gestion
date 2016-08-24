#ifndef DATADOMAINE_H
#define DATADOMAINE_H

#include <QObject>

class DataDomaine : public QObject
{
    Q_OBJECT
    public:
        explicit DataDomaine(QString nom, QString iddomaine, QObject *parent = 0);

        Q_PROPERTY(QString nom READ nom WRITE setNom)
        QString nom() const;
        void setNom(QString nom);

        Q_PROPERTY(QString iddomaine READ iddomaine WRITE setIddomaine)
        QString iddomaine() const;
        void setIddomaine(QString iddomaine);
    private:
        QString m_iddomaine;
        QString m_nom;
};

#endif // DATADOMAINE_H
