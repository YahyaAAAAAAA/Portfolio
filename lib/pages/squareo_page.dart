import 'package:flutter/material.dart';
import 'package:Portfolio/components/main_card.dart';
import 'package:Portfolio/pages/doi_page.dart';
import 'package:Portfolio/pages/home.dart';
import 'package:Portfolio/utils/custom_colors.dart';
import 'package:Portfolio/utils/movement.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SquareoPage extends StatefulWidget {
  const SquareoPage({super.key});

  @override
  State<SquareoPage> createState() => _SquareoPageState();
}

class _SquareoPageState extends State<SquareoPage> {
  CustomColors c = CustomColors();
  Movement movement = Movement();
  double contPadding = 50;
  // If the requirement is just to play a single video.
  final controller = YoutubePlayerController.fromVideoId(
    videoId: '0REj6jxwHZg',
    autoPlay: true,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  void dispose() {
    controller.close();
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
          pad: 70,
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
          githublink: 'https://github.com/YahyaAmarneh/Squareo',
          controller: controller,
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
