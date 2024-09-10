import 'package:flutter/material.dart';
import 'package:Portfolio/pages/squareo_page.dart';
import 'package:Portfolio/utils/custom_icons_icons.dart';
import 'package:Portfolio/utils/movement.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Movement movement = Movement();
  Color buttonsBg = Colors.brown.shade900.withOpacity(0.5);

  TextStyle getTextStyle({Color color = Colors.white, double fontSize = 25}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Abel',
    );
  }

  Icon getIconStyle(IconData icon,
      {Color color = Colors.white, double size = 25}) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }

  ButtonStyle getButtonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(buttonsBg),
      overlayColor: WidgetStatePropertyAll(Colors.brown.withOpacity(0.7)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) =>
          movement.scrollDown(event, context, const SquareoPage()),
      onPointerMove: (event) =>
          movement.swipeDown(event, context, const SquareoPage()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/home_bg.png',
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 6, top: 100),
            child: Wrap(
              children: [
                TextButton.icon(
                  onPressed: () =>
                      movement.goDown(context, const SquareoPage()),
                  label: Text(
                    'My Work',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(CustomIcons.blueprint, size: 20),
                  style: getButtonStyle(),
                ),
                const SizedBox(width: 20, height: 70),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Resume',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(CustomIcons.cv, size: 20),
                  style: getButtonStyle(),
                ),
                const SizedBox(width: 20, height: 70),
                TextButton.icon(
                  onPressed: () => movement.showConatctDialog(
                      context,
                      const Color(0xFFEDDCD2),
                      Colors.black,
                      const Color.fromARGB(255, 231, 205, 190)),
                  label: Text(
                    'Contact Me',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(Icons.person_rounded),
                  style: getButtonStyle(),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: IconButton(
          onPressed: () {
            movement.goUp(context, const SquareoPage());
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 30,
          ),
        ),
        extendBody: true,
        floatingActionButton: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: buttonsBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Yahya Amarneh',
            style: getTextStyle(),
          ),
        ),
      ),
    );
  }
}
