import 'dart:developer';

import 'package:flutter/material.dart';

import 'invoice_details.dart';

class CreateInvoiceTemplate extends StatefulWidget {
  const CreateInvoiceTemplate({Key? key}) : super(key: key);

  @override
  State<CreateInvoiceTemplate> createState() => _CreateInvoiceTemplateState();
}

class _CreateInvoiceTemplateState extends State<CreateInvoiceTemplate> {
  List<TextEditingController> priceControllers = [TextEditingController()];
  List<TextEditingController> quantityControllers = [TextEditingController()];

  double total = 0;

  void totalPrize() {
    setState(() {
      double totalAmount = 0;
      for (int i = 0; i < priceControllers.length; i++) {
        double price = double.tryParse(priceControllers[i].text) ?? 0.0;
        double quantity = double.tryParse(quantityControllers[i].text) ?? 0.0;
        totalAmount += price * quantity;
      }

      total = totalAmount;

      log(total.toString());
    });
  }

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FabCTA(
              title: 'Add Items',
              icon: Icons.add,
              onTap: () {
                if (itemCount < 10) {
                  setState(() => itemCount++);
                }
              },
            ),
            FabCTA(
              title: 'Preview',
              icon: Icons.visibility,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InvoiceDetailsScreen(),
                ));
              },
            ),
            FabCTA(
              title: 'Share',
              icon: Icons.share,
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Create Invoice',
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Customer Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Customer Name",
                )),
            const SizedBox(height: 15.0),
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Customer Number",
                )),
            const SizedBox(height: 15.0),
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Tax Details",
                )),
            const SizedBox(height: 20.0),
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: List.generate(
                  itemCount,
                  (index) => productDetails(index),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  '₹ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget productDetails(int index) {
    // Ensure that the lists have enough elements
    while (priceControllers.length <= index) {
      priceControllers.add(TextEditingController());
    }
    while (quantityControllers.length <= index) {
      quantityControllers.add(TextEditingController());
    }

    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green.shade100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Item : ${index + 1}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              InkWell(
                  onTap: () {
                    if (itemCount > 1) {
                      setState(() => itemCount = itemCount - 1);
                    }
                  },
                  child: Icon(Icons.delete))
            ],
          ),
          const SizedBox(height: 5.0),
          TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Product Name",
              )),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                    controller: priceControllers[index],
                    onChanged: (v) {
                      totalPrize();
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Price",
                    )),
              ),
              const SizedBox(width: 30.0),
              Expanded(
                child: TextFormField(
                    controller: quantityControllers[index],
                    onChanged: (v) {
                      totalPrize();
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Quantity",
                    )),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}

class AddInvoiceTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final double? height;
  final Widget? prefixIcon;
  const AddInvoiceTextfield(
      {Key? key,
      this.controller,
      this.label,
      this.height = 40,
      this.prefixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: label,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5))),
      ),
    );
  }
}

class FabCTA extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  const FabCTA({Key? key, this.title, this.onTap, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(title ?? ""),
        ],
      ),
    );
  }
}
