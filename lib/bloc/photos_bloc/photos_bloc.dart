import 'package:bloc/bloc.dart';
import 'package:manga_lib/api/api.dart';
import 'package:manga_lib/model/photos_model.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final ApiPhotos apiPhotos;

  PhotosBloc({required this.apiPhotos}) : super(PhotosStateLoading()) {
    on<PhotosEvent>((event, emit) {
      if (event is LoadingDataEvent) {
        return _loadData(event, emit);
      }
    });
    add(LoadingDataEvent());
  }

  Future<void> _loadData(PhotosEvent event, Emitter<PhotosState> emit) async {
    try {
      final photos = await apiPhotos.getHttp();

      final _state = state;
      if (_state is PhotosStateLoading) {
        print("adaddRRRR");
        emit(PhotosStateLoaded(photos ?? [], []));
      }
    } catch (e) {
      PhotosStateError();
    }
  }

  Future<void> _loadFact(PhotosEvent event, Emitter<PhotosState> emit) async {
    final photo = state as PhotosStateLoaded;
    final image = photo.photos;

    final _state = state;
    if (_state is PhotosStateLoaded) {
      emit(PhotosStateLoaded(image, []));
    }
  }
}
