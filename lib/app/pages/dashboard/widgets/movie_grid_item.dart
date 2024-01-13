import 'package:flutter/material.dart';
import 'package:moviechallenge/app/models/movie_model.dart';

class MovieGridItem extends StatelessWidget {
  final int index;
  final MovieModel movieModel;
  const MovieGridItem({
    super.key,
    required this.index,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Hero(
            tag: index,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/${movieModel.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movieModel.title ?? '',
                    style: const TextStyle(
                      color: Color(0xff272426),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  movieModel.voteAverage?.toStringAsFixed(1) ?? '0',
                  style: const TextStyle(
                    color: Color(0xffd7aa3e),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
