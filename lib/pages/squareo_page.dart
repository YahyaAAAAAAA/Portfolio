import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import 'package:yahya_porfolio/components/main_card.dart';
import 'package:yahya_porfolio/pages/doi_page.dart';
import 'package:yahya_porfolio/utils/custom_colors.dart';

class SquareoPage extends StatefulWidget {
  const SquareoPage({super.key});

  @override
  State<SquareoPage> createState() => _SquareoPageState();
}

class _SquareoPageState extends State<SquareoPage> {
  late VideoPlayerController _controller;
  CustomColors c = CustomColors();
  double pad = 50;
  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/Squareo.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => setState(
        () {
          pad = 90;
          // _controller.videoPlayerOptions!.webOptions?.controls.enabled = true;
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) => scrollDown(event, context),
      onPointerMove: (event) => swipeDown(event, context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MainCard(
          pad: pad,
          controller: _controller,
          mainTitle:
              'An engaging mobile puzzle game where your objective is to restore a grid of squares to its original state',
          meshPoints: [
            c.squareoMesh_1,
            c.squareoMesh_2,
            c.squareoMesh_1,
            c.squareoMesh_2,
          ],
          bgImage: 'assets/images/squareo_bg.png',
          animatedText: c.squareoTextAnimated,
          iconColor: c.squareoText,
          textAndIconBg: Colors.black.withOpacity(0.5),
          contactsBg: c.squareoMesh_1,
          contactsText: c.doiMesh_1,
          contactsCard: c.squareoText,
          videoBg: const Color(0xFFE9DACF),
          videoIconBg: c.doiMesh_1,
          link: 'https://squareoweb.github.io/',
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

  void swipeDown(PointerMoveEvent event, BuildContext context) {
    if (event.delta.dy < 0) {
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
