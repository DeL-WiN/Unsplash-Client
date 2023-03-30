import 'package:dio/dio.dart';
import 'package:manga_lib/model/photos_model.dart';

class ApiPhotos {
  ApiPhotos();
  final options = Options(
    headers: {
      "X-RapidAPI-Key": "89d9b0e75fmshfe72a8a77c71a3fp1c92a4jsn291e99fa84ac",
      "X-RapidAPI-Host": "t-one-youtube-converter.p.rapidapi.com"
    },
  );
  final client_id = "wN2rKGM0d-XojrvFXyN5IkyVQzdkUpeQUC1_PWghC84";
  Future<List<PhotosModel>?> getHttp() async {
    var response = await Dio().get(
        "https://api.unsplash.com/photos?client_id=$client_id",
        options: options);

    List post = response.data;
    // print(response);

    final posts = PhotosModel.fromList(post);
    return posts;
  }
}
