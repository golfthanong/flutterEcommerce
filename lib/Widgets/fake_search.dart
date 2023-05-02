import 'package:flutter/material.dart';

import '../minor_screens/search.dart';

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          //decoration ตบแต่ง Container ใช้คู่กับ BoxDecoration
          border: Border.all(color: Colors.orange, width: 1.4), //เส้นขอบของbox
          borderRadius: BorderRadius.circular(25), //ทำให้กรอบโค้ง
        ),
        child: Row(
          // แบ่ง Row ของ BoxDecoration
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //ทุกchildrenของrowอยู่กลาง
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'ค้นหาสินค้า',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Container(
              height: 32,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  'ค้นหา',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
