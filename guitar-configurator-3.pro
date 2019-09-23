QT += quickcontrols2 serialport
CONFIG += c++11 ccache

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        ardwiinolookup.cpp \
        main.cpp \
        port.cpp \
        portscanner.cpp \
        programmer.cpp

RESOURCES += \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ardwiinolookup.h \
    controllers.h \
    input_types.h \
    joy_types.h \
    mpu_orientations.h \
    port.h \
    portscanner.h \
    programmer.h \
    status.h \
    submodules/Ardwiino/src/shared/config/config.h \
    submodules/Ardwiino/src/shared/config/defaults.h \
    submodules/Ardwiino/src/shared/config/defines.h \
    submodules/Ardwiino/src/shared/controller/controller.h \
    tilt_types.h \
    wii_extensions.h

makeArd.commands =  mkdir -p $$OUT_PWD/firmware && cd $$PWD/submodules/Ardwiino && $(MAKE) build-all
copydata.commands = $(COPY_DIR) $$PWD/binaries/linux-64 $$OUT_PWD/binaries
copydata2.commands = $(COPY_DIR) $$PWD/binaries $$OUT_PWD/binariesAll
copyfirmware.commands = $(COPY_DIR) $$PWD/submodules/Ardwiino/output/* $$OUT_PWD/firmware
copyfirmware2.commands = $(COPY_DIR) $$PWD/firmware/* $$OUT_PWD/firmware
first.depends = $(first) copydata makeArd copyfirmware copyfirmware2 copydata2
export(first.depends)
export(copydata2.commands)
export(copydata.commands)
export(makeArd.commands)
export(copyfirmware.commands)
QMAKE_EXTRA_TARGETS += first copydata makeArd copyfirmware copyfirmware2 copydata2
