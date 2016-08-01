#include "showresult.h"

ShowResult::ShowResult(Treatment *t, QObject *parent) : QObject(parent)
{
    m_treatment = t;
}
