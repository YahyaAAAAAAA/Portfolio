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
  Color buttonsBg = Colors.grey.withOpacity(0.5);
  Color bgColor = Colors.grey.shade300;
  Color titleColor = Colors.grey.shade700;

  TextStyle getTextStyle({Color color = Colors.black, double fontSize = 20}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      fontFamily: 'Abel',
    );
  }

  Icon getIconStyle(IconData icon,
      {Color color = Colors.black, double size = 17}) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }

  ButtonStyle getButtonStyle() {
    return ButtonStyle(
      overlayColor: WidgetStatePropertyAll(buttonsBg),
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
        appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                thickness: 0.3,
                color: titleColor,
                endIndent: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 1.2),
                indent: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 1.2),
              )),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Wrap(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Resume',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(CustomIcons.cv),
                  style: getButtonStyle(),
                ),
                // const SizedBox(width: 20, height: 70),
                TextButton.icon(
                  onPressed: () => movement.showConatctDialog(
                      context, bgColor, Colors.black, bgColor),
                  label: Text(
                    'Contact Me',
                    style: getTextStyle(),
                  ),
                  icon: getIconStyle(Icons.person_rounded),
                  style: getButtonStyle(),
                ),

                TextButton.icon(
                  onPressed: () => movement.showAboutMeDialog(
                    context,
                    getTextStyle(color: Colors.white),
                    buttonsBg.withOpacity(1),
                  ),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: bgColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: TextButton(
                  onPressed: () =>
                      movement.goDown(context, const SquareoPage()),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    splashFactory: InkSparkle.splashFactory,
                  ),
                  child: Text(
                    'My Work',
                    style: getTextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Yahya Amarneh',
                style: getTextStyle(fontSize: 23, color: titleColor),
              ),
            ],
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
