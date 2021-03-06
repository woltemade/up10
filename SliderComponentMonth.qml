import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "localStorage.js" as DB

Rectangle {
    width: parent.width
    height: parent.height
    color: clrBackground

    function hideVieW(){
        lvwDays.opacity = 0
    }
    function showVieW(){
        lvwDays.opacity = 1
    }

    Component {
        id: monthDelegate
        Item {
            width: 125; height: 50
            Text { id:txtmonth; text: month; color: clrFont; font.family: fntMyraidPro.name; font.pixelSize: 22
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text { id:txtyear; text: year; color: clrFont; font.family: fntMyraidPro.name; font.pixelSize: 15
                anchors.top:txtmonth.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    lvwDays.currentIndex = index
                    dataViewMonthsModel.clear()
                    dataViewMonthsModel.append(DB.getDataViewMonthModel())

                }
            }
        }
    }

    ListView {
        id:lvwDays
        anchors.fill: parent
        model: MonthsModel{id:monthsModel}
        delegate: monthDelegate
        highlight: dayhighlight
        orientation: Qt.Horizontal
        onCurrentItemChanged: {
            selectedDateMonth = DB.getMonthNumber(lvwDays.model.get(lvwDays.currentIndex).month)
            selectedDateYear = lvwDays.model.get(lvwDays.currentIndex).year
            //console.debug("month changed:" + selectedDateMonth)
            hideSplashScreen()
        }
        highlightMoveDuration: 100
        Component.onCompleted: {

            positionViewAtBeginning()
            //console.debug("nothing happening here2 <")

        }
    }

    Component {
        id: dayhighlight

        Rectangle {
            width: 75; height: 75
            color: "lightsteelblue"; opacity: 0.25
            x: lvwDays.currentItem.x
            z:10
            Behavior on x {
                SpringAnimation {
                    spring: 3
                    damping: 0.2
                }
            }
        }
    }
}
