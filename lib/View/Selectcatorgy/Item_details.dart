import 'package:flutter/material.dart';

class AddItemDetails extends StatelessWidget {
  final String category;
  AddItemDetails({required this.category});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item - $category')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Image picker placeholder
            ElevatedButton(
              onPressed: () {
                // Logic to pick image
              },
              child: Text('Upload Image'),
            ),
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name')),
            TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description')),
            TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save logic here
              },
              child: Text('Save Item'),
            )
          ],
        ),
      ),
    );
  }
}
