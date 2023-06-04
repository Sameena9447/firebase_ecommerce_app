import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ecommerce_app/bottumnavigation.dart';
import 'package:firebase_ecommerce_app/homepage.dart';
import 'package:firebase_ecommerce_app/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ViewBrandPorducts extends StatelessWidget {
  String bname, bid;
  ViewBrandPorducts({required this.bname, required this.bid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: Text(
            bname,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottumNavigationPage()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .where('brandid', isEqualTo: bid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return Text(
                      'Something went wrong' + snapshot.error.toString());
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                      child: Text(
                    'This brand \n has no items yet !!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ));
                }

                return StaggeredGridView.countBuilder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        // 2,
                        snapshot.data!.docs.length,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return ProductModel(
                        products: snapshot.data!.docs[index],
                      );
                    },
                    staggeredTileBuilder: (context) =>
                        const StaggeredTile.fit(1));
              },
            ),
          ),
        ));
  }
}
