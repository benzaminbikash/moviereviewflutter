import 'package:flutter/material.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/screen/detailScreen.dart';

class movieSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const movieSlider({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 150,
                  height: 300,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(movie: snapshot.data[index]);
                      }));
                    },
                    child: Image.network(
                      '${Constants.image_path}${snapshot.data[index].poster_path}',
                      width: 150,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
