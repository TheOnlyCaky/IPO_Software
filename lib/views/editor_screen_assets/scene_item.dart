import 'package:flutter/material.dart';
import 'package:blizzard_wizzard/models/scene.dart';

class SceneItem extends StatelessWidget {
  final ValueChanged<int> onTap;
  final ValueChanged<int> onDoubleTap; 
  final Scene scene;
  final bool selected;
  final int index;

  SceneItem({Key key, @required this.scene, this.selected = false, this.index = 0, this.onTap, this.onDoubleTap}) : super(key: key);

  String _timeToText(double seconds){
    int hr, min, sec;

    if(seconds < 60){
      return "${seconds}s";
    }

    if(seconds < 60*60){
      min = (seconds/60).truncate();
      sec = ((seconds/60 - min) * 60).truncate();
      return "${min}m${sec}s";
    }

    hr = (seconds/(60*60)).truncate();
    min = ((seconds/(60*60) - hr) * 60).truncate();
    sec = ((((seconds/(60*60) - hr) * 60) - min) * 60).truncate();

    return "${hr}h${min}m${sec}s";

  }

  @override
  Widget build(BuildContext context) {

    Color headerFontColor = (selected) ? Colors.white : Theme.of(context).primaryColor;
    Color fontColor = (selected) ? Colors.white : Theme.of(context).textTheme.body1.color;
    Color bgColor = (!selected) ? Colors.white : Theme.of(context).primaryColor;

    return Card(
      color: bgColor,
      child: InkWell(
        child: ListTile(
          leading: Text(
            (index + 1).toString(),
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              color: headerFontColor
            ),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(height: 3.0),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Name:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: headerFontColor
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Text(
                      scene.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: headerFontColor
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Hold:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Text(
                      (scene.hold == 0) ?
                      "Halt" :
                      "${_timeToText(scene.hold)}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Cross Fade:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Text(
                      "${_timeToText(scene.xFade)}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Fade In:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Text(
                      "${_timeToText(scene.fadeIn)}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Fade Out:",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Text(
                      "${_timeToText(scene.fadeOut)}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: fontColor
                      ),
                    ),
                  ),
                ]
              ),
              Container(height: 3.0),
            ],
          ),
        ),
        onTap: (){onTap(index);},
        onDoubleTap: (){onDoubleTap(index);},
      )
    );
  }
}