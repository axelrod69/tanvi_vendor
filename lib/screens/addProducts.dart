import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/category/categoryProvider.dart';
import 'package:image_picker/image_picker.dart';
import '../model/products/productsProvider.dart';
import '../model/sizeList/sizeListProvider.dart';
import '../model/measureList/measureListProvider.dart';
import 'dart:convert';
import './products.dart';

class AddProductsPage extends StatefulWidget {
  AddProductsPageState createState() => AddProductsPageState();
}

class AddProductsPageState extends State<AddProductsPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _shortDesc = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _quantities = TextEditingController();
  final TextEditingController _weighht = TextEditingController();
  final TextEditingController _priceeee = TextEditingController();
  final TextEditingController _taxxx = TextEditingController();

  String? dropDownValue;
  String? measureDropDownValue;
  String? sizeDropDownValue;
  String? availablityDropDownValue;
  String? nameOfProduct;
  String? shortDescription;
  String? description;
  String? sizeOfProduct;
  String? quantityOfProduct;
  String? weightOfProduct;
  String? priceOfProduct;
  String? taxAmount;
  List<dynamic> list = [];
  bool isLoading = true;
  PickedFile? _imageFile;
  File? image;
  File? imageTwo;
  bool first = false;
  PickedFile? _secondImageFile;
  bool second = false;
  final ImagePicker? _imagePicker = ImagePicker();
  final measure = ['Kg', 'gm', 'ltr'];
  // final available = [
  //   {'value': true, 'data': 'Available'},
  //   {'value': false, 'data': 'Out Of Stock'}
  // ];
  final available = ['Available', 'Out Of Stock'];

  Future pickImage(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      final imageTemporary = File(img!.path);
      print('Temp Image: $imageTemporary');
      setState(() {
        image = imageTemporary;
        print('Image $image');
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickSecondImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker!.pickImage(source: source);
      final imageTemporary = File(pickedFile!.path);
      setState(() {
        imageTwo = imageTemporary;
        // second = true;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState1
    Provider.of<CategoryProvider>(context, listen: false)
        .getCategories()
        .then((_) {
      Provider.of<SizeListProvider>(context, listen: false)
          .getSizeList()
          .then((_) {
        Provider.of<MeasureListProvider>(context, listen: false)
            .getMeasureList()
            .then((_) {
          setState(() {
            isLoading = false;
          });
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<CategoryProvider>(context).categoryList;
    final sizeProvider = Provider.of<SizeListProvider>(context).sizeList;
    final measureList = Provider.of<MeasureListProvider>(context).measureList;
    // list = provider;

    // print('LIST $list');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.005,
                top: height * 0.003,
                right: width * 0.005,
                bottom: height * 0.003),
            child: Container(
              width: width * 0.1,
              height: height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(1, 2),
                    )
                  ]),
              child: const Icon(Icons.arrow_back_ios, color: Colors.green),
            ),
          ),
        ),
        title: const Text(
          'Add Products',
          style: TextStyle(
              color: Color.fromARGB(255, 36, 71, 100),
              fontWeight: FontWeight.bold,
              fontSize: 25),
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
              padding: EdgeInsets.all(width * 0.04),
              child: Form(
                key: _key,
                child: ListView(
                  children: [
                    const Text(
                      'Select Category',
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 71, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        width: width * 0.1,
                        height: height * 0.05,
                        padding: EdgeInsets.only(left: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: dropDownValue,
                              hint: Text('Category'),
                              items: provider.map((list) {
                                return DropdownMenuItem(
                                    child: Text(list['name']),
                                    value: list['id'].toString());
                              }).toList(),
                              onChanged: (selectedDropdownValue) {
                                setState(() {
                                  dropDownValue =
                                      selectedDropdownValue.toString();
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text(
                      'Title',
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 71, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        // width: width * 0.1,
                        height: height * 0.05,
                        padding: EdgeInsets.only(
                            left: width * 0.02, right: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: TextFormField(
                          controller: _title,
                          decoration: const InputDecoration(
                              hintText: 'Enter Name Of Product',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          validator: (name) {
                            if (name!.isEmpty) {
                              return 'Please Enter Name';
                            } else {
                              nameOfProduct = name;
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text(
                      'Short Description',
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 71, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        height: height * 0.15,
                        padding: EdgeInsets.only(
                            left: width * 0.02, right: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: TextFormField(
                          controller: _shortDesc,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              hintText: 'Enter Description',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          validator: (short) {
                            if (short!.isEmpty) {
                              return 'Please Enter Short Description';
                            } else {
                              shortDescription = short;
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text(
                      'Description',
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 71, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        height: height * 0.15,
                        padding: EdgeInsets.only(
                            left: width * 0.02, right: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: TextFormField(
                          controller: _desc,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              hintText: 'Enter Description',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          validator: (desc) {
                            if (desc!.isEmpty) {
                              return 'Please Enter Desccription';
                            } else {
                              description = desc;
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text('Images',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      height: height * 0.22,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: double.infinity,
                                // color: Colors.amber,
                                padding: EdgeInsets.only(
                                    top: height * 0.01, bottom: height * 0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      height: height * 0.14,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 36, 71, 100)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 8,
                                                offset: Offset(1, 2))
                                          ]),
                                      child: image != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                image!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : const Center(
                                              child: Text('Pick An Image'),
                                            ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    InkWell(
                                      onTap: () =>
                                          pickImage(ImageSource.gallery),
                                      child: Container(
                                        width: width * 0.4,
                                        height: height * 0.045,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 36, 71, 100),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 8,
                                                  offset: Offset(1, 2))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.attachment,
                                                color: Colors.white),
                                            SizedBox(width: width * 0.01),
                                            const Text('Choose Image',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: double.infinity,
                                // color: Colors.amber,
                                padding: EdgeInsets.only(
                                    top: height * 0.01, bottom: height * 0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      height: height * 0.14,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 36, 71, 100)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 8,
                                                offset: Offset(1, 2))
                                          ]),
                                      child: imageTwo != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                imageTwo!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : const Center(
                                              child: Text('Pick An Image',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    InkWell(
                                      onTap: () =>
                                          pickSecondImage(ImageSource.gallery),
                                      child: Container(
                                        width: width * 0.4,
                                        height: height * 0.045,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 36, 71, 100),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 8,
                                                  offset: Offset(1, 2))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.attachment,
                                                color: Colors.white),
                                            SizedBox(width: width * 0.01),
                                            const Text('Choose Image',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    const Text('Size',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.01),
                          child: Container(
                            // width: width * 0.35,
                            height: height * 0.035,
                            padding: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  value: sizeDropDownValue,
                                  hint: const Text('Select Size'),
                                  items: sizeProvider.map((sizeList) {
                                    return DropdownMenuItem(
                                        child: Text(sizeList['size']),
                                        value: sizeList['id'].toString());
                                  }).toList(),
                                  onChanged: (selectedDropdownValue) {
                                    setState(() {
                                      sizeDropDownValue =
                                          selectedDropdownValue.toString();
                                      print(
                                          'Measure DropDownValue $sizeDropDownValue');
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.015),
                    const Text('Quantity',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: height * 0.04,
                      // color: Colors.red,
                      padding: EdgeInsets.only(
                          left: width * 0.01, top: height * 0.005),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.035,
                            padding: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              controller: _quantities,
                              decoration: const InputDecoration(
                                  hintText: 'Enter Quantity',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              validator: (quantity) {
                                if (quantity!.isEmpty) {
                                  return 'Please Enter Quantity';
                                } else {
                                  quantityOfProduct = quantity;
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            width: width * 0.25,
                            height: height * 0.035,
                            padding: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              controller: _weighht,
                              decoration: const InputDecoration(
                                  hintText: 'Enter Weight',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              validator: (weight) {
                                if (weight!.isEmpty) {
                                  return 'Please Enter Weight';
                                } else {
                                  weightOfProduct = weight;
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            // width: width * 0.35,
                            height: height * 0.035,
                            padding: EdgeInsets.only(left: width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  value: measureDropDownValue,
                                  hint: const Text('Measure'),
                                  items: measureList.map((list) {
                                    return DropdownMenuItem(
                                        child: Text(list['short_name']),
                                        value: list['id'].toString());
                                  }).toList(),
                                  onChanged: (selectedDropdownValue) {
                                    setState(() {
                                      measureDropDownValue =
                                          selectedDropdownValue.toString();
                                      print('Measure: $measureDropDownValue');
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      height: height * 0.07,
                      width: width * 0.9,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: width * 0.3,
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Price',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 71, 100),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    const Text('₹',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 36, 71, 100),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                    SizedBox(width: width * 0.005),
                                    Container(
                                      width: width * 0.25,
                                      height: height * 0.035,
                                      padding:
                                          EdgeInsets.only(left: width * 0.02),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 8,
                                                offset: Offset(1, 2))
                                          ]),
                                      child: TextFormField(
                                        controller: _priceeee,
                                        decoration: const InputDecoration(
                                            hintText: 'Enter Amount',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                            ),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none),
                                        validator: (price) {
                                          if (price!.isEmpty) {
                                            return 'Please Enter Price';
                                          } else {
                                            priceOfProduct = price;
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            height: double.infinity,
                            width: width * 0.35,
                            // color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Tax',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 71, 100),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    const Text('₹',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 36, 71, 100),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                    SizedBox(width: width * 0.005),
                                    Container(
                                      width: width * 0.31,
                                      height: height * 0.035,
                                      padding:
                                          EdgeInsets.only(left: width * 0.02),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 8,
                                                offset: Offset(1, 2))
                                          ]),
                                      child: TextFormField(
                                        controller: _taxxx,
                                        decoration: const InputDecoration(
                                            hintText: 'Enter Tax Amount',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                            ),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none),
                                        validator: (tax) {
                                          if (tax!.isEmpty) {
                                            return 'Please Enter Tax';
                                          } else {
                                            taxAmount = tax;
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text('Availability',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        // width: width * 0.35,
                        height: height * 0.04,
                        padding: EdgeInsets.only(left: width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 2))
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: availablityDropDownValue,
                              hint: const Text('Set Availability'),
                              items: available.map((list) {
                                return DropdownMenuItem(
                                    child: Text(list), value: list);
                              }).toList(),
                              onChanged: (selectedDropdownValue) {
                                setState(() {
                                  availablityDropDownValue =
                                      selectedDropdownValue.toString();
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.1, right: width * 0.1),
                      child: InkWell(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            addProducts(context);
                          }
                        },
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 36, 71, 100),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    offset: Offset(1, 2))
                              ]),
                          child: const Center(
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
            ),
    );
  }

  dynamic addProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false).postProducts(
        nameOfProduct!,
        shortDescription!,
        description!,
        availablityDropDownValue!,
        weightOfProduct!,
        quantityOfProduct!,
        priceOfProduct!,
        taxAmount!,
        image!,
        dropDownValue!,
        sizeDropDownValue!,
        measureDropDownValue!);

    // await Provider.of<ProductsProvider>(context, listen: false).getProducts();

    // var res = json.decode(response.body);
    // if (res['message'] == 'Invalid inputes') {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text('Invalid Input Entered',
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontWeight: FontWeight.bold,
    //         )),
    //     backgroundColor: Colors.green,
    //     action: SnackBarAction(
    //         label: 'OK',
    //         onPressed: () =>
    //             ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    //   ));
    // }
    // Navigator.of(context).pop().then((_) {});
    Navigator.push(context, MaterialPageRoute(builder: (context) => Products()))
        .then((_) {
      setState(() {
        Provider.of<ProductsProvider>(context, listen: false).getProducts();
      });
    });
  }
}
