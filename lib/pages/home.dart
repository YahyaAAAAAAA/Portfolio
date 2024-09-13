import 'package:Portfolio/utils/movement.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/pages/squareo_page.dart';
import 'package:Portfolio/utils/custom_icons_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Movement movement = Movement();
  Color buttonsBg = Colors.brown.shade900.withOpacity(0.5);
  String img = 'assets/images/home_bg.png';

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
      overlayColor: WidgetStatePropertyAll(Colors.brown.withOpacity(0.7)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                img,
              ),
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 400),
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  const Color(0xFF826656).withOpacity(0.7),
                  const Color(0xFF826656).withOpacity(0.7),
                ])),
            child: Wrap(
              alignment: WrapAlignment.center,
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
                // const SizedBox(width: 20, height: 70),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Resume',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(CustomIcons.cv, size: 20),
                  style: getButtonStyle(),
                ),
                // const SizedBox(width: 20, height: 70),
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
                // const SizedBox(width: 20, height: 70),
                TextButton.icon(
                  onPressed: () => movement.showAboutMeDialog(
                      context, getTextStyle(), buttonsBg.withOpacity(1)),
                  label: Text(
                    'About Me',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(Icons.border_color_rounded),
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
      ),
    );
  }
}
