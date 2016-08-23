TEMPLATE = app

QT += qml quick

CONFIG += c++11
#CONFIG += console

SOURCES += main.cpp \
    loading.cpp \
    filecsv.cpp \
    data.cpp \
    treatment.cpp \
    showresult.cpp \
    exportresult.cpp \
    datainterface.cpp \
    treemodel.cpp \
    treeitem.cpp

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
    showresult.h \
    exportresult.h \
    datainterface.h \
    treemodel.h \
    treeitem.h
