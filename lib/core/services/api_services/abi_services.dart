import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> get({required String url, String? token}) async {
    try {
      final headers = <String, String>{'Content-Type': 'application/json'};

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load posts. Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching posts: $e");
    }
  }

  Future<dynamic> Post(Model, {required Url}) async {
    final url = Uri.parse('$Url');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Model.toJson()),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      // Handle successful response
      print(jsonEncode(Model.toJson()));
      return jsonDecode(response.body);
    }
  }

  Future<void> delete({required Url}) async {
    final url = Uri.parse('$Url');

    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Product deleted successfully');
      } else {
        print('Failed to delete product: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }
  //   Future<dynamic> update(
  //     ProductModel model, {
  //     required String url,
  //   }) async {
  //     final Uri uri = Uri.parse(url);

  //     try {
  //       final response = await http.patch(
  //         uri,
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: jsonEncode(model.toJson()),
  //       );
  //       print(response.statusCode);
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         print(jsonEncode(model.toJson()));
  //         print('Product updated successfully');
  //         return jsonDecode(response.body);
  //       } else {
  //         print('Failed to update product: ${response.reasonPhrase}');
  //       }
  //     } catch (e) {
  //       print('Error updating product: $e');
  //     }
  //   }
}
