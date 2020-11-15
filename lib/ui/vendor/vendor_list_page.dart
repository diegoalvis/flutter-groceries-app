import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/card_store.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/product_widget.dart';
import 'package:winkels_customer/ui/vendor/vendor_list_cubit.dart';

class VendorListPage extends StatefulWidget {
  final Destination destination;

  VendorListPage({Key key, this.destination}) : super(key: key);

  @override
  _VendorListPageState createState() => _VendorListPageState();
}

class _VendorListPageState extends State<VendorListPage> {
  final _cubit = VendorListCubit(GetIt.I.get<Repository>());

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<VendorListCubit, BaseState>(
          cubit: _cubit, // provide the local bloc instance
          builder: (context, state) {
            if (state.type == StateType.initial) {
              _cubit.getVendorList();
            }
            if (state.type == StateType.success) {
              final data = state.data as List<Vendor>;
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return StoreCard(vendor: data[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            }

            if (state.type == StateType.loading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Text("Obtener productos"),
              );
            }
          }),
    );
  }
}
