import 'package:flutter/material.dart';

class ValueNotifyListener extends StatelessWidget {
  ValueNotifyListener({super.key});

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('Page Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifyListener'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              builder: (context, value, _) {
                return TextFormField(
                  obscureText: value,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      child: const Icon(Icons.visibility),
                      onTap: () {
                        obscure.value = !obscure.value;
                      },
                    ),
                  ),
                );
              },
              valueListenable: obscure,
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              builder: (context, value, _) {
                return Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 32),
                );
              },
              valueListenable: counter,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter.value++;
          print(counter.value.toString());
        },
      ),
    );
  }
}
