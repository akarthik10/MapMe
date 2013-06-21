#ifndef MGR_H
#define MGR_H

#endif // MGR_H
#ifndef MGR_H
#define MGR_H

#endif // MGR_H
#include <QtGui/QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QObject>
#include <QTimer>
#include <QSystemNetworkInfo>
#include <QSqlDatabase>
#include <QSqlQuery>
using namespace QtMobility;

class Mgr:public QObject{
    Q_OBJECT

public slots:
void readFinish(QNetworkReply* pReply);
Q_INVOKABLE void onCid(int cell);
void timecall();
signals:
void cellChanged(int cell);
public:QString mcc,mnc,cid,lac,shortcode,latp,lonp;
       QDeclarativeView view;
       QSystemNetworkInfo* networkInfo;
       QNetworkAccessManager m_WebCtrl;
       void set(QString property,QString value);
       void geturld(QString str);
       Mgr();
       void restoreMain();
       void tempdisp();
       QTimer* timer;
       Q_INVOKABLE void debugfn();
       Q_INVOKABLE void savescode(QString);
       Q_INVOKABLE void saveLoc(QString cell,QString lat,QString lon);
       Q_INVOKABLE bool isSaved(QString cell);
       Q_INVOKABLE void overWrite(QString cell,QString lat,QString lon);
       Q_INVOKABLE void quit();
       QSqlDatabase db;
       void dbmgr();
       void postCID();
       void postLatLng(QString,QString);
       void checkCode();
       void selectAll();
       void setAddress(QString);

};
