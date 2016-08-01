#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loading.h"
#include "data.h"
#include "treatment.h"
#include "showresult.h"
#include "exportresult.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Data *d = new Data();
    Loading *l = new Loading(d);
    Treatment *t = new Treatment(d);
    ExportResult *e = new ExportResult(t);
    ShowResult *s = new ShowResult(t);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("loading", l);
    engine.rootContext()->setContextProperty("show", s);
    engine.rootContext()->setContextProperty("export", e);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
