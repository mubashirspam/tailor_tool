import 'package:flutter/material.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: const Text(" 2023AFD23"),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text("Share")),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
          child: Image.asset(
        "assets/invoice.png",
        width: double.maxFinite,
        fit: BoxFit.fill,
      )),
    );
  }
}
