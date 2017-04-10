#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/main.qml")));
    return app.exec();
}
