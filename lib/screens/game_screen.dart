import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/level_data.dart';
import '../models/game_state.dart';
import '../providers/game_provider.dart';
import '../providers/progress_provider.dart';
import '../ui/colors.dart';
import '../widgets/coin_burst.dart';
import '../widgets/confetti_overlay.dart';
import '../widgets/crossword_grid.dart';
import '../widgets/hint_button.dart';
import '../widgets/level_complete_card.dart';
import '../widgets/roulette_wheel.dart';
import '../widgets/word_display.dart';

class GameScreen extends ConsumerStatefulWidget {
  final int levelId;
  final GameProgressRepository repository;
  final VoidCallback onBack;
  final void Function(int nextLevelId) onNextLevel;

  const GameScreen({
    super.key,
    required this.levelId,
    required this.repository,
    required this.onBack,
    required this.onNextLevel,
  });

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late final GameArgs _args;
  bool _showComplete = false;
  bool _shaking = false;
  bool _showCoinFly = false;
  int _coinFlyAmount = 0;
  late List<int> _displayOrder;

  // Key on CoinDisplay so we can find its screen position
  final _coinDisplayKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final level = LevelData.levels[widget.levelId - 1];
    _args = gameArgs(level, widget.repository);
    _displayOrder = List.generate(level.letters.length, (i) => i)..shuffle(Random());
  }

  void _shuffle() {
    setState(() {
      _displayOrder = List.generate(_displayOrder.length, (i) => i)
        ..shuffle(Random());
    });
  }

  void _triggerCoinFly(int amount) {
    setState(() {
      _showCoinFly = true;
      _coinFlyAmount = amount;
    });
  }

  void _onPhaseChange(GameState state) {
    switch (state.phase) {
      case GamePhase.wordFound:
        HapticFeedback.mediumImpact();
        _triggerCoinFly(state.coinsEarned);
        Future.delayed(400.ms, () {
          if (mounted) ref.read(gameProvider(_args).notifier).resetPhase();
        });
      case GamePhase.bonusWordFound:
        HapticFeedback.lightImpact();
        _triggerCoinFly(state.coinsEarned);
        Future.delayed(400.ms, () {
          if (mounted) ref.read(gameProvider(_args).notifier).resetPhase();
        });
      case GamePhase.invalidWord:
        HapticFeedback.vibrate();
        setState(() => _shaking = true);
        Future.delayed(500.ms, () {
          if (mounted) {
            setState(() => _shaking = false);
            ref.read(gameProvider(_args).notifier).resetPhase();
          }
        });
      case GamePhase.alreadyFound:
        HapticFeedback.selectionClick();
        Future.delayed(800.ms, () {
          if (mounted) ref.read(gameProvider(_args).notifier).resetPhase();
        });
      case GamePhase.levelComplete:
        Future.delayed(600.ms, () {
          if (mounted) setState(() => _showComplete = true);
        });
      case GamePhase.playing:
        break;
    }
  }

  Offset _coinDisplayCenter() {
    final box = _coinDisplayKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return const Offset(40, 40);
    final pos = box.localToGlobal(Offset.zero);
    return Offset(pos.dx + box.size.width / 2, pos.dy + box.size.height / 2);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameProvider(_args));
    final coinBalance = ref.watch(coinProvider);

    ref.listen(gameProvider(_args), (prev, next) {
      if (prev?.phase != next.phase) _onPhaseChange(next);
    });

    final notifier = ref.read(gameProvider(_args).notifier);
    final level = state.level;
    final screenSize = MediaQuery.of(context).size;
    final isInvalid = state.phase == GamePhase.invalidWord;
    final isAlreadyFound = state.phase == GamePhase.alreadyFound;
    final totalWords = level.targetPlacements.length;
    final foundCount = state.progress.foundTargetWords.length;

    return Scaffold(
      backgroundColor: backgroundDeep,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 4),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: textSecondary, size: 20),
                        onPressed: widget.onBack,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Level ${level.id}',
                              style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: textPrimary,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 2),
                            _WordProgressDots(
                                found: foundCount, total: totalWords),
                          ],
                        ),
                      ),
                      CoinDisplay(
                        key: _coinDisplayKey,
                        coins: coinBalance,
                      ),
                      const SizedBox(width: 8),
                      HintButton(
                        hintsRemaining: 3 - state.progress.hintsUsed,
                        coinBalance: coinBalance,
                        onPressed:
                            state.hintsExhausted ? null : notifier.useHint,
                      ),
                    ],
                  ),
                ),

                // Crossword grid
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Center(
                      child: CrosswordGrid(
                        level: level,
                        foundWords: {
                          ...state.progress.foundTargetWords,
                          ...state.progress.foundBonusWords,
                        },
                        hintRevealedCells: state.hintRevealedCells,
                      ),
                    ),
                  ),
                ),

                // Word display
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _ShakeWidget(
                    shaking: _shaking,
                    child: WordDisplay(
                      word: state.currentWord,
                      isInvalid: isInvalid,
                      isAlreadyFound: isAlreadyFound,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Roulette
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: RouletteWheel(
                          letters: level.letters,
                          displayOrder: _displayOrder,
                          selectedIndices: state.selectedIndices,
                          onLetterEntered: notifier.selectLetter,
                          onGestureEnd: notifier.submitWord,
                          onShuffle: _shuffle,
                        ),
                      ),
                    ),
                  ),
                ),

                // Bottom row: restart level
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: cardBackground,
                              title: Text(
                                'Restart level?',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: textPrimary,
                                ),
                              ),
                              content: Text(
                                'All found words will be cleared. Coins earned are kept.',
                                style: GoogleFonts.inter(color: textSecondary),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(ctx, false),
                                  child: Text('Cancel',
                                      style: GoogleFonts.inter(
                                          color: textSecondary)),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(ctx, true),
                                  child: Text('Restart',
                                      style: GoogleFonts.inter(
                                          color: errorRed,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true && mounted) {
                            notifier.resetLevel();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: borderDefault, width: 1),
                          ),
                          child: Text(
                            'Restart',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: textSecondary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Coin fly animation
            if (_showCoinFly)
              CoinFlyAnimation(
                origin: Offset(screenSize.width / 2, screenSize.height / 2),
                target: _coinDisplayCenter(),
                coinCount: _coinFlyAmount,
                totalCoins: _coinFlyAmount,
                onDone: () {
                  if (mounted) setState(() => _showCoinFly = false);
                },
              ),

            // Confetti + complete card
            if (_showComplete) ...[
              const IgnorePointer(child: ConfettiOverlay()),
              Center(
                child: LevelCompleteCard(
                  levelId: level.id,
                  wordsFound: state.progress.foundTargetWords.length,
                  bonusWordsFound: state.progress.foundBonusWords.length,
                  hasNextLevel: level.id < LevelData.levels.length,
                  onNextLevel: () {
                    if (level.id < LevelData.levels.length) {
                      widget.onNextLevel(level.id + 1);
                    }
                  },
                  onHome: widget.onBack,
                )
                    .animate()
                    .slideY(
                        begin: 1,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOut)
                    .fadeIn(duration: 300.ms),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _WordProgressDots extends StatelessWidget {
  final int found;
  final int total;

  const _WordProgressDots({required this.found, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final done = i < found;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          width: done ? 18 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: done ? accentGold : borderDefault,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _ShakeWidget extends StatelessWidget {
  final bool shaking;
  final Widget child;

  const _ShakeWidget({required this.shaking, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!shaking) return child;
    return child
        .animate(onPlay: (c) => c.forward())
        .shake(duration: 400.ms, hz: 6, offset: const Offset(8, 0));
  }
}
