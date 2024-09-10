import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import 'package:yahya_porfolio/components/main_card.dart';
import 'package:yahya_porfolio/pages/squareo_page.dart';
import 'package:yahya_porfolio/utils/custom_colors.dart';

class DrawOverItPage extends StatefulWidget {
  const DrawOverItPage({super.key});

  @override
  State<DrawOverItPage> createState() => _DrawOverItPageState();
}

class _DrawOverItPageState extends State<DrawOverItPage> {
  late VideoPlayerController _controller;
  CustomColors c = CustomColors();
  double pad = 50;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/DOI.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(
          () {
            pad = 90;
          },
        );
      },
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
      onPointerSignal: (event) => scrollUp(event, context),
      onPointerMove: (event) => swipeUp(event, context),
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
        body: MainCard(
          pad: pad,
          controller: _controller,
          mainTitle: 'A Windows application that make you draw over any window',
          meshPoints: [
            c.doiMesh_1,
            c.doiMesh_2,
            c.doiMesh_1,
            c.doiMesh_2,
          ],
          bgImage: 'assets/images/doi_bg.png',
          animatedText: c.doiTextAnimated,
          iconColor: c.doiText,
          textAndIconBg: Colors.black.withOpacity(0.5),
          contactsBg: c.doiMesh_2,
          contactsText: c.doiMesh_1,
          contactsCard: c.doiText,
          videoBg: c.doiMesh_1,
          videoIconBg: c.doiText,
          link: 'https://github.com/YahyaAAAAAAA/DrawOverIt/releases/tag/v1.1',
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

  void swipeUp(PointerMoveEvent event, BuildContext context) {
    if (event.delta.dy > 0) {
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
