import "package:bean_app_0/components/cupData.dart";
import "package:bean_app_0/components/my_slider.dart";
import "package:bean_app_0/pages/home_page.dart";
import "package:flutter/material.dart";
import "../components/cup.dart";
import "../components/login_button_A.dart";

class EditCupPage extends StatefulWidget {
  final CupData cup;
  const EditCupPage({
    super.key,
    required this.cup,
  });
  @override
  State<EditCupPage> createState() => _EditCupState();
}

class _EditCupState extends State<EditCupPage> {
  double sliderVal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ));
          }),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Cup(
                data: widget.cup,
                size: 2,
              ),
              Visibility(
                visible: widget.cup.description != null,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.cup.description != null
                        ? widget.cup.description!
                        : '',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              LoginButtonA(
                text: "Add to Cart",
                onTap: () {},
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Size",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Espresso",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Milk Foam",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Steamed Milk",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Hot Water",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 1",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 2",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 3",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 4",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 5",
              ),
              MySlider(
                min: 0,
                max: 100,
                divisions: 100,
                title: "Syrup 6",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
