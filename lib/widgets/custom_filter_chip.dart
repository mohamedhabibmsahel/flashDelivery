import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';

class CustomFilterChip extends StatefulWidget {
  final Widget label;
  final Widget content;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const CustomFilterChip({
    Key? key,
    required this.label,
    required this.content,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(!widget.selected);
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: widget.content,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: widget.selected ? appTheme.yellow700 : appTheme.yellow700,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.label,
              const SizedBox(width: 8.0),
              _buildArrowIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      width: 20.0, // Adjust the width as needed
      child: Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
    );
  }
}
