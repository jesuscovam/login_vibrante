import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          new Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset('assets/collaboration.png', width: MediaQuery.of(context).size.width/1.5),
              WavyHeader()
            ],
          ),
          Expanded(
            child: Container(

            ),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              WavyFooter(),
              CirclePink(),
              CircleYellow()
            ],
          )
        ],
      ),
    );
  }
}

const List<Color> orangeGradients = [
  Color(0xFFFC97ED),
  Color(0xFFE22EE6),
  Color(0xFFE608EC),
];

const List<Color> aquaGradients = [
  Color(0xFFE608EC),
  Color(0xFFE22EE6),
];

class WavyHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: orangeGradients,
            begin: Alignment.topLeft,
            end: Alignment.center)
          ),
          height: MediaQuery.of(context).size.height / 2.5,
        ),
    );
  }
}

class WavyFooter extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: aquaGradients,
            begin: Alignment.center,
            end: Alignment.bottomLeft),
          ),
          height: MediaQuery.of(context).size.width / 3,
        ),
    );
  }
}

class CirclePink extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Colors.yellow,
        child: Padding(padding: EdgeInsets.all(140)),
        shape: CircleBorder(side:BorderSide(color: Colors.white, width: 15.0)),
      )
    );
  }
}

class CircleYellow extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Colors.yellow,
        child: Padding(padding:EdgeInsets.all(140)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
      )
    );
  }
}
class TopWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height -30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy);
    
    var secondControlPoint = new Offset(size.width / 5, size.height /4);
    var secondEndPoint = new Offset(size.width / 1.5, size.height / 5);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = new Offset(size.width - (size.width / 9), size.height /6);
    var thirdEndPoint = new Offset(size.width, 0.0);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
      thirdEndPoint.dx, thirdEndPoint.dy);
    
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    
    var secondControlPoint = Offset(size.width - (size.width /6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy);
    
    return path;
  }
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class YellowCircleClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}