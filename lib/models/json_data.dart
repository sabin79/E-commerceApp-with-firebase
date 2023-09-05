import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
    // try {
    //   FirebaseFirestore firestore = FirebaseFirestore.instance;
    //   await firestore.collection('Productlist').set(jsonData);

    //   print('Data uploaded to Firestore successfully');
    // } catch (e) {
    //   print('Error uploading data to Firestore: $e');
    // }
    // final jsonStr = await rootBundle.loadString('assets/data.json');
    // final jsonData = jsonDecode(jsonStr);

    for (var prods in jsonData['prods']) {
      await Future.delayed(Duration(seconds: 1));
      await FirebaseFirestore.instance.collection('itemlist').add(prods);
      print('Data uploaded to Firestore successfully');
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
                  // "prods": [
                  //   {
                  //     "category": "jewelery",
                  //     "description":
                  //         "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
                  //     "id": "7",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1611200047983-8df87804e582?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  //     "price": 9,
                  //     "title": "Black shoe"
                  //   },
                  //   {
                  //     "category": "women's clothing",
                  //     "description":
                  //         "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
                  //     "id": "18",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1597248881519-db089d3744a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
                  //     "price": 9,
                  //     "title": "Yellow shoe"
                  //   },
                  //   {
                  //     "category": "Coffee",
                  //     "description":
                  //         "100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
                  //     "id": "16",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
                  //     "price": 29,
                  //     "title": "Coffee"
                  //   },
                  //   {
                  //     "category": "Shoes",
                  //     "description":
                  //         "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
                  //     "id": "5",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1618329340733-ab4554d28b15?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=903&q=80",
                  //     "price": 695,
                  //     "title": "Yellow shoes"
                  //   },
                  //   {
                  //     "category": "Shoes",
                  //     "description":
                  //         "Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
                  //     "id": "12",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1618860202521-71e9f4bdcfaa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80",
                  //     "price": 114,
                  //     "title": "Red shoe"
                  //   },
                  //   {
                  //     "category": "electronics",
                  //     "description":
                  //         "3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
                  //     "id": "11",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1583394838336-acd977736f90?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=631&q=80",
                  //     "price": 109,
                  //     "title": "Headset"
                  //   },
                  //   {
                  //     "category": "Stationery",
                  //     "description":
                  //         "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
                  //     "id": "15",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=623&q=80",
                  //     "price": 56,
                  //     "title": "Pen"
                  //   },
                  //   {
                  //     "category": "electronics",
                  //     "description":
                  //         "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
                  //     "id": "19",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
                  //     "price": 7,
                  //     "title": "watch"
                  //   },
                  //   {
                  //     "category": "bycycle",
                  //     "description":
                  //         "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
                  //     "id": "6",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHByb2R1Y3R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
                  //     "price": 168,
                  //     "title": "Cycle"
                  //   },
                  //   {
                  //     "category": "men's clothing",
                  //     "description":
                  //         "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                  //     "id": "2",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1616740540792-3daec604777d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
                  //     "price": 22,
                  //     "title": "Water bottle"
                  //   },
                  //   {
                  //     "category": "Headphones",
                  //     "description":
                  //         "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
                  //     "id": "20",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1505751104546-4b63c93054b1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcyfHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
                  //     "price": 12,
                  //     "title": "Sony headset"
                  //   },
                  //   {
                  //     "category": "Hair care",
                  //     "description":
                  //         "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
                  //     "id": "9",
                  //     "image":
                  //         "https://images.unsplash.com/photo-1620915789336-129994d5efc8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  //     "price": 64,
                  //     "title": "Shampoo"
                  //   }
                  // ]
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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String jsonData = '';

//   void _uploadFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['json'],
//     );

//     if (result != null) {
//       String fileContent = String.fromCharCodes(result.files.first.bytes!);
//       setState(() {
//         jsonData = fileContent;
//       });

//       // Send jsonData to Firestore
//       await FirebaseFirestore.instance.collection('your_collection').add({
//         'data': jsonData,
//       });

//       // You can add error handling and success messages here
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _uploadFile,
//               child: Text('Upload JSON File'),
//             ),
//             SizedBox(height: 20.0),
//             Text('Uploaded JSON Data:'),
//             Text(jsonData),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<void> uploadDataToFirestore() async {
//     // Replace with your JSON file content
//     String jsonString =
//         '[,{"name":"Item 2","price":20},{"name":"Item 3","price":15}]';

//     // Parse the JSON string into a list of maps
//     List<dynamic> items = jsonDecode(jsonString);

//     try {
//       // Initialize Firebase and Firestore

//       for (var item in items) {
//         // Send each item to Firestore
//         await FirebaseFirestore.instance.collection('Product').add(item);
//       }

//       print("Data sent to Firestore successfully!");
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore Data Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 uploadDataToFirestore();
//               },
//               child: Text('Upload Data to Firestore'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
