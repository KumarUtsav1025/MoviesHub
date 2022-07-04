import 'dart:convert';
import 'package:http/http.dart' as http;

var MovData=new Map();

Future<String> ImdbId(var id) async{

  var onlineData = await http.get(Uri.parse('https://mdblist.p.rapidapi.com/?rapidapi-key=0891c1fa67mshb75ea0e5d4d19e5p180751jsn5d38bfedeab4&tm=$id'));

  var jdata = jsonDecode(onlineData.body);
  MovData['imdbid']=jdata['imdbid'];
  MovData['title']=jdata['title'];
  MovData['year']=jdata['year'];
  MovData['description']=jdata['description'];
  MovData['trailer']=jdata['trailer'];
  MovData['poster']=jdata['poster'];
  String data=MovData['imdbid'] ;
  return data;
}

Future<Map<dynamic,dynamic>>  MovDetail(var id) async{
  var para = await ImdbId(id);
  var onlineData = await http.get(Uri.parse('https://moviesdb5.p.rapidapi.com/om/?rapidapi-key=0891c1fa67mshb75ea0e5d4d19e5p180751jsn5d38bfedeab4&i=$para'));

  var jdata = jsonDecode(onlineData.body);
  MovData['runtime']=jdata['Runtime'];
  MovData['rating']=jdata['imdbRating'];
  MovData['genres']=jdata['Genre'];
  MovData['director']=jdata['Director'];
  MovData['actors']=jdata['Actors'];

  print(MovData);
  return MovData;
}

void main() {
  MovDetail(550);
}