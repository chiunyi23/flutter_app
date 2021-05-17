import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/screens/map/map_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/signup.dart';
import 'package:shop_app/screens/scan/scan_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AccountModel>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "完成",
            press: () async {
              // if (_formKey.currentState.validate()) {
              //   Navigator.pushNamed(context, OtpScreen.routeName);
              // }
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                user.setAddress(address);
                user.setName(firstName, lastName);
                user.setNumber(phoneNumber);
                user.setBirthday('2000-01-01');
                final sendData = await sendUserAccount(user.email, user.password, user.firstName, user.birthday);
                if (sendData == 'ok') {
                  print('sent');
                  // if all are valid then go to success screen
                  // await Navigator.pushNamed(context, ScanScreen.routeName);

                  Navigator.pushNamed(context, MapScreen.routeName);
                }
                else {
                  await Fluttertoast.showToast(msg: '伺服器錯誤');
                  print('not connected');
                }


              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: kAddressNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "地址",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     addError(error: kPhoneNumberNullError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        labelText: "手機號碼",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "名稱",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
