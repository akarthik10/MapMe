/****************************************************************************
** Meta object code from reading C++ file 'Mgr.h'
**
** Created: Sun 20. Nov 13:55:45 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../Mgr.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Mgr.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Mgr[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    5,    4,    4, 0x05,

 // slots: signature, parameters, type, tag, flags
      34,   27,    4,    4, 0x0a,
      61,    5,    4,    4, 0x0a,
      72,    4,    4,    4, 0x0a,

 // methods: signature, parameters, type, tag, flags
      83,    4,    4,    4, 0x02,
      93,    4,    4,    4, 0x02,
     125,  112,    4,    4, 0x02,
     163,    5,  158,    4, 0x02,
     180,  112,    4,    4, 0x02,
     215,    4,    4,    4, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Mgr[] = {
    "Mgr\0\0cell\0cellChanged(int)\0pReply\0"
    "readFinish(QNetworkReply*)\0onCid(int)\0"
    "timecall()\0debugfn()\0savescode(QString)\0"
    "cell,lat,lon\0saveLoc(QString,QString,QString)\0"
    "bool\0isSaved(QString)\0"
    "overWrite(QString,QString,QString)\0"
    "quit()\0"
};

const QMetaObject Mgr::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Mgr,
      qt_meta_data_Mgr, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Mgr::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Mgr::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Mgr::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Mgr))
        return static_cast<void*>(const_cast< Mgr*>(this));
    return QObject::qt_metacast(_clname);
}

int Mgr::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: cellChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: readFinish((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 2: onCid((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: timecall(); break;
        case 4: debugfn(); break;
        case 5: savescode((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: saveLoc((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 7: { bool _r = isSaved((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 8: overWrite((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 9: quit(); break;
        default: ;
        }
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void Mgr::cellChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
