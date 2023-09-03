import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JsonData extends StatefulWidget {
  const JsonData({super.key});

  @override
  State<JsonData> createState() => _JsonDataState();
}

class _JsonDataState extends State<JsonData> {
  // final postController = TextEditingController();
  // bool loading = false;
  // final fireStore = FirebaseFirestore.instance.collection('Product');
  final TextEditingController jsonController = TextEditingController();

  @override
  void dispose() {
    jsonController.dispose();
    super.dispose();
  }

  Future<void> uploadDataToFirestore(Map<String, dynamic> jsonData) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference dataCollection = firestore.collection('Product');

      // Add the JSON data to Firestore
      await dataCollection.add(jsonData);

      print('Data uploaded to Firestore successfully');
    } catch (e) {
      print('Error uploading data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: jsonController,
              decoration: InputDecoration(labelText: 'Enter JSON data'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final Map<String, dynamic> jsonDataText = {
                  "category": "jewelery",
                  "description":
                      "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
                  "id": "7",
                  "image":
                      "https://images.unsplash.com/photo-1611200047983-8df87804e582?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  "price": 9,
                  "title": "Black shoe"
                };
                try {
                  // Parse the user-provided JSON data

                  uploadDataToFirestore(jsonDataText);
                } catch (e) {
                  print('Invalid JSON format: $e');
                }
              },
              child: Text('Upload JSON to Firestore'),
            ),
          ],
        ),
      ),
    );
  }
}
