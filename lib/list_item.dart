import 'package:flutter/material.dart';
import 'package:flutter_basic_1/data.dart';
import 'package:flutter_basic_1/detail_page.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.biodata});

  final Data biodata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(biodata: biodata)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 83, 83, 83),
                offset: Offset(1, 2),
                blurRadius: 6,
              ),
            ]),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                biodata.image,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            textDeskripsi()
          ],
        ),
      ),
    );
  }

  Column textDeskripsi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          biodata.name,
          style: const TextStyle(color: Colors.black38, fontSize: 20),
        ),
        Text(biodata.email),
        Text(biodata.phone),
      ],
    );
  }
}