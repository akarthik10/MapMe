#include <QtGui/QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QObject>
#include <QSystemNetworkInfo>
#include <Mgr.h>
#include <QDir>
#include <QtCore/qmath.h>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include "qmlapplicationviewer/qmlapplicationviewer.h"
using namespace QtMobility;

void Mgr::set(QString property,QString value){
  view.rootContext()->setContextProperty(property,value);
}

Mgr::Mgr(){




networkInfo = new QSystemNetworkInfo(this);
mcc = networkInfo->currentMobileCountryCode();
mnc = networkInfo->currentMobileNetworkCode();
lac = QString::number(networkInfo->locationAreaCode());
cid = QString::number(networkInfo->cellId());
view.setSource(QUrl("qrc:/qml/Locv3/LocUI.qml"));
set("mccvar",mcc);
set("mncvar",mnc);
set("lacvar",lac);
set("cidvar",cid);
set("sidebarvar","false");
view.rootContext()->setContextProperty("obj",this);
view.showFullScreen();
timer = new QTimer(this);
connect(timer, SIGNAL(timeout()), this, SLOT(timecall()));
connect(&m_WebCtrl, SIGNAL(finished(QNetworkReply*)),this,SLOT(readFinish(QNetworkReply*)));
connect(this, SIGNAL(cellChanged(int)), this, SLOT(onCid(int)));

timer->start(3000);
delete networkInfo;
networkInfo = NULL;
latp="0";
lonp="0";
set("latp",latp);
set("lonp",lonp);
db = QSqlDatabase::addDatabase("QSQLITE");
db.setDatabaseName("loc.db");
db.open();


if (db.tables().indexOf("Locations") == -1)
{
   qDebug("No DB");
   db.exec("CREATE TABLE Locations"
              "(cid TEXT PRIMARY KEY,lat TEXT,lon TEXT,address TEXT)");
}
checkCode();
onCid(cid.toInt());
 //db.close();
}


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Mgr ob;
    ob.selectAll();
    return app.exec();

}
void Mgr::readFinish(QNetworkReply* pReply){

    set("loadervar","false");
    set("sidebarvar","true");
    set("peepbarvar","true");
    QString string = pReply->readAll();
    QStringList list = string.split("|");
    qDebug()<<string;
    if(string.startsWith("OK")){
        set("addressvar",list[3]);
        set("latvar",list[1]);
        set("lonvar",list[2]);
        latp=list[1];
        lonp=list[2];
        set("latp",latp);
        set("lonp",lonp);
        //set("tapmode","true");
        QTime t;
        set("infotxt","  Last Updated : "+t.currentTime().toString("hh:mm A")+"\nLocation Incorrect? Click Here");
        set("shownocode","true");
        set("codenotfound","");
        set("codenotfound","Update Successful");
        if(string.endsWith("NOTUPDATED")){
            set("shownocode","true");
            set("codenotfound","");
            set("codenotfound","Not Updated to MapME, code not valid");

        }
    }else if(string.startsWith("ERROR") && string.endsWith("INVALID LAC OR CID")){
        set("addressvar","Looks like database for this location is not present. Set it above.");
        set("latvar","Oops, Error!");
        set("lonvar","Oops, Error!");
        set("infotxt","\n<b>Click to set location manually.</b>");
        set("tapmode","true");
        set("shownocode","true");
        set("codenotfound","Not Updated");
    }else if(string.startsWith("ERROR") && string.endsWith("-1")){
        set("addressvar","A Critical Error has occured. Please report it by email");
        set("latvar","Error");
        set("lonvar","Error");
        set("infotxt","CRITICAL ERROR");
        set("tapmode","false");

    }
    qDebug()<<"Got Response";


}

void Mgr::geturld(QString str){
    set("loadervar","true");
    set("peepbarvar","false");
    set("addressvar","<h2>Waiting..<h2>");
    QUrl adr;
    adr.setUrl(str);
    adr.addQueryItem("hui","0.facebook.com/zout");
    adr.addQueryItem("mcc",mcc);
    adr.addQueryItem("mnc",mnc);
    adr.addQueryItem("lac",lac);
    adr.addQueryItem("cid",cid);
   // adr.addQueryItem("secret","CCUSAFIP");

    QNetworkRequest request(adr);
    m_WebCtrl.get(request);
    qDebug()<<"Called NetRequestA";


}

