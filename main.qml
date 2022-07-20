import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: "Make transition"

    Rectangle{
        id: scene
        anchors.fill:parent
        state: "OtherState"

        Rectangle {
            id:leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                id: name
                anchors.centerIn: parent
                text: "move"
                       }
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "OtherState"
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  ball.x +=10
            }
        }
        Rectangle {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                id: name1
                 anchors.centerIn: parent
                 text: "return"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }
        Rectangle {
            id: ball
            color: "darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2

        }

    states: [
            State {
                name:"InitialState"
                PropertyChanges {
                    target: ball
                    x:leftRectangle.x+5
                }
            },
            State {
                name:"OtherState"
                PropertyChanges{
                    target:if(ball.x>=rightRectangle.x-84){
                              ball.x=leftRectangle.x+5
                           } else {
                           ball.x
                           }
                }
            }
        ]
    transitions: [
        Transition {
            from:"OtherState"
            to: "InitialState"
            NumberAnimation{
                properties: "x,y"
                duration: 1000
                easing.type:  Easing.InOutSine
            }
        }
    ]
    }
}

