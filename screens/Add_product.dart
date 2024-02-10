import "package:flutter/material.dart";
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late File _imageFile;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _imageFile = File(''); // Initialize with an empty file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32a8a2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Card(
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      onPressed: () => {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange)),
                      child: Text(
                        "Add Product",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF32a8a2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Add Product',
          ),
        ],
      ),
    );
  }
}
