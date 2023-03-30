import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_lib/designer/designer.dart';

import '../../bloc/photos_bloc/photos_bloc.dart';
import 'photos_second_page.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
        if (state is PhotosStateLoading) {
          BlocProvider.of<PhotosBloc>(context).add(LoadingDataEvent());
        }
        if (state is PhotosStateLoaded) {
          return Scaffold(
            backgroundColor: Colors.black87,
            body: Center(
              child: ListView.builder(
                  itemCount: state.photos.length,
                  itemBuilder: (context, i) {
                    state.photos[i].urls.small;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<PhotosBloc>(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotosSecondPage(
                                        photoUrl: state.photos[i].urls.full,
                                        userName: state.photos[i].user.username,
                                        name: state.photos[i].user.name,
                                        location:
                                            state.photos[i].user.location ?? '',
                                        description:
                                            state.photos[i].altDescription,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 400,
                                  width: 350,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      state.photos[i].urls.small,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Usual(
                                  text: state.photos[i].user.name,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
            ),
          );
        }
        if (state is PhotosStateError) {
          return Center(
            child: Text('Error please come back later'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
