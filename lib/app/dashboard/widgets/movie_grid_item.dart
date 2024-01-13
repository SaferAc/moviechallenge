import 'package:flutter/material.dart';

class MovieGridItem extends StatelessWidget {
  final int index;
  const MovieGridItem({super.key, required this.index});

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
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/2e853FDVSIso600RqAMunPxiZjq.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Snow Society of Neverland',
                    style: TextStyle(
                      color: Color(0xff272426),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  '8.0',
                  style: TextStyle(
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
