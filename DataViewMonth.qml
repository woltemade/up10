import QtQuick 2.0
import QtQuick.Window 2.0
import "localStorage.js" as DB

Rectangle {
    width: view.width; height: view.height
    color: clrBackground
    function hideView(){
        sldcompmonth.hideView()
    }
    function showView(){
        sldcompmonth.showView()
    }
    SliderComponentMonth{ 
        id:sldcompmonth
        z:5
        width: Screen.width
        height: 50
        function showView(){
            showVieW()
        }
        function hideView(){
            hideVieW()
        }
    }
    ListView {
        id:sliderMonth
        anchors.top: sldcompmonth.bottom
        width: parent.width -10
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        z:0
        snapMode: ListView.SnapToItem
        spacing: 5
        Component {
            id: contactsDelegate
            Rectangle {
                id: wrapper
                width: parent.width
                height: 90
                color: clrBackground
                Rectangle{
                    id:spacer
                    height:20
                }

                Text {
                    id: activityName
                    anchors.top:spacer.bottom
                    text: name + ": "
                    font.family: fntMyraidPro.name
                    font.pixelSize: 25
                    color: clrFont
                    width: parent.width
                    Item{
                        id:txtBoxes
                        width:wrapper.width/3
                        anchors.top:activityName.bottom

                        Text{
                            id:txtToday
                            anchors.top:txtBoxes.bottom
                            anchors.right:txtBoxes.right
                            font.family: fntMyraidPro.name
                            font.pixelSize: 15
                            text: "This: " + thismonth
                            color: clrFont
                        }

                        Text{
                            id:txtYesterday
                            anchors.top: txtToday.bottom
                            anchors.right:txtBoxes.right
                            font.family: fntMyraidPro.name
                            font.pixelSize: 15
                            color: clrFont
                            text: "Prev: " + yestermonth
                        }
                        Text{
                            id:txtMax
                            anchors.top:txtYesterday.bottom
                            anchors.right:txtBoxes.right
                            font.family: fntMyraidPro.name
                            font.pixelSize: 15
                            text: "Max: " + maxmonth
                            color: clrFont
                        }

                    }

                    Rectangle{
                        id:rectToday
                        anchors.top:txtBoxes.bottom
                        anchors.left: txtBoxes.right
                        width:(thismonth / maxmonth) * graphBarWidth
                        height:10
                        color: "#f37a7a"
                        border.width: 2
                        anchors.margins: 4
                    }
                    Rectangle{
                        id:rectDayBefore
                        anchors.top: rectToday.bottom
                        anchors.left: txtBoxes.right
                        width:(yestermonth / maxmonth) * graphBarWidth
                        height:10
                        color: "#ed5353"
                        border.width: 2
                        anchors.margins: 4
                    }
                    Rectangle{
                        id:rectMax
                        anchors.top: rectDayBefore.bottom
                        anchors.left: txtBoxes.right
                        width:(maxmonth>0) ? graphBarWidth : 0
                        height:10
                        color: "#bf3636"
                        border.width: 2
                        anchors.margins: 4
                    }
                }
            }
        }
        model: DataViewMonthsModel{id:dataViewMonthsModel}
        delegate: contactsDelegate
        focus: true
    }

    signal letsReload
    onLetsReload:{
        dataViewMonthsModel.clear()
        dataViewMonthsModel.append(DB.getDataViewMonthModel())
    }
}

