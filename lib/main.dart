import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/progress_provider.dart';
import 'screens/game_screen.dart';
import 'screens/home_screen.dart';
import 'screens/intro_screen.dart';
import 'ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  initCoinNotifier(prefs);
  runApp(
    ProviderScope(
      child: ShabdLokApp(prefs: prefs),
    ),
  );
}

sealed class _Screen {}

class _Splash extends _Screen {}

class _Home extends _Screen {}

class _Game extends _Screen {
  final int levelId;
  _Game(this.levelId);
}

class ShabdLokApp extends StatelessWidget {
  final SharedPreferences prefs;

  const ShabdLokApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShabdLok',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      home: _AppNavigator(prefs: prefs),
    );
  }
}

class _AppNavigator extends StatefulWidget {
  final SharedPreferences prefs;

  const _AppNavigator({required this.prefs});

  @override
  State<_AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<_AppNavigator> {
  late final GameProgressRepository _repository;
  _Screen _screen = _Splash();

  @override
  void initState() {
    super.initState();
    _repository = GameProgressRepository(widget.prefs);
  }

  @override
  Widget build(BuildContext context) {
    final goingForward = _screen is _Game;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final offset =
            goingForward ? const Offset(1, 0) : const Offset(-1, 0);
        return SlideTransition(
          position: Tween<Offset>(begin: offset, end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: switch (_screen) {
        _Splash() => IntroScreen(
            key: const ValueKey('intro'),
            onDone: () => setState(() => _screen = _Home()),
          ),
        _Home() => HomeScreen(
            key: const ValueKey('home'),
            repository: _repository,
            onLevelSelected: (id) => setState(() => _screen = _Game(id)),
          ),
        _Game(:final levelId) => GameScreen(
            key: ValueKey('game_$levelId'),
            levelId: levelId,
            repository: _repository,
            onBack: () => setState(() => _screen = _Home()),
            onNextLevel: (nextId) => setState(() => _screen = _Game(nextId)),
          ),
      },
    );
  }
}
