// Dummy user list
List<User> users = [
  User(
    name: "John Doe",
    email: "john.doe@example.com",
    number: "1234567890",
    age: 25,
    gender: "Male",
    measurements: {
      "Collar": 15.5,
      "Chest": 40,
      "Arm": 18,
      "Hem": 25,
      "Waist": 32,
      "Length": 28,
    },
    invoice: Invoice(),
  ),
  User(
    name: "Jane Smith",
    email: "jane.smith@example.com",
    number: "9876543210",
    age: 28,
    gender: "Female",
    measurements: {
      "Collar": 14.5,
      "Chest": 36,
      "Arm": 16,
      "Hem": 24,
      "Waist": 28,
      "Length": 26,
    },
    invoice: Invoice(),
  ),
  User(
    name: "Bob Johnson",
    email: "bob.johnson@example.com",
    number: "5551112233",
    age: 32,
    gender: "Male",
    measurements: {
      "Collar": 16.0,
      "Chest": 42,
      "Arm": 18.5,
      "Hem": 26,
      "Waist": 34,
      "Length": 30,
    },
    invoice: Invoice(),
  ),
  User(
    name: "Alice Johnson",
    email: "alice.johnson@example.com",
    number: "5552223344",
    age: 28,
    gender: "Female",
    measurements: {
      "Collar": 15.0,
      "Chest": 38,
      "Arm": 17,
      "Hem": 24.5,
      "Waist": 30,
      "Length": 28,
    },
    invoice: Invoice(),
  ),
];

class User {
  String name;
  String email;
  String number;
  int age;
  String gender;
  Map<String, dynamic> measurements;
  Invoice invoice;

  User({
    required this.name,
    required this.email,
    required this.number,
    required this.age,
    required this.gender,
    required this.measurements,
    required this.invoice,
  });
}

class Invoice {
  // Define properties related to the invoice here
}
