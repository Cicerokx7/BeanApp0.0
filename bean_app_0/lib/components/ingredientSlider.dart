import 'package:flutter/material.dart';

class IngredientSlider extends StatefulWidget {
  final String title;
  final double min;
  final double max;
  final double divisions;
  final double startVal;
  double sliderVal;
  bool update;

  IngredientSlider({
    Key? key,
    required this.title,
    required this.min,
    required this.max,
    required this.startVal,
    required this.sliderVal,
    required this.update,
    required this.divisions,
  }) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<IngredientSlider> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    widget.sliderVal = widget.startVal;
    textController = TextEditingController(text: widget.sliderVal.toString());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.update) {
      widget.update = false;
      textController = TextEditingController(text: widget.sliderVal.toString());
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
                  activeColor: const Color.fromRGBO(184, 148, 7, 1),
                  inactiveColor: Colors.grey,
                  thumbColor: const Color.fromRGBO(184, 148, 7, 1),
                  value: widget.sliderVal * 100,
                  min: widget.min * 100,
                  max: widget.max * 100,
                  divisions: (widget.divisions * 100).toInt(),
                  // label: '$sliderVal',
                  onChanged: (value) {
                    setState(() {
                      widget.sliderVal = (value.roundToDouble()) / 100;
                      textController = TextEditingController(
                          text: widget.sliderVal.toString());
                    });
                  },
                ),
              ),
              // Text(
              //   sliderVal.toString(),
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 16,
              //   ),
              // )
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
                        widget.sliderVal = widget.max;
                        textController = TextEditingController(
                            text: widget.sliderVal.toString());
                      } else if (temp < widget.min) {
                        widget.sliderVal = widget.min;
                        textController = TextEditingController(
                            text: widget.sliderVal.toString());
                      } else {
                        widget.sliderVal = temp;
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
