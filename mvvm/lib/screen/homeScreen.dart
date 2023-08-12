import 'package:flutter/material.dart';
import 'package:mvvm/api/api.dart';
import 'package:mvvm/model/movieModel.dart';
import 'package:mvvm/widgets/movieSlider.dart';
import 'package:mvvm/widgets/titleScreen.dart';
import 'package:mvvm/widgets/trendingMovie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> trendingMovie;
  late Future<List<MovieModel>> topRating;
  late Future<List<MovieModel>> upcoming;

  @override
  void initState() {
    trendingMovie = Api().getTrendingApi();
    topRating = Api().getTopRating();
    upcoming = Api().getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/main.png',
            width: 250,
          ),
          backgroundColor: Color.fromARGB(255, 53, 42, 42),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TItleText(title: 'Trending Movies'),
              SizedBox(height: 20),
              // trending movie data:
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovie,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return TrendingMovie(
                          snapshot: snapshot,
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
              ),
              SizedBox(height: 20),
              TItleText(title: 'Top Rated Movies'),
              SizedBox(height: 10),
              // movieSlider(),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovie,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return movieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
              ),
              SizedBox(height: 20),
              TItleText(title: 'Upcoming Movies'),
              SizedBox(height: 10),
              SizedBox(
                child: FutureBuilder(
                    future: upcoming,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return movieSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
              ),
            ],
          ),
        ));
  }
}
