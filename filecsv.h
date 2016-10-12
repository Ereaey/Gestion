#ifndef FILECSV_H
#define FILECSV_H

#include <QObject>
#include <QVector>
#include <QFile>
#include <QTextStream>
#include <QFileInfo>
#include <QCoreApplication>
#include <QThread>
#include <QMutex>

class FileCSV  : public QThread
{
    Q_OBJECT
    public:
        FileCSV(QString path, bool thread = false, QMutex *mutex = NULL);
        ~FileCSV();
        QString getData(int line, int value);
        int getNumberLines();
        QString getName();
        QString getData(int line, QString col);

    private:
        QVector<QVector<QString>> lines;
        QMap<QString, int> cols;
        QString m_name, m_path;
        QMutex *m_mutex;
        bool m_thread;

    protected:
        void run();
};

#endif // FILECSV_H
