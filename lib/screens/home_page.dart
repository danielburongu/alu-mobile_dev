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
