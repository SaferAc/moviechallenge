import 'package:flutter/material.dart';
import 'package:moviechallenge/app/models/movie_model.dart';

class MovieListItem extends StatelessWidget {
  final int index;
  final MovieModel movieModel;
  const MovieListItem({
    super.key,
    required this.index,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    movieModel.title ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff272426),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  movieModel.voteAverage?.toStringAsFixed(1) ??
                                      '0,0',
                                  style: const TextStyle(
                                    color: Color(0xffd7aa3e),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  movieModel.overview ?? '',
                                  style: const TextStyle(
                                    color: Color(0xffbac6c3),
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Hero(
            tag: index,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original/${movieModel.posterPath}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ],
      ),
    );
  }
}
