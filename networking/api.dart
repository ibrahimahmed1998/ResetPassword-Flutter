import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network
{
  // 10.0.2.2
  // 127.0.0.1:8000
  final String _url = 'https://extra-hint.herokuapp.com/api/testing/';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async
  {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    //token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async // 12345678 - test
  {
    var fullUrl = _url + apiUrl;
    return await http.post( Uri.parse(fullUrl),

        body: {'value':data  } ,

        headers:  {  //'Content-type' : 'application/json',
          'Accept' : 'application/json',
         //  "Access-Control_Allow_Origin": "*"

          // 'Authorization' : 'Bearer $token'
        }

        // body: jsonEncode(data),
       // headers: _setHeaders()
    );
  }

  getData(apiUrl) async
  {
    var fullUrl = _url + apiUrl;
    await _getToken();

    return await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders()
    );
  }


  test2(token) async
  {
    var xz='http://10.0.2.2:8000/api/service/messages';
    // await _getToken();

    return await http.get(
        Uri.parse(xz),
        headers:  {  'Content-type' : 'application/json',
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $token'
        }
    );
  }

  test3(token,data) async
  {
    var xz='http://10.0.2.2:8000/api/testing/test';
    // await _getToken();

    return await http.post
      (
        Uri.parse(xz),
        body: { 'value':jsonEncode(data)  } ,

        headers:  {
          //  'Content-type' : 'application/json',
            'Accept' : 'application/json',
          //'Authorization' : 'Bearer $token'
        }
    );
  }




  postData(token,apiUrl) async
  {
    var fullUrl = _url + apiUrl;

    return await http.post
      (
        Uri.parse(fullUrl),
        headers:  {   'Authorization' : 'Bearer $token'}
    );
  }



  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}
