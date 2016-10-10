TEMPLATE = app

QT += qml quick widgets
QT -= network gui

CONFIG += c++11
#CONFIG += console
#CONFIG += static

SOURCES += main.cpp \
    loading.cpp \
    filecsv.cpp \
    data.cpp \
    treatment.cpp \
    exportresult.cpp \
    treemodel.cpp \
    treeitem.cpp \
    datadomaine.cpp \
    datadomaines.cpp \
    datacommu.cpp \
    datagoal.cpp \
    datadocument.cpp \
    autocompletgoal.cpp \
    autocompletuser.cpp \
    datauser.cpp \
    datanote.cpp

RESOURCES += qml.qrc

QMAKE_LFLAGS += -Wl,--large-address-aware

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    loading.h \
    filecsv.h \
    data.h \
    treatment.h \
    exportresult.h \
    treemodel.h \
    treeitem.h \
    datadomaine.h \
    datadomaines.h \
    datacommu.h \
    datagoal.h \
    datadocument.h \
    autocompletgoal.h \
    autocompletuser.h \
    datauser.h \
    datanote.h
