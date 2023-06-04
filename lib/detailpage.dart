import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'package:collection/collection.dart';
import 'package:badges/badges.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic proList;
  const ProductDetailsScreen({Key? key, required this.proList})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // late final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
  //     .collection('proList')
  //     .where('category', isEqualTo: widget.proList['category'])
  //     .where('subcategory', isEqualTo: widget.proList['subcategory'])
  //     .snapshots();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FullScreenView(
                    //               imagesList: imagesList,
                    //             )));
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 1.5,
                          height: MediaQuery.of(context).size.height * 0.43,
                          child: Image(
                            image: NetworkImage(widget.proList['image']
                                // "https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg",
                                ),
                            // fit: BoxFit.cover,
                          )),
                      Positioned(
                          left: 15,
                          top: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: (10)),
                  padding: EdgeInsets.only(top: (20)),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color:
                        //  Colors.amber,
                        Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, top: 10),
                          child: Text(
                            // 'name',
                            widget.proList['name'],
                            style: TextStyle(
                                //fontFamily: "muli",
                                color: Colors.grey.shade600,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Rs.  ',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      // fontFamily: "muli",
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  // "price",
                                  widget.proList['price'],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      // fontFamily: "muli",
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          // "description",
                          widget.proList['description'],
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              fontSize: 15,
                              // fontFamily: "muli",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              //  Colors.blueGrey.shade800
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(40),
              //   topRight: Radius.circular(40),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                // width: 100,
                // height: 26,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    backgroundColor: Colors.green.shade800,
                    // kPrimaryColor,
                  ),
                  onPressed: () {
                    log("Add to Cart");
                  },
                  child: Text(
                    'ADD TO CART',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "muli",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
