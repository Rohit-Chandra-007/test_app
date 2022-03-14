class Person {
  final String userName;
  final String userPhoneNumber;
  final String userEmail;

  Person(this.userName, this.userEmail, this.userPhoneNumber);

  Person.fromJson(Map<String, dynamic> json)
      : userName =
            "${json["name"]["title"]} ${json["name"]["first"]} ${json["name"]["last"]}",
        userPhoneNumber = json["phone"],
        userEmail = json["email"];
}
