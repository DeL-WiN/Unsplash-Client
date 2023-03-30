import 'package:flutter/material.dart';
import 'package:manga_lib/api/api.dart';
import 'package:manga_lib/tabs/photos_pages/photos_page.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Photos();
  }
}

// return MaterialApp(
//   home: Scaffold(
//     body: Center(
//       child: IconButton(
//           onPressed: () {
//             try {
//               final adada = ApiPhotos().getHttp();
//             } catch (e) {
//               print(e);
//             }
//           },
//           icon: Icon(
//             Icons.add_circle_outline,
//             color: Colors.black,
//           )),
//     ),
//   ),
// );
