import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:winkels_customer/core/cubit/base_state.dart';
import 'package:winkels_customer/data/models/Order.dart';
import 'package:winkels_customer/data/repository/Repository.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/order_item_card.dart';

import 'order_history_cubit.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final _cubit = OrderHistoryCubit(GetIt.I.get<Repository>());

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _cubit.getOrders,
        child: BlocBuilder<OrderHistoryCubit, BaseState>(
            cubit: _cubit,
            builder: (context, state) {
              if (state.type == StateType.initial) {
                _cubit.getOrders();
              }

              if (state.type == StateType.loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.type == StateType.success) {
                final data = state.data as List<Order>;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return OrderItemCard(order: data[index]);
                  },
                );
              }

              return Center(child: CupertinoButton(onPressed: _cubit.getOrders, child: Text("Cargar ordenes")));
            }),
      ),
    );
  }
}
