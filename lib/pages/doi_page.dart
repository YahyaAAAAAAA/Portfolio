import 'package:flutter/material.dart';
import 'package:Portfolio/components/main_card.dart';
import 'package:Portfolio/pages/squareo_page.dart';
import 'package:Portfolio/utils/custom_colors.dart';
import 'package:Portfolio/utils/movement.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DrawOverItPage extends StatefulWidget {
  const DrawOverItPage({super.key});

  @override
  State<DrawOverItPage> createState() => _DrawOverItPageState();
}

class _DrawOverItPageState extends State<DrawOverItPage> {
  CustomColors c = CustomColors();
  Movement movement = Movement();
  double contPadding = 50;
  final controller = YoutubePlayerController.fromVideoId(
    videoId: 'sh73i98ck0U',
    autoPlay: true,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
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
          pad: 70,
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
          githublink: 'https://github.com/YahyaAAAAAAA/DrawOverIt/',
          controller: controller,
        ),
      ),
    );
  }
}
