#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include <QQmlDebuggingEnabler>

int main(int argc, char *argv[])
{

    QQmlDebuggingEnabler enabler;

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
    );

    engine.loadFromModule("BlendViewer", "Main");

    return app.exec();
}
