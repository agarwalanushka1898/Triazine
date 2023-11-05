import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:triazine/data/models/search_section_model.dart';
import 'package:triazine/lists.dart';
import 'package:triazine/presentation/screens/search_screen.dart';

import '../../../constants.dart';
import '../../widgets/delegates/custom_sliver_delegate.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ScrollController _scrollController = ScrollController();
  bool isExpanded = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      ScrollDirection direction =
          _scrollController.position.userScrollDirection;
      int pixel = _scrollController.position.pixels.ceil();
      int offset = _scrollController.offset.ceil();

      if (pixel > 60 &&
          direction == ScrollDirection.reverse &&
          direction == ScrollDirection.reverse &&
          isExpanded == true) {
        log("test: shrink");
        isExpanded = false;
      } else if (pixel < 60 &&
          direction == ScrollDirection.reverse &&
          direction == ScrollDirection.reverse &&
          isExpanded == false) {
        log("test: expand");
        isExpanded = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bottom Layer
          Container(
            color: themeColor,
            height: 140,
          ),

          // Top layer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SearchScreen()));
                          },
                          child: const TextField(
                            cursorColor: Colors.grey,
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        const SliverPersistentHeader(
                            delegate:
                                CustomSliverAppBarDelegate(expandedHeight: 150),
                            pinned: true),
                        SliverToBoxAdapter(
                          child: GridView.builder(
                              itemCount: searchSectionList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index) {
                                SearchSectionLabel item =
                                    searchSectionList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(color: Colors.black),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        item.iconData,
                                        color: item.color,
                                        size: 40,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        item.label,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),

                        // Carousel Slider
                        SliverToBoxAdapter(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 100.0,
                              disableCenter: false,
                              pageSnapping: false,
                              viewportFraction: 0.8,
                              padEnds: false,
                              enableInfiniteScroll: false,
                            ),
                            items: [
                              "assets/slider1.png",
                              "assets/slider2.png",
                            ].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Image.asset(i);
                                },
                              );
                            }).toList(),
                          ),
                        )),

                        SliverToBoxAdapter(
                          child: GridView.builder(
                              itemCount: bottomHomeList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index) {
                                SearchSectionLabel item = bottomHomeList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(color: Colors.black),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        item.iconData,
                                        color: item.color,
                                        size: 40,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        item.label,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 30),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeTab extends StatefulWidget {
//   const HomeTab({super.key});

//   @override
//   _HomeTabState createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> {
//   final ScrollController _scrollController = ScrollController();
//   double _containerHeight = 100;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200,
//             collapsedHeight: 100,
//             pinned: true,
//             stretch: true,
//             flexibleSpace: AnimatedContainer(
//               height: _containerHeight,
//               duration: const Duration(milliseconds: 200),
//               child: Container(
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return ListTile(
//                   title: Text('Item ${index + 1}'),
//                 );
//               },
//               childCount: 100,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();

//     _scrollController.addListener(() {
//       if (_scrollController.offset > 0) {
//         setState(() {
//           _containerHeight = 50;
//         });
//       } else {
//         setState(() {
//           _containerHeight = 100;
//         });
//       }
//     });
//   }
// }
