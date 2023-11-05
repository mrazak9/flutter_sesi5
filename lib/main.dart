import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'EZIO Auditore';
    biodata['email'] = 'ezio@gmail.com';
    biodata['phone'] = '+6282214773030';
    biodata['image'] = 'ezio.jpg';
    biodata['hobby'] = 'Extreme Sport';
    biodata['address'] = 'Bandung Jawa Barat';
    biodata['desc'] =
        '''Ezio is an assassin from Assassin's Creed 2, Brotherhood, and Revelations. The player role-playing Ezio is the second to do so, but the first to have done anything with him. He chose Ezio on May 23, 2010. The player then went inactive. Ezio Auditore was born with no knowledge of his lineage or connection to the Assassins. However, he was trained unknowingly by his father, a high-up assassin himself. As a teenager he was feared by several gangs and, surprisingly, friends with a young artist.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            textTitle(biodata['name'] ?? '', Colors.black38),
            const SizedBox(height: 15),
            Image(image: AssetImage('assets/images/${biodata["image"] ?? ''}')),
            const SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email_outlined, Colors.greenAccent,
                    "mailto:${biodata['email'] ?? ''}"),
                const SizedBox(width: 10),
                btnContact(Icons.message, Colors.blueAccent,
                    "https://wa.me/${biodata['phone'] ?? ''}"),
                const SizedBox(width: 10),
                btnContact(Icons.phone, Colors.deepPurple,
                    "tel:${biodata['phone'] ?? ''}"),
              ],
            ),
            const SizedBox(height: 10),
            textAttribute("Hobby", biodata['hobby'] ?? ''),
            textAttribute("Alamat", biodata['address'] ?? ''),
            const SizedBox(height: 10),
            textTitle('Deskripsi', Colors.grey),
            const SizedBox(height: 10),
            Text(
              biodata['desc'] ?? '',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            )
          ]),
        ),
      ),
    );
  }

  Container textTitle(String value, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        value,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttribute(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            "- $label",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(fontSize: 18),
        ),
        Text(value, style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Expanded btnContact(IconData icon, Color color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        child: Icon(icon),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
