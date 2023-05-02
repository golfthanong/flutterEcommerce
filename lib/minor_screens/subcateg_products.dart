import 'package:flutter/material.dart';

class SubCategProducts extends StatelessWidget {
  final String maincategName;
  final String subcategName;
  const SubCategProducts(
      {Key? key, required this.subcategName, required this.maincategName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          //สร้างปุ่มลูก*ศรแล้วกดย้อนกลับได้
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); //พอกดแล้วให้ส่งกลับไปที่ที่มา
          },
        ),
        title: Text(
          subcategName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(child: Text(maincategName)),
    );
  }
}
