import 'package:flutter/material.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';

class CategoryCard extends StatelessWidget {
  final VendorCategory category;

  final Color backgroundColor;

  const CategoryCard({Key key, @required this.category, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purpleAccent),
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            category?.image?.url == null ? SizedBox() : Image.network(ApiClient.BASE_URL + category.image.url),
            Text(category.descriptionCategory),
          ],
        ),
      ),
    );
  }
}
