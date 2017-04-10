#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QtWebView::initialize();
    QQmlApplicationEngine engine;
    engine.addImportPath("D:/QMLStudy/cloudmusic/Modules");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
