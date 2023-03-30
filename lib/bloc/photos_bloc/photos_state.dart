part of 'photos_bloc.dart';

abstract class PhotosState {
  copyWith({required PhotosModel currentUser}) {}
}

class PhotosStateLoading extends PhotosState {}

class PhotosStateLoaded extends PhotosState {
  final List<PhotosModel> photos;
  final List<PhotosModel> favorites;
  PhotosStateLoaded(this.photos, this.favorites);
}

class PhotosStateError extends PhotosState {}
