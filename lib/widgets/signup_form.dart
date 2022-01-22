import 'package:flutter/material.dart';
import 'package:login_signup_ui_starter/screens/login.dart';
import 'package:login_signup_ui_starter/theme.dart';
import 'package:login_signup_ui_starter/widgets/login_form.dart';
import 'package:login_signup_ui_starter/widgets/primary_button.dart';
import 'package:login_signup_ui_starter/widgets/user.dart';

import '../api.dart';
import 'checkbox.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  TextEditingController fistname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
    String add = "";
bool isUpdate = true;

  String errorMessage;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
       Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { 
 Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Chúc mừng"),
    content: Text(" Đăng ký thành công!", style: TextStyle(color: Colors.green),),
    actions: [
      okButton,
    ],
  );
    return Form
    (key: _formKey,child:Column( children: [
        buildInputFormFirstName('Full Name', false),
        buildInputFormLastName('User Name', false),
        buildInputFormEmail('Email', false),
        buildInputFormPhone('Phone', false),
        buildInputFormPassword('Password', true),
        // buildInputFormConfirm('Confirm Password', true),
               SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: CheckBox('Agree to terms and conditions.'),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: CheckBox('I have at least 18 years old.'),
            // ),
            //  SizedBox(
            //   height: 20,
            // ),
             GestureDetector(
              onTap: () {
                if(email.text==""||phone.text==""||lastname.text==""||password.text=="")
                {
signUp();  
                }
                else
                
                {
                
      API(
                        url: "http://10.0.2.2:8000/api/them-tai-khoan/" +
                            fistname.text +
                            "/" +
                            lastname.text +
                            "/" +
                            password.text +
                            "/" +
                            phone.text +
                            "/" +
                            email.text)
                    .getDataString()
                    .then((value) {
                  add = value;
                  print(value);
                  isUpdate = false;
                  setState(() {});
                });
                                   showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

                }
                                
          
              },
              child: PrimaryButton(
                buttonText: 'Đăng ký',
              ),
            ),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: PrimaryButton(buttonText: 'Sign Up'),
            // ),
      ],
    ));
     
  }

  Padding buildInputFormFirstName(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          controller: fistname,
        validator: (value) {
                      if (value.isEmpty) {
                        return ('Vui lòng nhập họ và tên');
                      }},
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
    Padding buildInputFormLastName(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
            validator: (value) {
                      if (value.isEmpty) {
                        return ('Vui lòng nhập tên đăng nhập');
                      }},
           controller: lastname,
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
    Padding buildInputFormEmail(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
           controller: email,
           validator: (value) {
                      if (value.isEmpty) {
                        return ('Vui lòng nhập email');
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]')
                          .hasMatch(value)) {
                        return ('Vui lòng nhập email đúng định dạng');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email.text = value;
                    },
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
    Padding buildInputFormPhone(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
            validator: (value) {
                      if (value.isEmpty) {
                        return ('Vui lòng nhập số điện thoại');
                      }},
           controller: phone,
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
    Padding buildInputFormPassword(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
           controller: password,
           validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value.isEmpty) {
                        return ('Vui lòng nhập password');
                      }
                      if (!regex.hasMatch(value)) {
                        return ('Vui lòng nhập password ít nhất 6 kí tự');
                      }
                    },
                    onSaved: (value) {
                      password.text = value;
                    },
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
    Padding buildInputFormConfirm(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
                  
           controller: confirm,
              validator: (value) {
                       if(password!=confirm){
                         return "Xác nhận mật khẩu sai!"; 
                       }
                       return null;
                
                     },
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kTextFieldColor),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
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
                          ))
                : null,
          ),
        ));
        
  }
  void signUp() async {
    if (_formKey.currentState.validate()) {
   
    }
  }

  postDetailsToFirestore() async {
    

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();


    userModel.email = user.email;
    userModel.id = user.uid;
    userModel.firstname = fistname.text;
    userModel.firstname = lastname.text;
   
    userModel.phone = phone.text;



    await firebaseFirestore
        .collection("user")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Đăng kí thành công :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LogInScreen()),
        (route) => false);
  }


}
