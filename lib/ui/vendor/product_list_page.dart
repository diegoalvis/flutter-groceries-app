import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winkels_customer/data/api/api_client.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/repository/vendor_repository.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/product_widget.dart';
import 'package:winkels_customer/ui/vendor/product_list_cubit.dart';

class ProductListPage extends StatelessWidget {
  final cubit = ProductListCubit(VendorRepository(ApiClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<ProductListCubit, ProductListState>(
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
                    cubit.getProductList();
                  },
                  child: Text("Obtener productos")),
            );
          }),
    );
  }
}
