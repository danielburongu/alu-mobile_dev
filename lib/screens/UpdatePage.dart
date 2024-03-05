import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePage extends StatefulWidget {
  final String productId;

  UpdatePage({required this.productId});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String updatedName = '';
  String updatedPrice = '';
  String updatedDescription = '';
  String updatedImage = '';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // ImagePicker instance
  final ImagePicker _imagePicker = ImagePicker();

  // Text editing controllers to set default values
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing product values
    nameController =
        TextEditingController(text: ''); // Add the actual existing name here
    priceController =
        TextEditingController(text: ''); // Add the actual existing price here
    descriptionController = TextEditingController(
        text: ''); // Add the actual existing description here
    imageController = TextEditingController(
        text: ''); // Add the actual existing image URL here
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        updatedImage = pickedImage.path;
        imageController.text = updatedImage;
      });
    }
  }

  Future<void> updateProduct(
      String productId, Map<String, dynamic> updatedData) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update(updatedData);

      // Successfully updated, navigate back to home page
      navigatorKey.currentState?.pushReplacementNamed(
          '/home'); // Replace '/home' with your actual home route
    } catch (e) {
      print('Error updating product: $e');
      // Handle error, show a snackbar, or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Update Product'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text field for updating product name
                    TextField(
                      controller: nameController,
                      onChanged: (value) {
                        updatedName = value;
                      },
                      decoration: InputDecoration(labelText: 'Product Name'),
                    ),
                    SizedBox(height: 16),

                    // Text field for updating product price
                    TextField(
                      controller: priceController,
                      onChanged: (value) {
                        updatedPrice = value;
                      },
                      decoration: InputDecoration(labelText: 'Price'),
                    ),
                    SizedBox(height: 16),

                    // Text field for updating product description
                    TextField(
                      controller: descriptionController,
                      onChanged: (value) {
                        updatedDescription = value;
                      },
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                    SizedBox(height: 16),

                    // Text field for updating product image URL
                    TextField(
                      controller: imageController,
                      onChanged: (value) {
                        updatedImage = value;
                      },
                      decoration: InputDecoration(labelText: 'Image URL'),
                    ),
                    SizedBox(height: 16),

                    // Button to pick an image
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Pick Image'),
                    ),
                    SizedBox(height: 16),

                    // Display the picked image path
                    Text('Picked Image: $updatedImage'),

                    // Button to trigger the update
                    ElevatedButton(
                      onPressed: () {
                        // Call the update function
                        updateProduct(widget.productId, {
                          'productName': updatedName,
                          'price': updatedPrice,
                          'description': updatedDescription,
                          'image': updatedImage,
                        });
                      },
                      child: Text('Update Product'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