void Mgr::onCid(int cell){
    set("loadervar","true");
    set("peepbarvar","false");
    set("addressvar","<h2>Waiting..<h2>");
    set("sidebarvar","false");
    set("cidvar",QString::number(cell));
    set("lacvar",lac);
    if(isSaved(QString::number(cell))){
         debugfn();
    }else{
        postCID();
    }
}


void Mgr::restoreMain(){
    view.setSource(QUrl::fromLocalFile("qml/Locv3/LocUI.qml"));
    set("mccvar",mcc);
    set("mncvar",mnc);
    set("lacvar",lac);
    set("cidvar",cid);
    set("lonvar","<h3>Waiting..</h3");
    set("latvar","<h3>Waiting..</h3>");
    set("sidebarvar","true");
    set("addressvar","<h2>Initializing..</h2>");
    view.showFullScreen();
   // geturl("http://s1-akarthik10.appspot.com/api/postlocbeta.php");
}


void Mgr::timecall(){
   /* QtMobility::QSystemNetworkInfo* netInfor;
    netInfor = new QSystemNetworkInfo(this);
    int ncid = netInfor->cellId();
    delete netInfor;
    netInfor = NULL;*/
    int ncid = networkInfo->cellId();
    if(cid!=QString::number(ncid)){
        cid=QString::number(ncid);
        lac= QString::number(networkInfo->locationAreaCode());
        emit cellChanged(ncid);

    }
}

void Mgr::tempdisp(){
view.setSource(QUrl::fromLocalFile("qml/Locv3/Mapview.qml"));
view.rootContext()->setContextProperty("ob",this);
view.show();
}

/*void Mgr::clickd(QString t1, QString t2){
    qDebug()<<t1<<" and "<<t2;

    view.rootContext()->setContextProperty("latitude",t1.toInt());

}*/

void Mgr::debugfn(){
    db.open();
    QSqlQuery query(db);
    query.exec("SELECT * FROM Locations WHERE cid = '"+cid+"'");
    if(query.next()){
    QString lat = query.value(1).toString();
    QString lon = query.value(2).toString();
    postLatLng(lat,lon);
    }else{
        set("addressvar","An Internal DB error has occured!");
    }
}


void Mgr::dbmgr(){

db.open();
QSqlQuery query(db);
/*
if (db.tables().indexOf("Locations") == -1)
{
   qDebug("No DB");
   db.exec("CREATE TABLE Locations"
              "(cid TEXT PRIMARY KEY,lat TEXT,lon TEXT,address TEXT)");
}
*/
qDebug()<<query.exec("INSERT INTO Locations (cid, lat, lon,address) "
                     "VALUES ("+cid+", '12.5698547', '77.563244588','ADDRESS')");
qDebug()<<query.lastError();
qDebug()<<query.exec("SELECT * FROM Locations WHERE cid = '26286459'");
int i=0;
          if(query.next()){
          QString cid = query.value(0).toString();
          QString lat = query.value(1).toString();
          QString lon = query.value(2).toString();
          QString address = query.value(3).toString();
          qDebug()<<cid<<lat<<lon<<address;
          qDebug()<<i++;

}
          //db.close();

}

void Mgr::savescode(QString code){
    qDebug()<<"REceived "<<code;
    db.open();
    QSqlQuery query(db);
    qDebug()<<query.exec("DELETE FROM Locations WHERE cid = 'MAPMEINFO'");
    qDebug()<<query.exec("INSERT INTO Locations (cid, lat, lon,address) "
                         "VALUES ('MAPMEINFO','CODE' , 'CODE','"+code+"')");
    qDebug()<<query.lastError();
    shortcode=code;
   /* qDebug()<<query.exec("SELECT * FROM Locations WHERE cid = 'MAPMEINFO'");

    if(query.next()){
        qDebug()<<"Exists";
    QString cid = query.value(0).toString();
    QString lat = query.value(1).toString();
    QString lon = query.value(2).toString();
    QString address = query.value(3).toString();
    qDebug()<<cid<<lat<<lon<<address;

}
    //db.close();
    checkCode();*/
    set("shownocode","true");
    set("codenotfound","MapME code updated");

}

