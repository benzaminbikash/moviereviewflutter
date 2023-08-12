import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/api/api.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/model/movieModel.dart';
import 'package:mvvm/screen/detailScreen.dart';

class TrendingMovie extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TrendingMovie({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 200,
                  height: 300,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(movie: snapshot.data[itemIndex]);
                      }));
                    },
                    child: Image.network(
                        '${Constants.image_path}${snapshot.data[itemIndex].poster_path}'),
                  ),
                ),
              ),
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              pageSnapping: true)),
    );
  }
}
