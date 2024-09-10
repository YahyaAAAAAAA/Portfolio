import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:Portfolio/components/main_card.dart';
import 'package:Portfolio/pages/squareo_page.dart';
import 'package:Portfolio/utils/custom_colors.dart';
import 'package:Portfolio/utils/movement.dart';

class DrawOverItPage extends StatefulWidget {
  const DrawOverItPage({super.key});

  @override
  State<DrawOverItPage> createState() => _DrawOverItPageState();
}

class _DrawOverItPageState extends State<DrawOverItPage> {
  late VideoPlayerController _controller;
  CustomColors c = CustomColors();
  Movement movement = Movement();
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
      onPointerSignal: (event) =>
          movement.scrollUp(event, context, const SquareoPage()),
      onPointerMove: (event) =>
          movement.swipeUp(event, context, const SquareoPage()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: IconButton(
            onPressed: () {
              movement.goUp(context, const SquareoPage());
            },
            icon: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
              size: 30,
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
}
