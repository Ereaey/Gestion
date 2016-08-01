#ifndef TREATMENT_H
#define TREATMENT_H

#include "data.h"

class Treatment
{
    public:
        Treatment(Data *d);
    private:
        Data *m_data;
};

#endif // TREATMENT_H
