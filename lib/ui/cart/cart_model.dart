import 'dart:math';

import 'package:flutter/material.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';

class CartModel extends ChangeNotifier {
  final Map<VendorProduct, int> _items = {};
  Vendor _vendor;

  Map<VendorProduct, int> get items => _items..removeWhere((key, value) => value == 0);

  int get itemsPrice => _items.entries.map((e) => e.key.price * e.value).reduce((p1, p2) => p1 + p2);
  int get deliveryFee => _vendor?.deliveryFee?.toInt() ?? 0;
  int get total => itemsPrice + deliveryFee;

  void increase(VendorProduct item, {Vendor vendor}) {
    validateCurrentVendor(vendor);
    _items[item] = min((_items[item] ?? 0) + 1, 99);
    notifyListeners();
  }

  void decrease(VendorProduct item, {Vendor vendor}) {
    validateCurrentVendor(vendor);
    _items[item] = max((_items[item] ?? 0) - 1, 0);
    notifyListeners();
  }

  void validateCurrentVendor(Vendor vendor) {
    if (vendor != null && vendor.id != _vendor?.id) {
      _vendor = vendor;
      _items.clear();
    }
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
