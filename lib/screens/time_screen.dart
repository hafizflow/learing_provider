import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learing_provider/provider/time_provider.dart';
import 'package:provider/provider.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TimeProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      provider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<TimeProvider>(context, listen: false);
    log('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TimeProvider>(builder: (context, value, _) {
              return Column(
                children: [
                  Text(
                    '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                    style: const TextStyle(fontSize: 60),
                  ),
                  Text(
                    value.count.toString(),
                    style: const TextStyle(fontSize: 60),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          countProvider.setCount();
        },
      ),
    );
  }
}
