

import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    Text {
        text: qsTr("GPA Calculator")
        width: qq
        font.pointSize: 22
        font.weight: Font.DemiBold
        anchors.verticalCenterOffset: -507
        anchors.horizontalCenterOffset: -737
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    TextField {
        id: textField
        x: 273
        y: 46
        width: 102
        height: 25
        placeholderText: qsTr("# Of Classes")
    }

    TextField {
        id: listofgrades
        x: 138
        y: 77
        width: 324
        height: 22
        antialiasing: true
        font.pointSize: 8
        placeholderText: qsTr("Enter Grades (eg: 90, 87, 95) must be followed by comma")
    }

    DelayButton {
        id: delayButton
        property color property: "#ffffff"
        x: 255
        y: 113
        width: 135
        height: 27
        text: qsTr("Calculate Grades")
        layer.mipmap: false
        focus: false
        antialiasing: true
        wheelEnabled: false
        onClicked:
            busyIndicator.opacity = 1
    }

    BusyIndicator {
        id: busyIndicator
        x: 303
        y: 146
        opacity: 0
    }

    TabBar {
        id: tabBar
        x: -11
        y: 177
        width: 240
        wheelEnabled: true
        rotation: -270
    }

    ToolButton {
        id: menu
        property string property: "This is a string"
        x: 98
        y: 67
        width: 32
        height: 32
        text: qsTr("☰")
        down: none.none
        smooth: false
        clip: false
        activeFocusOnTab: false
        focus: false
        icon.cache: false
        layer.smooth: false
        highlighted: false
        checked: false
        checkable: true
        antialiasing: true
        autoExclusive: false
        flat: false

        Connections {
            target: menu
            onClicked: {

                menu.rotation = 90
            }
        }

        Connections {
            target: menu
            onClicked: info.opacity = 1
        }
    }

    ToolButton {
        id: info
        x: 100
        y: 93
        opacity: 0
        text: qsTr("ⓘ")

        Connections {
            target: info
            onClicked: {
                rectangle1.visible = true
                text1.visible = true
                text2.visible = true
                text3.visible = true
                text4.visible = true
            }
        }
    }

    Pane {
        id: pane
        x: 8
        y: 342
        width: 156
        height: 144
        wheelEnabled: false

        Switch {
            id: switch1
            property string property: "This is a string"
            x: 7
            y: 49
            position: none.none
            text: qsTr("Dark Mode")

            Connections {
                target: switch1
                onToggled: switch1.text = "Lightmode"
            }

            Connections {
                target: switch1
                onToggled: if (condition) {
                               rectangle.color = "grey"
                           }
            }

            Connections {
                target: switch1
                onEnabledChanged: rectangle.color = "grey"
            }

            Connections {
                target: switch1
                onToggled: switch1.visible = true
            }
        }
    }

    StateGroup {
        id: stateGroup
    }

    Rectangle {
        id: rectangle1
        x: 880
        y: 0
        width: 649
        height: 532
        visible: info.pressed
        color: "#ffffff"

        Text {
            id: text1
            x: 252
            y: 27
            text: qsTr("GPA CALCULATOR")
            font.pixelSize: 18
        }

        Text {
            id: text2
            x: 278
            y: 55
            text: qsTr("VERISON 0.1.0.0")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 239
            y: 115
            text: qsTr("UI Made with Qt Design Studio")
            font.pixelSize: 12
        }

        Text {
            id: text4
            x: 116
            y: 155
            text: qsTr("Code programmed with ChatGPT,  Replit, Visual Studio Code, on a M1 Mac")
            font.pixelSize: 12
        }
    }
}

