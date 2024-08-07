import 'package:adv_flutter_exam/model/model.dart';
import 'package:adv_flutter_exam/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountryModel country =
        ModalRoute.of(context)!.settings.arguments as CountryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              country.flag,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('Country Name : ${country.name}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Capital: ${country.capital}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('Region: ${country.region}',
                    style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: WidgetStateColor.transparent),
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .saveCountry(country);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${country.name} saved!'),
                  ),
                );
              },
              child: const Text(
                'Save Country',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
