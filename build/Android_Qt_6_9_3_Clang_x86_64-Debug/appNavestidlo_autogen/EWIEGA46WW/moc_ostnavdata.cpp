/****************************************************************************
** Meta object code from reading C++ file 'ostnavdata.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../ostnavdata.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ostnavdata.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN10ostnavdataE_t {};
} // unnamed namespace

template <> constexpr inline auto ostnavdata::qt_create_metaobjectdata<qt_meta_tag_ZN10ostnavdataE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "ostnavdata",
        "vypisdata",
        "",
        "id",
        "xnazev",
        "xnavestidlo",
        "xvzhled",
        "xpopis",
        "xico",
        "xden",
        "xnoc",
        "xvyh",
        "xvyhplan",
        "xsamovratnav",
        "xblik"
    };

    QtMocHelpers::UintData qt_methods {
        // Slot 'vypisdata'
        QtMocHelpers::SlotData<void(QString)>(1, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 3 },
        }}),
        // Slot 'xnazev'
        QtMocHelpers::SlotData<QString()>(4, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xnavestidlo'
        QtMocHelpers::SlotData<QString()>(5, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xvzhled'
        QtMocHelpers::SlotData<QString()>(6, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xpopis'
        QtMocHelpers::SlotData<QString()>(7, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xico'
        QtMocHelpers::SlotData<QString()>(8, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xden'
        QtMocHelpers::SlotData<QString()>(9, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xnoc'
        QtMocHelpers::SlotData<QString()>(10, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xvyh'
        QtMocHelpers::SlotData<QString()>(11, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xvyhplan'
        QtMocHelpers::SlotData<QString()>(12, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xsamovratnav'
        QtMocHelpers::SlotData<QString()>(13, 2, QMC::AccessPublic, QMetaType::QString),
        // Slot 'xblik'
        QtMocHelpers::SlotData<QString()>(14, 2, QMC::AccessPublic, QMetaType::QString),
    };
    QtMocHelpers::UintData qt_properties {
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<ostnavdata, qt_meta_tag_ZN10ostnavdataE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject ostnavdata::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10ostnavdataE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10ostnavdataE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN10ostnavdataE_t>.metaTypes,
    nullptr
} };

void ostnavdata::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<ostnavdata *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->vypisdata((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 1: { QString _r = _t->xnazev();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 2: { QString _r = _t->xnavestidlo();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: { QString _r = _t->xvzhled();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 4: { QString _r = _t->xpopis();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: { QString _r = _t->xico();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 6: { QString _r = _t->xden();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: { QString _r = _t->xnoc();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 8: { QString _r = _t->xvyh();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->xvyhplan();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 10: { QString _r = _t->xsamovratnav();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 11: { QString _r = _t->xblik();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

const QMetaObject *ostnavdata::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ostnavdata::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10ostnavdataE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ostnavdata::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 12;
    }
    return _id;
}
QT_WARNING_POP
