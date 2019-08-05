import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Controls.Universal 2.13

ApplicationWindow {
    id: applicationWindow
    visible: true
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Violet

    Label {
        id: title
        x: 646
        width: 802
        text: qsTr("Welcome to the Ardwiino Configuration Tool")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.WordWrap
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 510
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 510
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 30
        fontSizeMode: Text.FixedSize
    }

    Image {
        id: image
        x: 786
        width: 400
        anchors.horizontalCenterOffset: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 510
        anchors.top: parent.top
        anchors.topMargin: 170
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/controller.png"
        fillMode: Image.PreserveAspectFit
    }

    Label {
        id: please
        x: 714
        text: qsTr("Please connect an Ardwiino controller, or an Arduino")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: title.bottom
        anchors.topMargin: 40
        wrapMode: Text.WordWrap
        font.bold: false
        font.pointSize: 16
        font.weight: Font.DemiBold
        font.capitalization: Font.MixedCase
    }

    Column {
        id: instructions
        x: 883
        width: 384
        height: 104
        anchors.top: please.bottom
        anchors.topMargin: 20
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: supported
            y: 646
            width: 384
            text: qsTr("The following Arduinos are supported:")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pointSize: 16
            font.capitalization: Font.MixedCase
            font.weight: Font.DemiBold
            font.bold: false
        }

        Label {
            id: micro
            width: 384
            text: qsTr("Arduino Pro Micro")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 16
            font.capitalization: Font.MixedCase
            font.weight: Font.Light
            font.bold: false
        }

        Label {
            id: leo
            width: 384
            text: qsTr("Arduino Leonardo")
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 16
            font.capitalization: Font.MixedCase
            font.weight: Font.Light
            font.bold: false
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: uno
            width: 384
            text: qsTr("Arduino Uno R3")
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 16
            font.capitalization: Font.MixedCase
            font.weight: Font.Light
            font.bold: false
            verticalAlignment: Text.AlignVCenter
        }
    }

    ComboBox {
        id: devices
        x: 891
        width: 485
        height: 40
        textRole: "description"
        model: scanner.model
        anchors.horizontalCenterOffset: 1
        anchors.top: label.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button
        x: 910
        text: qsTr("Continue")
        anchors.top: devices.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: false
        states: [
            State {
               name: "enabled"; when: devices.currentIndex != -1
               PropertyChanges { target: button; enabled:true }
            },
            State {
               name: "disabled"; when: devices.currentIndex == -1
               PropertyChanges { target: button; enabled:false }
            }
        ]
    }

    Label {
        id: label
        x: 944
        text: qsTr("Found Devices: ")
        anchors.top: instructions.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.DemiBold
        font.pointSize: 16
        Timer {
                id: timer
                interval: 1000
                running: true
                repeat: true
                onTriggered: scanner.checkPorts()
        }
    }





}















































































/*##^## Designer {
    D{i:0;autoSize:true;height:1080;width:1920}D{i:1;anchors_height:60;anchors_width:802;anchors_x:646;anchors_y:658}
D{i:2;anchors_height:400;anchors_y:232}D{i:3;anchors_y:774}
}
 ##^##*/
