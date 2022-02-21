import 'package:flutter/material.dart';

class WellCome extends StatelessWidget {
  const WellCome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WellComeBody(),
    );
  }
}

class WellComeBody extends StatelessWidget {
  const WellComeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text('you are authenticated successfully'),
      ),
    );
  }
}
