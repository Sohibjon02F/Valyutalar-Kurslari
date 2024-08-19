import 'package:flutter/material.dart';
import 'package:gt/Model/valyuta_model.dart';
import 'package:gt/service/valyuta_service.dart';
import 'package:gt/ui/info_page.dart';

class ValyutaPage extends StatelessWidget {
   ValyutaPage({Key? key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Malumotlar")),
      body: FutureBuilder(
        future: ValyutaService().getValyuta(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final List<ValyutaModel> kurslar = snapshot.data!;
            return ListView.builder(
              itemCount: kurslar.length,
              itemBuilder: (context, index) {
                final ValyutaModel kurs = kurslar[index];
                return ListTile(
                  title: Text(kurs.ccyNmUZ.toString()),
                  onTap: () {
                    // Elementni bosganda, InfoPage sahifasiga o'tish
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(item: kurs),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
