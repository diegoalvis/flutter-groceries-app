import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/Vendor.dart';
import 'package:winkels_customer/data/models/base_product.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/search/search_page.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/item_card.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/store_vendor.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/product_widget.dart';
import 'package:winkels_customer/ui/vendor/vendor_list_cubit.dart';

class VendorListPage extends StatefulWidget {
  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  VendorListPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

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
      appBar: AppBar(
          title: GestureDetector(
        onTap: () => widget.onChangeCurrentPage('/search'),
        child: SearchTextField(enabled: false, hintText: "Buscar"),
      )),
      body: RefreshIndicator(
        onRefresh: _cubit.getVendorList,
        child: BlocBuilder<VendorListCubit, BaseState>(
            cubit: _cubit, // provide the local bloc instance
            builder: (context, state) {
              if (state.type == StateType.initial) {
                _cubit.getVendorList();
              }
              if (state.type == StateType.success) {
                final data = state.data as List<Vendor>;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return VendorCard(vendor: data[index]);
                  },
                );
              }

              if (state.type == StateType.loading) {
                return Center(child: CircularProgressIndicator());
              }

              return Center(child: CupertinoButton(onPressed: _cubit.getVendorList, child: Text("Cargar comercios")));
            }),
      ),
    );
  }
}
