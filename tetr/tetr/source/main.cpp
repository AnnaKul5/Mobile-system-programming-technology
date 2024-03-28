#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "loadcheck.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    LoadCheck checker;
    QObject::connect(&engine, SIGNAL(objectCreated(QObject*,QUrl)),
                     &checker, SLOT(ComponentStatusChanged(QObject*,QUrl)));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if(checker.HasError())
        return 1;

    return app.exec();
}
