#ifndef EXPORTRESULT_H
#define EXPORTRESULT_H

#include "treatment.h"
#include <QObject>

class ExportResult : public QObject
{
    Q_OBJECT
    public:
        explicit ExportResult(Treatment *t, QObject *parent = 0);

    signals:

    public slots:

    private:
        Treatment *m_treatment;
};

#endif // EXPORTRESULT_H
