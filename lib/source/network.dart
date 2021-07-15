
import 'dart:convert';

import 'package:http/http.dart';

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      print(response.body[0]);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}