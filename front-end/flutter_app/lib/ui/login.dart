import 'package:flutter/material.dart';
import 'package:flutter_app/api/apiservice.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/shared/sp.dart';
import 'package:flutter_app/ui/Register.dart';
import 'package:flutter_app/ui/app.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  User user;

  LoginScreen({this.user});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldUsernameValid;
  bool _isFieldPasswordValid;
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldUsername(),
                _buildTextFieldPassword(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldUsernameValid == null ||
                          _isFieldPasswordValid == null ||
                          !_isFieldUsernameValid ||
                          !_isFieldPasswordValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String username = _controllerUsername.text.toString();
                      String password = _controllerPassword.text.toString();
                      Map<String, dynamic> map = new Map();
                      map.putIfAbsent("username", () => username);
                      map.putIfAbsent("password", () => password);
                      _apiService.login(map).then((data) {
                        setState(() => _isLoading = false);
                        if (data != null) {
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                            content: Text("Login Sukses"),
                          ));
                          addStringToSF("username",data.data.username);
                          addStringToSF("login_state",data.data.login_state);
                          Navigator.push(
                            _scaffoldState.currentContext,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return App();
                            }),
                          );
                        } else {
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                            content: Text("Login failed"),
                          ));
                        }
                      });
                    },
                    color: Colors.orange[600],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          _scaffoldState.currentContext,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return RegisterScreen();
                          }),
                        );
                      },
                      color: Colors.orange[600],
                    )
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldUsername() {
    return TextField(
      controller: _controllerUsername,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Username",
        errorText: _isFieldUsernameValid == null || _isFieldUsernameValid
            ? null
            : "Username is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldUsernameValid) {
          setState(() => _isFieldUsernameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldPassword() {
    return TextField(
      controller: _controllerPassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        errorText: _isFieldPasswordValid == null || _isFieldPasswordValid
            ? null
            : "Password is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldPasswordValid) {
          setState(() => _isFieldPasswordValid = isFieldValid);
        }
      },
    );
  }
}
