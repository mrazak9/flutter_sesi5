import 'package:flutter/material.dart';
import 'package:flutter_basic_1/data.dart';
// import 'package:flutter_basic_1/home_page.dart';
// import 'package:flutter_basic_1/list.dart';
import 'package:flutter_basic_1/list_item.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Data> listData = Data.dummyData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Biodata",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list_alt, size: 30),
                  Text(
                    "List Data",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return ListItem(biodata: listData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
