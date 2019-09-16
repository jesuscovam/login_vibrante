import 'package:flutter/material.dart';
import 'inputWidget.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "Correo",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A))
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0),
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'Escribe tu correo para continuar',
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Color(0xFFA0A0A0),
                                fontSize: 12),
                              ),
                          )),
                          GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/home');
                          },
                          child:Container(
                            padding: EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              gradient: LinearGradient(
                                colors: singInGradients,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                              )
                            ),
                            child: ImageIcon(
                              AssetImage('assets/ic_forward.png'),
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            roundedRectButton('Iniciar Sesión', singInGradients, false),
            roundedRectButton('Crear cuenta', signUpGradients, false),
          ],
        )
      ],
    );
  }
}

Widget roundedRectButton(
  String title, List<Color> gradient, bool isEndIconVisible){
    return Builder(builder: (BuildContext mContext){
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment(1.0, 0.0),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(mContext).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                )),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            Visibility(
              visible: isEndIconVisible,
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: ImageIcon(
                  AssetImage("assets/ic_forward.png"),
                  size: 30,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  const List<Color> singInGradients =[
    Color(0xFFE22EE6),
    Color(0xFFE608EC),
  ];

  const List<Color> signUpGradients = [
    Color(0xFFFF9945),
    Color(0xFFFc6076),
];