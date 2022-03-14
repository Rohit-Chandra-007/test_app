import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/person.dart';

const String randomPersonURL = "https://randomuser.me/api/";

class PersonNetworkService {
  Future<List<Person>> fetchPersons() async {
    var url = Uri.parse('https://randomuser.me/api/?page=0&results=1');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"][0];
      return peoples.map((json) => Person.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
