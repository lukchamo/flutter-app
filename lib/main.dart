import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/movieModel.dart';

const baseUrl = 'https://api.themoviedb.org/3/movie/';
const baseImageUrl = 'https://image.tmdb.org/t/p/';
const apiKey = 'e5e5f15cca92449ebb7220adadc945d3';

const nowPlayingUrl = "${baseUrl}now_playing?api_key=${apiKey}";


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData.light(),
      home: MyRestaurantApp(),
    ));

class MyRestaurantApp extends StatefulWidget {
  _MyRestaurantAppState createState() => _MyRestaurantAppState();
}

class _MyRestaurantAppState extends State<MyRestaurantApp> {


  Movie nowPlayingMovies;
  
 
  void initState(){
    super.initState();
    _fetchNowPlayingMovies();    
  }


  void _fetchNowPlayingMovies() async{
    var response = await http.get(nowPlayingUrl);
    print(response);
    var decodeJson = jsonDecode(response.body);
    print(decodeJson);
    //nowPlayingMovies = Movie.fromJson(decodeJson);
    setState(() {
     nowPlayingMovies = Movie.fromJson(decodeJson);
     print(nowPlayingMovies.results);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Mi Restaurante'),
        centerTitle: true,
        leading: IconButton(
          icon:Icon(Icons.menu),
          onPressed: (){
            print('BtnMenu');
            print(nowPlayingMovies);
            print(nowPlayingUrl);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){ print('BtnSearch'); },)
        ],
      ),
    );
  }
}

