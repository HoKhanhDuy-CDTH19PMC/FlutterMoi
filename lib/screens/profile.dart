import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/screens/login.dart';

import '../api.dart';
Iterable us = [];
class Profile extends StatelessWidget {
  String id;

    Profile({Key key,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       API(
                          url:
                              "http://10.0.2.2:8000/api/findUser/" +id)
                                 
                      .getDataString()
                      .then((value) {
                    us = json.decode(value);
                    print(us);
                   
                           
                  });
                
    return Scaffold(
      body: ListView(
             children: [
                       Column(
          
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
               
                 "https://nichetravel.com.vn/wp-content/uploads/2020/08/travel-world.jpg",
            
                  ),
                  fit: BoxFit.cover
                )
              ),
            child: Container(
              width: double.infinity,
              height: 170,
              child: Container(
                alignment: Alignment(0.0,2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                     "http://www.imgworlds.com/wp-content/uploads/2015/12/18-CONTACTUS-HEADER.jpg"
                  ),
                  radius: 60.0,
                ),
              ),
            ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              us.elementAt(0)["fullname"].toString()
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              us.elementAt(0)["email"].toString()
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
             us.elementAt(0)["phone"].toString()
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              elevation: 2.0,
              color: Colors.cyan,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                  child: Text("Setting",style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                     
                  ),))
            ),
            SizedBox(
              height: 14,
            ),
            // Text(
            //   "App Developer || Digital Marketer"
            //   ,style: TextStyle(
            //     fontSize: 18.0,
            //     color:Colors.black45,
            //     letterSpacing: 2.0,
            //     fontWeight: FontWeight.w300
            // ),
            // ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Share",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600
                            ),),
                          SizedBox(
                            height: 7,
                          ),
                          Text("15",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w300
                            ),)
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child:
                    //   Column(
                    //     children: [
                    //       Text("Followers",
                    //         style: TextStyle(
                    //             color: Colors.blueAccent,
                    //             fontSize: 22.0,
                    //             fontWeight: FontWeight.w600
                    //         ),),
                    //       SizedBox(
                    //         height: 7,
                    //       ),
                    //       Text("2000",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 22.0,
                    //             fontWeight: FontWeight.w300
                    //         ),)
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                          RaisedButton(
                  onPressed: (){
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.pink,Colors.redAccent]
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.pink,Colors.redAccent]
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: InkWell(
                     child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    onTap: (){
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  LogInScreen()),
  );
                    }
                    )
                  ),
                )
                    ],
                  ),
                )
            
              ],
            )
          ],
        ),
              ]

      )
    );
  }
}