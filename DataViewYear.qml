import QtQuick 2.0
import QtQuick.Window 2.0
import "localStorage.js" as DB

Rectangle {
    width: view.width; height: view.height
    color: clrBackground
    function hideView(){
        sldcompyear.hideView()
    }
    function showView(){
        sldcompyear.showView()
    }
    SliderComponentYear{
        id:sldcompyear
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
        id:sliderYear
        anchors.top: sldcompyear.bottom
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
                            text: "This: " + thisyear
                            color: clrFont
                        }

                        Text{
                            id:txtYesterday
                            anchors.top: txtToday.bottom
                            anchors.right:txtBoxes.right
                            font.family: fntMyraidPro.name
                            font.pixelSize: 15
                            color: clrFont
                            text: "Prev: " + yesteryear
                        }
                        Text{
                            id:txtMax
                            anchors.top:txtYesterday.bottom
                            anchors.right:txtBoxes.right
                            font.family: fntMyraidPro.name
                            font.pixelSize: 15
                            text: "Max: " + maxyear
                            color: clrFont
                        }

                    }

                    Rectangle{
                        id:rectToday
                        anchors.top:txtBoxes.bottom
                        anchors.left: txtBoxes.right
                        width:(thisyear / maxyear) * graphBarWidth
                        height:10
                        color: "#e9f37a"
                        border.width: 2
                        anchors.margins: 4
                    }
                    Rectangle{
                        id:rectDayBefore
                        anchors.top: rectToday.bottom
                        anchors.left: txtBoxes.right
                        width:(yesteryear / maxyear) * graphBarWidth
                        height:10
                        color: "#e1ed53"
                        border.width: 2
                        anchors.margins: 4
                    }
                    Rectangle{
                        id:rectMax
                        anchors.top: rectDayBefore.bottom
                        anchors.left: txtBoxes.right
                        width: (maxyear>0) ? graphBarWidth : 0
                        height:10
                        color: "#bbbf36"
                        border.width: 2
                        anchors.margins: 4
                    }
                }
            }
        }
        model: DataViewYearsModel{id:dataViewYearsModel}
        delegate: contactsDelegate
        focus: true
    }

    signal letsReload
    onLetsReload:{
        dataViewYearsModel.clear()
        dataViewYearsModel.append(DB.getDataViewYearModel())
    }
}

