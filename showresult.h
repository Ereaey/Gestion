#ifndef SHOWRESULT_H
#define SHOWRESULT_H

#include "treatment.h"
#include <QObject>

class ShowResult : public QObject
{
    Q_OBJECT
    public:
        explicit ShowResult(Treatment *t, QObject *parent = 0);

    signals:

    public slots:
    private:
        Treatment *m_treatment;
};

#endif // SHOWRESULT_H
