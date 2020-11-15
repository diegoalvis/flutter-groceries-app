import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/product_widget.dart';
import 'package:winkels_customer/ui/vendor/product_list_cubit.dart';

class VendorListPage extends StatelessWidget {
  final Destination destination;

  final cubit = ProductListCubit(GetIt.I.get<Repository>());

  VendorListPage({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<ProductListCubit, BaseState>(
          cubit: cubit, // provide the local bloc instance
          builder: (context, state) {
            if (state.type == StateType.success) {
              final productList = state.data as List<BaseProduct>;
              return ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductWidget(product: productList[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            }

            if (state.type == StateType.loading) {
              return Center(child: CircularProgressIndicator());
            }

            return Center(
              child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                    // cubit.getProductList();
                  },
                  child: Text("Obtener productos")),
            );
          }),
    );
  }
}
