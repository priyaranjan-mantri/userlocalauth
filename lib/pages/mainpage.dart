import 'dart:developer';

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
          ElevatedButton(
            onPressed: () async {
              //withArgs();
              withArgsCallback();
            },
            child: const Text('with args'),
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
      log('Value form kotlin : $value');
      if (value == "true") {
        Get.to(() => const WellCome());
      }
    } catch (e) {
      log('Error : $e');
    }
  }

  void keyguardManager() async {
    String value = '';
    try {
      value = await platform.invokeMethod("keyguardManager");
      log('is authenticated : $value');
    } catch (e) {
      log('error : $e');
    }
  }

  void isAuthenticate() async {
    String value = '';
    try {
      value = await platform.invokeMethod("isAuthenticated");
      log('is authenticated : $value');
    } catch (e) {
      log('error : $e');
    }
  }

  void withArgs() async {
    String value = '';
    try {
      value = await platform.invokeMethod("withArgs", "Hello from Flutter");
      log('my args : $value');
    } catch (e) {
      log('error : $e');
    }
  }

  void withArgsCallback() async {
    String value = '';
    try {
      value = await platform.invokeMethod("withArgsCallback", () {
        log('message from flutter callback');
      });

      log('my args : $value');
    } catch (e) {
      log('error : $e');
    }
  }

  // $ check biomteric is avalable or not
  // ? if yes then go for => biometric prompt
  // * if no then go for => keyguard manager
}
