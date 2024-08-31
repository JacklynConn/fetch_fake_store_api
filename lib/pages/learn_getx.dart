import 'package:flutter/material.dart';

class LearnGetX extends StatefulWidget {
  const LearnGetX({super.key});

  @override
  State<LearnGetX> createState() => _LearnGetXState();
}

class _LearnGetXState extends State<LearnGetX> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You Can Push The button to increase the counter",
            ),
            Text(
              "$counter",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
