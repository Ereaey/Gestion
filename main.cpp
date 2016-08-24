#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loading.h"
#include "data.h"
#include "treatment.h"
#include "showresult.h"
#include "exportresult.h"
#include <QQmlContext>
#include "treemodel.h"
#include "treeitem.h"
#include <QList>
#include <QVariant>
#include "datadomaine.h"

/*
QList<QVariant> g;
g << "qsdsd" << "qsdsd";
TreeItem *root = new TreeItem(g);

TreeModel *tree = new TreeModel("");
tree->rootItem->appendChild(root);
    engine.rootContext()->setContextProperty("treetest", tree);
*/

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Model *m = new Model;
    Data *d = new Data(m);
    Loading *l = new Loading(d);
    Treatment *t = new Treatment(d);
    ExportResult *e = new ExportResult(t);
    ShowResult *s = new ShowResult(t);

    QList<QObject*> dataList;
    dataList.append(new DataDomaine("Item 1", "red"));

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("loading", l);
    engine.rootContext()->setContextProperty("show", s);
    engine.rootContext()->setContextProperty("export", e);
    engine.rootContext()->setContextProperty("tree", m);
    engine.rootContext()->setContextProperty("dataT", d);
    engine.rootContext()->setContextProperty("listDomaine", QVariant::fromValue(dataList));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
