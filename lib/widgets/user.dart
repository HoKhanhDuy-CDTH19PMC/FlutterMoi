class UserModel {
  String id;
  String firstname;
  String lastname;
  String email;
  String phone;
  String password;
  String confirm;

  UserModel({this.id, this.firstname, this.lastname, this.email, this.phone,this.password,this.confirm});

  ///du lieu server
  factory UserModel.fromMap(map) {
    return UserModel(
      id: map('id'),
      firstname: map('First Name'),
      lastname: map('Last Name'),
      email: map('Email'),
      phone: map('Phone'),
      password: map('Password'),
      confirm: map('Confirm Password')

    );
  }

  ///gui du lieu len mail
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'First Name': firstname,
      'Last Name':lastname,
      'Email': email,
      'Phone': phone,
      'Password':password,
      'Confirm Password':confirm


      
    };
  }
}
