#include "exportresult.h"

ExportResult::ExportResult(Treatment *t, QObject *parent) : QObject(parent)
{
    m_treatment = t;
}
