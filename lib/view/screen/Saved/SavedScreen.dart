import 'package:adv_flutter_exam/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final savedCountries = Provider.of<HomeProvider>(context).savedCountries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Countries'),
      ),
      body: ListView.builder(
        itemCount: savedCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              savedCountries[index].flag,
              scale: 5,
            ),
            title: Text(savedCountries[index].name),
            subtitle: Text(savedCountries[index].capital),
            trailing: Text(
              savedCountries[index].region,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[800],
              ),
            ),
          );
        },
      ),
    );
  }
}
