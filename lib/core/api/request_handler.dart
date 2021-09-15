import 'dart:convert';
import 'package:flutter_library/core/constants/api_constants.dart';
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
    return uri;
  }

  String encodeBody(Map<String, dynamic>? body) {
    return json.encode(body);
  }

  @override
  Future<http.Response> makeDelete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    return http.delete(uri, headers: headers, body: encodedBody);
  }

  @override
  Future<http.Response> makeGet(String path) {
    final uri = getUrl(path);
    return http.get(uri);
  }

  @override
  Future<http.Response> makePost(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    return http.post(uri, headers: headers, body: encodedBody);
  }

  @override
  Future<http.Response> makePut(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    final uri = getUrl(path);
    final encodedBody = encodeBody(body);
    return http.put(uri, headers: headers, body: encodedBody);
  }
}
