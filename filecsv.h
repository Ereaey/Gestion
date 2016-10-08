#ifndef FILECSV_H
#define FILECSV_H

#include <QObject>
#include <QVector>
#include <QFile>
#include <QTextStream>
#include <QFileInfo>
#include <QCoreApplication>

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
        QVector<QVector<QString>> lines;
        QMap<QString, int> cols;
        QString m_name;
};

#endif // FILECSV_H
