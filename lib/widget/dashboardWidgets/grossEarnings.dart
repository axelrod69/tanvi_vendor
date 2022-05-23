import 'package:flutter/material.dart';

class GrossEarnings extends StatefulWidget {
  final String grossEarnings;
  GrossEarningsState createState() => GrossEarningsState();

  GrossEarnings(this.grossEarnings);
}

class GrossEarningsState extends State<GrossEarnings> {
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
              Icon(Icons.money, color: Colors.green, size: 80),
              Text('View',
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 71, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout ? 18 : 14))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.02),
            child: Text('₹${widget.grossEarnings}',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 71, 100))),
          ),
          Text('Gross Earnings',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 71, 100)))
        ],
      ),
    );
  }
}
