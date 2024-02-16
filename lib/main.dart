import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:provider/provider.dart';

import 'src/app_state.dart';
import 'src/playlist_details.dart';
import 'src/adaptive_playlists.dart';
import 'src/adaptive_login.dart';

// From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
// const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';

// This is obtained by creating a new project from your gmail account
// Enable the youtube data api v3, navigate to credentials and create
// the API_KEY
// const youTubeApiKey = 'AIzaSyChzkg7GcxiodI74HqswUMeEGpPP7AFHuw';

// From https://developers.google.com/youtube/v3/guides/auth/installed-apps#identify-access-scopes
final scopes = [
  'https://www.googleapis.com/auth/youtube.readonly',
];

final clientId = ClientId(
  '985668357426-320hg0grfdpgnjos1i70hlr5pqqu0k2p.apps.googleusercontent.com',
  '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',
);

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const AdaptivePlaylists();
      },
      // Add redirect configuration
      redirect: (context, state) {
        if (!context.read<AuthedUserPlaylists>().isLoggedIn) {
          return '/login';
        } else {
          return null;
        }
      },
      routes: <RouteBase>[
        // Add new login Route
        GoRoute(
          path: 'login',
          builder: (context, state) {
            return AdaptiveLogin(
              clientId: clientId,
              scopes: scopes,
              loginButtonChild: const Text('Login to YouTube'),
            );
          },
        ),
        GoRoute(
          path: 'playlist/:id',
          builder: (context, state) {
            final title = state.uri.queryParameters['title']!;
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text(title)),
              body: PlaylistDetails(
                playlistId: id,
                playlistName: title,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

void main() {
  runApp(ChangeNotifierProvider<AuthedUserPlaylists>(
    create: (context) => AuthedUserPlaylists(),
    child: const PlaylistsApp(),
  ));
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Your Playlists',
      theme: FlexColorScheme.light(
        scheme: FlexScheme.red,
        useMaterial3: true,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.red,
        useMaterial3: true,
      ).toTheme,
      themeMode: ThemeMode.system, // Or ThemeMode.System if you'd prefer
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
