import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget{
  final bool isTrue;
  final VoidCallback _onTap;
  CorrectWrongOverlay(this.isTrue,this._onTap);
  
  

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return CorrectWrongOverlayDisplay();
    }
}

class CorrectWrongOverlayDisplay extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      animationController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 1000));
      animation=new CurvedAnimation(parent: animationController,curve: Curves.bounceOut);
      animationController.addListener(() => this.setState(()=>{}));
      animationController.forward();
    }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: (){ widget._onTap(); },
          child:new Center(
            child: new Transform.rotate(
              angle: animation.value*2*pi,
              child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white,width: 10.0,),
                    shape: BoxShape.circle,
                  ),
                child:new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child:new Icon((widget.isTrue) ? Icons.done : Icons.clear ,size: 50.0,color: Colors.white,),
                ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child:new Text((widget.isTrue) ? "Correct!" : "Wrong!",style: new TextStyle(color: Colors.white,fontSize: 20.0) ,),
                ),
              ],
            ),
            ),
          ),
        ),
      );
    }
  }