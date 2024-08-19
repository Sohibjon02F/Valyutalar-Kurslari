import 'package:flutter/material.dart';
import 'package:gt/Model/valyuta_model.dart';

class InfoPage extends StatelessWidget {
  final ValyutaModel item;

  InfoPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.ccyNmUZ.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Code: ${item.ccy}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Rate: ${item.rate}',
              style: TextStyle(fontSize: 18),
            ),
            // Add more fields as necessary
          ],
        ),
      ),
    );
  }
}
