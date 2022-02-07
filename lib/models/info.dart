import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class InfoId{
  String lang='';
  String? id;
  InfoId();

  getApi (String id) async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    lang= preferences.getString('language')??'en';
    var headers = {
      'Cookie': 'device_view=full; hl=en'
    };
    var request = http.Request('GET', Uri.parse('https://www.mawaqit.net/$lang/id/$id?view=desktop'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('pressed');
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  setLanguage(String language)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  getLanguage()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    lang= preferences.getString('language')??'en';
    return lang;
  }
}