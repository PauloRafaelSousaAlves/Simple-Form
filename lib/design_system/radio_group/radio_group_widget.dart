import 'package:flutter/material.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';
import 'package:simple_form/design_system/radio_group/item.dart';
import 'package:simple_form/design_system/radio_group/radio_group_bloc.dart';

class RadioGroupWidget extends StatefulWidget {
  const RadioGroupWidget(
      {Key? key,
      required this.title,
      required this.items,
      required this.onValueChanged})
      : super(key: key);

  final String title;
  final List<Item> items;
  final ValueChanged<Item> onValueChanged;

  @override
  State<RadioGroupWidget> createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupWidget> {
  final _bloc = RadioGroupBloc();
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Item>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        final item = snapshot.data;
        return Column(
          children: items(
            context,
            item,
          ),
        );
      },
    );
  }

  List<Widget> items(BuildContext context, Item? selectedItem) {
    List<Widget> items = [];
    items.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: DSColors.red60,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
    for (int i = 0; i < widget.items.length; i++) {
      items.add(RadioListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        value: widget.items[i],
        groupValue: selectedItem,
        title: Text(
          widget.items[i].description,
          style: const TextStyle(
            fontSize: 15,
            color: DSColors.black60,
          ),
        ),
        onChanged: (value) {
          onValueChanged(value as Item);
        },
        activeColor: DSColors.black,
        selected: false,
      ));
    }

    return items;
  }

  void onValueChanged(Item value) {
    _bloc.onValueChanged(value);
    widget.onValueChanged(value);
  }
}
