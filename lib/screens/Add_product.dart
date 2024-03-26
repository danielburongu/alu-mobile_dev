import "package:flutter/material.dart";
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/screens/home_page.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late File _imageFile;
  late String _productName;
  late String _description;
  late double _price;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print(pickedImage.path);
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadProduct() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    if (_imageFile == null ||
        _productName.isEmpty ||
        _description.isEmpty ||
        _price == null) {
      // Validation failed
      return;
    }

    // Upload image to Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = storageReference.putFile(_imageFile);
    TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => null);
    String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

    // Store product details in Firestore or Realtime Database
    // Example Firestore usage:
    await FirebaseFirestore.instance.collection('products').add({
      'productName': _productName,
      'description': _description,
      'price': _price,
      'imageUrl': imageUrl,
    });
    //
    // Clear form after upload
    setState(() {
      _imageFile = File('');
      _productName = '';
      _description = '';
      _price = 0.0;
    });
    Navigator.pop(context);
    //navigate to a different Home screen
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _imageFile = File(''); // Initialize with an empty file
    _productName = '';
    _description = '';
    _price = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32a8a2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New Product',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Product Name",
                  hintText: 'Enter product name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF32a8a2),
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  _productName = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: 'Product description...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF32a8a2),
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  _description = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Price",
                  hintText: "Enter price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF32a8a2),
                      width: 2.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _price = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: _imageFile.path.isNotEmpty
                    ? Image.file(
                        _imageFile,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 200,
                        color: Color.fromARGB(255, 90, 85, 85),
                        child: Icon(Icons.camera_alt,
                            size: 50, color: Colors.white),
                      ),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                key: const Key('add_product_button'),
                onPressed: _uploadProduct,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF32a8a2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Add Product',
          ),
        ],
      ),
    );
  }
}
