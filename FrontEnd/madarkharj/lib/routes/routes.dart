import 'package:get/get.dart';
import 'package:madarkharj/Pages/login.dart';
import 'package:madarkharj/Pages/signup.dart';
import 'package:madarkharj/Pages/welcome.dart';
import 'package:madarkharj/Pages/start_screen.dart';

appRoutes() => [
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 600),
      ),
      GetPage(
        name: '/welcome',
        page: () => const WelcomePage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/startscreen',
        page: () => const StartScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300),
      ),
      GetPage(
        name: '/secondstartscreen',
        page: () => const StartScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ];


// const List<NavigationDestination> destinations = [
//   NavigationDestination(
//     label: 'Home',
//     icon: Icon(Icons.home), // Modify this line
//     route: '/',
//   ),
//   NavigationDestination(
//     label: 'Playlists',
//     icon: Icon(Icons.playlist_add_check), // Modify this line
//     route: '/playlists',
//   ),
//   NavigationDestination(
//     label: 'Artists',
//     icon: Icon(Icons.people), // Modify this line
//     route: '/artists',
//   ),
// ];

// class NavigationDestination {
//   const NavigationDestination({
//     required this.route,
//     required this.label,
//     required this.icon,
//     this.child,
//   });

//   final String route;
//   final String label;
//   final Icon icon;
//   final Widget? child;
// }

// final appRouter = GoRouter(
//   routes: [
//     // HomeScreen
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => const MaterialPage<void>(
//         key: _pageKey,
//         child: RootLayout(
//           key: _scaffoldKey,
//           currentIndex: 0,
//           child: HomeScreen(),
//         ),
//       ),
//     ),

//     // PlaylistHomeScreen
//     GoRoute(
//       path: '/playlists',
//       pageBuilder: (context, state) => const MaterialPage<void>(
//         key: _pageKey,
//         child: RootLayout(
//           key: _scaffoldKey,
//           currentIndex: 1,
//           child: PlaylistHomeScreen(),
//         ),
//       ),
//       routes: [
//         GoRoute(
//           path: ':pid',
//           pageBuilder: (context, state) => MaterialPage<void>(
//             key: state.pageKey,
//             child: RootLayout(
//               key: _scaffoldKey,
//               currentIndex: 1,
//               child: PlaylistScreen(
//                 playlist: playlistsProvider
//                     .getPlaylist(state.pathParameters['pid']!)!,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),

//     // ArtistHomeScreen
//     GoRoute(
//       path: '/artists',
//       pageBuilder: (context, state) => const MaterialPage<void>(
//         key: _pageKey,
//         child: RootLayout(
//           key: _scaffoldKey,
//           currentIndex: 2,
//           child: ArtistsScreen(),
//         ),
//       ),
//       routes: [
//         GoRoute(
//           path: ':aid',
//           pageBuilder: (context, state) => MaterialPage<void>(
//             key: state.pageKey,
//             child: RootLayout(
//               key: _scaffoldKey,
//               currentIndex: 2,
//               child: ArtistScreen(
//                 artist:
//                     artistsProvider.getArtist(state.pathParameters['aid']!)!,
//               ),
//             ),
//           ),
//           // builder: (context, state) => ArtistScreen(
//           //   id: state.params['aid']!,
//           // ),
//         ),
//       ],
//     ),
//     for (final route in destinations.skip(3))
//       GoRoute(
//         path: route.route,
//         pageBuilder: (context, state) => MaterialPage<void>(
//           key: _pageKey,
//           child: RootLayout(
//             key: _scaffoldKey,
//             currentIndex: destinations.indexOf(route),
//             child: const SizedBox(),
//           ),
//         ),
//       ),
//   ],
// );