import 'package:flutter/material.dart';
import 'package:tailor/create_invoice.dart';
import 'package:tailor/list.dart';

import 'home.dart';
import 'invoice_details.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({super.key, required this.user});
  void _showAddExpenseSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddExpenseSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: Text(
          user.name,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateInvoiceTemplate(),
                ));
              },
              child: const Text("New invoice")),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                "Measurements",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 370,
                child: PageViewExample(
                  measurements: user.measurements,
                  name: user.name,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black),
                  margin: const EdgeInsets.all(5),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black),
                  margin: const EdgeInsets.all(5),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                "Invoices",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(top: 10),
              child: Column(
                children: List.generate(
                  5,
                  (index) => Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const InvoiceDetailsScreen();
                            },
                          ),
                        );
                      },
                      title: const Text("Invoice Id : 2023AFD23"),
                      subtitle: const Text("10-12- 2023"),
                      trailing: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewExample extends StatelessWidget {
  final Map<String, dynamic> measurements;
  final String name;
  const PageViewExample(
      {super.key, required this.measurements, required this.name});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Measurement(
            measurements: measurements,
            name: name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Measurement(
            measurements: measurements,
            name: name,
          ),
        ),
      ],
    );
  }
}

class AddExpenseSheet extends StatefulWidget {
  @override
  _AddExpenseSheetState createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends State<AddExpenseSheet> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _taxInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Details",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(labelText: "Date"),
            // onTap: () async {
            //   // Show a date picker when the user taps on the Date field
            //   DateTime selectedDate = await showDatePicker(
            //     context: context,
            //     initialDate: DateTime.now(),
            //     firstDate: DateTime(2000),
            //     lastDate: DateTime(2101),
            //   );

            //   if (selectedDate != null && selectedDate != DateTime.now()) {
            //     setState(() {
            //       _dateController.text = selectedDate.toLocal().toString().split(' ')[0];
            //     });
            //   }
            // },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Amount"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _taxInfoController,
            decoration: const InputDecoration(labelText: "Tax Information"),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet on Cancel
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle saving the expense here
                  // You can access the entered data using _dateController.text, _amountController.text, _taxInfoController.text
                  Navigator.pop(context); // Close the bottom sheet on Save
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
