/// It's a generic class that provides a set of methods to interact with a REST API
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quiver/strings.dart' as quiver;

abstract class IProvider<T> {
  String get endpoint;

  String buildEndpointWithPath(path) {
    List<String?> x = [endpoint, path];

    x.removeWhere((item) => quiver.isBlank(item));

    return x.join('/');
  }
}
