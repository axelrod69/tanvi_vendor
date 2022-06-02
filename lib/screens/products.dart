import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tanvi_vendor/screens/editProductScreen.dart';
import '../model/products/productsProvider.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  bool isLoading = true;
  Map<String, dynamic> _mapData = {};

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductsProvider>(context, listen: false)
        .getProducts()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    // recall();
    super.initState();
  }

  Future<void> recall() async {
    Provider.of<ProductsProvider>(context, listen: false)
        .getProducts()
        .then((_) {
      setState(() {
        isLoading = false;
        // _mapData = Provider.of<ProductsProvider>(context, listen: false)
        //     .vendorProducts;
      });
    });

    print('Map Data: $_mapData');
    print('executed');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<ProductsProvider>(context).vendorProducts;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        toolbarHeight: tabLayout ? 100 : 56,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Navigator.of(context).pushNamed('/home'),
          child: Icon(Icons.arrow_back_ios,
              color: Colors.green, size: tabLayout ? 40 : 24),
        ),
        title: Text(
          'Products',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: tabLayout ? 35 : 14),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.red,
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.02,
                  right: width * 0.02,
                  bottom: height * 0.02),
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: height * 0.02),
                  padding: EdgeInsets.all(width * 0.01),
                  width: double.infinity,
                  height: tabLayout ? height * 0.175 : height * 0.158,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(1, 2))
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.3,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 132, 175, 134),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          'http://54.80.135.220${provider['data'][index]['main_image']}',
                          // fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: height * 0.01, bottom: height * 0.01),
                          // width: width * 0.7,
                          height: double.infinity,
                          // color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      provider['data'][index]['name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout ? 25 : 14),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Expanded(
                                      child: Text(
                                        provider['data'][index]['category']
                                            ['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout ? 25 : 14),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('Size',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: tabLayout ? 25 : 14)),
                                        Text(
                                            provider['data'][index]['sizes']
                                                ['size'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout ? 25 : 14))
                                      ],
                                    ),
                                    SizedBox(width: width * 0.015),
                                    Column(
                                      children: [
                                        Text('Quantity',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: tabLayout ? 25 : 14)),
                                        Text(
                                            provider['data'][index]['qty']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout ? 25 : 14))
                                      ],
                                    ),
                                    SizedBox(width: width * 0.015),
                                    Column(
                                      children: [
                                        Text('Weight',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: tabLayout ? 25 : 14)),
                                        Text(
                                            provider['data'][index]['weight']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout ? 25 : 14))
                                      ],
                                    ),
                                    SizedBox(width: width * 0.015),
                                    Column(
                                      children: [
                                        Text('Unit',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: tabLayout ? 25 : 14)),
                                        Text(
                                            provider['data'][index]['uom']
                                                    ['short_name']
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout ? 25 : 14))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        // color: Colors.red,
                                        child: Column(
                                          children: [
                                            Text('Price',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        tabLayout ? 25 : 14)),
                                            Text(
                                                '₹ ${provider['data'][index]['price']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        tabLayout ? 25 : 14))
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: width * 0.01),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          children: [
                                            Text('Tax',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        tabLayout ? 25 : 14)),
                                            Text(
                                                '${provider['data'][index]['tax']}%',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        tabLayout ? 25 : 14))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        // color: Colors.purple,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              // onTap: () => Navigator.of(context)
                                              //     .pushNamed('/edit-products',
                                              //         arguments: {
                                              // 'id': provider['data']
                                              //     [index]['id'],
                                              // 'name': provider['data']
                                              //     [index]['name'],
                                              // 'short_description':
                                              //     provider['data'][index][
                                              //         'short_description'],
                                              // 'description':
                                              //     provider['data'][index]
                                              //         ['description'],
                                              // 'status': provider['data']
                                              //     [index]['status'],
                                              // 'weight': provider['data']
                                              //     [index]['weight'],
                                              // 'qty': provider['data']
                                              //     [index]['qty'],
                                              // 'price': provider['data']
                                              //     [index]['price'],
                                              // 'tax': provider['data']
                                              //     [index]['tax'],
                                              // 'main_image':
                                              //     provider['data'][index]
                                              //         ['main_image'],
                                              // 'category': provider['data']
                                              //         [index]['category']
                                              //     ['name'],
                                              // 'size': provider['data']
                                              //         [index]['sizes']
                                              //     ['size'],
                                              // 'uom': provider['data']
                                              //         [index]['uom']
                                              //     ['short_name']
                                              //     }),
                                              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => EditProductsPage(
                                                      provider['data'][index]
                                                          ['id'],
                                                      provider['data'][index]
                                                          ['name'],
                                                      provider['data'][index]
                                                          ['short_description'],
                                                      provider['data'][index]
                                                          ['description'],
                                                      provider['data'][index]
                                                          ['status'],
                                                      provider['data'][index]
                                                          ['weight'],
                                                      provider['data'][index]
                                                          ['qty'],
                                                      provider['data'][index]
                                                          ['price'],
                                                      provider['data'][index]
                                                          ['tax'],
                                                      provider['data'][index]
                                                          ['main_image'],
                                                      provider['data'][index]
                                                          ['category']['name'],
                                                      provider['data'][index]
                                                          ['sizes']['size'],
                                                      provider['data'][index]
                                                          ['uom']['short_name']))),
                                              child: Icon(Icons.edit,
                                                  color: Colors.green,
                                                  size: tabLayout ? 40 : 24),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                Provider.of<ProductsProvider>(
                                                        context,
                                                        listen: false)
                                                    .deleteProduct(
                                                        provider['data'][index]
                                                                ['id']
                                                            .toString())
                                                    .then((_) {
                                                  setState(() {
                                                    provider['data']
                                                        .removeAt(index);
                                                  });
                                                });
                                                // setState(() {
                                                //   isLoading = true;
                                                // });
                                                // recall();
                                              },
                                              child: Icon(Icons.delete,
                                                  color: Colors.red,
                                                  size: tabLayout ? 40 : 24),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: provider['data'].length,
              ),
            ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: height * 0.07),
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(2, 2))
        ]),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed('/add-products'),
          child: CircleAvatar(
            radius: tabLayout ? width * 0.05 : width * 0.07,
            backgroundColor: Colors.green,
            child: Text(
              '+',
              style:
                  TextStyle(color: Colors.white, fontSize: tabLayout ? 55 : 35),
            ),
          ),
        ),
      ),
    );
  }
}
