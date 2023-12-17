import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomRadioBottomSheet extends StatefulWidget {
   String title;
   List<String> options;
   String initialSelectedOption;
   String button1Label;
   String button2Label;

  CustomRadioBottomSheet({
    required this.title,
    required this.options,
    required this.initialSelectedOption,
    required this.button1Label,
    required this.button2Label,
  });

  @override
  _CustomRadioBottomSheet createState() => _CustomRadioBottomSheet();
}

class _CustomRadioBottomSheet extends State<CustomRadioBottomSheet> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Column(
            children: widget.options.map((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString() ;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                title: widget.button1Label ,
                onPressed: () {
                  print(selectedOption);
                  // Your action here
                  print("Button pressed!");
                },
              ),
              CustomButton(
                backgroundColor: Colors.white,
                titleColor: Colors.black,
                title: widget.button2Label,
                onPressed: () {
                  // Your action here
                  print("second button pressed :");
                  widget.initialSelectedOption = selectedOption ;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}