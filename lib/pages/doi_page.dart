import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yahya_porfolio/pages/squareo_page.dart';
import 'package:yahya_porfolio/utils/custom_colors.dart';

class DrawOverItPage extends StatefulWidget {
  const DrawOverItPage({super.key});

  @override
  State<DrawOverItPage> createState() => _DrawOverItPageState();
}

class _DrawOverItPageState extends State<DrawOverItPage> {
  CustomColors c = CustomColors();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        scrollUp(event, context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: IconButton(
            onPressed: () {
              goUp(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
        ),
        body: AnimatedMeshGradient(
          colors: [
            c.doiMesh_1,
            c.doiMesh_2,
            c.doiMesh_1,
            c.doiMesh_2,
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
                  image: AssetImage('assets/images/doi_bg.png'),
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
                    child: const Text(
                      'A Windows application that make you draw over any window',
                      style: TextStyle(
                        color: Colors.white,
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
      ),
    );
  }

  void goUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const SquareoPage(),
      ),
    );
  }

  void scrollUp(PointerSignalEvent event, BuildContext context) {
    if (event is PointerScrollEvent) {
      double yScroll = event.scrollDelta.dy;
      if (yScroll < 0) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const SquareoPage(),
          ),
        );
      }
    }
  }
}
