import 'package:flutter/material.dart';

import '../Widgets/categ_widgets.dart';
import '../utility/categ_list.dart';

class SkinCateg extends StatefulWidget {
  const SkinCateg({super.key});

  @override
  State<SkinCateg> createState() => _SkinCategState();
}

class _SkinCategState extends State<SkinCateg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(
                    headerLabal: 'Men',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70, //ความห่างแถวบนกับแถวล่าง
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.5,
                      crossAxisCount: 3,
                      children: List.generate(men.length, (index) {
                        return SubcategModel(
                          maincategName: ' men ',
                          subcategName: men[index],
                          assetName: 'images/men/men$index.jpg',
                          subcategLabel: men[index],
                        );
                        //return Container(
                        //  color: Colors.amber,
                        //);
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SilderBox(
              mainCategName: ' men ',
            ),
          )
        ],
      ),
    );
  }
}
