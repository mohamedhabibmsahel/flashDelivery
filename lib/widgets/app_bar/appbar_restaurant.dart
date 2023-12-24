import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_image_view.dart';

class Appbar_restaurant extends StatelessWidget {
  const Appbar_restaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: CustomImageView(
          imagePath: "assets/images/Header-image.png",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset("assets/icons/back.svg"),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/icons/share.svg",
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
