import 'package:contactus/contactus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Movement {
  //up methods
  void goUp(BuildContext context, Widget child) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: child,
      ),
    );
  }

  void scrollUp(PointerSignalEvent event, BuildContext context, Widget child) {
    if (event is PointerScrollEvent) {
      double yScroll = event.scrollDelta.dy;
      if (yScroll < 0) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: child,
          ),
        );
      }
    }
  }

  void swipeUp(PointerMoveEvent event, BuildContext context, Widget child) {
    if (event.delta.dy > 0) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: child,
        ),
      );
    }
  }

  //down methods
  void goDown(BuildContext context, Widget child) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: child,
      ),
    );
  }

  void scrollDown(
      PointerSignalEvent event, BuildContext context, Widget child) {
    if (event is PointerScrollEvent) {
      double yScroll = event.scrollDelta.dy;
      if (yScroll > 0) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: child,
          ),
        );
      }
    }
  }

  void swipeDown(PointerMoveEvent event, BuildContext context, Widget child) {
    if (event.delta.dy < 0) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: child,
        ),
      );
    }
  }

  void showAboutMeDialog(BuildContext context, TextStyle style, Color bgColor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bgColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Yahya Amarneh, 21 years old lives in Zarqa/Jordan.\nStudying Computer Science in Hashemite University. ',
                style: style,
              )
            ],
          ),
        );
      },
    );
  }

  //show Contact Me dialog
  void showConatctDialog(BuildContext context, Color contactsBg,
      Color contactsText, Color contactsCard) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: contactsBg,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContactUs(
                logo: const AssetImage('assets/images/pfp12313.PNG'),
                email: 'yahya.amarneh73@gmail.com',
                companyName: 'Yahya',
                phoneNumber: null,
                dividerThickness: 2,
                githubUserName: 'YahyaAAAAAAA/',
                linkedinURL:
                    'https://www.linkedin.com/in/yahya-amarneh-315528229/',
                tagLine: 'Software Engineer',
                twitterHandle: null,
                textColor: contactsText,
                cardColor: contactsCard,
                companyColor: contactsText,
                taglineColor: contactsText,
                dividerColor: contactsText,
              ),
            ),
          ],
        );
      },
    );
  }
}