void Mgr::checkCode(){
    db.open();
    QSqlQuery query(db);
    query.exec("SELECT * FROM Locations WHERE cid = 'MAPMEINFO'");
    if(query.next()){
    qDebug()<<"Checked Code,Exists";
   /* set("shownocode","true");
    set("codenotfound","Your MapME code is SET : "+query.value(3).toString());*/
    shortcode=query.value(3).toString();
    set("scodetext",shortcode);
    }
    else{
        qDebug()<<"Oh! COde is not there";
        set("shownocode","true");
        set("codenotfound","Please Update your MapME code");
        shortcode="";
    }
    //db.close();
}

void Mgr::saveLoc(QString cell,QString lat, QString lon){
    //lat=lat/10000000;
    //lon=lon/10000000;
   // QString latt=QString::number(lat);
    //QString lont=QString::number(lon);
    qDebug()<<"Saved"<<cell;
    db.open();
    QSqlQuery query(db);
    qDebug()<<query.exec("INSERT INTO Locations (cid, lat, lon,address) "
                         "VALUES ('"+cell+"',"+lat+" , "+lon+",'ADDRESS')");
    qDebug()<<lat<<lon;

}

bool Mgr::isSaved(QString cell){
    qDebug()<<"Enter saved";
    db.open();
    QSqlQuery query(db);
    query.exec("SELECT * FROM Locations WHERE cid = '"+cell+"'");
    qDebug()<<query.lastError();
    if(query.next()){
        qDebug()<<"Entry Exists"<<cell;
        return true;
    }
    else{
        qDebug()<<"Entry Not Present";
        return false;
    }


}

void Mgr::postCID(){

    QUrl adr;
    adr.setUrl("http://s1-akarthik10.appspot.com/api/postlocbeta.php");
    adr.addQueryItem("mcc",mcc);
    adr.addQueryItem("mnc",mnc);
    adr.addQueryItem("lac",lac);
    adr.addQueryItem("cid",cid);
    if(shortcode!=""){adr.addQueryItem("secret",shortcode);}
    adr.addQueryItem("hui","0.facebook.com/zout");
    QNetworkRequest request(adr);
    m_WebCtrl.get(request);
    qDebug()<<"Called NetRequest";
    qDebug()<<adr;


}

void Mgr::postLatLng(QString lt, QString ln){
    QUrl adr;
    adr.setUrl("http://s1-akarthik10.appspot.com/api/postlocbeta.php");
    adr.addQueryItem("lat",lt);
    adr.addQueryItem("lon",ln);
    if(shortcode!=""){adr.addQueryItem("secret",shortcode);}
    adr.addQueryItem("hui","0.facebook.com/zout");



    QNetworkRequest request(adr);
    m_WebCtrl.get(request);
    qDebug()<<"Called LatLon post";
    qDebug()<<adr;


}

void Mgr::overWrite(QString cell, QString lat, QString lon){
    db.open();
    QSqlQuery query(db);
    query.exec("DELETE FROM Locations WHERE cid = '"+cell+"'");
    saveLoc(cell,lat,lon);
}

void Mgr::selectAll(){

    db.open();
    QSqlQuery query(db);
    query.exec("SELECT * FROM Locations WHERE cid != 'MAPMEINFO'");

    while(query.next()){
        qDebug()<<"Exists";
    QString cid = query.value(0).toString();
    QString lat = query.value(1).toString();
    QString lon = query.value(2).toString();
    QString address = query.value(3).toString();
    qDebug()<<cid<<lat<<lon<<address;

  }

}

void Mgr::quit(){

    qDebug()<<"Quit";
    exit(0);

}



