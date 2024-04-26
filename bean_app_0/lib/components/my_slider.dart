import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  final String title;
  final double min;
  final double max;
  final int? divisions;

  MySlider({
    Key? key,
    required this.title,
    required this.min,
    required this.max,
    this.divisions,
  }) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double sliderVal = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Row(
            children: [
              Expanded(
                child: Slider(
                  activeColor: const Color.fromRGBO(184, 148, 7, 1),
                  inactiveColor: Colors.grey,
                  thumbColor: const Color.fromRGBO(184, 148, 7, 1),
                  value: sliderVal,
                  min: widget.min,
                  max: widget.max,
                  divisions: widget.divisions,
                  // label: '$sliderVal',
                  onChanged: (value) {
                    setState(() {
                      sliderVal = value.roundToDouble();
                    });
                  },
                ),
              ),
              Text(
                sliderVal.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
