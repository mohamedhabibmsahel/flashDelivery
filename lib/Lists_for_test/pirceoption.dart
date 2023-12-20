import 'package:flash_delivery_app/widgets/custom_grey_line.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class CustomSliderBottomSheet extends StatefulWidget {
  String title;
  double initialValue;
  List<double> divisions;
  String button1Label;
  String button2Label;

  CustomSliderBottomSheet({
    required this.title,
    required this.initialValue,
    required this.divisions,
    required this.button1Label,
    required this.button2Label,
  });

  @override
  _CustomSliderBottomSheet createState() => _CustomSliderBottomSheet();
}

class _CustomSliderBottomSheet extends State<CustomSliderBottomSheet> {
  late double selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const GreyLine(),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.divisions.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value;

            String labelText = (index == widget.divisions.length - 1)
                ? '${value.toInt()}+Dt'
                : '${value.toInt()} Dt';

            return Text(labelText);
          }).toList(),
        ),
        const SizedBox(height: 16.0),
        Slider(
          value: selectedValue,
          min: widget.divisions.first,
          max: widget.divisions.last,
          divisions: widget.divisions.length - 1,
          thumbColor: Colors.white,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
        const SizedBox(height: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              title: widget.button1Label,
              onPressed: () {
                double roundedValue = selectedValue.roundToDouble();
                print(roundedValue);
                // Your action here
                print("Button pressed!");
              },
            ),
            const SizedBox(height: 16.0),

            CustomButton(
              backgroundColor: Colors.white,
              titleColor: Colors.black,
              title: widget.button2Label,
              onPressed: () {
                // Your action here
                print("Second button pressed :");
                widget.initialValue = selectedValue;
              },
            ),
          ],
        ),
      ],
    );
  }
}
