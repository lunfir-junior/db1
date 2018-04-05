QT += core
QT -= gui

CONFIG += c++11

TARGET = generator
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    Generator.cpp

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    Generator.h

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/yaml-cpp/build/release/ -lyaml-cpp
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/yaml-cpp/build/debug/ -lyaml-cpp
else:unix: LIBS += -L$$PWD/yaml-cpp/build/ -lyaml-cpp

INCLUDEPATH += $$PWD/yaml-cpp/include/
DEPENDPATH += $$PWD/yaml-cpp/include/

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/yaml-cpp/build/release/libyaml-cpp.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/yaml-cpp/build/debug/libyaml-cpp.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/yaml-cpp/build/release/yaml-cpp.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/yaml-cpp/build/debug/yaml-cpp.lib
else:unix: PRE_TARGETDEPS += $$PWD/yaml-cpp/build/libyaml-cpp.a
