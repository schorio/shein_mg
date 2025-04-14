import 'package:flutter/material.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 25,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_border_rounded,
            color: Colors.black,
            size: 27,
          ),
        ),
      ],
    );
  }
}
