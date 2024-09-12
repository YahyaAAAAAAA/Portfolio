import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.mainTitle,
    required this.meshPoints,
    required this.bgImage,
    required this.animatedText,
    required this.iconColor,
    required this.textAndIconBg,
    required this.contactsBg,
    required this.contactsText,
    required this.contactsCard,
    required this.videoBg,
    required this.link,
    required this.videoIconBg,
    required this.contPadding,
    required this.controller,
  });

  final double contPadding;
  final String mainTitle;
  final String bgImage;
  final List<Color> meshPoints;
  final List<Color> animatedText;
  final Color iconColor;
  final Color textAndIconBg;
  final Color contactsBg;
  final Color contactsText;
  final Color contactsCard;
  final Color videoBg;
  final Color videoIconBg;
  final String link;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedMeshGradient(
      colors: meshPoints,
      options: AnimatedMeshGradientOptions(
        speed: 7,
      ),
      //the padded container
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 500),
        color: Colors.transparent,
        padding: EdgeInsets.all(contPadding),
        //image container
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(bgImage),
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
            alignment: WrapAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: textAndIconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  pause: const Duration(milliseconds: 0),
                  animatedTexts: [
                    ColorizeAnimatedText(
                      mainTitle,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Abel',
                      ),
                      colors: animatedText,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height - 270),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => _launchUrl(link),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          textAndIconBg,
                        ),
                      ),
                      icon: Icon(
                        Icons.link_outlined,
                        size: 35,
                        color: iconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                backgroundColor: videoBg,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                content: SizedBox(
                                  width: 500,
                                  height: 500,
                                  child: YoutubePlayer(
                                    controller: controller,
                                    // aspectRatio: 16 / 9,
                                  ),
                                ));
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          textAndIconBg,
                        ),
                      ),
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 35,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String link) async {
    if (!await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch $link');
    }
  }
}
