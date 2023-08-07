import 'dart:convert';
import 'package:http/http.dart'as http;
class Api{
  final String url="http://127.0.0.1:8000/";
AuthData(data,apiurl)async{
  var fullurl=url+apiurl;
  return await http.post(
Uri.parse(fullurl),
    body: data,
  );
}
PostData(data,apiurl)async{
  var fullurl=url+apiurl;
  return await http.post(
    Uri.parse(fullurl),
  );
}
GetData(data,apiurl)async{
  var fullurl=url+apiurl;
  return await http.get(
    Uri.parse(fullurl),
  );
}
}