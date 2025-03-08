import 'dart:convert';
import 'package:flutter_application_1/modal/nft_modal.dart';
import 'package:http/http.dart' as http;

class NftHelper {
  NftHelper._();
  static NftHelper nh = NftHelper._();

  Future<NftModal?> apiParsing({required int id}) async {
    String api =
        'https://collectionapi.metmuseum.org/public/collection/v1/objects/$id';

    try {
      print("Fetching data for ID: $id"); // ✅ Debugging log

      http.Response r = await http.get(Uri.parse(api));

      if (r.statusCode == 200) {
        var data = jsonDecode(r.body);

        print("API Response: $data");

        if (data != null && data['primaryImage'] != null) {
          return NftModal.toModal(data);
        } else {
          print("No image found for ID: $id");
        }
      } else {
        print("API Error: ${r.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }

    return null;
  }
}
