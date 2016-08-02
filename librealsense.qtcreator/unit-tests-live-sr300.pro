include(include.pri)

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt
QMAKE_CXXFLAGS += -std=c++11
QMAKE_CXXFLAGS += -D_FORTIFY_SOURCE=2 -fstack-protector-strong -Wformat -Wformat-security
QMAKE_CXXFLAGS += -z noexecstack -z relro -z now
# add the desired -O2 if not present
QMAKE_CXXFLAGS_RELEASE *= -O2
PKGCONFIG += libusb-1.0
CONFIG += link_pkgconfig
INCLUDEPATH += ../include
LIBS += -pthread

SOURCES += ../unit-tests/unit-tests-live-sr300.cpp
SOURCES += ../unit-tests/unit-tests-live.cpp
SOURCES += ../unit-tests/unit-tests-common.h

LIBS += -L$$DESTDIR/ -lrealsense

PRE_TARGETDEPS += $$DESTDIR/librealsense.a
