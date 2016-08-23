#ifndef DATAINTERFACE_H
#define DATAINTERFACE_H

#include <QObject>

class DataInterface : public QObject
{
    Q_OBJECT
    public:
        explicit DataInterface(QObject *parent = 0);

    signals:

    public slots:
};

#endif // DATAINTERFACE_H
