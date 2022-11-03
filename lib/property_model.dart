import 'package:flutter/cupertino.dart';

@immutable
class Property {
  final String title;
  final String location;
  final String currencyType;
  final double price;
  final bool isCarted;

  const Property({
    required this.title,
    required this.location,
    required this.currencyType,
    required this.price,
    this.isCarted = false,
  });

  Property copyWith(
      {String? title,
      String? location,
      String? currencyType,
      double? price,
      bool? isCarted}) {
    return Property(
      title: title ?? this.title,
      location: location ?? this.location,
      currencyType: currencyType ?? this.currencyType,
      price: price ?? this.price,
    );
  }

  String get getTitle => title;
  String get getLocation => location;
  String get getCurrencyType => currencyType;
  double get getPrice => price;
  bool get getIsCarted => isCarted;

  @override
  String toString() {
    return """
{
  title : $title,
  location : $location,
  currency type : $currencyType,
  price : $price,
  isCarted : $isCarted,
}""";
  }
}
