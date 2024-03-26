import 'package:flutter/material.dart';
import 'package:learing_provider/provider/favorite_provider.dart';
import 'package:learing_provider/screens/favorite/favorite_item_screen.dart';
import 'package:learing_provider/screens/favorite/theme_changer_screen.dart';
import 'package:provider/provider.dart';

class AllItemScreen extends StatelessWidget {
  const AllItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.change_circle),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ThemeChangerScreen();
            }));
          },
        ),
        title: const Text('All Item'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FavoriteScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.favorite, color: Colors.red.shade700),
            ),
          )
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Product ${index + 1}"),
              trailing: Consumer<FavoriteProvider>(
                builder: (context, value, _) {
                  return InkWell(
                    onTap: () {
                      if (value.myFavorite.contains(index)) {
                        value.removeMyFavorite(index);
                      } else {
                        value.setMyFavorite(index);
                      }
                    },
                    child: Icon(
                      value.myFavorite.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
