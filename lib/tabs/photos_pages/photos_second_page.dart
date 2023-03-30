import 'package:flutter/material.dart';
import 'package:manga_lib/designer/designer.dart';

class PhotosSecondPage extends StatelessWidget {
  final String photoUrl;
  final String userName;
  final String name;
  final String location;
  final String description;

  const PhotosSecondPage(
      {Key? key,
      required this.photoUrl,
      required this.userName,
      required this.name,
      required this.location,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Usual(text: userName)
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 400,
              height: 500,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Bold(text: name),
                    const SizedBox(width: 15),
                    Usual(text: location),
                  ],
                ),
                Usual(text: 'description: $description'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
