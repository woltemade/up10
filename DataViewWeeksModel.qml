import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "localStorage.js" as DB

ListModel {

    signal refresh()

    Component.onCompleted: refresh()

    onRefresh: {
        dataViewWeeksModel.clear()
        dataViewWeeksModel.append(DB.getDataViewWeekModel())
    }
 }
