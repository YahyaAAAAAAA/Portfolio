import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:Portfolio/components/main_card.dart';
import 'package:Portfolio/pages/doi_page.dart';
import 'package:Portfolio/pages/home.dart';
import 'package:Portfolio/utils/custom_colors.dart';
import 'package:Portfolio/utils/movement.dart';

class SquareoPage extends StatefulWidget {
  const SquareoPage({super.key});

  @override
  State<SquareoPage> createState() => _SquareoPageState();
}

class _SquareoPageState extends State<SquareoPage> {
  late VideoPlayerController _controller;
  CustomColors c = CustomColors();
  Movement movement = Movement();
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
      onPointerSignal: (event) {
        movement.scrollDown(event, context, const DrawOverItPage());
        movement.scrollUp(event, context, const Home());
      },
      onPointerMove: (event) {
        movement.swipeDown(event, context, const DrawOverItPage());
        movement.swipeUp(event, context, const Home());
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: IconButton(
            onPressed: () {
              movement.goUp(context, const Home());
            },
            icon: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
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
          link: 'https://github.com/YahyaAmarneh/Squareo',
        ),
        bottomSheet: IconButton(
          onPressed: () {
            movement.goDown(context, const DrawOverItPage());
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
