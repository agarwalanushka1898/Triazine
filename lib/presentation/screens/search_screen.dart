import 'package:flutter/material.dart';
import 'package:triazine/constants.dart';
import 'package:triazine/data/models/search_section_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getTopBar(),
            ListView.builder(
                itemCount: searchSectionList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  SearchSectionLabel item = searchSectionList[index];
                  return ListTile(
                    leading: Icon(
                      item.iconData,
                      color: item.color,
                    ),
                    title: Text(item.label),
                  );
                })
          ],
        ),
      ),
    );
  }

  _getTopBar() => Container(
        height: 100,
        padding: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        color: themeColor,
        child: const TextField(
          autofocus: true,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.close,
                color: Colors.white,
              )),
        ),
      );
}
