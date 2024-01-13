import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final int index;
  const MovieListItem({
    super.key,
    required this.index,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Snow Society of Neverland',
                                    style: TextStyle(
                                      color: Color(0xff272426),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  '8.0',
                                  style: TextStyle(
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
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'Director:',
                                      style: TextStyle(
                                        color: Color(0xffbac6c3),
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Jon Doe',
                                      style: TextStyle(
                                        color: Color(0xffbac6c3),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'Starring:',
                                      style: TextStyle(
                                        color: Color(0xffbac6c3),
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Jon Doe',
                                      style: TextStyle(
                                        color: Color(0xffbac6c3),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
                  color: Colors.blue,
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/2e853FDVSIso600RqAMunPxiZjq.jpg'),
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
