#ifndef FILECSV_H
#define FILECSV_H

#include <QObject>
#include <QVector>
#include <QFile>
#include <QTextStream>
#include <QFileInfo>
#include <QCoreApplication>

struct DataCSV
{
    QVector<QString> value;
};

class FileCSV
{
    public:
        FileCSV(QString path);
        ~FileCSV();
        QString getData(int line, int value);
        int getNumberLines();
        QString getName();
        QString getData(int line, QString col);

    private:
        QVector<DataCSV*> lines;
        QMap<QString, int> cols;
        QString m_name;
};

#endif // FILECSV_H
