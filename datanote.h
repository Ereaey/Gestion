#ifndef DATANOTE_H
#define DATANOTE_H

#include <QObject>
#include "data.h"

class DataNote : public QObject
{
    Q_OBJECT
    public:
        explicit DataNote(Data *d, QObject *parent = 0);

    /*
        Q_PROPERTY(bool finish READ finish NOTIFY finishChanged)
        Q_PROPERTY(QVariant result READ result NOTIFY refreshResult)

        Q_INVOKABLE void search(QString name);

        bool finish() const{return m_finish;}
        QVariant result() const{return QVariant::fromValue(m_result);}
*/
    Q_SIGNALS:
        void finishChanged();
        void refreshResult();


    private:
        Data *m_d;
};

#endif // DATANOTE_H
