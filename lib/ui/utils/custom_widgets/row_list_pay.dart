import 'package:flutter/material.dart';

class RowListElement extends StatelessWidget {
  final String nameListItem;
  final Widget widgetListSelect;
  final bool iconVisible;

  const RowListElement({
    Key key,
    this.nameListItem,
    this.widgetListSelect,
    this.iconVisible: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          nameListItem,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Spacer(),
        widgetListSelect,
        SizedBox(width: 4),
        iconVisible ? Icon(Icons.arrow_forward_ios) : SizedBox(),
      ],
    );
  }
}
