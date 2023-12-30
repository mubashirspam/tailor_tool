import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailor/list.dart';

import 'home.dart';

class AddMeasurement extends StatefulWidget {
  const AddMeasurement({
    super.key,
  });

  @override
  State<AddMeasurement> createState() => _AddMeasurementState();
}

class _AddMeasurementState extends State<AddMeasurement> {
  final TextEditingController _controllerPassword = TextEditingController();
  final List<MapEntry<String, dynamic>> entryList =
      users.first.measurements.entries.toList();

  List<TextEditingController> measurementControllers = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final measurementsListProvider =
        Provider.of<MeasurementsListProvider>(context);
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: const Text("Add Measurement"),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Map<String, dynamic> measurements = {};
                  for (MapEntry<String, dynamic> entry in entryList) {
                    int index = entryList.indexOf(entry);
                    measurements[entry.key] =
                        measurementControllers[index].text;
                  }

                  MeasurementData measurementData = MeasurementData(
                    measurements: measurements,
                    name: _controllerPassword.text,
                  );
                  measurementsListProvider.addMeasurement(measurementData);

                  measurementControllers
                      .forEach((controller) => controller.clear());
                  setState(() {});
                }
                Navigator.pop(
                  context,
                );
              },
              child: Text("Save")),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<int>(
                value: 1,
                items: const [
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text("Shirt"),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text("Pant"),
                  ),
                ],
                onChanged: (int? value) {},
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerPassword,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Enter Measurement Name (e.g Robin’s Shirt) ",
                  )),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: entryList.map((entry) {
                    final int index = entryList.indexOf(entry);

                    log(index.toString());

                    while (measurementControllers.length <= index) {
                      measurementControllers.add(TextEditingController());
                    }

                    return Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 15),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " ${entry.key}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    child: Image.asset(images[index]),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Lay the collar flat and measure from the centre of the collar button to the far end of the",
                                        ),
                                        TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller:
                                                measurementControllers[index],
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter a measurement value';
                                              }

                                              // Add additional validation logic if needed
                                              // For example, check if the entered value is a valid number

                                              return null; // Return null if the input is valid
                                            },
                                            decoration: const InputDecoration(
                                              labelText: "inch",
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List images = <String>[
  "assets/t2.png",
  "assets/t3.png",
  "assets/t4.png",
  "assets/t5.png",
  "assets/t1.png",
  "assets/t6.png",
];
