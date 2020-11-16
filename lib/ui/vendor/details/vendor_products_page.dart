import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/VendorProduct.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_card.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/primary_button.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/store_vendor.dart';
import 'package:winkels_customer/ui/vendor/details/vendor_products_cubit.dart';

class VendorProductsPage extends StatefulWidget {
  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  VendorProductsPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  @override
  _VendorProductsPageState createState() => _VendorProductsPageState();
}

class _VendorProductsPageState extends State<VendorProductsPage> {
  final _cubit = VendorProductsCubit(GetIt.I.get<Repository>());

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Vendor vendor = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: VendorCard(vendor: vendor),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _cubit.getProducts(vendor.id),
              child: BlocBuilder<VendorProductsCubit, BaseState>(
                  cubit: _cubit, // provide the local bloc instance
                  builder: (context, state) {
                    if (state.type == StateType.initial) {
                      _cubit.getProducts(vendor.id);
                    }

                    if (state.type == StateType.loading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state.type == StateType.success) {
                      final data = state.data as List<VendorProduct>;
                      return GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ItemCard(product: data[index]);
                        },
                      );
                    }

                    return Center(
                      child: CupertinoButton(
                        onPressed: () => _cubit.getProducts(vendor.id),
                        child: Text("Cargar productos"),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: PrimaryButton(
              buttonText: "Continuar",
              buttonColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/my_cart');
              },
            ),
          ),
        ],
      ),
    );
  }
}
