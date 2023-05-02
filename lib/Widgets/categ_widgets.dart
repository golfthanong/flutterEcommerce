import 'package:flutter/material.dart';

import '../minor_screens/subcateg_products.dart';

class SilderBox extends StatelessWidget {
  final String mainCategName;
  const SilderBox({super.key, required this.mainCategName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.height * 0.03,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50)),
          //ขอบให้โค้ง
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  ' << ',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 10),
                ),
                Text(
                  mainCategName.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 10),
                ),
                const Text(
                  ' >> ',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubcategModel extends StatelessWidget {
  final String maincategName;
  final String subcategName;
  final String assetName;
  final String subcategLabel;
  const SubcategModel({
    super.key,
    required this.maincategName,
    required this.subcategName,
    required this.assetName,
    required this.subcategLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategProducts(
                    subcategName: subcategName, maincategName: maincategName)));
      },
      child: Column(
        //ในแต่ละ Grid จะมี Column, รูปและก็ชื่อ
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subcategLabel),
        ],
      ),
    );
  }
}

class CategHeaderLabel extends StatelessWidget {
  final String headerLabal;
  const CategHeaderLabel({super.key, required this.headerLabal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        headerLabal,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}
