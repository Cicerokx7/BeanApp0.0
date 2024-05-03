import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IngredientSlider extends StatefulWidget {
  final String title;
  final String units;
  final double min;
  final double max;
  final double divisions;
  final double startVal;
  bool update;
  Function(double)? onChanged;
  // final double limit;

  IngredientSlider({
    Key? key,
    required this.title,
    required this.units,
    required this.min,
    required this.max,
    required this.startVal,
    required this.update,
    required this.divisions,
    required this.onChanged,
    // required this.limit,
  }) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<IngredientSlider> {
  late TextEditingController textController;
  late double sliderVal;

  @override
  void initState() {
    super.initState();
    setState(() {
      sliderVal = widget.startVal;
    });
    textController = TextEditingController(text: sliderVal.toString());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.update) {
      widget.update = false;
      sliderVal = widget.startVal;
      textController = TextEditingController(text: sliderVal.toString());
    }
    Color sliderFill = Color.fromRGBO(184, 148, 7, 1);
    Color sliderEmpty = Colors.grey;
    if (sliderVal == 0) {
      sliderFill = Color.fromRGBO(112, 91, 5, 1);
      sliderEmpty = Colors.grey[800]!;
    }
    int divisions = (widget.divisions * 100).toInt();
    if (divisions == 0) {
      divisions = 1;
    }
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
                flex: 9,
                child: Slider(
                  activeColor: sliderFill,
                  inactiveColor: sliderEmpty,
                  thumbColor: sliderFill,
                  value: sliderVal * 100,
                  min: widget.min * 100,
                  max: widget.max * 100,
                  divisions: divisions,
                  onChanged: (value) {
                    if (value < widget.max * 100) {
                      widget.onChanged!((value.roundToDouble()) / 100);
                      setState(() {
                        sliderVal = (value.roundToDouble()) / 100;
                        textController =
                            TextEditingController(text: sliderVal.toString());
                      });
                    } else {
                      widget.onChanged!(widget.max);
                      setState(() {
                        sliderVal = widget.max;
                        textController =
                            TextEditingController(text: sliderVal.toString());
                      });
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  cursorColor: Colors.white,
                  controller: textController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      double temp = double.tryParse(value) ?? widget.startVal;
                      if (temp > widget.max) {
                        sliderVal = widget.max;
                        widget.onChanged!(sliderVal);
                        textController =
                            TextEditingController(text: sliderVal.toString());
                      } else if (temp < widget.min) {
                        sliderVal = widget.min;
                        widget.onChanged!(sliderVal);
                        textController =
                            TextEditingController(text: sliderVal.toString());
                      } else {
                        sliderVal = temp;
                        widget.onChanged!(sliderVal);
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: Text(
                  widget.units,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
