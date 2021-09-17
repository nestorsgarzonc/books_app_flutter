import 'dart:convert';
import 'dart:developer';
import 'package:flutter_books/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

abstract class IRequestHandler {
  Future<http.Response> makeGet(String path);
  Future<http.Response> makePost(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
  Future<http.Response> makePut(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
  Future<http.Response> makeDelete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
}

class RequestHandler implements IRequestHandler {
  Uri getUrl(String path) {
    final uri = Uri.parse('${ApiConstants.path}$path');
    log('URI: $uri');
    return uri;
  }

  List<int> encodeBody(Map<String, dynamic>? body) {
    log('BODY: $body');
    return utf8.encode(json.encode(body));
  }

  void printLogs(http.Response response) {
    log('STATUS: ${response.statusCode}');
    log('HEADERS: ${response.headers}');
    log('BODY: ${response.body}');
  }

  @override
  Future<http.Response> makeDelete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    final res = await http.delete(uri, headers: headers, body: encodedBody);
    printLogs(res);
    return res;
  }

  @override
  Future<http.Response> makeGet(String path) async {
    final uri = getUrl(path);
    final res = await http.get(uri);
    printLogs(res);
    return res;
  }

  @override
  Future<http.Response> makePost(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    final res = await http.post(uri, headers: headers, body: encodedBody);
    printLogs(res);
    return res;
  }

  @override
  Future<http.Response> makePut(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    final res = await http.put(uri, headers: headers, body: encodedBody);
    printLogs(res);
    return res;
  }
}
