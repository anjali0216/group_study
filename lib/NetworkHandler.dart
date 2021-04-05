import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
class NetworkHandler
{
  var log = Logger();
  String baseurl="http://studygroup_userDB_baseURL.com";

  Future get(String url)async
  {
    url=formatUrl(url);
    var response= await http.get(Uri.parse(url));
    if(response.statusCode==200 || response.statusCode==201){
      log.i(response.body);
      return json.decode(response.body);
    }
log.i(response.body);
log.i(response.statusCode);
  }

  Future<http.Response> post(String url,Map<String, String> body)async
  {
    url=formatUrl(url);
    var response= await http.post(
        Uri.parse(url),
      headers: {"Content-type": "application/json",},
      body: json.encode(body),
    );

    return response;
  }
  String formatUrl(String url)
  {
    return baseurl+url;
  }
}