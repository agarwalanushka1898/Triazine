import 'package:flutter/material.dart';
import 'package:triazine/data/models/intro_item_model.dart';
import 'package:triazine/data/models/search_section_model.dart';

const Color themeColor = Color(0xff272643);

List<SearchSectionLabel> searchSectionList = [
  SearchSectionLabel(
      iconData: Icons.sync_alt, label: "Transfer", color: themeColor),
  SearchSectionLabel(
      iconData: Icons.attach_money,
      label: "Request money transfer",
      color: Colors.black),
  SearchSectionLabel(
      iconData: Icons.card_giftcard, label: "Give gifts", color: Colors.orange),
  SearchSectionLabel(
      iconData: Icons.fastfood_outlined,
      label: "Order food online",
      color: Colors.yellow),
  SearchSectionLabel(
      iconData: Icons.receipt_outlined, label: "Pay bills", color: Colors.blue),
  SearchSectionLabel(
      iconData: Icons.confirmation_num_outlined,
      label: "Buy movie tickets",
      color: Colors.redAccent),
];

List<String> introImageList = [
  "assets/deposit.png",
  "assets/quick_transfer.png",
  "assets/safe.png",
];

List<IntroItemModel> introItemList = [
  IntroItemModel(
      imagePath: "assets/quick_transfer.png",
      bodyText: "Lorem ipsum text for intro prt sadihke",
      label: "Easy deposit"),
  IntroItemModel(
      imagePath: "assets/deposit.png",
      bodyText: "Lorem ipsum text for intro prt sadihke",
      label: "Definitely safe"),
  IntroItemModel(
      imagePath: "assets/safe.png",
      bodyText: "Lorem ipsum text for intro prt sadihke",
      label: "Quick transfer"),
];
