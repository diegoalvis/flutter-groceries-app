import 'dart:math';

import 'package:flutter/material.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

class CartModel extends ChangeNotifier {
  final Map<VendorProduct, int> _items = {};
  Vendor _vendor;

  Map<VendorProduct, int> get items => _items..removeWhere((key, value) => value == 0);

  double get itemsPrice => _items.entries.map((e) => e.key.price * e.value).reduce((p1, p2) => p1 + p2);

  double get deliveryFee => _vendor?.deliveryFee ?? 0.0;

  double get orderTotal => itemsPrice + deliveryFee;

  Vendor get vendor => _vendor;

  void increase(VendorProduct item, {Vendor vendor}) {
    validateCurrentVendor(vendor);
    _items[item] = min((_items[item] ?? 0) + 1, 99);
    notifyListeners();
  }

  void decrease(VendorProduct item, {Vendor vendor}) {
    validateCurrentVendor(vendor);
    _items[item] = max((_items[item] ?? 0) - 1, 0);
    if (_items[item] == 0) {
      _items.remove(item);
    }
    notifyListeners();
  }

  void validateCurrentVendor(Vendor vendor) {
    if (vendor != null && vendor.id != _vendor?.id) {
      _vendor = vendor;
      _items.clear();
    }
  }

  void removeItem(VendorProduct item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
