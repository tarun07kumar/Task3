import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade700,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: Image.asset('assets/tsf_logo.png'),
            ),
            _homeScreenColumnWidgets(
                text: 'The Sparks Foundation',
                marginFromTopVal: 0.0,
                fontSize: 25.0,
                color: Colors.amber),
            _homeScreenColumnWidgets(
                text: 'Mobile App Development Internship',
                marginFromTopVal: 30.0,
                fontSize: 22.0),
            _homeScreenColumnWidgets(
                text: 'Payment Gateway Integration',
                marginFromTopVal: 30.0,
                fontSize: 20.0,
                color: Colors.black),
            _donateButton(),
          ],
        ),
      ),
    );
  }

  Widget _homeScreenColumnWidgets(
      {@required String text,
      @required double marginFromTopVal,
      @required double fontSize,
      Color color = Colors.white70}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginFromTopVal),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _donateButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.green.shade900,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(color: Colors.green.shade900)),
        ),
        child: Text(
          'Donate',
          style: TextStyle(color: Colors.green.shade900, fontSize: 16.0),
        ),
        onPressed: () async {
          print('Donate Button Pressed');

          try {
            /// This is the RazorPay Payment Pages onBoarding link
            // ignore: deprecated_member_use
            await launch('https://rzp.io/l/L0y1FPfi');
          } catch (e) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: const Color.fromRGBO(34, 48, 60, 0.6),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      title: Center(
                        child: Text(
                          'Unknown Error Occured',
                          style: TextStyle(color: Colors.red, fontSize: 18.0),
                        ),
                      ),
                      content: Center(
                        child: Text(
                          'Make Sure your Internet Connected Properly',
                          style: TextStyle(color: Colors.amber, fontSize: 18.0),
                        ),
                      ),
                    ));
          }
        },
      ),
    );
  }
}
