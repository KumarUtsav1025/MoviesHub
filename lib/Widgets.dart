
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';


Widget CustomBar(double Height, double Width,){
  return Padding(
    padding: EdgeInsets.fromLTRB(0.0,Height*0.055,0.0,0.0),
    child: Container(
      width: Width*0.89,
      height: Height*0.075,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(200, 0,0,0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  //Navigator.of(context).pop();
                },
                child: const Icon(Icons.home_rounded,size: 40,color: Color.fromARGB(255,137, 44, 220),),),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  cursorHeight: 22.0,
                  cursorColor: const Color.fromARGB(255,137, 44, 220),
                  style: const TextStyle(color: Color.fromARGB(255,137, 44, 220),fontSize: 18,overflow: TextOverflow.ellipsis),
                  onChanged: (value){},
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 6.0),
                    hintStyle: TextStyle(color: Color.fromARGB(255,137, 44, 220),),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255,137, 44, 220), width: 2.5, )
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255,137, 44, 220), )
                    ),
                    hintText: 'Search Movies',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: const Icon(Icons.search,size: 40,color: Color.fromARGB(255,137, 44, 220),),),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget movieTile(String title, String url){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: const Color.fromARGB(220,188, 111, 241),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,0.0,8.0),
              child: Image.network(url,
                height: 150.0,
                fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 8.0,),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                ],
              )
          ),
          const SizedBox(width: 8.0,),
        ],
      ),
    ),
  );
}

Widget DescripMov(double Width, double Height, var ComplDat){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0.0,Height*0.018, 0.0,3 ),
        child: AutoSizeText(ComplDat['title'] ,
          maxLines: 2,
          style: GoogleFonts.gentiumBasic(textStyle: const TextStyle(
            height: 1,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            shadows: [Shadow(
                blurRadius: 10.0,
                color: Color.fromARGB(255, 0, 0, 0)
            )],
            color: Color.fromARGB(255,188, 111, 241),
          ),
          ),
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 3.0),
        child:  AutoSizeText("Director:  ${ComplDat['director']}",
          maxLines: 2,
          style: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 3.0),
        child: AutoSizeText("Released: ${ComplDat['year']}",
          maxLines: 1,
          style: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AutoSizeText("IMDb: ${ComplDat['rating']}",
                maxLines: 1,
                style: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              child: AutoSizeText("Runtime: ${ComplDat['runtime']}",
                maxLines: 1,
                style: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 2.0),
        child: AutoSizeText("Genre: ${ComplDat['genres']}",
          maxLines: 2,
          style: const TextStyle(color: Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 2.0),
        child: AutoSizeText("Cast: ${ComplDat['actors']}",
          maxLines: 4,
          style: const TextStyle(color: const Color.fromARGB(255, 188, 111, 241,),fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget MovieTile(String Url, String Name,double Width, double Height){
  return
    Padding(
      padding: const EdgeInsets.fromLTRB(7, 0,7 , 0),
      child: SizedBox(
        height: Height*0.28,
        width: Width*0.33,
        child: Stack(
        children: [
          Container(
            height: Height*0.28,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [BoxShadow(
                color: Color.fromARGB(255, 204, 0, 250),
                offset: Offset(
                  0.0,
                  0.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 3.0,
              ),],
              image: DecorationImage(image: NetworkImage(Url,), fit: BoxFit.cover,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Width*0.33,
              height: Height*0.09,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromARGB(120, 0, 0, 0),
                      Color.fromARGB(170, 0, 0, 0),
                      Color.fromARGB(230, 7, 7, 7),
                      Color.fromARGB(255, 12, 12, 12),
                      Color.fromARGB(255, 9, 9, 9),
                    ]
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),) ,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: Height*0.09,
                alignment: Alignment.center,
                child: AutoSizeText("$Name",
                  maxLines: 3,
                  maxFontSize: 15,
                  style:GoogleFonts.raleway(textStyle: const TextStyle(color: Color.fromARGB(255,188, 111, 241),fontWeight: FontWeight.bold),),),
              )),
        ],
      ),
      ),
    );
}

//Appbar
//AppBar(title:  Text('Movies$pa'),
//           backgroundColor: const Color.fromARGB(255,137, 44, 220),
//           foregroundColor: Colors.black,
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 showDialog<String>(
//                     context: context,
//                     builder: (BuildContext context) => AlertDialog(
//                       backgroundColor: const Color.fromARGB(210,188, 111, 241),
//                       title: const Text('Search'),
//                       content: TextField(
//                         onChanged: (value) {
//                           surc=value;
//                         },
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Type Here',
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: (){
//                             Navigator.of(context).pop();
//                             setState(() {
//                               getData(pa,"https://api.themoviedb.org/3/search/movie?api_key=6c459b95cc2fb143cce9ca7d2097b416&query=$surc");
//                             });
//                           },
//                           child: const Text('Search',style: TextStyle(color: Colors.black ),),
//                         ),
//                       ],
//                     )
//                 );
//               },
//             ),
//           ],
//         ),

