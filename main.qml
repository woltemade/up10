import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    width:Screen.width
    height:Screen.height
    visible: true

    Rectangle {
        id:bg
        width:Screen.height *1.5
        height: Screen.height*1.5
        anchors.centerIn: parent
        rotation: 75
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#a2f6cf" }
            GradientStop { position: 0.33; color: "#65c79a" }
            GradientStop { position: 0.66; color: "#459874" }
            GradientStop { position: 1.0; color: "#5b9c80" }
        }
        opacity: 1
    }
    Image {
        width: Screen.width / 2
        height:Screen.width / 2
        id: splash
        source: "images/logo.png"
        opacity: 1
        anchors.centerIn: parent
    }


    Item{
        id:topPanel
        anchors{
            top:parent.top
            bottom: myToolBar.top
            left:parent.left
            right:parent.right
        }
        DataView2{
            id:dataView
            width: Screen.width
        }
        LogView{
            id:logView

        }
        LogViewDetail{
            id:logViewDetail
        }
        AddActivityView{
            id:addActivityView
        }
        HelpView{
            id:helpView
        }
        SettingsView{
            id:settingsView
        }

        states: [
            State {
                name: "dataViewState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: splash
                    opacity: 0
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: dataView
                    opacity: 1
                    z:1
                }

            },
            State {
                name: "logViewState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: logView
                    opacity: 1
                    z:1
                }

            },
            State {
                name: "logViewDetailState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: logViewDetail
                    opacity: 1
                    z:1
                }

            },
            State {
                name: "addActivityViewState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: addActivityView
                    opacity: 1
                    z:1
                }

            },
            State {
                name: "settingsViewState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: settingsView
                    opacity: 1
                    z:1
                }
            },
            State {
                name: "helpViewState"
                PropertyChanges {
                    target: myToolBar
                    opacity: 1
                }
                PropertyChanges {
                    target: bg
                    opacity: 1
                }
                PropertyChanges {
                    target: helpView
                    opacity: 1
                    z:1}}]
        transitions: [
            Transition {
                NumberAnimation { property: "opacity"; easing.type: Easing.InOutQuad; duration:1000}
            }

        ]
    }
    Item {
        Timer {
            interval: 3333; running: true; repeat: false
            onTriggered: topPanel.state = "dataViewState"

        }
    }
    Toolbar{
        opacity: 0
        id:myToolBar
        width: Screen.width
    }

}
