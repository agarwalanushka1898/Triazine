import 'package:flutter/material.dart';
import 'package:triazine/data/models/search_section_model.dart';
import 'package:triazine/lists.dart';

import '../../../constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: themeColor,
            height: 140,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            child: Column(
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
                Row(
                  children: [
                    const Text(
                      "Balance in the wallet",
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          GridView.builder(
              itemCount: searchSectionList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                SearchSectionLabel item = searchSectionList[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
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
              })
        ],
      ),
    );
  }
}
