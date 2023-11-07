import 'package:flutter/material.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.biodata,
  });

  final Data biodata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Biodata")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          textTitle(biodata.name, Colors.black38),
          const SizedBox(height: 15),
          Image(
            image: AssetImage(biodata.image),
            width: 200,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              btnContact(Icons.alternate_email_outlined, Colors.greenAccent,
                  "mailto:${biodata.email}"),
              const SizedBox(width: 10),
              btnContact(Icons.message, Colors.blueAccent,
                  "https://wa.me/${biodata.phone}"),
              const SizedBox(width: 10),
              btnContact(
                  Icons.phone, Colors.deepPurple, "tel:${biodata.phone}"),
            ],
          ),
          const SizedBox(height: 10),
          textAttribute("Hobby", biodata.hobby),
          textAttribute("Alamat", biodata.address),
          const SizedBox(height: 10),
          textTitle('Deskripsi', Colors.grey),
          const SizedBox(height: 10),
          Text(
            biodata.desc,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          )
        ]),
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
          width: 85,
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
