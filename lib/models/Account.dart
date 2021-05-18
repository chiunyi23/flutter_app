import 'package:flutter/cupertino.dart';


class Account {
  String userName;
  String email;
  int age;
  String birthday;
  String password;

  // ignore: sort_constructors_first
  // Account({@required this.userName, @required this.email, @required this.age});
}


class AccountModel extends ChangeNotifier{
  // Account _user;
  // const Account({@required this.userName});

  String _firstName;
  String _lastName;
  String _email;
  int _age;
  String _birthday;
  String _password;
  String _number;
  String _address;
  int _balance;

  AccountModel() {
    _firstName = 'test_first';
    _lastName = 'test_last';
    _email = 'test_email';
    _age = 10;
    _birthday = '1999-10-10';
    _number = '0912345678';
    _address = 'test_address';
    _balance = 0;
  }

  String get email => _email;
  String get password => _password;
  String get birthday => _birthday;
  int get age => _age;
  String get number => _number;
  String get address => _address;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get balance => _balance;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setName(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
    notifyListeners();
  }
  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }
  void setNumber(String number) {
    _number = number;
    notifyListeners();
  }
  void setBirthday(String birthday) {
    _birthday = birthday;
    notifyListeners();
  }
  void setBalance(String balance) {
    _balance = int.parse(balance);
    notifyListeners();
  }
  void setBalanceInt(int balance) {
    _balance = balance;
    notifyListeners();
  }


  // void update1(String email, String password) {
  //   _user.email = email;
  //   _user.password = password;
  //   notifyListeners();
  // }
}

// class AccountRegister extends Account -> to separate register to server and in app account