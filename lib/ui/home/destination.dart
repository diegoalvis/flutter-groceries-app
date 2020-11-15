import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Tienda', Icons.storefront_outlined, Colors.white),
  Destination('Buscar', Icons.search_outlined, Colors.white),
  Destination('Carrito', Icons.shopping_cart_outlined, Colors.white),
  Destination('Cuenta', Icons.account_circle_outlined, Colors.white)
];
