import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup_ui_starter/screens/homePage.dart';
import 'package:login_signup_ui_starter/screens/tabControll.dart';
import 'package:login_signup_ui_starter/theme.dart';
import 'package:login_signup_ui_starter/widgets/primary_button.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_ui_starter/widgets/signup_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api.dart';


class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
     Iterable ds = [];
  int check = 0 ;
  TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String errMessage ;
  final FirebaseAuth _auth = FirebaseAuth.instance;
    bool isUpdate = true;
    String add = "";
    String dangnhap='';

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { 
        Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Sai thông tin"),
    content: Text("Vui lòng kiểm tra lại thông tin tài khoản!", style: TextStyle(color: Colors.red),),
    actions: [
      okButton,
    ],
  );
     
//     signInMethod(String email, String password) async {

// var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"), body: {
//   "email": email,
//   "password": password
// });

//   var jsonResponse = null;

//   if (response.statusCode == 200) {
//     jsonResponse = json.decode(response.body);
//     if (jsonResponse != null) {

//       print(jsonResponse['token']);  // for Printing the token

//       // Navigator used to enter inside app if the authentication is correct
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(
//             builder: (BuildContext context) => HomePage(),
//           ),
//           (Route<dynamic> route) => false);
//     }
//   } else {
//     print("Error message like email or password wrong!!!!");  // Toast
//   }
// }
  //   signIn(String email, password) async {
  //   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {
  //     'email': email,
  //     'password': password
  //   };
  //   var jsonResponse = null;
  //   var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"), body: data);
  //   if(response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if(jsonResponse != null) {
  //       setState(() {
  //       });
  //       // sharedPreferences.setString("token", jsonResponse['token']);
  //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
  //     }
  //   }
  //   else {
  //     setState(() {
  //     });
  //   }
  // }

    return Form(
      key: _formKey,
  child: Column(
    children: [
      
        buildInputFormEmail('Email', false),
        buildInputFormPassword('Password', true),
          SizedBox(
                height: 20,
              ),
              GestureDetector(
                   onTap: (){
                     
                    //  signIn(_email.text, _password.text);
                   if(_email.text==""||_password.text=="")
                  {
                   signIn(_email.text, _password.text);
                  }
                  else {
                      API(
                        url: "http://10.0.2.2:8000/api/dang_nhap_tai_khoan/" +
                            _email.text +
                            "/" +
                            _password.text)
                    .getDataString()
                    .then((value) {
                  dangnhap = value;
                  print(value);

                  setState(() {
                    if (dangnhap == "duoc") {
                    
                      // Fluttertoast.showToast(msg: "Đăng nhập thành công");
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AllTabControll(id: _email.text,)));
                    } else {
                       showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

                    }
                  });
                });
                  }
              
              },
                 
                                   //   signIn(_email.text, _password.text);

                      //  Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => AllTabControll()));
                   
                   child: PrimaryButton(buttonText: 'Đăng nhập',
                 
                   ),
                 ),
    ],
  ),
    );
  }

  Padding buildInputFormEmail(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: _email,
        validator: (value) {
   
                           if (value.isEmpty) {
                             return ('Nhập email');
                           }
                          if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]')
                             .hasMatch(value)) {
                           return ('Nhập email đúng định dạng');
                           }
                          return null;
                        },
                        onSaved: (value) {
                          _email.text = value;
                        },
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? Icon(
                            Icons.visibility_off,
                            color: kTextFieldColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                  )
                : null),
      ),
    );
  }
    Padding buildInputFormPassword(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: _password,
        validator: (value) {
          
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value.isEmpty) {
                            return ('Nhập password');
                          }
                          if (!regex.hasMatch(value)) {
                            return ('Nhập password ít nhất 6 kí tự');
                          }
                        },
                        onSaved: (value) {
                          _password.text = value;
                        },
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? Icon(
                            Icons.visibility_off,
                            color: kTextFieldColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                  )
                : null),
      ),
    );
  }void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
        


      }
    }
  
}
