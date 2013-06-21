import Qt 4.7

Item {
    width: 400
    height: 400

    // handle clicks on empty area
    MouseArea {
        anchors.fill: parent
        onClicked: grid.currentIndex = -1
    }

    // a dummy model
    ListModel {
        id: itemModel
        ListElement {
            name: "red"
        }
        ListElement {
            name: "blue"
        }
        ListElement {
            name: "green"
        }
        ListElement {
            name: "tomato"
        }
    }

    // our delegate
    Component {
        id: rectDelegate
        Rectangle {
            id: rect

            width: 50
            height: 50
            color: name

            MouseArea {
                anchors.fill: parent
                onClicked: grid.currentIndex = index
            }
            states: [
                State {
                    name: "none"
                    when: (grid.currentIndex == -1)
                },
                State {
                    name: "selected"
                    when: rect.GridView.isCurrentItem
                    PropertyChanges {
                        target: rect;
                        width: 100;
                        height: 100
                    }
                }
            ]
            transitions: Transition {
                PropertyAnimation {
                    target: rect
                    properties: "width, height"
                }
            }
        }
    }

    GridView {
        id: grid
        x: 50
        y: 50
        width: 200
        height: 200
        model: itemModel
        delegate: rectDelegate

        // handle clicks on empty area within the grid.
        // this adds an element below the grid items but on the grid's flickable surface
        //     (so it won't have mouse events stolen by the grid)
        flickableChildren: MouseArea {
            anchors.fill: parent
            onClicked: grid.currentIndex = -1
        }

        // sets the initial index to -1, so no item is selected
        //        currentIndex: -1 // not enough, need to check later
        Component.onCompleted: currentIndex = -1
       }
}
