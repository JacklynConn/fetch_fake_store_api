import 'package:flutter/material.dart';
import 'package:flutter_part2/helper/db_helper.dart';

class SqliteTestPages extends StatefulWidget {
  const SqliteTestPages({super.key});

  @override
  State<SqliteTestPages> createState() => _SqliteTestPagesState();
}

class _SqliteTestPagesState extends State<SqliteTestPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test SQL"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                await DBHelper().insertTask();
              }, child: const Text("Add"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                await DBHelper().showTask();
              }, child: const Text("Show"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                await DBHelper().updateTask();
              }, child: const Text("Update"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async{
                await DBHelper().deleteTask();
              }, child: const Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
