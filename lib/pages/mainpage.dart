import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userlocalauth/pages/wellcome.dart';
import 'package:userlocalauth/utils/localauthservice.dart';
import 'package:flutter/services.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Local Auth'),
        centerTitle: true,
      ),
      body: const MainPageBody(),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you want to authenticate',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              biometricPrompt();
            },
            child: const Text('Biometric'),
          ),
          ElevatedButton(
            onPressed: () async {
              keyguardManager();
            },
            child: const Text('PIN/Passcode/pattern'),
          ),
          ElevatedButton(
            onPressed: () async {
              isAuthenticate();
            },
            child: const Text('is Authenticated'),
          ),
        ],
      ),
    );
  }

  static const platform = MethodChannel("com.flutter.epic/epic");
  void biometricPrompt() async {
    String value = '';
    try {
      value = await platform.invokeMethod("biometricPrompt");
      print('Value form kotlin : $value');
    } catch (e) {
      print(e);
    }
  }

  void keyguardManager() async {
    String value = '';
    try {
      value = await platform.invokeMethod("keyguardManager");
      print('is authenticated : $value');
    } catch (e) {
      print(e);
    }
  }

  void isAuthenticate() async {
    String value = '';
    try {
      value = await platform.invokeMethod("isAuthenticated");
      print('is authenticated : $value');
    } catch (e) {
      print(e);
    }
  }
}
