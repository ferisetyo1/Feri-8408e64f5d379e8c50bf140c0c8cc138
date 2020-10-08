import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String key, String val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, val);
}

getStringValuesSF(String s) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(s);
  return stringValue;
}

removeValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("username");
  prefs.remove("login_state");
}