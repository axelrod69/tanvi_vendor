import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/category/categoryProvider.dart';
import 'package:image_picker/image_picker.dart';

class AddProductsPage extends StatefulWidget {
  AddProductsPageState createState() => AddProductsPageState();
}

class AddProductsPageState extends State<AddProductsPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? dropDownValue;
  String? measureDropDownValue;
  String? availablityDropDownValue;
  List<dynamic> list = [];
  bool isLoading = true;
  PickedFile? _imageFile;
  File? image;
  File? imageTwo;
  bool first = false;
  PickedFile? _secondImageFile;
  bool second = false;
  final ImagePicker? _imagePicker = ImagePicker();
  final measure = ['Kg', 'gm'];
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
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<CategoryProvider>(context).categoryList;
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
                          decoration: const InputDecoration(
                              hintText: 'Enter Name Of Product',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
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
                          maxLines: 5,
                          decoration: const InputDecoration(
                              hintText: 'Enter Description',
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
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
                              decoration: const InputDecoration(
                                  hintText: 'Enter Quantity',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
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
                                  hint: Text('Measure'),
                                  items: measure.map((list) {
                                    return DropdownMenuItem(
                                        child: Text(list), value: list);
                                  }).toList(),
                                  onChanged: (selectedDropdownValue) {
                                    setState(() {
                                      measureDropDownValue =
                                          selectedDropdownValue.toString();
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    const Text('Price',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 71, 100),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    Container(
                      height: height * 0.05,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          const Text('₹',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 36, 71, 100),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)),
                          SizedBox(width: width * 0.01),
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
                              decoration: const InputDecoration(
                                  hintText: 'Enter Amount',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
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
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
            ),
    );
  }
}
