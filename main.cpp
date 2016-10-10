#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loading.h"
#include "data.h"
#include "treatment.h"
#include "exportresult.h"
#include <QQmlContext>
#include "treemodel.h"
#include "treeitem.h"
#include <QList>
#include <QVariant>
#include "datadomaines.h"
#include "autocompletgoal.h"
#include "autocompletuser.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    autoCompletGoal *autoComplet = new autoCompletGoal();
    autoCompletUser *autoCompletU = new autoCompletUser();

    Model *m = new Model;
    Data *d = new Data(m);
    Loading *l = new Loading(d, autoComplet, autoCompletU);
    Treatment *t = new Treatment(d);
    ExportResult *e = new ExportResult(t);
    DataDomaines *ds = new DataDomaines();

    //ds->addDomaine("test", "111");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("loading", l);
    engine.rootContext()->setContextProperty("export", e);
    engine.rootContext()->setContextProperty("tree", m);
    engine.rootContext()->setContextProperty("dataT", d);
    engine.rootContext()->setContextProperty("listDomaine", ds);
    engine.rootContext()->setContextProperty("treatment", t);
    engine.rootContext()->setContextProperty("autoComplet", autoComplet);
    engine.rootContext()->setContextProperty("autoCompletUser", autoCompletU);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
