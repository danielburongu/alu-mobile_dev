// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "name": "Ikivuguto",
      "title": "5 litres of fermented milk",
      "price": "\$4.5",
      "images":
          "https://www.culinarytravellers.com/wp-content/uploads/2021/06/ikivuguto-1-2-1-1024x731.jpg.webp",
    },

    {
      "name": "Jeans",
      "title": "Black Jeans with blue stripes",
      "price": "\$10",
      "images":
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Air Force",
      "title": "A white air force shoes",
      "price": "\$275",
      "images":
          "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    },
    {
      "name": "Nike Sport shoes",
      "title": "Red shoes with black stripes",
      "price": "\$18",
      "images":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    },

    {
      "name": "T-Shirt",
      "title": "Alpha t-shirt for alpha testers.",
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
      "title": "1kg of Fresh meat(pig)",
      "price": "\$3.5",
      "images":
          "https://media.post.rvohealth.io/wp-content/uploads/2020/08/pork-1200x628-facebook-1200x628.jpg",
    },
    // Add more product data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true, // Make the app bar sticky
          expandedHeight: 70.0, // Set the desired height
          centerTitle: true, // Center the title
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "All Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              mainAxisExtent: 360,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (gridMap[index]['name'] != null &&
                    gridMap[index]['title'] != null &&
                    gridMap[index]['price'] != null &&
                    gridMap[index]['images'] != null) {
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
                            "${gridMap.elementAt(index)['images']}",
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
                                "${gridMap.elementAt(index)['name']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                              ),
                              Text(
                                "${gridMap.elementAt(index)['price']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                              ),
                              Text(
                                "${gridMap.elementAt(index)['title']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
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
                } else {
                  return Container();
                }
              },
              childCount: gridMap.length,
            ),
          ),
        ),
      ],
    );
  }
}
