/*
Copyright: 2012 LORDZOUGA <ozojiechikelu@gmail.com>
License: GPL-2+
 This package is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 .
 This package is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 .
 You should have received a copy of the GNU General Public License
 along with this program. If not, see <http://www.gnu.org/licenses/>

*/
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5

import QtQuick 1.1

/*this is a QML code for windows 8 loading style icon;
  it uses the Item transform property to implement rotation and uses the Behavior object
  to synchronize animation across rectangles. the core logic is to rotate the rectangles
  around the same axis at varying time intervals*/

Rectangle{
    //root rectangle for recdering the animation
    height: 300; width: 300
    color: "black"; smooth: true

    /*variable to hold the value of the origin of the x axis when rotating rectangles*/
    property int originx: 20
    Rectangle{
        //1st rectangle
        id: rect1
        height: 5; width: 5; radius: 5
        x: 213; y: 138; color: "gray"; smooth: true

        //transform property for rotating the objects
        transform: Rotation{
            //object that handles the rotation
                    id: rotator1
                    origin.x: originx; origin.y: rect1.height/2; angle: -300
                }
        //you can use any property you want.. I used x
            Behavior on x{
                //behavior on x
                ParallelAnimation{
                PropertyAnimation{
                    //for rect1 no delay is required
                    target: rotator1; properties: "angle"; duration: 4000;
                    easing.type: Easing.InOutCubic; to: 420; loops: Animation.Infinite}
                SequentialAnimation{
                    //animation for rect2
                    PropertyAnimation{
                        //dummy animation used as a delay object
                        target: rect2; properties: "x"; to: 213; duration: 120
                    }
                PropertyAnimation{
                    //main animation used for rotation
                    target: rotator2; properties: "angle"; duration: 4000;
                    easing.type: Easing.InOutCubic; to: 400; loops: Animation.Infinite
                }
                }
                SequentialAnimation{
                    //animation for rect3
                    PropertyAnimation{
                        //dummy animation
                        target: rect3; properties: "x"; to: 213; duration: 240}
                    PropertyAnimation{
                        //main animation used for rotation
                        target: rotator3; properties: "angle"; duration: 4000; easing.type: Easing.InOutCubic
                        to: 380; loops: Animation.Infinite;
                    }
                }
                SequentialAnimation{
                    //animation for rect4
                    PropertyAnimation{target: rect4; properties: "x"; to: 213; duration: 360}
                    PropertyAnimation{
                        target: rotator4; properties: "angle"; duration: 4000; easing.type: Easing.InOutCubic
                        to: 360; loops: Animation.Infinite;
                    }
                }
                SequentialAnimation{
                    //animation for rect5
                    PropertyAnimation{target: rect5; properties: "x"; to: 213; duration: 480}
                    PropertyAnimation{
                        target: rotator5; properties: "angle"; duration: 4000; easing.type: Easing.InOutCubic
                        to: 340; loops: Animation.Infinite;
                    }
                }
                }
            }
    }
    Rotater{
        id: rect2
        transform: Rotation{
                    id: rotator2
                    origin.x: originx; origin.y: rect2.height/2; angle: -320
                }
    }
    Rotater{
        id: rect3
        transform: Rotation{
            id: rotator3
            origin.x: originx; origin.y: rect3.height/2; angle: -340
        }
    }
    Rotater{
        id: rect4
        transform: Rotation{
            id: rotator4
            origin.x: originx; origin.y: rect3.height/2; angle: -360
        }
    }
    Rotater{
        id: rect5
        transform: Rotation{
            id: rotator5
            origin.x: originx; origin.y: rect3.height/2; angle: -380
        }
    }

    //initialize animation by reassigning the x property
   Component.onCompleted: rect1.x = 213;
}
