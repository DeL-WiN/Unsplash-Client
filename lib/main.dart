import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_lib/tabs/home_page.dart';

import 'api/api.dart';
import 'bloc/photos_bloc/photos_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PhotosBloc>(
              create: (context) => PhotosBloc(apiPhotos: ApiPhotos()))
        ],
        child: MaterialApp(
          title: 'Cats',
          initialRoute: '/',
          onGenerateRoute: (routeSettings) {
            switch (routeSettings.name) {
              case '/':
                return MaterialPageRoute(
                    builder: (context) => const Tabs(),
                    settings: routeSettings);
              default:
                return MaterialPageRoute(
                    builder: (context) => const Tabs(),
                    settings: routeSettings);
            }
          },
        ));
  }
}
