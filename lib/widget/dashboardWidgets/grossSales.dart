import 'package:flutter/material.dart';

class GrossSales extends StatefulWidget {
  final String grossSale;
  GrossSalesState createState() => GrossSalesState();

  GrossSales(this.grossSale);
}

class GrossSalesState extends State<GrossSales> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Container(
      height: height * 0.1,
      padding: EdgeInsets.all(tabLayout ? 20 : 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.point_of_sale,
                  color: Colors.green, size: tabLayout ? 200 : 80),
              Text('View',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 18 : 14))
            ],
          ),
          SizedBox(height: tabLayout ? height * 0.02 : 0),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: Text('₹${widget.grossSale}',
                style: TextStyle(
                    fontSize: tabLayout ? 45 : 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 36, 71, 100))),
          ),
          Text('Gross Sales',
              style: TextStyle(
                  fontSize: tabLayout ? 35 : 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 36, 71, 100)))
        ],
      ),
    );
  }
}
