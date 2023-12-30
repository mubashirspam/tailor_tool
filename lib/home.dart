import 'package:flutter/material.dart';
import 'package:tailor/add_measurement.dart';
import 'package:provider/provider.dart';

import 'create_invoice.dart';
import 'list.dart';
import 'profile.dart';
import 'user_screen.dart';

class Home extends StatelessWidget {
  final bool isAdmin;
  const Home({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    final measurementsListProvider =
        Provider.of<MeasurementsListProvider>(context);
    return Scaffold(
        backgroundColor: Colors.lightGreen.shade100,
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            isAdmin
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                  ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        drawer: const SafeArea(
          child: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: Text("About"),
                ),
                ListTile(
                  title: Text("Logout"),
                )
              ],
            ),
          ),
        ),
        body: isAdmin
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Search",
                        )),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: users.length,
                    padding: const EdgeInsets.all(20).copyWith(top: 0),
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserScreen(
                                  user: users[index],
                                );
                              },
                            ),
                          );
                        },
                        title: Text(users[index].name),
                        subtitle: Text(
                            "${users[index].gender} (${users[index].age})"),
                        trailing: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                  ))
                ],
              )
            : ListView(
                padding: const EdgeInsets.all(20),
                children: List.generate(
                    measurementsListProvider.measurementsList.length,
                    (index) => Measurement(
                          measurements: measurementsListProvider
                              .measurementsList[index].measurements,
                          name: measurementsListProvider
                              .measurementsList[index].name,
                        ))),
        floatingActionButton: isAdmin
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CreateInvoiceTemplate();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "Add Invoice",
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddMeasurement();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  "Add Measurement",
                  style: TextStyle(color: Colors.black),
                ),
              ));
  }
}

class Measurement extends StatelessWidget {
  final Map<String, dynamic> measurements;
  final String name;
  const Measurement(
      {super.key, required this.measurements, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.maxFinite,
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 0.11,
              letterSpacing: -0.46,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Image.asset(
                        "assets/shirt.png",
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: measurements.entries
                            .map((entry) => SizedBox(
                                height: 25,
                                child: Row(
                                  children: [
                                    Text(
                                      entry.key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Spacer(),
                                    const Text(": "),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        "${entry.value}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ],
                                )))
                            .toList(),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MeasurementData {
  final Map<String, dynamic> measurements;
  final String name;
  const MeasurementData({
    required this.measurements,
    required this.name,
  });
}

class MeasurementsListProvider extends ChangeNotifier {
  List<MeasurementData> _measurementsList = [
    MeasurementData(measurements: users.first.measurements, name: "Robin")
  ];

  List<MeasurementData> get measurementsList => _measurementsList;

  void addMeasurement(MeasurementData measurement) {
    _measurementsList.add(measurement);
    notifyListeners();
  }

  void removeMeasurement(int index) {
    _measurementsList.removeAt(index);
    notifyListeners();
  }
}
