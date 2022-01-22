import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup_ui_starter/screens/homePage.dart';
import 'package:login_signup_ui_starter/screens/share_me.dart';
import 'news.dart';
import 'profile.dart';
void main() {
  runApp(const AllTabControll());
}

class AllTabControll extends StatelessWidget {
 final String id;

  const AllTabControll({Key key,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: DefaultTabController(
          length: 4,
          child: Scaffold(
          
            bottomNavigationBar: menu(),
            body: TabBarView(
              children: [
                HomePage(id:id),
                News(),
                Profile(id: id,),
                ShareOfMe(id:id)
              
              ],
            ),
          ),
        ),
    );
    
  }
  
}

     Widget menu() {
return Container(
  color: Color.fromRGBO(255,255,255,0),
  child: TabBar(
    labelColor:  Colors.pink,
    unselectedLabelColor:Colors.black,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.blue,
    tabs: [
      Tab(
        text: "HOME",
        icon: Icon(Icons.home)
      ),
      Tab(
        text: "SHARES",
        icon: Icon(Icons.assignment),
      ),
        Tab(
           text: "PROFILE",
     
        icon: Icon(Icons.settings),
      ),
      Tab(
          text: "ME",
        icon: Icon(Icons.account_balance_wallet),
      ),
    
    ],
  ),
);
} 