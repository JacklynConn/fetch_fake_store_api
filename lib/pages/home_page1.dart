import 'package:flutter/material.dart';
import 'package:flutter_part2/models/user_model.dart';
import '../service/user_services/user_service.dart';

class HomePages1 extends StatefulWidget {
  const HomePages1({super.key});

  @override
  State<HomePages1> createState() => _HomePages1State();
}

class _HomePages1State extends State<HomePages1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('get from api'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: UserService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.email),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
