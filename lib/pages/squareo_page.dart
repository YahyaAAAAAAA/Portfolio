import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yahya_porfolio/pages/doi_page.dart';
import 'package:yahya_porfolio/utils/custom_colors.dart';

class SquareoPage extends StatefulWidget {
  const SquareoPage({super.key});

  @override
  State<SquareoPage> createState() => _SquareoPageState();
}

class _SquareoPageState extends State<SquareoPage>
    with TickerProviderStateMixin {
  CustomColors c = CustomColors();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) => scrollDown(event, context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedMeshGradient(
          colors: [
            c.squareoMesh_1,
            c.squareoMesh_2,
            c.squareoMesh_1,
            c.squareoMesh_2,
          ],
          options: AnimatedMeshGradientOptions(
            speed: 7,
          ),
          //the padded container
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            padding: const EdgeInsets.all(90),
            //image container
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
                image: const DecorationImage(
                  image: AssetImage('assets/images/squareo_bg.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'An engaging mobile puzzle game where your objective is to restore a grid of squares to its original state',
                      style: TextStyle(
                        color: c.squareoText,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Abel',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: IconButton(
          onPressed: () {
            goUp(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
        extendBody: true,
      ),
    );
  }

  void goUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const DrawOverItPage(),
      ),
    );
  }

  void scrollDown(PointerSignalEvent event, BuildContext context) {
    if (event is PointerScrollEvent) {
      double yScroll = event.scrollDelta.dy;
      if (yScroll > 0) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const DrawOverItPage(),
          ),
        );
      }
    }
  }
}
