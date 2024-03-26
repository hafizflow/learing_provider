import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learing_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('Widget Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Center(
        child: Consumer<SliderProvider>(builder: (context, provider, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: provider.value,
                onChanged: (val) {
                  log(provider.value.toString());
                  provider.setValue(val);
                },
              ),
              Container(
                height: 100,
                color: Colors.teal.withOpacity(provider.value),
              )
            ],
          );
        }),
      ),
    );
  }
}
