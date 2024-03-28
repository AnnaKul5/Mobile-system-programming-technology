import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    PageHeader {
        objectName: "pageHeader"
        title: "Страница 6"
    }

    property var db: LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000)

    Column {
        y: 100
        width: parent.width

        TextField {
            id: txtfield
            placeholderText: "Текст заметка"
        }

        Button {
            text: "Добавить"
            onClicked: {
                db.transaction(function(tx) {
                    tx.executeSql("INSERT INTO notes (note_text) VALUES(?);", [txtfield.text]);

                    // Show all added greetings
                    var rs = tx.executeSql('SELECT * FROM notes');

                    var r = []
                    for (var i = 0; i < rs.rows.length; i++) {
                        r.push(rs.rows.item(i))
                    }
                    console.log(r)
                    container.notesModel = r
                });

            }
        }
    }

    Item {
        id: container
        anchors {
            left: parent.left; right: parent.right;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height * 0.5

        property var notesModel: []

        SilicaListView {
            anchors.fill: parent
            model: container.notesModel
            delegate: Label {
                width: parent.width
                height: 100
                Text {
                    text: modelData.note_text
                    anchors.centerIn: parent
                }
            }
            spacing: 5
        }

        function findGreetings() {
            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS notes(note_text TEXT)');

                            // Add (another) greeting row
                            tx.executeSql('INSERT INTO notes VALUES(?)', [ 'hello' ]);

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM notes');

                            var r = []
                            for (var i = 0; i < rs.rows.length; i++) {
                                r.push(rs.rows.item(i))
                            }
                            console.log(r)
                            container.notesModel = r
                        }
                        )
        }
        Component.onCompleted: findGreetings()
    }

    Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            spacing: 20
            Button {
                text: "Назад"
                onClicked: pageStack.pop()
            }
            Button {
                text: "Следующая задача"
                onClicked: pageStack.push(Qt.resolvedUrl(qsTr("Page7.qml")))
            }
        }
}
