import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  _UserPanelState createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('D1_zov'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30)),
                Text('Jonh Doe', style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
                ),),
                Padding(padding: EdgeInsets.only(top:10)),
                CircleAvatar(
                  backgroundImage: AssetImage('Assets/img/sea.jpg'),
                  radius: 50,
                ),
                Padding(padding: EdgeInsets.only(top:10)),
                Row(
                  children: [
                    Icon(Icons.mail_outline,size: 25,),
                    Padding(padding: EdgeInsets.only(left:10)),
                    Text('Mail', style:  TextStyle(color: Colors.green),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top:10)),
                Text('Count: $_count', style:  TextStyle(color: Colors.green),)
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_sharp),
        backgroundColor: Colors.green,
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}

