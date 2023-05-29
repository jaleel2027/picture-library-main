import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:picture_library/api/api_manager.dart';
import 'package:picture_library/home/model/photos_response_model.dart';
import 'package:picture_library/home/model/search_photos_model.dart';
import 'package:picture_library/utils/api_utilities.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  List<PhotosResponse>? _photos;

  List<PhotosResponse>? get photos => _photos;

  set photos(List<PhotosResponse>? value) {
    _photos = value;
    update();
  }

  SearchPhotosResponse? _searchPhotos;

  SearchPhotosResponse? get searchPhotos => _searchPhotos;

  set searchPhotos(SearchPhotosResponse? value) {
    _searchPhotos = value;
    update();
  }

  Future<bool> getPhotos(int? page) async {
    page = page ?? 1;
    List<PhotosResponse>? photosss;
    var photosList = await API.callAPI(
        url: "${APIUtilities.photosUrl}?page=$page", type: APIType.tGet);
    photosss = List<PhotosResponse>.from(
        photosList.map((x) => PhotosResponse.fromJson(x)));
    if (photosList != null) {
      photos ??= [];
      photos!.addAll(photosss);
      update();
      // log(jsonEncode(photos));
      if (photosss.isEmpty) {
        return false;
      }
      return true;
    }
    return false;
  }

  Future<bool> getSearchPhotos(int? page, String? query) async {
    page = page ?? 1;
    SearchPhotosResponse? photosss;
    var photosList = await API.callAPI(
        url: "${APIUtilities.photosSearchUrl}?page=$page&query=$query",
        type: APIType.tGet);
    photosss = SearchPhotosResponse.fromJson(photosList);
    if (photosList != null) {
      searchPhotos = photosss;
      update();
      // log(jsonEncode(photos));
      if (photosss.results!.isEmpty) {
        return false;
      }
      return true;
    }
    return false;
  }
}
