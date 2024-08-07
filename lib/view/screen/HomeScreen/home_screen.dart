import 'package:adv_flutter_exam/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    final countries = Provider.of<HomeProvider>(context).countries;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.flag,
          size: 35,
          color: Colors.blue,
        ),
        title: const Text('countries'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              countries[index].flag,
              scale: 5,
            ),
            title: Text(countries[index].name),
            subtitle: Text(countries[index].capital),
            trailing: Text(
              countries[index].region,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/detail', arguments: countries[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/save');
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
