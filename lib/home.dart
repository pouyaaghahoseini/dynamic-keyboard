import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getPermission() async {
    var permitStatus = await Permission.storage.status;
    print(permitStatus);
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    print("Home build --");
    getPermission();

    return Scaffold(
      backgroundColor: Color(0xff15202b),
      appBar: AppBar(
        title: Text('Welcome to Dynamic Keyboard Experiment'),
        centerTitle: true,
        backgroundColor: Color(0xff1D2C3B),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'Please choose your Keyboard type.',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 150.0,
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/dynamic', // gotta push the next screen while passing the input method
                          arguments: ('Dynamic' + DateTime.now().toString()));
                    },
                    child: Center(
                      child: const Text(
                        "Dynamic",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.0,
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/normal', // gotta push the next screen while passing the input method.
                          arguments: ('Normal' + DateTime.now().toString()));
                    },
                    child: const Text(
                      "Normal",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
