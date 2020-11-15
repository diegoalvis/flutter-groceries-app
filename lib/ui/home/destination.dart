import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.route, this.icon, this.color);

  final String title;
  final String route;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Tienda', '/vendor_list', Icons.storefront_outlined, Colors.white),
  Destination('Buscar', '/search', Icons.search_outlined, Colors.white),
  Destination('Carrito', '/my_cart', Icons.shopping_cart_outlined, Colors.white),
  Destination('Cuenta', '/account', Icons.account_circle_outlined, Colors.white)
];
