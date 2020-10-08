import 'package:flutter/material.dart';
import 'package:flutter_app/shared/sp.dart';
import 'package:flutter_app/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiservice.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
        ),
        home: Scaffold(
          key: _scaffoldState,
          appBar: AppBar(
            title: Text(
              "Test MKM",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: RaisedButton(
                      child: Text("Hello"),
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String loginState = prefs.getString('login_state');
                        if (loginState == null || loginState.isEmpty) {
                          Navigator.push(
                            _scaffoldState.currentContext,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return LoginScreen();
                            }),
                          );
                        }
                        Map<String, dynamic> map = new Map();
                        map.putIfAbsent("username", () => "feri");
                        _apiService.myinfo(map).then((data) {
                          setState(() => _isLoading = true);
                          if (data != null) {
                            if (loginState == data.data.login_state) {
                              _scaffoldState.currentState.showSnackBar(SnackBar(
                                content: Text(data.data.username +
                                    " " +
                                    data.data.login_time),
                              ));
                            } else {
                              Navigator.push(
                                _scaffoldState.currentContext,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return LoginScreen();
                                }),
                              );
                              removeValuesSF();
                            }
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("anda belum login"),
                            ));
                          }
                        });

                        return;
                      }))
            ],
          ),
        ));
  }
}
