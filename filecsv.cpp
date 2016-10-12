#include "filecsv.h"
#include <QDebug>

FileCSV::FileCSV(QString path, bool thread, QMutex *mutex)
{
    m_mutex = mutex;
    m_path = path;
    if (thread == true)
    {
        start();
        return;
    }
    QFile file(path);
    if (!file.open(QIODevice::ReadOnly))
            return;

    QFileInfo file1(path);
    m_name = file1.fileName();
    QString a;
    a += QChar(0x0D);
    a += QChar(0x0A);
    QByteArray dataFile = file.readAll();
    file.close();
    dataFile.replace(a, "");
    QString d = QString::fromLatin1(dataFile);
    QTextStream in(&d);
    in.setCodec("UTF-8");

    QStringList listeData;

    while (!in.atEnd())
    {
        QString line = in.readLine();
        if (line.at(0) == QChar('"') && (line.at(line.size() - 1) == QChar('"') || line.at(line.size() - 1) == QChar(';')))
        {
            line.replace(" ; ", " | ");
            listeData = line.split(";");
            QVector<QString> d;
            bool e = true;
            for (int i = 0; i < listeData.size(); i++)
            {
                QString temp = listeData.at(i);
                if (temp.count(QChar('"')) == 1)
                    e = false;
                d.push_back(temp.remove(QChar('"'), Qt::CaseInsensitive));
            }
            if (e == true)
                lines.push_back(d);
        }
    }

    QString chaine;
    for (int it = 0; it < 5; it++)
    {
        for (int i = 0; i < 26; i++)
        {
            chaine.clear();
            if (it != 0)
                chaine += QChar('A' + (it - 1));
            chaine += QChar('A' + i);
            cols[chaine] = i + it * 26;
        }
    }

    dataFile.clear();
}

FileCSV::~FileCSV()
{
    //for (int i = 0; i < lines.size(); i++)
    //    qDeleteAll(lines[i]);
    //qDeleteAll(lines);
}

void FileCSV::run()
{
    m_mutex->lock();

    QFile file(m_path);
    if (!file.open(QIODevice::ReadOnly))
            return;

    QFileInfo file1(m_path);
    m_name = file1.fileName();
    QString a;
    a += QChar(0x0D);
    a += QChar(0x0A);
    QByteArray dataFile = file.readAll();
    file.close();
    dataFile.replace(a, "");
    QString d = QString::fromLatin1(dataFile);
    QTextStream in(&d);
    in.setCodec("UTF-8");

    QStringList listeData;

    while (!in.atEnd())
    {
        QString line = in.readLine();
        if (line.at(0) == QChar('"') && (line.at(line.size() - 1) == QChar('"') || line.at(line.size() - 1) == QChar(';')))
        {
            line.replace(" ; ", " | ");
            listeData = line.split(";");
            QVector<QString> d;
            bool e = true;
            for (int i = 0; i < listeData.size(); i++)
            {
                QString temp = listeData.at(i);
                if (temp.count(QChar('"')) == 1)
                    e = false;
                d.push_back(temp.remove(QChar('"'), Qt::CaseInsensitive));
            }
            if (e == true)
                lines.push_back(d);
        }
    }

    QString chaine;
    for (int it = 0; it < 5; it++)
    {
        for (int i = 0; i < 26; i++)
        {
            chaine.clear();
            if (it != 0)
                chaine += QChar('A' + (it - 1));
            chaine += QChar('A' + i);
            cols[chaine] = i + it * 26;
        }
    }

    dataFile.clear();

    m_mutex->unlock();
}

QString FileCSV::getData(int line, int value)
{
    if (value >= lines[line].size())
        return "";
    else
        return lines[line][value];
}

QString FileCSV::getData(int line, QString col)
{
    if (cols[col] >= lines[line].size())
        return "";
    else
        return lines[line][cols[col]];
}

int FileCSV::getNumberLines()
{
    return lines.size();
}

QString FileCSV::getName()
{
    return m_name;
}
