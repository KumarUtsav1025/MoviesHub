import 'dart:convert';
import 'package:http/http.dart' as http;

var MovData=new Map();
var SimData;

var GenDat={"genres":[{"id":28,"name":"Action"},{"id":12,"name":"Adventure"},{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},{"id":80,"name":"Crime"},{"id":99,"name":"Documentary"},{"id":18,"name":"Drama"},{"id":10751,"name":"Family"},{"id":14,"name":"Fantasy"},{"id":36,"name":"History"},{"id":27,"name":"Horror"},{"id":10402,"name":"Music"},{"id":9648,"name":"Mystery"},{"id":10749,"name":"Romance"},{"id":878,"name":"Science Fiction"},{"id":10770,"name":"TV Movie"},{"id":53,"name":"Thriller"},{"id":10752,"name":"War"},{"id":37,"name":"Western"}]};




Future<String> ImdbId(int id) async{
  print(id);

  var onlineData = await http.get(Uri.parse('https://mdblist.p.rapidapi.com/?rapidapi-key=0891c1fa67mshb75ea0e5d4d19e5p180751jsn5d38bfedeab4&tm=$id'));
  var onlineData2 = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${id}/similar?api_key=6c459b95cc2fb143cce9ca7d2097b416&language=en-US&page=1'));

  var jdata = jsonDecode(onlineData.body);
  var jdata2 = jsonDecode(onlineData2.body);
  SimData=jdata2['results'];
  if(jdata['imdbid']==null)
  {
    return 'fail';
  }
  MovData['imdbid']=jdata['imdbid'];
  MovData['title']=jdata['title'];
  MovData['year']=jdata['year'];
  MovData['description']=jdata['description'];
  MovData['trailer']=jdata['trailer'];
  MovData['poster']=jdata['poster'];
  String data=MovData['imdbid'] ;
  return data;
}

Future<Map<dynamic,dynamic>>  MovDetail(int id) async{
  print('MovDetail');
  var para = await ImdbId(id);

  print(para);
  var onlineData = await http.get(Uri.parse('https://moviesdb5.p.rapidapi.com/om/?rapidapi-key=cfb4fb12b5msh2bb0e63345e7668p19235fjsn0e4dc96a71dd&i=$para'));
  var jdata = jsonDecode(onlineData.body);
  print(jdata);
  MovData['runtime']=jdata['Runtime'];
  MovData['rating']=jdata['imdbRating'];
  MovData['genres']=jdata['Genre'];
  MovData['director']=jdata['Director'];
  MovData['actors']=jdata['Actors'];

  print(MovData);
  return MovData;

}
