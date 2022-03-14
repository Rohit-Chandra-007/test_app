import 'package:flutter/material.dart';
import 'package:test_app/model/person.dart';

import '../services/networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersonNetworkService personService = PersonNetworkService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              var currentPerson = snapshot.data![index];

                              return ListTile(
                                title: Text(currentPerson.userName),
                                leading: Text(currentPerson.userEmail),
                                subtitle: Text(
                                    "Phone: ${currentPerson.userPhoneNumber}"),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasError) {
                return const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
