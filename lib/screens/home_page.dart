// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:test1/screens/Add_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _GridBState();
}

class _GridBState extends State<HomeScreen> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "name": "Jeans",
      "title": "Black Jeans with blue stripes for a perfect gent",
      "price": "\$10",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Air Force",
      "title": "A white air force shoes for your comfort ",
      "price": "\$20",
      "images":
          "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Nike Sport shoes",
      "title": "Red shoes with black stripes ready for a rock star",
      "price": "\$18",
      "images":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    },

    {
      "name": "T-Shirt",
      "title": "Alpha t-shirt for alpha testers(Amazing fashion).",
      "price": "\$25",
      "images":
          "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Air Max",
      "title": "white sneaker with adidas logo",
      "price": "\$20",
      "images":
          "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
    },

    {
      "name": "Pork",
      "title": "1kg of Fresh meat(pig) from the land of thousand hills",
      "price": "\$3.5",
      "images":
          "https://media.post.rvohealth.io/wp-content/uploads/2020/08/pork-1200x628-facebook-1200x628.jpg",
    },
    // Add more product data as needed_daniel
    {
      "name": "Vegetables",
      "title": "Fresh assorted vegetables",
      "price": "\$3",
      "images":
      "https://unsplash.com/photos/a-pile-of-different-types-of-vegetables-on-a-white-surface-5aJVJvJ9rG8",
    },
    {
      "name": "Meat",
      "title": "Fresh meat",
      "price": "\$4",
      "images":
      "https://unsplash.com/photos/sliced-raw-meat-with-green-leaves-cvj-7TZjvA0",
    },
    {
      "name": "Sombe",
      "title": "Traditional African dish",
      "price": "\$1",
      "images":
      "https://unsplash.com/photos/a-close-up-of-a-tree-jp5bf3RmhWI",
    },
    {
      "name": "Rice",
      "title": "Fresh rice from the beautiful farm lands across the country",
      "price": "\$1.2",
      "images":
      "https://unsplash.com/photos/white-rice-grains-on-brown-wooden-table--LdilhDx3sk",
    },
    {
      "name": "Cassava",
      "title": "Fresh cassava staple African food",
      "price": "\$1",
      "images":
      "https://unsplash.com/photos/a-pile-of-wood-vP5guwApg0g",
    },
    {
      "name": "Onions",
      "title": "Fresh onions",
      "price": "\$0.5",
      "images":
      "https://unsplash.com/photos/red-onion-on-brown-wooden-crate-SSIwIRCu7bM",
    },
  ];

  List<String> docIds = [];

  // get all ids
  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection("products")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
  }

  @override
  void initState() {
    getDocIds().whenComplete(() => setState(() {}));
    super.initState();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return CustomScrollView(
  //     slivers: [
  //       SliverAppBar(
  //         pinned: true, // Make the app bar sticky
  //         expandedHeight: 70.0, // Set the desired height
  //         centerTitle: true, // Center the title
  //         flexibleSpace: FlexibleSpaceBar(
  //           title: Row(
  //             children: [
  //               Text(
  //                 "All Products",
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 20.0,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               SizedBox(width: 50, height: 20),
  //               // IconButton(onPressed: ()=> {}, icon:Icon(Icons.add), iconSize: 30,)
  //               StreamBuilder<User?>(
  //                 stream: FirebaseAuth.instance.authStateChanges(),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.connectionState == ConnectionState.waiting) {
  //                     // If waiting for data, return a loading indicator
  //                     return CircularProgressIndicator();
  //                   } else {
  //                     if (snapshot.hasError) {
  //                       // If an error occurred, return an error message
  //                       return Text("Error: ${snapshot.error}");
  //                     } else if (snapshot.hasData) {
  //                       // If user data is available
  //                       final User? user = snapshot.data;

  //                       if (user != null) {
  //                         if (user.email == "admin@gmail.com") {
  //                           return IconButton(
  //                             onPressed: () {
  //                               Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                       builder: (context) =>
  //                                           AddProductScreen()));
  //                             },
  //                             icon: Icon(Icons.add),
  //                           );
  //                         }
  //                       }
  //                     }
  //                     // If no user data available, return an empty container
  //                     return SizedBox(width: 0, height: 0);
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       SliverPadding(
  //         padding: const EdgeInsets.all(16.0),
  //         sliver: SliverGrid(
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             crossAxisSpacing: 12.0,
  //             mainAxisSpacing: 12.0,
  //             mainAxisExtent: 360,
  //           ),
  //           delegate: SliverChildBuilderDelegate(
  //             (BuildContext context, int index) {
  //               if (gridMap[index]['name'] != null &&
  //                   gridMap[index]['title'] != null &&
  //                   gridMap[index]['price'] != null &&
  //                   gridMap[index]['images'] != null) {
  //                 return Container(
  //                   margin: const EdgeInsets.all(8.0),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(16.0),
  //                     color: Colors.blue[200],
  //                   ),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       ClipRRect(
  //                         borderRadius: const BorderRadius.only(
  //                           topLeft: Radius.circular(16.0),
  //                           topRight: Radius.circular(16.0),
  //                         ),
  //                         child: Image.network(
  //                           "${gridMap.elementAt(index)['images']}",
  //                           height: 170,
  //                           width: double.infinity,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               "${gridMap.elementAt(index)['name']}",
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .titleSmall!
  //                                   .merge(
  //                                     TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       color: Colors.black,
  //                                     ),
  //                                   ),
  //                             ),
  //                             Text(
  //                               "${gridMap.elementAt(index)['price']}",
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .titleSmall!
  //                                   .merge(
  //                                     TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       color: Colors.white,
  //                                     ),
  //                                   ),
  //                             ),
  //                             Text(
  //                               "${gridMap.elementAt(index)['title']}",
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .titleMedium!
  //                                   .merge(
  //                                     const TextStyle(
  //                                       fontWeight: FontWeight.w700,
  //                                     ),
  //                                   ),
  //                             ),
  //                             const SizedBox(
  //                               height: 8.0,
  //                             ),
  //                             const SizedBox(
  //                               height: 8.0,
  //                             ),
  //                             Row(
  //                               children: [
  //                                 IconButton(
  //                                   onPressed: () {},
  //                                   icon: Icon(
  //                                     CupertinoIcons.heart,
  //                                   ),
  //                                 ),
  //                                 IconButton(
  //                                   onPressed: () {},
  //                                   icon: Icon(
  //                                     CupertinoIcons.cart,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               } else {
  //                 return Container();
  //               }
  //             },
  //             childCount: gridMap.length,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 70.0,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Row(
              children: [
                Text(
                  "All Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 50, height: 20),
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      final User? user = snapshot.data;

                      if (user != null && user.email == "admin@gmail.com") {
                        return IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.add),
                        );
                      }
                    }
                    return SizedBox(width: 0, height: 0);
                  },
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                    child: Text("Error: ${snapshot.error}"));
              } else {
                final products = snapshot.data!.docs;
                print(products);
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 360,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final product =
                          products[index].data() as Map<String, dynamic>;
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.blue[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              child: Image.network(
                                product['imageUrl'],
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['productName'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                  ),
                                  Text(
                                    product['price'].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                  ),
                                  Text(
                                    product['description'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .merge(
                                          const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          CupertinoIcons.heart,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          CupertinoIcons.cart,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: products.length,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
