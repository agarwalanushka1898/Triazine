import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../lists.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return buildBackground(shrinkOffset);
  }

  Widget buildBackground(double shrinkOffset) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (shrinkOffset < 2)
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: menuItemList
                          .map((e) => Column(
                                children: [
                                  Icon(e.iconData, color: e.color),
                                  const SizedBox(height: 10),
                                  Text(
                                    e.label,
                                    style: const TextStyle(color: themeColor),
                                  )
                                ],
                              ))
                          .toList()),
                  const SizedBox(height: 30),
                ],
              ),
            Row(
              children: [
                const Text(
                  "Expand:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.remove_red_eye,
                  color: themeColor,
                ),
                Expanded(child: Container()),
                const Text(
                  "\$ 40000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            )
          ],
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
