/****************************************************************************
** Meta object code from reading C++ file 'rychnavdata.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../rychnavdata.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'rychnavdata.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.9.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN11rychnavdataE_t {};
} // unnamed namespace

template <> constexpr inline auto rychnavdata::qt_create_metaobjectdata<qt_meta_tag_ZN11rychnavdataE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "rychnavdata",
        "xdata",
        "",
        "sxnazev",
        "sxbarva",
        "sxhindct",
        "sxblikr",
        "sxblik1",
        "sxblik2",
        "sxdolindc",
        "sxlinka1",
        "sxlinka2",
        "sxvyznam",
        "nazev",
        "barva",
        "hindct",
        "blikr",
        "blik1",
        "blik2",
        "dolindc",
        "linka1",
        "linka2",
        "vyznam"
    };

    QtMocHelpers::UintData qt_methods {
        // Slot 'xdata'
        QtMocHelpers::SlotData<void(QString, QString, QString, QString, QString, QString, QString, QString, QString, QString)>(1, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 3 }, { QMetaType::QString, 4 }, { QMetaType::QString, 5 }, { QMetaType::QString, 6 },
            { QMetaType::QString, 7 }, { QMetaType::QString, 8 }, { QMetaType::QString, 9 }, { QMetaType::QString, 10 },
            { QMetaType::QString, 11 }, { QMetaType::QString, 12 },
        }}),
        // Slot 'nazev'
        QtMocHelpers::SlotData<QString()>(13, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'barva'
        QtMocHelpers::SlotData<QString()>(14, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'hindct'
        QtMocHelpers::SlotData<QString()>(15, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'blikr'
        QtMocHelpers::SlotData<QString()>(16, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'blik1'
        QtMocHelpers::SlotData<QString()>(17, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'blik2'
        QtMocHelpers::SlotData<QString()>(18, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'dolindc'
        QtMocHelpers::SlotData<QString()>(19, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'linka1'
        QtMocHelpers::SlotData<QString()>(20, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'linka2'
        QtMocHelpers::SlotData<QString()>(21, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'vyznam'
        QtMocHelpers::SlotData<QString()>(22, 2, QMC::AccessPublic, QMetaType::QString),
    };
    QtMocHelpers::UintData qt_properties {
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<rychnavdata, qt_meta_tag_ZN11rychnavdataE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject rychnavdata::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11rychnavdataE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11rychnavdataE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN11rychnavdataE_t>.metaTypes,
    nullptr
} };

void rychnavdata::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<rychnavdata *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->xdata((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[3])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[4])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[5])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[6])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[7])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[8])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[9])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[10]))); break;
        case 1: { QString _r = _t->nazev();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 2: { QString _r = _t->barva();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: { QString _r = _t->hindct();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 4: { QString _r = _t->blikr();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: { QString _r = _t->blik1();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 6: { QString _r = _t->blik2();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: { QString _r = _t->dolindc();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 8: { QString _r = _t->linka1();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->linka2();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 10: { QString _r = _t->vyznam();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

const QMetaObject *rychnavdata::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *rychnavdata::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11rychnavdataE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int rychnavdata::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 11;
    }
    return _id;
}
QT_WARNING_POP
