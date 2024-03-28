/****************************************************************************
** Meta object code from reading C++ file 'Calc.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../Lab8_calc/src/Calc.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Calc.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.6.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Calc_t {
    QByteArrayData data[22];
    char stringdata0[160];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Calc_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Calc_t qt_meta_stringdata_Calc = {
    {
QT_MOC_LITERAL(0, 0, 4), // "Calc"
QT_MOC_LITERAL(1, 5, 11), // "num1Changed"
QT_MOC_LITERAL(2, 17, 0), // ""
QT_MOC_LITERAL(3, 18, 11), // "num2Changed"
QT_MOC_LITERAL(4, 30, 11), // "num3Changed"
QT_MOC_LITERAL(5, 42, 11), // "num4Changed"
QT_MOC_LITERAL(6, 54, 7), // "getNum1"
QT_MOC_LITERAL(7, 62, 7), // "getNum2"
QT_MOC_LITERAL(8, 70, 7), // "getNum3"
QT_MOC_LITERAL(9, 78, 7), // "getNum4"
QT_MOC_LITERAL(10, 86, 5), // "add_1"
QT_MOC_LITERAL(11, 92, 5), // "add_2"
QT_MOC_LITERAL(12, 98, 4), // "sub1"
QT_MOC_LITERAL(13, 103, 4), // "div1"
QT_MOC_LITERAL(14, 108, 4), // "mul1"
QT_MOC_LITERAL(15, 113, 4), // "sub2"
QT_MOC_LITERAL(16, 118, 4), // "div2"
QT_MOC_LITERAL(17, 123, 4), // "mul2"
QT_MOC_LITERAL(18, 128, 7), // "m_num_1"
QT_MOC_LITERAL(19, 136, 7), // "m_num_2"
QT_MOC_LITERAL(20, 144, 7), // "m_num_3"
QT_MOC_LITERAL(21, 152, 7) // "m_num_4"

    },
    "Calc\0num1Changed\0\0num2Changed\0num3Changed\0"
    "num4Changed\0getNum1\0getNum2\0getNum3\0"
    "getNum4\0add_1\0add_2\0sub1\0div1\0mul1\0"
    "sub2\0div2\0mul2\0m_num_1\0m_num_2\0m_num_3\0"
    "m_num_4"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Calc[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       4,  110, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x06 /* Public */,
       3,    0,   95,    2, 0x06 /* Public */,
       4,    0,   96,    2, 0x06 /* Public */,
       5,    0,   97,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       6,    0,   98,    2, 0x02 /* Public */,
       7,    0,   99,    2, 0x02 /* Public */,
       8,    0,  100,    2, 0x02 /* Public */,
       9,    0,  101,    2, 0x02 /* Public */,
      10,    0,  102,    2, 0x02 /* Public */,
      11,    0,  103,    2, 0x02 /* Public */,
      12,    0,  104,    2, 0x02 /* Public */,
      13,    0,  105,    2, 0x02 /* Public */,
      14,    0,  106,    2, 0x02 /* Public */,
      15,    0,  107,    2, 0x02 /* Public */,
      16,    0,  108,    2, 0x02 /* Public */,
      17,    0,  109,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,
    QMetaType::Int,

 // properties: name, type, flags
      18, QMetaType::Double, 0x00495003,
      19, QMetaType::Double, 0x00495003,
      20, QMetaType::Double, 0x00495003,
      21, QMetaType::Double, 0x00495003,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,

       0        // eod
};

void Calc::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Calc *_t = static_cast<Calc *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->num1Changed(); break;
        case 1: _t->num2Changed(); break;
        case 2: _t->num3Changed(); break;
        case 3: _t->num4Changed(); break;
        case 4: { int _r = _t->getNum1();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 5: { int _r = _t->getNum2();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 6: { int _r = _t->getNum3();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 7: { int _r = _t->getNum4();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 8: { int _r = _t->add_1();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 9: { int _r = _t->add_2();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 10: { int _r = _t->sub1();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 11: { int _r = _t->div1();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 12: { int _r = _t->mul1();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 13: { int _r = _t->sub2();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 14: { int _r = _t->div2();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 15: { int _r = _t->mul2();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Calc::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Calc::num1Changed)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Calc::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Calc::num2Changed)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (Calc::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Calc::num3Changed)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (Calc::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Calc::num4Changed)) {
                *result = 3;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        Calc *_t = static_cast<Calc *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->getNum1(); break;
        case 1: *reinterpret_cast< double*>(_v) = _t->getNum2(); break;
        case 2: *reinterpret_cast< double*>(_v) = _t->getNum3(); break;
        case 3: *reinterpret_cast< double*>(_v) = _t->getNum4(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        Calc *_t = static_cast<Calc *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setNum1(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setNum2(*reinterpret_cast< double*>(_v)); break;
        case 2: _t->setNum3(*reinterpret_cast< double*>(_v)); break;
        case 3: _t->setNum4(*reinterpret_cast< double*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject Calc::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Calc.data,
      qt_meta_data_Calc,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Calc::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Calc::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Calc.stringdata0))
        return static_cast<void*>(const_cast< Calc*>(this));
    return QObject::qt_metacast(_clname);
}

int Calc::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 16;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Calc::num1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void Calc::num2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void Calc::num3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 2, Q_NULLPTR);
}

// SIGNAL 3
void Calc::num4Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 3, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
