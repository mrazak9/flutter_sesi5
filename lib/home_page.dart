import 'package:flutter/material.dart';
import 'package:flutter_basic_1/data.dart';
import 'package:flutter_basic_1/list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Data> listData = Data.dummyData;

    return SafeArea(
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
    );
  }
}
