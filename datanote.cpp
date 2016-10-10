#include "datanote.h"

DataNote::DataNote(Data *d, QObject *parent) : QObject(parent)
{
    m_d = d;
}
