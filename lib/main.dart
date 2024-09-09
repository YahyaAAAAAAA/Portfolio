import 'package:flutter/material.dart';
import 'package:yahya_porfolio/pages/doi_page.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const DrawOverItPage(); //Home Page
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'doi',
//           builder: (BuildContext context, GoRouterState state) {
//             return const DrawOverItPage();
//           },
//         ),
//         GoRoute(
//           path: 'squareo',
//           pageBuilder: (BuildContext context, GoRouterState state) {
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const SquareoPage(),
//               transitionDuration: const Duration(milliseconds: 150),
//               transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) {
//                 // Change the opacity of the screen using a Curve based on the the animation's
//                 // value
//                 return FadeTransition(
//                   opacity:
//                       CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const DrawOverItPage(),
    );
  }
}
