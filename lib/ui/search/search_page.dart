import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/VendorCategory.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/home/destination.dart';
import 'package:winkels_customer/ui/search/search_cubit.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/category_item.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';

class SearchPage extends StatelessWidget {
  final Destination destination;
  final Function(String route) onChangeCurrentPage;

  SearchPage({Key key, this.destination, this.onChangeCurrentPage}) : super(key: key);

  final _cubit = SearchCubit(GetIt.I.get<Repository>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchTextField(hintText: "Buscar")),
      body: RefreshIndicator(
        onRefresh: _cubit.getCategoryList,
        child: BlocBuilder<SearchCubit, BaseState>(
            cubit: _cubit, // provide the local bloc instance
            builder: (context, state) {
              if (state.type == StateType.initial) {
                _cubit.getCategoryList();
              }
              if (state.type == StateType.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.type == StateType.success) {
                final data = state.data as List<VendorCategory>;
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CategoryCard(category: data[index]);
                  },
                );
              }

              return Center(child: CupertinoButton(onPressed: _cubit.getCategoryList, child: Text("Cargar categorias")));
            }),
      ),
    );
  }
}
