import 'package:fluttertube_blocpattern/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube_blocpattern/models/video.dart';
import 'dart:async';

class VideosBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  final StreamController<String> _searchController = StreamController<String>();

  Stream get outVideos => _videosController.stream;
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _videosController.sink.add([]);
      videos = await api.search(search);
    } else {
      videos += await api.nextPage();
    }
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _searchController.close();
    _videosController.close();
  }

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}

  @override
  void addListener(listener) {}
}
