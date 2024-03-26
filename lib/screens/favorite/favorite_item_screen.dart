import 'package:flutter/material.dart';
import 'package:learing_provider/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
      ),
      body: Consumer<FavoriteProvider>(builder: (context, value, _) {
        return ListView.builder(
            itemCount: value.myFavorite.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Product ${index + 1}'),
                trailing: InkWell(
                  onTap: () {
                    value.removeSelected(index);
                  },
                  child: const Icon(Icons.favorite),
                ),
              );
            });
      }),
    );
  }
}
