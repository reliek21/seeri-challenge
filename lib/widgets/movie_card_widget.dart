import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

class MovieCardWidget extends StatelessWidget {
  final bool? disabled;

  const MovieCardWidget({
    this.disabled,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 146.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                width: 146.0,
                height: 180.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6.0
                ),
                child: Icon(
                  // Todo: interactive button
                  (disabled == null) ? Icons.favorite_border : Icons.favorite,
                  color: (disabled == null) ? SeeriColors.white : SeeriColors.red,
                  size: 22.0,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 9.0, bottom: 5.0),
            child: const Text(
              'Knock at the Cabin',
              style: TextStyle(
                color: SeeriColors.white,
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Todo: use a package to this
              Row(
                children: const [
                  Icon(
                    Icons.star_rate_sharp,
                    color: SeeriColors.yellow,
                    size: 15.0,
                  ),
                  SizedBox(width: 5.21),
                  Icon(
                    Icons.star_rate_sharp,
                    color: SeeriColors.yellow,
                    size: 15.0,
                  ),
                  SizedBox(width: 5.21),
                  Icon(
                    Icons.star_rate_sharp,
                    color: SeeriColors.yellow,
                    size: 15.0,
                  ),
                  SizedBox(width: 5.21),
                  Icon(
                    Icons.star_rate_sharp,
                    color: SeeriColors.yellow,
                    size: 15.0,
                  ),
                  SizedBox(width: 5.21),
                  Icon(
                    Icons.star_rate_sharp,
                    color: SeeriColors.grey,
                    size: 15.0,
                  ),
                ],
              ),
              const Text(
                '6.5',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: SeeriColors.yellow
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}