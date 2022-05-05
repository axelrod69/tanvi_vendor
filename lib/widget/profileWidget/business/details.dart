import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../model/profile/profileProvider.dart';

class Details extends StatelessWidget {
  final String bankName;
  final String branchName;
  final String ifscCode;
  final String accountNumber;
  final String organisationName;
  final String telephoneOne;
  final String telephoneTwo;
  final String companyPancard;
  final String companyPancardDoc;
  final String aadharUdyog;
  final String aadharUdyogDoc;
  final String gstNumber;

  Details(
      this.bankName,
      this.branchName,
      this.ifscCode,
      this.accountNumber,
      this.organisationName,
      this.telephoneOne,
      this.telephoneTwo,
      this.companyPancard,
      this.companyPancardDoc,
      this.aadharUdyog,
      this.aadharUdyogDoc,
      this.gstNumber);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textColor = Color.fromARGB(255, 36, 71, 100);
    // final textScale = MediaQuery.of(context).textScaleFactor * 1.2;
    // final provider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Organization Name',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            organisationName ?? 'null',
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Telephone Number 1',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            telephoneOne ?? 'null',
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Telephone Number 2',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            telephoneTwo ?? 'null',
            // provider['email'],
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Company Pan Card',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            companyPancard ?? 'null',
            // provider['phone'],
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.005),
          Text(
            companyPancardDoc != null
                ? 'Pan Card Document Uploaded'
                : 'Pan Card Document Not Uploaded',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Aadhar Udyam Udoyog',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            aadharUdyog,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.005),
          Text(
            aadharUdyogDoc != null
                ? 'Aadhar Card Document Uploaded'
                : 'Aadhar Card Document Not Uploaded',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'GST Number',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            gstNumber,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Bank Name',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            bankName,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Branch Name',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            branchName,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Branch IFSC Code',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            ifscCode,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Account Number',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            accountNumber,
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Business Name',
            // textScaleFactor: textScale,
            style: TextStyle(
                // color: Color.fromRGBO(131, 131, 131, 1),
                color: textColor,
                fontSize: 17),
          ),
          SizedBox(height: height * 0.01),
          Text(
            // provider['name'],
            'Dum Dum Cantonment',
            // textScaleFactor: textScale,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          SizedBox(height: height * 0.02),
          // Text(
          //   'Business Address',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(
          //       // color: Color.fromRGBO(131, 131, 131, 1),
          //       color: textColor,
          //       fontSize: 17),
          // ),
          // SizedBox(height: height * 0.01),
          // Text(
          //   // provider['name'],
          //   'Dum Dum Cantonment',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(color: textColor, fontSize: 12),
          // ),
          // SizedBox(height: height * 0.02),
          // Text(
          //   'Locality',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(
          //       // color: Color.fromRGBO(131, 131, 131, 1),
          //       color: textColor,
          //       fontSize: 17),
          // ),
          // SizedBox(height: height * 0.01),
          // Text(
          //   // provider['name'],
          //   'Dum Dum Cantonment',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(color: textColor, fontSize: 12),
          // ),
          // SizedBox(height: height * 0.02),
          // Text(
          //   'City',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(
          //       // color: Color.fromRGBO(131, 131, 131, 1),
          //       color: textColor,
          //       fontSize: 17),
          // ),
          // SizedBox(height: height * 0.01),
          // Text(
          //   // provider['name'],
          //   'Dum Dum Cantonment',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(color: textColor, fontSize: 12),
          // ),
          // SizedBox(height: height * 0.02),
          // Text(
          //   'State',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(
          //       // color: Color.fromRGBO(131, 131, 131, 1),
          //       color: textColor,
          //       fontSize: 17),
          // ),
          // SizedBox(height: height * 0.01),
          // Text(
          //   // provider['name'],
          //   'Dum Dum Cantonment',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(color: textColor, fontSize: 12),
          // ),
          // SizedBox(height: height * 0.02),
          // Text(
          //   'Post Code',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(
          //       // color: Color.fromRGBO(131, 131, 131, 1),
          //       color: textColor,
          //       fontSize: 17),
          // ),
          // SizedBox(height: height * 0.01),
          // Text(
          //   // provider['name'],
          //   'Dum Dum Cantonment',
          //   // textScaleFactor: textScale,
          //   style: TextStyle(color: textColor, fontSize: 12),
          // ),
          SizedBox(height: height * 0.05),
          Padding(
            padding: EdgeInsets.only(right: width * 0.1, bottom: height * 0.05),
            child: Container(
              width: double.infinity,
              height: height * 0.05,
              // margin: EdgeInsets.only(bottom: height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: textColor, width: 1)),
              child: Center(
                child: Text(
                  'Save',
                  // textScaleFactor: textScale,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // );
  }
}
