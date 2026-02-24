import '../models/level.dart';
import '../models/word_placement.dart';

class LevelData {
  static const List<Level> levels = [
    // -------------------------------------------------------------------------
    // LEVEL 1 — D O G
    //   col: 0 1 2
    //   row0: D O G   <- DOG horizontal (isBonus)
    //   row1:     O   <- GOD vertical: G(0,2) O(1,2) D(2,2)
    //   row2:     D
    // -------------------------------------------------------------------------
    Level(
      id: 1,
      name: 'Dog',
      letters: ['D', 'O', 'G'],
      targetPlacements: [
        WordPlacement(
          word: 'DOG',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'GOD',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: [],
      gridRows: 3,
      gridCols: 3,
      preRevealedCells: [(0, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 2 — P O T
    //   col: 0 1 2
    //   row0: P O T   <- POT horizontal (isBonus)
    //   row1:     O   <- TOP vertical: T(0,2) O(1,2) P(2,2)
    //   row2:     P
    // -------------------------------------------------------------------------
    Level(
      id: 2,
      name: 'Pot',
      letters: ['P', 'O', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'POT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'TOP',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['OPT'],
      gridRows: 3,
      gridCols: 3,
      preRevealedCells: [(0, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 3 — T A P
    //   col: 0 1 2
    //   row0: T A P   <- TAP horizontal (isBonus)
    //   row1:     A   <- PAT vertical: P(0,2) A(1,2) T(2,2)
    //   row2:     T
    // -------------------------------------------------------------------------
    Level(
      id: 3,
      name: 'Tap',
      letters: ['T', 'A', 'P'],
      targetPlacements: [
        WordPlacement(
          word: 'TAP',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PAT',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['APT'],
      gridRows: 3,
      gridCols: 3,
      preRevealedCells: [(0, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 4 — B O N E
    //   col: 0 1 2 3
    //   row0: B O N E   <- BONE horizontal (isBonus)
    //   row1: O     O   <- BON vertical: B(0,0) O(1,0) N(2,0)
    //   row2: N     N   <- EON vertical: E(0,3) O(1,3) N(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 4,
      name: 'Bone',
      letters: ['B', 'O', 'N', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'BONE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BON',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EON',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['BEN', 'EBON', 'NEB', 'NOB', 'OBE', 'ONE'],
      gridRows: 3,
      gridCols: 4,
      preRevealedCells: [(0, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 5 — C O R D
    //   col: 0 1 2 3
    //   row0: C O R D   <- CORD horizontal (isBonus)
    //   row1: O   O     <- COD vertical: C(0,0) O(1,0) D(2,0)
    //   row2: D   D     <- ROD vertical: R(0,2) O(1,2) D(2,2)
    // -------------------------------------------------------------------------
    Level(
      id: 5,
      name: 'Cord',
      letters: ['C', 'O', 'R', 'D'],
      targetPlacements: [
        WordPlacement(
          word: 'CORD',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'COD',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ROD',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['COR', 'DOC', 'DOR', 'ORC', 'ROC'],
      gridRows: 3,
      gridCols: 4,
      preRevealedCells: [(0, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 6 — F A R M
    //   col: 0 1 2 3
    //   row0: F A R M   <- FARM horizontal (isBonus)
    //   row1:   R   A   <- ARM vertical: A(0,1) R(1,1) M(2,1)
    //   row2:   M   R   <- MAR vertical: M(0,3) A(1,3) R(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 6,
      name: 'Farm',
      letters: ['F', 'A', 'R', 'M'],
      targetPlacements: [
        WordPlacement(
          word: 'FARM',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'ARM',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'MAR',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ARF', 'FAR', 'RAM'],
      gridRows: 3,
      gridCols: 4,
      preRevealedCells: [(0, 0), (0, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 7 — L A K E
    //   col: 0 1 2 3
    //   row0: L A K E   <- LAKE horizontal (isBonus)
    //   row1:   L A     <- ALE vertical: A(0,1) L(1,1) E(2,1)
    //   row2:   E L K   <- KALE vertical: K(0,2) A(1,2) L(2,2) E(3,2)
    //   row3:     E     <- ELK horizontal: E(2,1) L(2,2) K(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 7,
      name: 'Lake',
      letters: ['L', 'A', 'K', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'LAKE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'ALE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'KALE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ELK',
          startRow: 2,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['KAE', 'KEA', 'LEA', 'LEAK', 'LEK'],
      gridRows: 4,
      gridCols: 4,
      preRevealedCells: [(0, 3), (2, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 8 — P I N E
    //   col: 0 1 2 3
    //   row0: P I N E   <- PINE horizontal (isBonus)
    //   row1: E         <- PEN vertical: P(0,0) E(1,0) N(2,0)
    //   row2: N I P     <- NIP horizontal: N(2,0) I(2,1) P(2,2)
    // -------------------------------------------------------------------------
    Level(
      id: 8,
      name: 'Pine',
      letters: ['P', 'I', 'N', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'PINE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PEN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIP',
          startRow: 2,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['PEIN', 'PIE', 'PIN'],
      gridRows: 3,
      gridCols: 4,
      preRevealedCells: [(0, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 9 — M O L E
    //   col: 0 1 2 3
    //   row0: M O L E   <- MOLE horizontal (isBonus)
    //   row1:   L   L   <- OLE vertical: O(0,1) L(1,1) E(2,1)
    //   row2:   E   M   <- ELM vertical: E(0,3) L(1,3) M(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 9,
      name: 'Mole',
      letters: ['M', 'O', 'L', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'MOLE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'OLE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ELM',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['MEL', 'MOL'],
      gridRows: 3,
      gridCols: 4,
      preRevealedCells: [(0, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 10 — R O P E
    //   col: 0 1 2 3
    //   row0: R O P E   <- ROPE horizontal (isBonus)
    //   row1: E   O     <- REPO vertical: R(0,0) E(1,0) P(2,0) O(3,0)
    //   row2: P   R     <- PORE vertical: P(0,2) O(1,2) R(2,2) E(3,2)
    //   row3: O   E
    // -------------------------------------------------------------------------
    Level(
      id: 10,
      name: 'Rope',
      letters: ['R', 'O', 'P', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'ROPE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'REPO',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PORE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['OPE', 'ORE', 'PER', 'PRO', 'REP', 'ROE'],
      gridRows: 4,
      gridCols: 4,
      preRevealedCells: [(0, 3), (2, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 11 — B R A V E  [1×5-letter isBonus, 1×4-letter, 2×3-letter]
    //   col: 0 1 2 3 4
    //   row0: B R A V E   <- BRAVE horizontal (isBonus)
    //   row1: A   V   A   <- BARE vertical: B(0,0) A(1,0) R(2,0) E(3,0)
    //   row2: R   E   R   <- AVE  vertical: A(0,2) V(1,2) E(2,2)
    //   row3: E           <- EAR  vertical: E(0,4) A(1,4) R(2,4)
    // -------------------------------------------------------------------------
    Level(
      id: 11,
      name: 'Brave',
      letters: ['B', 'R', 'A', 'V', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'BRAVE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BARE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'AVE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EAR',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ARB', 'ARE', 'AVER', 'BAR', 'BEAR', 'BRA', 'BRAE', 'ERA', 'RAVE', 'REB', 'REV', 'VAR', 'VERA', 'VERB'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(1, 2), (3, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 12 — F L A M E  [1×5-letter isBonus, 2×4-letter, 1×3-letter]
    //   col: 0 1 2 3 4
    //   row0: F L A M E   <- FLAME horizontal (isBonus)
    //   row1:   A   A     <- LAME vertical: L(0,1) A(1,1) M(2,1) E(3,1)
    //   row2:   M E L     <- MALE vertical: M(0,3) A(1,3) L(2,3) E(3,3)
    //   row3:   E   E     <- MEL  horizontal: M(2,1) E(2,2) L(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 12,
      name: 'Flame',
      letters: ['F', 'L', 'A', 'M', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'FLAME',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'LAME',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'MALE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'MEL',
          startRow: 2,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ALE', 'ALEF', 'ALME', 'ELF', 'ELM', 'EMF', 'FAME', 'FEAL', 'FEM', 'FLAM', 'FLEA', 'FLEAM', 'LAM', 'LEA', 'LEAF', 'MAE', 'MEAL'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (1, 1), (3, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 13 — C O V E R  [1×5-letter isBonus, 2×4-letter, 1×3-letter]
    //   col: 0 1 2 3 4
    //   row0: C O V E R   <- COVER horizontal (isBonus)
    //   row1: O R C   O   <- CORE vertical: C(0,0) O(1,0) R(2,0) E(3,0)
    //   row2: R   C   V   <- ROVE vertical: R(0,4) O(1,4) V(2,4) E(3,4)
    //   row3: E       E   <- ORC  horizontal: O(1,0) R(1,1) C(1,2)
    // -------------------------------------------------------------------------
    Level(
      id: 13,
      name: 'Cover',
      letters: ['C', 'O', 'V', 'E', 'R'],
      targetPlacements: [
        WordPlacement(
          word: 'COVER',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'CORE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ROVE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ORC',
          startRow: 1,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['CERO', 'COR', 'COVE', 'ORE', 'OVER', 'REC', 'REV', 'ROC', 'ROE', 'VOE'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (3, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 14 — B L A N D  [1×5-letter isBonus, 1×4-letter, 2×3-letter]
    //   col: 0 1 2 3 4
    //   row0: B L A N D   <- BLAND horizontal (isBonus)
    //   row1: A N D   A   <- BAND vertical: B(0,0) A(1,0) N(2,0) D(3,0)
    //   row2: N           <- AND  horizontal: A(1,0) N(1,1) D(1,2)
    //   row3: D       B   <- DAB  vertical: D(0,4) A(1,4) B(2,4)
    // -------------------------------------------------------------------------
    Level(
      id: 14,
      name: 'Bland',
      letters: ['B', 'L', 'A', 'N', 'D'],
      targetPlacements: [
        WordPlacement(
          word: 'BLAND',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BAND',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'AND',
          startRow: 1,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
        WordPlacement(
          word: 'DAB',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ALB', 'BAD', 'BAL', 'BALD', 'BAN', 'DAL', 'LAB', 'LAD', 'LAND', 'NAB'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 3), (2, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 15 — C L O S E  [1×5-letter isBonus, 2×4-letter, 1×3-letter]
    //   col: 0 1 2 3 4
    //   row0: C L O S E   <- CLOSE horizontal (isBonus)
    //   row1:   O   O     <- LOSE vertical: L(0,1) O(1,1) S(2,1) E(3,1)
    //   row2:   S O L     <- SOLE vertical: S(0,3) O(1,3) L(2,3) E(3,3)
    //   row3:   E   E     <- SOL  horizontal: S(2,1) O(2,2) L(2,3)
    // -------------------------------------------------------------------------
    Level(
      id: 15,
      name: 'Close',
      letters: ['C', 'L', 'O', 'S', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'CLOSE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'LOSE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SOLE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SOL',
          startRow: 2,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['CEL', 'CELS', 'COL', 'COLE', 'COLES', 'COLS', 'COS', 'ELS', 'OES', 'OLE', 'OLES', 'OSE', 'SEC', 'SEL', 'SLOE', 'SOCLE'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 4), (1, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 16 — P L A N T  [1×5-letter isBonus, 1×4-letter, 2×3-letter]
    //   col: 0 1 2 3 4
    //   row0: P L A N T   <- PLANT horizontal (isBonus)
    //   row1: L       A   <- PLAN vertical: P(0,0) L(1,0) A(2,0) N(3,0)
    //   row2: A N T   N   <- ANT  horizontal: A(2,0) N(2,1) T(2,2)
    //   row3: N           <- TAN  vertical: T(0,4) A(1,4) N(2,4)
    // -------------------------------------------------------------------------
    Level(
      id: 16,
      name: 'Plant',
      letters: ['P', 'L', 'A', 'N', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'PLANT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PLAN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANT',
          startRow: 2,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
        WordPlacement(
          word: 'TAN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ALP', 'ALT', 'APT', 'LAP', 'LAT', 'NAP', 'PAL', 'PAN', 'PANT', 'PAT', 'PLAT', 'TAP'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (1, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 17 — D R E A M  [1×5-letter isBonus, 1×4-letter, 2×3-letter]
    //   col: 0 1 2 3 4
    //   row0: D R E A M   <- DREAM horizontal (isBonus)
    //   row1:   E R A     <- READ vertical: R(0,1) E(1,1) A(2,1) D(3,1)
    //   row2:   A         <- ERA  horizontal: E(1,1) R(1,2) A(1,3)
    //   row3:   D A M     <- DAM  horizontal: D(3,1) A(3,2) M(3,3)
    // -------------------------------------------------------------------------
    Level(
      id: 17,
      name: 'Dream',
      letters: ['D', 'R', 'E', 'A', 'M'],
      targetPlacements: [
        WordPlacement(
          word: 'DREAM',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'READ',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ERA',
          startRow: 1,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
        WordPlacement(
          word: 'DAM',
          startRow: 3,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ARE', 'ARM', 'ARMED', 'DAME', 'DARE', 'DEAR', 'DERM', 'DERMA', 'DRAM', 'EAR', 'MAD', 'MADE', 'MADRE', 'MAE', 'MAR', 'MARE', 'MEAD', 'MED', 'RAD', 'RAM', 'REAM', 'RED', 'REM'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (1, 2), (3, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 18 — S P O R E  [1×5-letter isBonus, 2×4-letter]
    //   col: 0 1 2 3 4
    //   row0: S P O R E   <- SPORE horizontal (isBonus)
    //   row1: O     O     <- SORE vertical: S(0,0) O(1,0) R(2,0) E(3,0)
    //   row2: R     P     <- ROPE vertical: R(0,3) O(1,3) P(2,3) E(3,3)
    //   row3: E     E
    // -------------------------------------------------------------------------
    Level(
      id: 18,
      name: 'Spore',
      letters: ['S', 'P', 'O', 'R', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'SPORE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SORE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ROPE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['EPOS', 'EROS', 'ERS', 'OES', 'OPE', 'OPES', 'OPS', 'ORE', 'ORES', 'ORS', 'OSE', 'PER', 'PES', 'PESO', 'PORE', 'PORES', 'POSE', 'POSER', 'PRO', 'PROS', 'PROSE', 'REP', 'REPO', 'REPOS', 'REPS', 'RES', 'ROE', 'ROES', 'ROPES', 'ROSE', 'SER', 'SOP'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 4), (2, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 19 — C L E A N  [1×5-letter isBonus, 1×4-letter, 1×3-letter]
    //   col: 0 1 2 3 4
    //   row0: C L E A N   <- CLEAN horizontal (isBonus)
    //   row1: A C N E     <- CANE vertical: C(0,0) A(1,0) N(2,0) E(3,0)
    //   row2: N           <- ACNE horizontal: A(1,0) C(1,1) N(1,2) E(1,3)
    //   row3: E
    // -------------------------------------------------------------------------
    Level(
      id: 19,
      name: 'Clean',
      letters: ['C', 'L', 'E', 'A', 'N'],
      targetPlacements: [
        WordPlacement(
          word: 'CLEAN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'CANE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ACNE',
          startRow: 1,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACE', 'ALE', 'ALEC', 'ANE', 'CAN', 'CEL', 'CLAN', 'ELAN', 'LAC', 'LACE', 'LANCE', 'LANE', 'LEA', 'LEAN', 'NAE'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (1, 2), (3, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 20 — B R A N D  [1×5-letter isBonus, 1×4-letter, 2×3-letter]
    //   col: 0 1 2 3 4
    //   row0: B R A N D   <- BRAND horizontal (isBonus)
    //   row1: R A D       <- BRAN vertical: B(0,0) R(1,0) A(2,0) N(3,0)
    //   row2: A N D       <- RAD  horizontal: R(1,0) A(1,1) D(1,2)
    //   row3: N           <- AND  horizontal: A(2,0) N(2,1) D(2,2)
    // -------------------------------------------------------------------------
    Level(
      id: 20,
      name: 'Brand',
      letters: ['B', 'R', 'A', 'N', 'D'],
      targetPlacements: [
        WordPlacement(
          word: 'BRAND',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BRAN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RAD',
          startRow: 1,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
        WordPlacement(
          word: 'AND',
          startRow: 2,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ARB', 'BAD', 'BAN', 'BAND', 'BAR', 'BARD', 'BARN', 'BRA', 'BRAD', 'DAB', 'DARB', 'DARN', 'DRAB', 'NAB', 'NARD', 'RAN', 'RAND'],
      gridRows: 4,
      gridCols: 5,
      preRevealedCells: [(0, 2), (1, 2), (3, 0)],
    ),


    // -------------------------------------------------------------------------
    // LEVEL 21 — S H E L T E R  (two E's)
    //
    // col:  0 1 2 3 4 5 6
    // row0: S H E L T E R   ← SHELTER (H, isBonus)
    // row1: L   E   H   E
    // row2: E   L E E   S
    // row3: E           T
    // row4: T
    //
    // Verticals at cols 0,2,4,6 (spaced ≥2 apart — no false adjacencies)
    // SLEET(V,col0): S(0,0) L(1,0) E(2,0) E(3,0) T(4,0)
    // EEL  (V,col2): E(0,2) E(1,2) L(2,2)
    // THE  (V,col4): T(0,4) H(1,4) E(2,4)
    // REST (V,col6): R(0,6) E(1,6) S(2,6) T(3,6)
    // LEE  (H,row2): L(2,2) E(2,3) E(2,4)  — shares L with EEL, E with THE
    // -------------------------------------------------------------------------
    Level(
      id: 21,
      name: 'Shelter',
      letters: ['S', 'H', 'E', 'L', 'T', 'E', 'R'],
      targetPlacements: [
        WordPlacement(
          word: 'SHELTER',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SLEET',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EEL',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'THE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'REST',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LEE',
          startRow: 2,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['EELS', 'ELS', 'ELSE', 'ERE', 'ERS', 'ERST', 'ESTER', 'ETH', 'ETHER', 'ETHERS', 'ETHS', 'HEEL', 'HEELS', 'HER', 'HERE', 'HERES', 'HERL', 'HERLS', 'HERS', 'HES', 'HEST', 'HET', 'HETS', 'LEER', 'LEERS', 'LEES', 'LEET', 'LEETS', 'LEHR', 'LEHRS', 'LEST', 'LET', 'LETHE', 'LETHES', 'LETS', 'REE', 'REEL', 'REELS', 'REES', 'REEST', 'RELET', 'RELETS', 'RES', 'RESET', 'RESH', 'RET', 'RETE', 'RETS', 'SEE', 'SEEL', 'SEER', 'SEL', 'SER', 'SERE', 'SET', 'SHE', 'SHEER', 'SHEET', 'STEEL', 'STEER', 'STELE', 'STERE', 'STREEL', 'TEE', 'TEEL', 'TEELS', 'TEES', 'TEL', 'TELE', 'TELES', 'TELS', 'TERSE', 'THEE', 'THERE', 'THERES', 'THESE', 'THREE', 'THREES', 'TREE', 'TREES'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(1, 0), (2, 4), (3, 6)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 22 — F L A T T E N  (two T's)
    //
    // col:  0 1 2 3 4 5 6
    // row0: F L A T T E N   ← FLATTEN (H, isBonus)
    // row1: E   N   E   E
    // row2: T   T A N   A
    // row3: A           T
    // row4: L
    //
    // FETAL (V,col0): F(0,0) E(1,0) T(2,0) A(3,0) L(4,0)
    // ANT   (V,col2): A(0,2) N(1,2) T(2,2)
    // TEN   (V,col4): T(0,4) E(1,4) N(2,4)
    // NEAT  (V,col6): N(0,6) E(1,6) A(2,6) T(3,6)
    // TAN   (H,row2): T(2,2) A(2,3) N(2,4)  — shares T with ANT, N with TEN
    // -------------------------------------------------------------------------
    Level(
      id: 22,
      name: 'Flatten',
      letters: ['F', 'L', 'A', 'T', 'T', 'E', 'N'],
      targetPlacements: [
        WordPlacement(
          word: 'FLATTEN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'FETAL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANT',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TEN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEAT',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TAN',
          startRow: 2,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AFT', 'ALE', 'ALEF', 'ALT', 'ANE', 'ANTE', 'ATE', 'ATT', 'EAT', 'EFT', 'ELAN', 'ELF', 'ETA', 'ETNA', 'FAN', 'FANE', 'FAT', 'FATE', 'FATTEN', 'FEAL', 'FEAT', 'FELT', 'FEN', 'FET', 'FETA', 'FLAN', 'FLAT', 'FLEA', 'LANE', 'LAT', 'LATE', 'LATEN', 'LATENT', 'LATTE', 'LATTEN', 'LEA', 'LEAF', 'LEAN', 'LEANT', 'LEFT', 'LENT', 'LET', 'NAE', 'NET', 'NETT', 'TAE', 'TAEL', 'TALE', 'TALENT', 'TAT', 'TATE', 'TEA', 'TEAL', 'TEAT', 'TEL', 'TELA', 'TENT', 'TET'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 3), (4, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 23 — S P A R R O W  (two R's)
    //
    // col:  0 1 2 3 4 5 6
    // row0: S P A R R O W   ← SPARROW (H, isBonus)
    // row1: O           A
    // row2: A           R
    // row3: R         R A P
    // row4:           S
    //
    // SOAR  (V,col0): S(0,0) O(1,0) A(2,0) R(3,0)
    // ROARS (V,col4): R(0,4) O(1,4) A(2,4) R(3,4) S(4,4)  — uses R×2
    // WARP  (V,col6): W(0,6) A(1,6) R(2,6) P(3,6)
    // RAP   (H,row3): R(3,4) A(3,5) P(3,6)  — shares R with ROARS, P with WARP
    // Cols 0,4,6 — all differ ≥2, no false adjacencies
    // -------------------------------------------------------------------------
    Level(
      id: 23,
      name: 'Sparrow',
      letters: ['S', 'P', 'A', 'R', 'R', 'O', 'W'],
      targetPlacements: [
        WordPlacement(
          word: 'SPARROW',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SOAR',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ROARS',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'WARP',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RAP',
          startRow: 3,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ARROW', 'ARROWS', 'ARS', 'ASP', 'OAR', 'OARS', 'OPS', 'ORA', 'ORRA', 'ORS', 'OSAR', 'PAR', 'PARR', 'PARRS', 'PARS', 'PAS', 'PAW', 'PAWS', 'POW', 'POWS', 'PRAO', 'PRAOS', 'PRO', 'PROA', 'PROAS', 'PROS', 'PROW', 'PROWAR', 'PROWS', 'RAPS', 'RAS', 'RASP', 'RAW', 'RAWS', 'ROAR', 'ROW', 'ROWS', 'SAP', 'SAPOR', 'SAW', 'SOAP', 'SOP', 'SORA', 'SOW', 'SOWAR', 'SPA', 'SPAR', 'SWAP', 'SWOP', 'WAP', 'WAPS', 'WAR', 'WARPS', 'WARS', 'WAS', 'WASP', 'WOP', 'WOPS', 'WOS', 'WRAP', 'WRAPS'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (2, 6), (4, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 24 — S E R V A N T
    //
    // col:  0 1 2 3 4 5 6
    // row0: S E R V A N T   ← SERVANT (H, isBonus)
    // row1: T   A   N   E
    // row2: E   N E T   A
    // row3: R   T       R
    // row4: N
    //
    // STERN (V,col0): S(0,0) T(1,0) E(2,0) R(3,0) N(4,0)
    // RANT  (V,col2): R(0,2) A(1,2) N(2,2) T(3,2)
    // ANT   (V,col4): A(0,4) N(1,4) T(2,4)
    // TEAR  (V,col6): T(0,6) E(1,6) A(2,6) R(3,6)
    // NET   (H,row2): N(2,2) E(2,3) T(2,4)  — shares N with RANT, T with ANT
    // -------------------------------------------------------------------------
    Level(
      id: 24,
      name: 'Servant',
      letters: ['S', 'E', 'R', 'V', 'A', 'N', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'SERVANT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'STERN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RANT',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANT',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TEAR',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NET',
          startRow: 2,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ANE', 'ANES', 'ANTE', 'ANTES', 'ANTRE', 'ANTRES', 'ANTS', 'ARE', 'ARES', 'ARS', 'ARSE', 'ART', 'ARTS', 'ASTER', 'ASTERN', 'ATE', 'ATES', 'AVE', 'AVENS', 'AVER', 'AVERS', 'AVERT', 'AVERTS', 'AVES', 'EAR', 'EARN', 'EARNS', 'EARS', 'EAST', 'EAT', 'EATS', 'ENS', 'ERA', 'ERAS', 'ERN', 'ERNS', 'ERS', 'ERST', 'ETA', 'ETAS', 'ETNA', 'ETNAS', 'NAE', 'NARES', 'NATES', 'NAVE', 'NAVES', 'NEAR', 'NEARS', 'NEAT', 'NEATS', 'NERTS', 'NEST', 'NETS', 'RAN', 'RANTS', 'RAS', 'RASE', 'RAT', 'RATE', 'RATES', 'RATS', 'RAVE', 'RAVEN', 'RAVENS', 'RAVES', 'RENT', 'RENTS', 'RES', 'REST', 'RET', 'RETS', 'REV', 'REVS', 'SAE', 'SANE', 'SANER', 'SAT', 'SATE', 'SAVE', 'SAVER', 'SEA', 'SEAR', 'SEAT', 'SEN', 'SENT', 'SER', 'SERA', 'SET', 'SETA', 'SNARE', 'STANE', 'STAR', 'STARE', 'STARVE', 'STAVE', 'STERNA', 'TAE', 'TAN', 'TANS', 'TAR', 'TARE', 'TARES', 'TARN', 'TARNS', 'TARS', 'TAS', 'TAV', 'TAVERN', 'TAVERNS', 'TAVS', 'TEA', 'TEARS', 'TEAS', 'TEN', 'TENS', 'TERN', 'TERNS', 'TRANS', 'TRAVE', 'TRAVES', 'TSAR', 'VAN', 'VANE', 'VANES', 'VANS', 'VAR', 'VARS', 'VAS', 'VASE', 'VAST', 'VASTER', 'VAT', 'VATS', 'VENA', 'VENT', 'VENTS', 'VERA', 'VERSANT', 'VERST', 'VERT', 'VERTS', 'VEST', 'VESTA', 'VET', 'VETS'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 3), (4, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 25 — G R A N I T E
    //
    // col:  0 1 2 3 4 5 6
    // row0: G R A N I T E   ← GRANITE (H, isBonus)
    // row1: R   N   R   A
    // row2: I   T   A   R
    // row3: T   I T A N
    // row4:         E
    //
    // GRIT  (V,col0): G(0,0) R(1,0) I(2,0) T(3,0)
    // ANTI  (V,col2): A(0,2) N(1,2) T(2,2) I(3,2)
    // IRATE (V,col4): I(0,4) R(1,4) A(2,4) T(3,4) E(4,4)
    // EARN  (V,col6): E(0,6) A(1,6) R(2,6) N(3,6)
    // TAN   (H,row3): T(3,4) A(3,5) N(3,6)  — shares T with IRATE, N with EARN
    // -------------------------------------------------------------------------
    Level(
      id: 25,
      name: 'Granite',
      letters: ['G', 'R', 'A', 'N', 'I', 'T', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'GRANITE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'GRIT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANTI',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'IRATE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EARN',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TAN',
          startRow: 3,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AGE', 'AGENT', 'AGER', 'AGIN', 'AIGRET', 'AIN', 'AIR', 'AIRN', 'AIRT', 'AIT', 'ANE', 'ANGER', 'ANI', 'ANT', 'ANTE', 'ANTRE', 'ARE', 'ARGENT', 'ART', 'ATE', 'EAR', 'EARING', 'EAT', 'EATING', 'ENG', 'ENGIRT', 'ENTIA', 'ERA', 'ERG', 'ERN', 'ETA', 'ETNA', 'GAE', 'GAEN', 'GAIN', 'GAINER', 'GAIT', 'GAITER', 'GAN', 'GANE', 'GAR', 'GARNET', 'GARNI', 'GAT', 'GATE', 'GEAR', 'GEN', 'GENT', 'GET', 'GETA', 'GIANT', 'GIE', 'GIEN', 'GIN', 'GIRN', 'GIRT', 'GIT', 'GNAR', 'GNAT', 'GRAIN', 'GRAN', 'GRANT', 'GRAT', 'GRATE', 'GRATIN', 'GRATINE', 'GREAT', 'GRIN', 'INERT', 'INGATE', 'INGRATE', 'INTER', 'IRE', 'NAE', 'NAG', 'NEAR', 'NEAT', 'NET', 'NIT', 'NITE', 'NITER', 'NITRE', 'RAG', 'RAGE', 'RAGI', 'RAIN', 'RAN', 'RANG', 'RANGE', 'RANI', 'RANT', 'RAT', 'RATE', 'RATINE', 'RATING', 'REAGIN', 'REG', 'REGAIN', 'REGINA', 'REGNA', 'REI', 'REIGN', 'REIN', 'RENIG', 'RENT', 'RET', 'RETAG', 'RETAIN', 'RETIA', 'RETINA', 'RIA', 'RIANT', 'RIG', 'RIN', 'RING', 'RITE', 'TAE', 'TAG', 'TAIN', 'TANG', 'TANGIER', 'TAR', 'TARE', 'TARGE', 'TARING', 'TARN', 'TEA', 'TEAR', 'TEARING', 'TEG', 'TEN', 'TENIA', 'TERAI', 'TERGA', 'TERN', 'TIE', 'TIER', 'TIGER', 'TIN', 'TINE', 'TINEA', 'TING', 'TINGE', 'TIRE', 'TRAGI', 'TRAIN', 'TRIAGE', 'TRIG', 'TRINE'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 4), (4, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 26 — C A P T A I N  (two A's)
    //
    // col:  0 1 2 3 4 5 6
    // row0: C A P T A I N   ← CAPTAIN (H, isBonus)
    // row1: A   A   N   I
    // row2: N   I T A P
    // row3: T   N   I
    // row4:     T
    //
    // CANT  (V,col0): C(0,0) A(1,0) N(2,0) T(3,0)
    // PAINT (V,col2): P(0,2) A(1,2) I(2,2) N(3,2) T(4,2)
    // ANTI  (V,col4): A(0,4) N(1,4) T(2,4) I(3,4)
    // NIP   (V,col6): N(0,6) I(1,6) P(2,6)
    // TAP   (H,row2): T(2,4) A(2,5) P(2,6)  — shares T with ANTI, P with NIP
    // -------------------------------------------------------------------------
    Level(
      id: 26,
      name: 'Captain',
      letters: ['C', 'A', 'P', 'T', 'A', 'I', 'N'],
      targetPlacements: [
        WordPlacement(
          word: 'CAPTAIN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'CANT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PAINT',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANTI',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIP',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TAP',
          startRow: 2,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACT', 'ACTA', 'ACTIN', 'AIN', 'AIT', 'ANA', 'ANI', 'ANT', 'ANTA', 'ANTIC', 'APIAN', 'APT', 'ATAP', 'CAIN', 'CAN', 'CAP', 'CAPITA', 'CAPTAN', 'CAT', 'CATNAP', 'CATNIP', 'INAPT', 'NAP', 'NIPA', 'NIT', 'PAC', 'PACA', 'PACT', 'PAIN', 'PAN', 'PANIC', 'PANT', 'PAT', 'PATIN', 'PATINA', 'PIA', 'PIAN', 'PIC', 'PICA', 'PIN', 'PINA', 'PINATA', 'PINT', 'PINTA', 'PIT', 'PITA', 'TAIN', 'TAIPAN', 'TAN', 'TAPA', 'TIC', 'TIN', 'TIP'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 5), (4, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 27 — L A N T E R N  (two N's)
    //
    // col:  0 1 2 3 4 5 6
    // row0: L A N T E R N   ← LANTERN (H, isBonus)
    // row1: E   E   A   E
    // row2: A   A   R   A
    // row3: R   R   L A T
    // row4: N
    //
    // LEARN (V,col0): L(0,0) E(1,0) A(2,0) R(3,0) N(4,0)
    // NEAR  (V,col2): N(0,2) E(1,2) A(2,2) R(3,2)
    // EARL  (V,col4): E(0,4) A(1,4) R(2,4) L(3,4)
    // NEAT  (V,col6): N(0,6) E(1,6) A(2,6) T(3,6)
    // LAT   (H,row3): L(3,4) A(3,5) T(3,6)  — shares L with EARL, T with NEAT
    // -------------------------------------------------------------------------
    Level(
      id: 27,
      name: 'Lantern',
      letters: ['L', 'A', 'N', 'T', 'E', 'R', 'N'],
      targetPlacements: [
        WordPlacement(
          word: 'LANTERN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'LEARN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEAR',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EARL',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEAT',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LAT',
          startRow: 3,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ALE', 'ALERT', 'ALT', 'ALTER', 'ANE', 'ANENT', 'ANT', 'ANTE', 'ANTLER', 'ANTRE', 'ARE', 'ART', 'ARTEL', 'ATE', 'EAR', 'EARN', 'EAT', 'ELAN', 'ERA', 'ERN', 'ETA', 'ETNA', 'LANE', 'LANNER', 'LAR', 'LATE', 'LATEN', 'LATER', 'LEA', 'LEAN', 'LEANT', 'LEAR', 'LEARNT', 'LENT', 'LET', 'NAE', 'NAN', 'NET', 'RALE', 'RAN', 'RANT', 'RAT', 'RATE', 'RATEL', 'REAL', 'RENAL', 'RENT', 'RENTAL', 'RET', 'TAE', 'TAEL', 'TALE', 'TALER', 'TAN', 'TANNER', 'TAR', 'TARE', 'TARN', 'TEA', 'TEAL', 'TEAR', 'TEL', 'TELA', 'TEN', 'TERN'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (2, 4), (4, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 28 — C R Y S T A L
    //
    // col:  0 1 2 3 4 5 6
    // row0: C R Y S T A L   ← CRYSTAL (H, isBonus)
    // row1: L           A
    // row2: A           C
    // row3: Y         C R Y
    // row4: S
    //
    // CLAYS (V,col0): C(0,0) L(1,0) A(2,0) Y(3,0) S(4,0)
    // TALC  (V,col4): T(0,4) A(1,4) L(2,4) C(3,4)
    // LACY  (V,col6): L(0,6) A(1,6) C(2,6) Y(3,6)
    // CRY   (H,row3): C(3,4) R(3,5) Y(3,6)  — shares C with TALC, Y with LACY
    // Cols 0,4,6 — all differ ≥2, no false adjacencies
    // -------------------------------------------------------------------------
    Level(
      id: 28,
      name: 'Crystal',
      letters: ['C', 'R', 'Y', 'S', 'T', 'A', 'L'],
      targetPlacements: [
        WordPlacement(
          word: 'CRYSTAL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'CLAYS',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TALC',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LACY',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CRY',
          startRow: 3,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACT', 'ACTS', 'ACYL', 'ACYLS', 'ALS', 'ALT', 'ALTS', 'ARC', 'ARCS', 'ARS', 'ART', 'ARTS', 'ARTSY', 'ARTY', 'ARYL', 'ARYLS', 'AYS', 'CAR', 'CARL', 'CARLS', 'CARS', 'CART', 'CARTS', 'CAST', 'CAT', 'CATS', 'CAY', 'CAYS', 'CLARY', 'CLAST', 'CLAY', 'CYST', 'LAC', 'LACS', 'LAR', 'LARS', 'LAS', 'LAST', 'LAT', 'LATS', 'LAY', 'LAYS', 'LYART', 'RACY', 'RAS', 'RAT', 'RATS', 'RAY', 'RAYS', 'RYA', 'RYAS', 'SAC', 'SAL', 'SALT', 'SALTY', 'SAT', 'SATYR', 'SAY', 'SCALY', 'SCAR', 'SCART', 'SCARY', 'SCAT', 'SCRY', 'SLAT', 'SLATY', 'SLAY', 'SLY', 'STAR', 'STAY', 'STRAY', 'STY', 'STYLAR', 'TALCS', 'TAR', 'TARS', 'TAS', 'TRAY', 'TRAYS', 'TRY', 'TSAR', 'YAR'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (2, 0), (3, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 29 — P L A S T I C
    //
    // col:  0 1 2 3 4 5 6
    // row0: P L A S T I C   ← PLASTIC (H, isBonus)
    // row1: L   L   A   L
    // row2: A   P   L   I
    // row3: I   S A C   P
    // row4: T           S
    //
    // PLAIT (V,col0): P(0,0) L(1,0) A(2,0) I(3,0) T(4,0)
    // ALPS  (V,col2): A(0,2) L(1,2) P(2,2) S(3,2)
    // TALC  (V,col4): T(0,4) A(1,4) L(2,4) C(3,4)
    // CLIPS (V,col6): C(0,6) L(1,6) I(2,6) P(3,6) S(4,6)
    // SAC   (H,row3): S(3,2) A(3,3) C(3,4)  — shares S with ALPS, C with TALC
    // -------------------------------------------------------------------------
    Level(
      id: 29,
      name: 'Plastic',
      letters: ['P', 'L', 'A', 'S', 'T', 'I', 'C'],
      targetPlacements: [
        WordPlacement(
          word: 'PLASTIC',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PLAIT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ALPS',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TALC',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CLIPS',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SAC',
          startRow: 3,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACT', 'ACTS', 'AIL', 'AILS', 'AIS', 'AIT', 'AITS', 'ALIST', 'ALIT', 'ALP', 'ALS', 'ALT', 'ALTS', 'APT', 'ASCI', 'ASP', 'ASPIC', 'CAP', 'CAPS', 'CAST', 'CAT', 'CATS', 'CIS', 'CIST', 'CLAP', 'CLAPS', 'CLAPT', 'CLASP', 'CLASPT', 'CLAST', 'CLIP', 'CLIPT', 'ITS', 'LAC', 'LACS', 'LAIC', 'LAICS', 'LAP', 'LAPIS', 'LAPS', 'LAS', 'LAST', 'LAT', 'LATI', 'LATS', 'LIP', 'LIPS', 'LIS', 'LISP', 'LIST', 'LIT', 'LITAS', 'LITS', 'PAC', 'PACS', 'PACT', 'PACTS', 'PAIL', 'PAILS', 'PAL', 'PALS', 'PAS', 'PAST', 'PASTIL', 'PAT', 'PATS', 'PIA', 'PIAL', 'PIAS', 'PIC', 'PICA', 'PICAL', 'PICAS', 'PICS', 'PIS', 'PIT', 'PITA', 'PITAS', 'PITS', 'PLAITS', 'PLAT', 'PLATS', 'PLICA', 'PSI', 'SAIL', 'SAL', 'SALIC', 'SALP', 'SALT', 'SAP', 'SAT', 'SATI', 'SCALP', 'SCAT', 'SIAL', 'SIC', 'SILT', 'SIP', 'SIT', 'SLAP', 'SLAT', 'SLIP', 'SLIPT', 'SLIT', 'SPA', 'SPAIL', 'SPAIT', 'SPAT', 'SPIC', 'SPICA', 'SPILT', 'SPIT', 'SPITAL', 'SPLAT', 'SPLIT', 'TAIL', 'TAILS', 'TALCS', 'TALI', 'TAP', 'TAPIS', 'TAPS', 'TAS', 'TIC', 'TICAL', 'TICALS', 'TICS', 'TIL', 'TILS', 'TIP', 'TIPS', 'TIS'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (3, 3), (4, 6)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 30 — B L A N K E T
    //
    // col:  0 1 2 3 4 5 6
    // row0: B L A N K E T   ← BLANKET (H, isBonus)
    // row1: L   N   N   E
    // row2: E L K   E T A
    // row3: A   L   L   K
    // row4: T   E   T
    //
    // BLEAT (V,col0): B(0,0) L(1,0) E(2,0) A(3,0) T(4,0)
    // ANKLE (V,col2): A(0,2) N(1,2) K(2,2) L(3,2) E(4,2)
    // KNELT (V,col4): K(0,4) N(1,4) E(2,4) L(3,4) T(4,4)
    // TEAK  (V,col6): T(0,6) E(1,6) A(2,6) K(3,6)
    // ELK   (H,row2): E(2,0) L(2,1) K(2,2)  — shares E with BLEAT, K with ANKLE
    // ETA   (H,row2): E(2,4) T(2,5) A(2,6)  — shares E with KNELT, A with TEAK
    // ELK ends at (2,2), ETA starts at (2,4) — differ by 2, not adjacent
    // -------------------------------------------------------------------------
    Level(
      id: 30,
      name: 'Blanket',
      letters: ['B', 'L', 'A', 'N', 'K', 'E', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'BLANKET',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BLEAT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANKLE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'KNELT',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TEAK',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ELK',
          startRow: 2,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
        WordPlacement(
          word: 'ETA',
          startRow: 2,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ABET', 'ABLE', 'ALB', 'ALE', 'ALT', 'ANE', 'ANKLET', 'ANT', 'ANTE', 'ATE', 'BAKE', 'BAL', 'BALE', 'BALK', 'BAN', 'BANE', 'BANK', 'BAT', 'BATE', 'BEAK', 'BEAN', 'BEAT', 'BEL', 'BELT', 'BEN', 'BENT', 'BET', 'BETA', 'BLAE', 'BLANK', 'BLAT', 'BLATE', 'BLEAK', 'BLENT', 'BLET', 'EAT', 'ELAN', 'ETNA', 'KAB', 'KAE', 'KALE', 'KANE', 'KAT', 'KEA', 'KEN', 'KENT', 'LAB', 'LAKE', 'LANE', 'LANK', 'LAT', 'LATE', 'LATEN', 'LATKE', 'LEA', 'LEAK', 'LEAN', 'LEANT', 'LEK', 'LENT', 'LET', 'NAB', 'NABE', 'NAE', 'NEAT', 'NEB', 'NET', 'TAB', 'TABLE', 'TAE', 'TAEL', 'TAKE', 'TAKEN', 'TALE', 'TALK', 'TAN', 'TANK', 'TEA', 'TEAL', 'TEL', 'TELA', 'TEN'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 1), (2, 1), (3, 6)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 31 — P R E S E N T  (two E's)
    //
    // PRESENT (H, row0): P(0,0) R(0,1) E(0,2) S(0,3) E(0,4) N(0,5) T(0,6)
    // PREEN   (V, col0): P(0,0) R(1,0) E(2,0) E(3,0) N(4,0)
    // RENTS   (V, col1): R(0,1) E(1,1) N(2,1) T(3,1) S(4,1)
    // STERN   (V, col3): S(0,3) T(1,3) E(2,3) R(3,3) N(4,3)
    // ENTERS  (V, col4): E(0,4) N(1,4) T(2,4) E(3,4) R(4,4) S(5,4)
    // SEEN    (H, row5): S(5,4) E(5,5) E(5,6) N(5,7)
    //
    // Intersections:
    //   PREEN  ∩ PRESENT: (0,0)=P ✓
    //   RENTS  ∩ PRESENT: (0,1)=R ✓
    //   STERN  ∩ PRESENT: (0,3)=S ✓
    //   ENTERS ∩ PRESENT: (0,4)=E ✓
    //   SEEN   ∩ ENTERS:  (5,4)=S ✓
    //
    // col: 0 1 2 3 4 5 6 7
    // row0: P R E S E N T
    // row1: R E   T N
    // row2: E N   E T
    // row3: E T   R E
    // row4: N S   N R
    // row5:       . S E E N
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 31 — P R E S E N T
    //
    // Letters: P, R, E, S, E, N, T  (E×2)
    // PRESENT (H, row0): P(0,0) R(0,1) E(0,2) S(0,3) E(0,4) N(0,5) T(0,6)
    // PEN     (V, col0): P(0,0) E(1,0) N(2,0)
    // RENT    (V, col1): R(0,1) E(1,1) N(2,1) T(3,1)
    // SET     (V, col3): S(0,3) E(1,3) T(2,3)
    // ENTER   (V, col4): E(0,4) N(1,4) T(2,4) E(3,4) R(4,4)   [E×2 ✓]
    // NEST    (V, col5): N(0,5) E(1,5) S(2,5) T(3,5)
    // TEN     (V, col6): T(0,6) E(1,6) N(2,6)
    // REP     (H, row4): R(4,4) E(4,5) P(4,6)   connected via ENTER
    //
    // col: 0 1 2 3 4 5 6
    // row0: P R E S E N T
    // row1: E E . E N E E
    // row2: N N . T T S N
    // row3:   T . . E T .
    // row4:         R E P
    // -------------------------------------------------------------------------
    Level(
      id: 31,
      name: 'Present',
      letters: ['P', 'R', 'E', 'S', 'E', 'N', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'PRESENT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PEN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RENT',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SET',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ENTER',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEST',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TEN',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'REP',
          startRow: 4,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ENS', 'ENTERS', 'ERE', 'ERN', 'ERNE', 'ERNES', 'ERNS', 'ERS', 'ERST', 'ESTER', 'NEE', 'NEEP', 'NEEPS', 'NERTS', 'NESTER', 'NET', 'NETS', 'PEE', 'PEEN', 'PEENS', 'PEER', 'PEERS', 'PEES', 'PENES', 'PENS', 'PENSTER', 'PENT', 'PER', 'PERSE', 'PERT', 'PES', 'PEST', 'PESTER', 'PET', 'PETER', 'PETERS', 'PETS', 'PREE', 'PREEN', 'PREENS', 'PREES', 'PRESE', 'PRESET', 'PREST', 'REE', 'REES', 'REEST', 'RENEST', 'RENTE', 'RENTES', 'RENTS', 'REPENT', 'REPENTS', 'REPS', 'RES', 'RESENT', 'RESET', 'REST', 'RET', 'RETE', 'RETS', 'SEE', 'SEEN', 'SEEP', 'SEER', 'SEN', 'SENE', 'SENT', 'SENTE', 'SEPT', 'SER', 'SERE', 'SERPENT', 'SNEER', 'SPEER', 'SPENT', 'SPREE', 'SPRENT', 'STEEP', 'STEER', 'STEP', 'STERE', 'STERN', 'STREP', 'TEE', 'TEEN', 'TEENS', 'TEES', 'TENS', 'TENSE', 'TENSER', 'TERN', 'TERNE', 'TERNES', 'TERNS', 'TERSE', 'TREE', 'TREEN', 'TREENS', 'TREES'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (2, 5), (4, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 32 — F R A G I L E
    //
    // FRAGILE (H, row0): F(0,0) R(0,1) A(0,2) G(0,3) I(0,4) L(0,5) E(0,6)
    // FLARE   (V, col0): F(0,0) L(1,0) A(2,0) R(3,0) E(4,0)
    // REGAL   (V, col1): R(0,1) E(1,1) G(2,1) A(3,1) L(4,1)
    // GRAIL   (V, col3): G(0,3) R(1,3) A(2,3) I(3,3) L(4,3)
    // LIFER   (V, col5): L(0,5) I(1,5) F(2,5) E(3,5) R(4,5)
    // GEAR    (H, row2): G(2,1) E(2,2) A(2,3) R(2,4)
    //
    // Intersections:
    //   FLARE ∩ FRAGILE: (0,0)=F ✓
    //   REGAL ∩ FRAGILE: (0,1)=R ✓
    //   GRAIL ∩ FRAGILE: (0,3)=G ✓
    //   LIFER ∩ FRAGILE: (0,5)=L ✓
    //   GEAR  ∩ REGAL:   (2,1)=G ✓
    //   GEAR  ∩ GRAIL:   (2,3)=A ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: F R A G I L E
    // row1: L E   R   I
    // row2: A G E A   F
    // row3: R A   I   E
    // row4: E L   L   R
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 32 — F R A G I L E
    //
    // Letters: F, R, A, G, I, L, E  (all unique)
    // FRAGILE (H, row0): F(0,0) R(0,1) A(0,2) G(0,3) I(0,4) L(0,5) E(0,6)
    // FIG     (V, col0): F(0,0) I(1,0) G(2,0)
    // RIG     (V, col1): R(0,1) I(1,1) G(2,1)
    // AIR     (V, col2): A(0,2) I(1,2) R(2,2)
    // GRAIL   (V, col3): G(0,3) R(1,3) A(2,3) I(3,3) L(4,3)
    // IRE     (V, col4): I(0,4) R(1,4) E(2,4)
    // LIFER   (V, col5): L(0,5) I(1,5) F(2,5) E(3,5) R(4,5)
    // EARL    (V, col6): E(0,6) A(1,6) R(2,6) L(3,6)
    // LIRE    (H, row4): L(4,3) I(4,4) R(4,5) E(4,6)   connected via GRAIL+LIFER
    //
    // Conflicts: (4,3): GRAIL[4]=L, LIRE[0]=L ✓  (4,5): LIFER[4]=R, LIRE[2]=R ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: F R A G I L E
    // row1: I I I R R I A
    // row2: G G R A E F R
    // row3:       I   E L
    // row4:       L I R E
    // -------------------------------------------------------------------------
    Level(
      id: 32,
      name: 'Fragile',
      letters: ['F', 'R', 'A', 'G', 'I', 'L', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'FRAGILE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'FIG',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RIG',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'AIR',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GRAIL',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'IRE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LIFER',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EARL',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LIRE',
          startRow: 4,
          startCol: 3,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AFIRE', 'AGE', 'AGER', 'AGILE', 'AIL', 'ALE', 'ALEF', 'ALIF', 'ARE', 'ARF', 'ARGIL', 'ARGLE', 'ARIEL', 'ARIL', 'EAR', 'EGAL', 'ELF', 'ERA', 'ERG', 'FAG', 'FAIL', 'FAIR', 'FAR', 'FARE', 'FARL', 'FARLE', 'FEAL', 'FEAR', 'FER', 'FERAL', 'FERIA', 'FERIAL', 'FIAR', 'FIE', 'FIL', 'FILA', 'FILAR', 'FILE', 'FILER', 'FIR', 'FIRE', 'FLAG', 'FLAIR', 'FLARE', 'FLEA', 'FLIER', 'FRAE', 'FRAG', 'FRAIL', 'FRIG', 'GAE', 'GAL', 'GALE', 'GAR', 'GEAR', 'GEL', 'GIE', 'GIRL', 'GLAIR', 'GLAIRE', 'GLARE', 'GLIA', 'GRIEF', 'ILEA', 'LAG', 'LAGER', 'LAIR', 'LAR', 'LARGE', 'LARI', 'LEA', 'LEAF', 'LEAR', 'LEG', 'LEI', 'LIAR', 'LIE', 'LIEF', 'LIER', 'LIFE', 'LIGER', 'LIRA', 'RAG', 'RAGE', 'RAGI', 'RAIL', 'RALE', 'REAL', 'REF', 'REG', 'REGAL', 'REI', 'REIF', 'RIA', 'RIAL', 'RIEL', 'RIF', 'RIFE', 'RIFLE', 'RILE'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 1), (2, 3), (4, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 33 — C O U R A G E
    //
    // COURAGE (H, row0): C(0,0) O(0,1) U(0,2) R(0,3) A(0,4) G(0,5) E(0,6)
    // CORE    (V, col0): C(0,0) O(1,0) R(2,0) E(3,0)
    // ROUGE   (V, col2): U(0,2) ... ROUGE=R,O,U,G,E. U at pos3, need R at row-3. Invalid.
    //   Use GRUEL — no L available. Use OCULAR — no L.
    //   OGRE (V, col1): O(0,1) G(1,1) R(2,1) E(3,1). OGRE=O,G,R,E ✓. Shares O(0,1) ✓.
    // ROGUE   (V, col3): R(0,3) O(1,3) G(2,3) U(3,3) E(4,3). ROGUE ✓. Shares R(0,3) ✓.
    // GRACE   (V, col5): G(0,5) R(1,5) A(2,5) C(3,5) E(4,5). GRACE ✓. Shares G(0,5) ✓.
    // GORE    (H, row2): G(2,1) ... wait (2,1)=R from OGRE.
    //   RACE (H, row2): R(2,0) A(2,1)? (2,1)=R from OGRE. Conflict.
    //   CURE (H, row3): C? (3,0)=E from CORE, (3,1)=E from OGRE. No C at row3.
    //   EURO (H, row4): E? (4,3)=E from ROGUE ✓. E(4,3)U(4,4)R(4,5)? (4,5)=E from GRACE. EURO[2]=R. Conflict.
    //   ACRE (H, row3): A? (3,3)=U from ROGUE. Conflict. (3,5)=C from GRACE. ACRE[0]=A. Conflict.
    //   CAGE (H, row3): C? (3,5)=C from GRACE ✓. C(3,5)A(3,6)G(3,7)... outside 7 cols.
    //   RACE (H, row2): R(2,5)=A from GRACE. Conflict.
    //   ORCA (H, row2): O? (2,0)=R from CORE. Conflict. (2,3)=G from ROGUE. Conflict.
    //   GREW (H) — no W.  GORE (H, row3, col1): G? (3,1)=E from OGRE. Conflict.
    //   GORE (H, row1): G? (1,1)=G from OGRE ✓. G(1,1)O(1,2)R(1,3)E(1,4). (1,3)=O from ROGUE. GORE[2]=R. Conflict.
    //   GORSE (H, row1): G(1,1)O(1,2)R(1,3)S(1,4)E(1,5). No S in letters. Conflict.
    //   ROUE (H, row1): R? (1,0)=O from CORE, (1,3)=O from ROGUE, (1,5)=R from GRACE ✓. R(1,5)O(1,6)U(1,7)... outside.
    //   RAGE (H, row2): R(2,0) from CORE ✓. R(2,0)A(2,1)G(2,2)E(2,3). (2,1)=R from OGRE. Conflict.
    //   ACRE (H, row2): A? (2,5)=A from GRACE ✓. A(2,5)C(2,6)R(2,7)... outside.
    //   RACE (H, row2, col5): R? (2,5)=A. Conflict. 5 words OK for L33.
    //
    // Intersections:
    //   CORE  ∩ COURAGE: (0,0)=C ✓
    //   OGRE  ∩ COURAGE: (0,1)=O ✓
    //   ROGUE ∩ COURAGE: (0,3)=R ✓
    //   GRACE ∩ COURAGE: (0,5)=G ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: C O U R A G E
    // row1: O G   O   R
    // row2: R R   G   A
    // row3: E E   U   C
    // row4:       E   E
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 33 — C O U R A G E
    //
    // Letters: C, O, U, R, A, G, E  (all unique)
    // COURAGE (H, row0): C(0,0) O(0,1) U(0,2) R(0,3) A(0,4) G(0,5) E(0,6)
    // COUGAR  (V, col0): C(0,0) O(1,0) U(2,0) G(3,0) A(4,0) R(5,0)
    // ORC     (V, col1): O(0,1) R(1,1) C(2,1)
    // UREA    (V, col2): U(0,2) R(1,2) E(2,2) A(3,2)
    // RACE    (V, col3): R(0,3) A(1,3) C(2,3) E(3,3)
    // ACE     (V, col4): A(0,4) C(1,4) E(2,4)
    // GRACE   (V, col5): G(0,5) R(1,5) A(2,5) C(3,5) E(4,5)
    // EAR     (V, col6): E(0,6) A(1,6) R(2,6)
    // RUG     (H, row5): R(5,0) U(5,1) G(5,2)   connected via COUGAR
    //
    // col: 0 1 2 3 4 5 6
    // row0: C O U R A G E
    // row1: O R R A C R A
    // row2: U C E C E A R
    // row3: G   A E   C
    // row4: A       . E
    // row5: R U G
    // -------------------------------------------------------------------------
    Level(
      id: 33,
      name: 'Courage',
      letters: ['C', 'O', 'U', 'R', 'A', 'G', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'COURAGE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'COUGAR',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ORC',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'UREA',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RACE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ACE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GRACE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EAR',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RUG',
          startRow: 5,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACRE', 'AERO', 'AERUGO', 'AGE', 'AGER', 'AGO', 'AGUE', 'ARC', 'ARCO', 'ARE', 'ARGUE', 'AUGER', 'CAGE', 'CAGER', 'CAR', 'CARE', 'CARGO', 'CERO', 'COG', 'COR', 'CORE', 'CRAG', 'CUE', 'CUR', 'CURE', 'EAU', 'ECRU', 'ECU', 'EGO', 'ERA', 'ERG', 'ERGO', 'ERUGO', 'EURO', 'GAE', 'GAR', 'GAUR', 'GEAR', 'GOA', 'GOER', 'GOR', 'GORE', 'GRUE', 'GUACO', 'GUAR', 'OAR', 'OCA', 'OCREA', 'OGRE', 'ORA', 'ORCA', 'ORE', 'OUR', 'RAG', 'RAGE', 'REC', 'REG', 'ROC', 'ROE', 'ROGUE', 'ROUE', 'ROUGE', 'RUE', 'RUGA', 'RUGAE', 'URGE'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 2), (3, 0), (5, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 34 — M I N E R A L
    //
    // MINERAL (H, row0): M(0,0) I(0,1) N(0,2) E(0,3) R(0,4) A(0,5) L(0,6)
    // MARE    (V, col0): M(0,0) A(1,0) R(2,0) E(3,0)
    // REIN    (V, col4): R(0,4) E(1,4) I(2,4) N(3,4)
    // ALIEN   (V, col5): A(0,5) L(1,5) I(2,5) E(3,5) N(4,5)
    // LINER   (V, col6): L(0,6) I(1,6) N(2,6) E(3,6) R(4,6)
    // RAIN    (H, row2): R(2,0) A(2,1) I(2,2) N(2,3)
    // EARN    (H, row3): E(3,0) A(3,1) R(3,2) N(3,3)
    //
    // Intersections:
    //   MARE  ∩ MINERAL: (0,0)=M ✓
    //   REIN  ∩ MINERAL: (0,4)=R ✓
    //   ALIEN ∩ MINERAL: (0,5)=A ✓
    //   LINER ∩ MINERAL: (0,6)=L ✓
    //   RAIN  ∩ MARE:    (2,0)=R ✓
    //   EARN  ∩ MARE:    (3,0)=E ✓
    //
    // Check (2,4): REIN col4 row2=I. RAIN ends at (2,3). No overlap. ✓
    // Check (3,4): REIN col4 row3=N. EARN ends at (3,3). No overlap. ✓
    // Check (3,5): ALIEN col5 row3=E. EARN ends at (3,3). No overlap. ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: M I N E R A L
    // row1: A       E L I
    // row2: R A I N I I N
    // row3: E A R N N E E
    // row4:         . N R
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 34 — M I N E R A L
    //
    // Letters: M, I, N, E, R, A, L  (all unique)
    // MINERAL (H, row0): M(0,0) I(0,1) N(0,2) E(0,3) R(0,4) A(0,5) L(0,6)
    // MARINE  (V, col0): M(0,0) A(1,0) R(2,0) I(3,0) N(4,0) E(5,0)
    // IRE     (V, col1): I(0,1) R(1,1) E(2,1)
    // NIL     (V, col2): N(0,2) I(1,2) L(2,2)
    // EARN    (V, col3): E(0,3) A(1,3) R(2,3) N(3,3)
    // REIN    (V, col4): R(0,4) E(1,4) I(2,4) N(3,4)
    // ALIEN   (V, col5): A(0,5) L(1,5) I(2,5) E(3,5) N(4,5)
    // LINER   (V, col6): L(0,6) I(1,6) N(2,6) E(3,6) R(4,6)
    // EAR     (H, row5): E(5,0) A(5,1) R(5,2)   connected via MARINE
    //
    // col: 0 1 2 3 4 5 6
    // row0: M I N E R A L
    // row1: A R I A E L I
    // row2: R E L R I I N
    // row3: I     N N E E
    // row4: N         N R
    // row5: E A R
    // -------------------------------------------------------------------------
    Level(
      id: 34,
      name: 'Mineral',
      letters: ['M', 'I', 'N', 'E', 'R', 'A', 'L'],
      targetPlacements: [
        WordPlacement(
          word: 'MINERAL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'MARINE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'IRE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIL',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EARN',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'REIN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ALIEN',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LINER',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EAR',
          startRow: 5,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AIL', 'AIM', 'AIMER', 'AIN', 'AIR', 'AIRMEN', 'AIRN', 'ALE', 'ALINE', 'ALINER', 'ALME', 'ALMNER', 'AMEN', 'AMI', 'AMIE', 'AMIN', 'AMINE', 'AMIR', 'ANE', 'ANI', 'ANIL', 'ANILE', 'ANIME', 'ARE', 'ARIEL', 'ARIL', 'ARM', 'EARL', 'ELAIN', 'ELAN', 'ELM', 'EMIR', 'ERA', 'ERN', 'ILEA', 'INARM', 'LAIN', 'LAIR', 'LAM', 'LAME', 'LAMER', 'LANE', 'LAR', 'LARI', 'LARINE', 'LEA', 'LEAN', 'LEAR', 'LEARN', 'LEI', 'LEMAN', 'LIANE', 'LIAR', 'LIE', 'LIEN', 'LIER', 'LIMA', 'LIMAN', 'LIME', 'LIMEN', 'LIMN', 'LIMNER', 'LIN', 'LINE', 'LINEAR', 'LIRA', 'LIRE', 'MAE', 'MAIL', 'MAILE', 'MAILER', 'MAIN', 'MAIR', 'MALE', 'MALINE', 'MAN', 'MANE', 'MANLIER', 'MAR', 'MARE', 'MARL', 'MARLIN', 'MARLINE', 'MEAL', 'MEAN', 'MEL', 'MEN', 'MENIAL', 'MERL', 'MERLIN', 'MIEN', 'MIL', 'MILE', 'MILER', 'MINA', 'MINAE', 'MINE', 'MINER', 'MIR', 'MIRE', 'NAE', 'NAIL', 'NAILER', 'NAM', 'NAME', 'NAMER', 'NEAR', 'NEMA', 'NIM', 'RAIL', 'RAIN', 'RALE', 'RAM', 'RAMI', 'RAMIE', 'RAN', 'RANI', 'REAL', 'REALM', 'REAM', 'REI', 'REM', 'REMAIL', 'REMAIN', 'REMAN', 'RENAIL', 'RENAL', 'RIA', 'RIAL', 'RIEL', 'RILE', 'RIM', 'RIME', 'RIN'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 5), (5, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 35 — M A C H I N E
    //
    // MACHINE (H, row0): M(0,0) A(0,1) C(0,2) H(0,3) I(0,4) N(0,5) E(0,6)
    // MANE    (V, col0): M(0,0) A(1,0) N(2,0) E(3,0)
    // INCH    (V, col4): I(0,4) N(1,4) C(2,4) H(3,4)
    // NICHE   (V, col5): N(0,5) I(1,5) C(2,5) H(3,5) E(4,5)
    // EACH    (V, col6): E(0,6) A(1,6) C(2,6) H(3,6)
    // ACNE    (H, row1): A(1,0) C(1,1) N(1,2) E(1,3)
    // NICE    (H, row2): N(2,0) I(2,1) C(2,2) E(2,3)
    //
    // Intersections:
    //   MANE  ∩ MACHINE: (0,0)=M ✓
    //   INCH  ∩ MACHINE: (0,4)=I ✓
    //   NICHE ∩ MACHINE: (0,5)=N ✓
    //   EACH  ∩ MACHINE: (0,6)=E ✓
    //   ACNE  ∩ MANE:    (1,0)=A ✓
    //   NICE  ∩ MANE:    (2,0)=N ✓
    //
    // Check (1,4): INCH col4 row1=N. ACNE ends at (1,3). No overlap. ✓
    // Check (2,4): INCH col4 row2=C. NICE ends at (2,3). No overlap. ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: M A C H I N E
    // row1: A C N E N I A
    // row2: N I C E C C C
    // row3: E       H H H
    // row4:           E
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 35 — M A C H I N E
    //
    // Letters: M, A, C, H, I, N, E  (all unique)
    // MACHINE (H, row0): M(0,0) A(0,1) C(0,2) H(0,3) I(0,4) N(0,5) E(0,6)
    // MANIC   (V, col0): M(0,0) A(1,0) N(2,0) I(3,0) C(4,0)
    // ACE     (V, col1): A(0,1) C(1,1) E(2,1)
    // CAN     (V, col2): C(0,2) A(1,2) N(2,2)
    // HEM     (V, col3): H(0,3) E(1,3) M(2,3)
    // ICE     (V, col4): I(0,4) C(1,4) E(2,4)
    // NICHE   (V, col5): N(0,5) I(1,5) C(2,5) H(3,5) E(4,5)
    // EACH    (V, col6): E(0,6) A(1,6) C(2,6) H(3,6)
    // CAME    (H, row4): C(4,0) A(4,1) M(4,2) E(4,3)   connected via MANIC
    //
    // Conflict: (4,0): MANIC[4]=C, CAME[0]=C ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: M A C H I N E
    // row1: A C A E C I A
    // row2: N E N M E C C
    // row3: I       . H H
    // row4: C A M E . E .
    // -------------------------------------------------------------------------
    Level(
      id: 35,
      name: 'Machine',
      letters: ['M', 'A', 'C', 'H', 'I', 'N', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'MACHINE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'MANIC',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ACE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CAN',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'HEM',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ICE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NICHE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EACH',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CAME',
          startRow: 4,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACHE', 'ACME', 'ACNE', 'AHEM', 'AIM', 'AIN', 'AMEN', 'AMI', 'AMICE', 'AMIE', 'AMIN', 'AMINE', 'AMNIC', 'ANE', 'ANEMIC', 'ANI', 'ANIME', 'CAIN', 'CAM', 'CANE', 'CHAIN', 'CHAINE', 'CHAM', 'CHI', 'CHIA', 'CHIME', 'CHIN', 'CHINA', 'CHINE', 'CINE', 'CINEMA', 'EMIC', 'HAE', 'HAEM', 'HAEMIC', 'HAEMIN', 'HAEN', 'HAM', 'HAME', 'HANCE', 'HEMIC', 'HEMIN', 'HEN', 'HIC', 'HIE', 'HIM', 'HIN', 'ICEMAN', 'ICH', 'INCH', 'MAC', 'MACE', 'MACH', 'MACHE', 'MAE', 'MAIN', 'MAN', 'MANCHE', 'MANE', 'MEAN', 'MEN', 'MICA', 'MICE', 'MICHE', 'MIEN', 'MINA', 'MINAE', 'MINCE', 'MINE', 'NAE', 'NAH', 'NAM', 'NAME', 'NEMA', 'NICE', 'NIM'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 3), (2, 4), (4, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 36 — S T R A N G E
    //
    // STRANGE (H, row0): S(0,0) T(0,1) R(0,2) A(0,3) N(0,4) G(0,5) E(0,6)
    // STERN   (V, col0): S(0,0) T(1,0) E(2,0) R(3,0) N(4,0)
    // TEARS   (V, col1): T(0,1) E(1,1) A(2,1) R(3,1) S(4,1)
    // ANGER   (V, col4): N(0,4) ... ANGER=A,N,G,E,R. N at pos2->A at row-2. Invalid.
    //   RANGE (V, col4): N(0,4)... RANGE=R,A,N,G,E. N at pos3->R at row-3. Invalid.
    //   ANGEL (V, col5): G(0,5)... ANGEL=A,N,G,E,L. No L in letters. Conflict.
    //   ANGER (V, col5): G(0,5)... ANGER=A,N,G,E,R. G at pos3->A at row-3. Invalid.
    //   GRANT (V, col3): A(0,3) G(1,3) R(2,3) A(3,3) N(4,3) T(5,3). Needs 2 A's. Only 1 A. Conflict.
    //   GREET — no second E. SNARE (V, col3): A(0,3) ... SNARE=S,N,A,R,E. A at pos3->S at row-3. Invalid.
    //   ANGER starting at col5: G(0,5)R(1,5)... ANGER[0]=A not G. Conflict.
    //   RANGE starting at col4: N(0,4)... RANGE[0]=R not N. Conflict.
    //   ANGER starting at col2: R(0,2)... ANGER[0]=A. Conflict.
    //   CRANE (V, col2): R(0,2) A? CRANE=C,R,A,N,E. No C. Conflict with letters.
    //   STERN (V, col0) already placed. RENTS (V, col1)—already TEARS.
    //   GREAT (V, col5): G(0,5)R(1,5)E(2,5)A(3,5)T(4,5). GREAT=G,R,E,A,T ✓. Shares G(0,5) ✓.
    //   ENTER (V, col6): E(0,6)N(1,6)T(2,6)E(3,6)R(4,6). Needs 2 E's. Letters have 1 E. Conflict.
    //   SNARE (V, col3): A(0,3)... SNARE[0]=S not A. Conflict.
    //   GRANT (V, col3): A(0,3) uses 2 A's. Conflict.
    //   RANT  (V, col3): A(0,3) R? RANT=R,A,N,T. A at pos2->R at row-2. Invalid.
    //   ANTE  (V, col3): A(0,3) N(1,3) T(2,3) E(3,3). ANTE=A,N,T,E ✓. Shares A(0,3) ✓.
    //   RATER (V, col4): N(0,4)... RATER[0]=R not N. Conflict.
    //   NEARS (V, col4): N(0,4) E(1,4) A(2,4) R(3,4) S(4,4). NEARS=N,E,A,R,S ✓. Shares N(0,4) ✓.
    //   GENRE (V, col6): E(0,6) ... GENRE=G,E,N,R,E. Needs 2 E's. Conflict.
    //   EGRET (V, col6): E(0,6) G(1,6) R(2,6) E(3,6) T(4,6). Needs 2 E's. Conflict.
    //   EAGER — 2 E's. EATER — 2 E's.
    //   STERN: S(0,0)T(1,0)E(2,0)R(3,0)N(4,0). Shares S(0,0) ✓. STERN ✓.
    //   TEARS: T(0,1)E(1,1)A(2,1)R(3,1)S(4,1). Shares T(0,1) ✓. TEARS ✓.
    //   ANTE:  A(0,3)N(1,3)T(2,3)E(3,3). Shares A(0,3) ✓.
    //   NEARS: N(0,4)E(1,4)A(2,4)R(3,4)S(4,4). Shares N(0,4) ✓.
    //   GREAT: G(0,5)R(1,5)E(2,5)A(3,5)T(4,5). Shares G(0,5) ✓.
    //   H-connector: RANT (H, row1): R? (1,0)=T from STERN. Conflict.
    //   NEAR (H, row2): N? (2,0)=E from STERN,(2,1)=A from TEARS,(2,3)=T from ANTE,(2,4)=A from NEARS,(2,5)=E from GREAT.
    //     NEAR[0]=N. No N at row2 except (2,4)=A. Conflict.
    //   EARN (H, row3): E? (3,0)=R from STERN,(3,1)=R from TEARS,(3,3)=E from ANTE ✓,(3,4)=R from NEARS,(3,5)=A from GREAT.
    //     EARN[0]=E. (3,3)=E from ANTE ✓. E(3,3)A(3,4)? (3,4)=R from NEARS. Conflict.
    //   ERAS (H, row4): E? (4,0)=N from STERN,(4,1)=S from TEARS,(4,4)=S from NEARS,(4,5)=T from GREAT. No E at row4.
    //   RENT (H, row3): R? (3,0)=R from STERN ✓. R(3,0)E(3,1)? (3,1)=R from TEARS. Conflict.
    //   RANT (H, row3): R(3,0)A(3,1)? (3,1)=R from TEARS. Conflict.
    //   STAR (H, row4): S? (4,1)=S from TEARS ✓. S(4,1)T(4,2)A(4,3)R(4,4)? (4,4)=S from NEARS. STAR[3]=R not S. Conflict.
    //   RATS (H, row4): R? (4,0)=N. Conflict.
    //   ANTS (H, row2): A? (2,1)=A from TEARS ✓. A(2,1)N(2,2)T(2,3)? (2,3)=T from ANTE ✓ shared! A(2,1)N(2,2)T(2,3)S(2,4)? (2,4)=A from NEARS. ANTS[3]=S not A. Conflict.
    //   ANTS ends at (2,3). 4 letters: (2,1)(2,2)(2,3)(2,4). (2,3)=T from ANTE ✓ and (2,4)=A from NEARS. ANTS[3]=S. A≠S. Conflict.
    //   RANT (H, row2, col1): R? (2,1)=A from TEARS. Conflict.
    //   TANS (H, row2): T? (2,3)=T from ANTE ✓. T(2,3)A(2,4)? (2,4)=A from NEARS ✓ shared. T(2,3)A(2,4)N(2,5)? (2,5)=E from GREAT. TAN[2]=N. E≠N. Conflict.
    //   SEAT (H, row4): S? (4,1)=S from TEARS ✓. S(4,1)E(4,2)A(4,3)T(4,4)? (4,4)=S from NEARS. SEAT[3]=T. S≠T. Conflict.
    //   6 words OK for level 36 (STRANGE+STERN+TEARS+ANTE+NEARS+GREAT).
    //
    // Intersections:
    //   STERN ∩ STRANGE: (0,0)=S ✓
    //   TEARS ∩ STRANGE: (0,1)=T ✓
    //   ANTE  ∩ STRANGE: (0,3)=A ✓
    //   NEARS ∩ STRANGE: (0,4)=N ✓
    //   GREAT ∩ STRANGE: (0,5)=G ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: S T R A N G E
    // row1: T E   N E R
    // row2: E A   T A E
    // row3: R R   E R A
    // row4: N S   . S T
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 36 — S T R A N G E
    //
    // Letters: S, T, R, A, N, G, E  (all unique)
    // STRANGE (H, row0): S(0,0) T(0,1) R(0,2) A(0,3) N(0,4) G(0,5) E(0,6)
    // SAGE    (V, col0): S(0,0) A(1,0) G(2,0) E(3,0)
    // TERN    (V, col1): T(0,1) E(1,1) R(2,1) N(3,1)
    // RAN     (V, col2): R(0,2) A(1,2) N(2,2)
    // ANTE    (V, col3): A(0,3) N(1,3) T(2,3) E(3,3)
    // NEARS   (V, col4): N(0,4) E(1,4) A(2,4) R(3,4) S(4,4)
    // GARNET  (V, col5): G(0,5) A(1,5) R(2,5) N(3,5) E(4,5) T(5,5)
    // EAR     (V, col6): E(0,6) A(1,6) R(2,6)
    // SEA     (H, row4): S(4,4) E(4,5) A(4,6)   connected via NEARS+GARNET
    //
    // Conflicts: (4,4): NEARS[4]=S, SEA[0]=S ✓  (4,5): GARNET[4]=E, SEA[1]=E ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: S T R A N G E
    // row1: A E A N E A A
    // row2: G R N T A R R
    // row3: E N   E R N
    // row4:         S E A
    // row5:           T
    // -------------------------------------------------------------------------
    Level(
      id: 36,
      name: 'Strange',
      letters: ['S', 'T', 'R', 'A', 'N', 'G', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'STRANGE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SAGE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TERN',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RAN',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANTE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEARS',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GARNET',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EAR',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SEA',
          startRow: 4,
          startCol: 4,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AGE', 'AGENT', 'AGENTS', 'AGER', 'AGERS', 'AGES', 'ANE', 'ANES', 'ANGER', 'ANGERS', 'ANGST', 'ANT', 'ANTES', 'ANTRE', 'ANTRES', 'ANTS', 'ARE', 'ARES', 'ARGENT', 'ARGENTS', 'ARS', 'ARSE', 'ART', 'ARTS', 'ASTER', 'ASTERN', 'ATE', 'ATES', 'EARN', 'EARNS', 'EARS', 'EAST', 'EAT', 'EATS', 'ENG', 'ENGS', 'ENS', 'ERA', 'ERAS', 'ERG', 'ERGS', 'ERN', 'ERNS', 'ERS', 'ERST', 'ETA', 'ETAS', 'ETNA', 'ETNAS', 'GAE', 'GAEN', 'GAES', 'GAN', 'GANE', 'GAR', 'GARNETS', 'GARS', 'GAS', 'GAST', 'GASTER', 'GAT', 'GATE', 'GATES', 'GATS', 'GEAR', 'GEARS', 'GEN', 'GENS', 'GENT', 'GENTS', 'GEST', 'GET', 'GETA', 'GETAS', 'GETS', 'GNAR', 'GNARS', 'GNAT', 'GNATS', 'GRAN', 'GRANS', 'GRANT', 'GRANTS', 'GRAT', 'GRATE', 'GRATES', 'GREAT', 'GREATS', 'NAE', 'NAG', 'NAGS', 'NARES', 'NATES', 'NEAR', 'NEAT', 'NEATS', 'NERTS', 'NEST', 'NET', 'NETS', 'RAG', 'RAGE', 'RAGES', 'RAGS', 'RANG', 'RANGE', 'RANGES', 'RANT', 'RANTS', 'RAS', 'RASE', 'RAT', 'RATE', 'RATES', 'RATS', 'REG', 'REGNA', 'REGS', 'RENT', 'RENTS', 'RES', 'REST', 'RET', 'RETAG', 'RETAGS', 'RETS', 'SAE', 'SAG', 'SAGER', 'SANE', 'SANER', 'SANG', 'SANGER', 'SARGE', 'SAT', 'SATE', 'SEAR', 'SEAT', 'SEG', 'SEN', 'SENT', 'SER', 'SERA', 'SET', 'SETA', 'SNAG', 'SNARE', 'STAG', 'STAGE', 'STAGER', 'STANE', 'STANG', 'STAR', 'STARE', 'STERN', 'STERNA', 'STRANG', 'TAE', 'TAG', 'TAGS', 'TAN', 'TANG', 'TANGS', 'TANS', 'TAR', 'TARE', 'TARES', 'TARGE', 'TARGES', 'TARN', 'TARNS', 'TARS', 'TAS', 'TEA', 'TEAR', 'TEARS', 'TEAS', 'TEG', 'TEGS', 'TEN', 'TENS', 'TERGA', 'TERNS', 'TRANS', 'TSAR'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 2), (3, 5), (5, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 37 — O R G A N I C
    //
    // ORGANIC (H, row0): O(0,0) R(0,1) G(0,2) A(0,3) N(0,4) I(0,5) C(0,6)
    // GROAN   (V, col2): G(0,2) R(1,2) O(2,2) A(3,2) N(4,2). GROAN ✓. Shares G(0,2) ✓.
    // ARCING  (V, col3): A(0,3) R(1,3) C(2,3) I(3,3) N(4,3) G(5,3). ARCING ✓. Shares A(0,3) ✓.
    // CARING  (V, col6): C(0,6) A(1,6) R(2,6) I(3,6) N(4,6) G(5,6). CARING ✓. Shares C(0,6) ✓.
    // RACON   — needs 2nd letter set. Use ROAM — no M.
    // ACING (H, row2): A? (2,2)=O from GROAN, (2,3)=C from ARCING, (2,6)=R from CARING. No A at row2.
    // CORN  (H, row2): C? (2,3)=C from ARCING ✓. C(2,3)O(2,4)R(2,5)N(2,6)? (2,6)=R from CARING. CORN[3]=N. R≠N. Conflict.
    // COIN  (H, row3): C? (3,3)=I from ARCING. Conflict.
    // ROAN  (H, row3): R? (3,2)=A from GROAN, (3,3)=I from ARCING, (3,6)=I from CARING. No R at row3.
    // NARC  (H, row4): N? (4,2)=N from GROAN ✓. N(4,2)A(4,3)? (4,3)=N from ARCING. Conflict.
    // RING  (H, row4): R? (4,2)=N from GROAN, (4,3)=N from ARCING, (4,6)=N from CARING. No R at row4.
    // ICON  (H, row3): I? (3,3)=I from ARCING ✓. I(3,3)C(3,4)O(3,5)N(3,6). (3,6)=I from CARING. ICON[3]=N. I≠N. Conflict.
    // ORCA  (H, row1): O? (1,2)=R from GROAN, (1,3)=R from ARCING, (1,6)=A from CARING. No O at row1.
    //   (1,0) empty, (1,1) empty. Not connected at row1, col0-1.
    // RAIN  (H, row1, connected via col1 from ORGANIC[1]=R):
    //   (0,1)=R from ORGANIC. No vertical at col1.
    //   RAIN (V, col1): R(0,1)A(1,1)I(2,1)N(3,1). RAIN=R,A,I,N ✓. Shares R(0,1) ✓.
    //   Now with RAIN at col1:
    //   RAIN (H row not V): use as another vertical.
    //
    // Add RAIN (V, col1): R(0,1)A(1,1)I(2,1)N(3,1). Shares R(0,1) ✓.
    // GRAIN (H, row3): G? (3,2)=A from GROAN, (3,3)=I from ARCING, (3,1)=N from RAIN. No G at row3.
    // GRAIN (H, row1): G? (1,2)=R from GROAN, (1,3)=R from ARCING, (1,1)=A from RAIN. No G at row1.
    // NARC  (H, row3): N? (3,1)=N from RAIN ✓. N(3,1)A(3,2)? (3,2)=A from GROAN ✓ shared!
    //   N(3,1)A(3,2)R(3,3)? (3,3)=I from ARCING. NARC[2]=R. I≠R. Conflict.
    // NARC at (3,1)-(3,4): N(3,1)A(3,2)R(3,3)C(3,4). (3,3)=I. Conflict.
    // RAIN (H, row3): R? (3,6)=I from CARING. No R at row3.
    // ORGAN (H, row1): O? (1,2)=R from GROAN. Conflict. (1,0)(1,1)=empty,A from RAIN. No O.
    // ACORN (H, row3): A? (3,2)=A from GROAN ✓. A(3,2)C(3,3)? (3,3)=I from ARCING. Conflict.
    // ROAN (H, row4): R? (4,2)=N from GROAN. Conflict.
    // OARING (H, row2): O? (2,2)=O from GROAN ✓. O(2,2)A(2,3)? (2,3)=C from ARCING. Conflict.
    // INCAR — not a word.
    // GANG — 2 G's.
    // NAIRU — not a word.
    // ROARING — 2 R's.
    // 6 words: ORGANIC + RAIN + GROAN + ARCING + CARING = 5. Need one more.
    // CROWN — no W. CORGI (V, col0): O(0,0)... CORGI=C,O,R,G,I. O at pos2->C at row-2. Invalid.
    // MINOR — no M. GORING (V, col5): I(0,5)... GORING=G,O,R,I,N,G. 2 G's needed. Conflict.
    // IONIC (V, col5): I(0,5)O(1,5)N(2,5)I(3,5)C(4,5). 2 I's needed. Conflict.
    // GROIN (V, col5): I(0,5)... GROIN=G,R,O,I,N. I at pos4->G at row-4. Invalid.
    //   Cross I(0,5): GROIN[3]=I->G at row-3. Invalid.
    // ICON (V, col5): I(0,5)C(1,5)O(2,5)N(3,5). ICON=I,C,O,N ✓. Shares I(0,5) ✓.
    //   Now ICON at col5: 4 verticals from row0 + RAIN + GROAN.
    //   Add H-connector: COIN (H, row2): C? (2,2)=O from GROAN, (2,3)=C from ARCING ✓, (2,5)=O from ICON. Conflict.
    //   CORN (H, row2): C(2,3) from ARCING ✓. C(2,3)O(2,4)R(2,5)? (2,5)=O from ICON. CORN[2]=R. O≠R. Conflict.
    //   COIN (H, row1): C? (1,2)=R, (1,3)=R, (1,5)=C from ICON ✓. C(1,5)O(1,6)? (1,6)=A from CARING. COIN[1]=O. A≠O. Conflict.
    //   NOIR (H, row3): N? (3,1)=N from RAIN ✓. N(3,1)O(3,2)? (3,2)=A from GROAN. Conflict.
    //   IRON (H, row3): I? (3,3)=I from ARCING ✓. I(3,3)R(3,4)O(3,5)N(3,6). (3,6)=I from CARING. IRON[3]=N. I≠N. Conflict.
    //   7 words if we keep 5+ICON but struggle to connect ICON. ICON at col5 only shares (0,5)=I with ORGANIC. Fine.
    //
    // FINAL Level 37: ORGANIC + RAIN + GROAN + ARCING + ICON + CARING = 6 words
    //
    // Intersections:
    //   RAIN   ∩ ORGANIC: (0,1)=R ✓
    //   GROAN  ∩ ORGANIC: (0,2)=G ✓
    //   ARCING ∩ ORGANIC: (0,3)=A ✓
    //   ICON   ∩ ORGANIC: (0,5)=I ✓
    //   CARING ∩ ORGANIC: (0,6)=C ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: O R G A N I C
    // row1: . A R R   C A
    // row2: . I O C   O R
    // row3: . N A I   N I
    // row4:   . N N   . N
    // row5:     . G   . G
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 37 — O R G A N I C
    //
    // Letters: O, R, G, A, N, I, C  (all unique)
    // ORGANIC (H, row0): O(0,0) R(0,1) G(0,2) A(0,3) N(0,4) I(0,5) C(0,6)
    // ORC     (V, col0): O(0,0) R(1,0) C(2,0)
    // RIG     (V, col1): R(0,1) I(1,1) G(2,1)
    // GIN     (V, col2): G(0,2) I(1,2) N(2,2)
    // ARCING  (V, col3): A(0,3) R(1,3) C(2,3) I(3,3) N(4,3) G(5,3)
    // NAG     (V, col4): N(0,4) A(1,4) G(2,4)
    // ICON    (V, col5): I(0,5) C(1,5) O(2,5) N(3,5)
    // CORGI   (V, col6): C(0,6) O(1,6) R(2,6) G(3,6) I(4,6)
    // NOR     (H, row4): N(4,3) O(4,4) R(4,5)   connected via ARCING
    //
    // Conflict: (4,3): ARCING[4]=N, NOR[0]=N ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: O R G A N I C
    // row1: R I I R A C O
    // row2: C G N C G O R
    // row3:       I   N G
    // row4:       N O R I
    // row5:       G
    // -------------------------------------------------------------------------
    Level(
      id: 37,
      name: 'Organic',
      letters: ['O', 'R', 'G', 'A', 'N', 'I', 'C'],
      targetPlacements: [
        WordPlacement(
          word: 'ORGANIC',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'ORC',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RIG',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GIN',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ARCING',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NAG',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ICON',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CORGI',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NOR',
          startRow: 4,
          startCol: 3,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACING', 'ACORN', 'AGIN', 'AGIO', 'AGO', 'AGON', 'AGONIC', 'AIN', 'AIR', 'AIRN', 'ANI', 'ARC', 'ARCO', 'ARGON', 'CAIN', 'CAIRN', 'CAN', 'CAR', 'CARGO', 'CARING', 'CARN', 'CIAO', 'CIGAR', 'CION', 'COG', 'COIGN', 'COIN', 'COIR', 'CON', 'CONGA', 'CONI', 'COR', 'CORIA', 'CORING', 'CORN', 'CRAG', 'GAIN', 'GAN', 'GAR', 'GARCON', 'GARNI', 'GIRN', 'GIRO', 'GIRON', 'GNAR', 'GOA', 'GONIA', 'GOR', 'GRAIN', 'GRAN', 'GRIN', 'GROAN', 'GROIN', 'INCOG', 'INRO', 'ION', 'IRON', 'NAOI', 'NARC', 'NARCO', 'NARIC', 'NOG', 'NOIR', 'NORI', 'NORIA', 'OAR', 'OARING', 'OCA', 'ONAGRI', 'ORA', 'ORANG', 'ORCA', 'ORCIN', 'ORGAN', 'ORGIAC', 'ORGIC', 'ORIGAN', 'RACING', 'RACON', 'RAG', 'RAGI', 'RAIN', 'RAN', 'RANG', 'RANI', 'RIA', 'RIN', 'RING', 'ROAN', 'ROC'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 4), (3, 3), (5, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 38 — V E N T U R E  (two E's)
    //
    // VENTURE (H, row0): V(0,0) E(0,1) N(0,2) T(0,3) U(0,4) R(0,5) E(0,6)
    // VENT    (V, col0): V(0,0) E(1,0) N(2,0) T(3,0). Shares V(0,0) ✓.
    // ENTER   (V, col1): E(0,1) N(1,1) T(2,1) E(3,1) R(4,1). Needs 2 E's ✓. Shares E(0,1) ✓.
    // RUNE    (V, col5): R(0,5) U(1,5) N(2,5) E(3,5). Shares R(0,5) ✓.
    // RETUNE  (V, col6): E(0,6) R(1,6) T(2,6) U(3,6) N(4,6) E(5,6). Needs 2 E's ✓. Shares E(0,6) ✓.
    // TRUE    (H, row2): T(2,1) R(2,2) U(2,3) E(2,4). (2,1)=T from ENTER ✓. Ends at (2,4). (2,5)=N from RUNE. No conflict. ✓.
    //
    // Intersections:
    //   VENT   ∩ VENTURE: (0,0)=V ✓
    //   ENTER  ∩ VENTURE: (0,1)=E ✓
    //   RUNE   ∩ VENTURE: (0,5)=R ✓
    //   RETUNE ∩ VENTURE: (0,6)=E ✓
    //   TRUE   ∩ ENTER:   (2,1)=T ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: V E N T U R E
    // row1: E N   . . U R
    // row2: N T R U E N T
    // row3: T E   . . E U
    // row4:   R   . . . N
    // row5:   .   . . . E
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 38 — V E N T U R E
    //
    // Letters: V, E, N, T, U, R, E  (E×2)
    // VENTURE (H, row0): V(0,0) E(0,1) N(0,2) T(0,3) U(0,4) R(0,5) E(0,6)
    // VET     (V, col0): V(0,0) E(1,0) T(2,0)
    // ENTER   (V, col1): E(0,1) N(1,1) T(2,1) E(3,1) R(4,1)   [E×2 ✓]
    // NEUTER  (V, col2): N(0,2) E(1,2) U(2,2) T(3,2) E(4,2) R(5,2)   [E×2 ✓]
    // TERN    (V, col3): T(0,3) E(1,3) R(2,3) N(3,3)
    // URN     (V, col4): U(0,4) R(1,4) N(2,4)
    // RUNE    (V, col5): R(0,5) U(1,5) N(2,5) E(3,5)
    // ERN     (V, col6): E(0,6) R(1,6) N(2,6)
    // RENT    (H, row4): R(4,1) E(4,2) N(4,3) T(4,4)   connected via ENTER+NEUTER
    //
    // Conflicts: (4,1): ENTER[4]=R, RENT[0]=R ✓  (4,2): NEUTER[4]=E, RENT[1]=E ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: V E N T U R E
    // row1: E N E E R U R
    // row2: T T U R N N N
    // row3:   E T N   E
    // row4:   R E N T
    // row5:     R
    // -------------------------------------------------------------------------
    Level(
      id: 38,
      name: 'Venture',
      letters: ['V', 'E', 'N', 'T', 'U', 'R', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'VENTURE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'VET',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ENTER',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NEUTER',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TERN',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'URN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RUNE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ERN',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RENT',
          startRow: 4,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ENURE', 'ERE', 'ERNE', 'EVE', 'EVEN', 'EVENT', 'EVER', 'EVERT', 'NEE', 'NERVE', 'NET', 'NEVE', 'NEVER', 'NUT', 'REE', 'RENTE', 'RET', 'RETE', 'RETUNE', 'REV', 'REVET', 'REVUE', 'RUE', 'RUN', 'RUNT', 'RUT', 'TEE', 'TEEN', 'TEN', 'TENURE', 'TERNE', 'TREE', 'TREEN', 'TRUE', 'TUN', 'TUNE', 'TUNER', 'TUREEN', 'TURN', 'VEE', 'VEER', 'VENT', 'VENTER', 'VENUE', 'VERT', 'VERTU'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 4), (3, 5), (5, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 39 — E C L I P S E  (two E's)
    //
    // ECLIPSE (H, row0): E(0,0) C(0,1) L(0,2) I(0,3) P(0,4) S(0,5) E(0,6)
    // EPICS   (V, col0): E(0,0) P(1,0) I(2,0) C(3,0) S(4,0). Shares E(0,0) ✓.
    // SLICE   (V, col1): C(0,1) ... SLICE=S,L,I,C,E. C at pos4->S at row-4. Invalid.
    //   CEILS: C,E,I,L,S. C(0,1)E(1,1)I(2,1)L(3,1)S(4,1). Obscure. Skip.
    //   SINCE — no N. SPLICE — needs 2nd letter.
    //   CLIPS  (V, col1): C(0,1) L(1,1) I(2,1) P(3,1) S(4,1). CLIPS=C,L,I,P,S ✓. Shares C(0,1) ✓.
    // ICES    (V, col3): I(0,3) C(1,3) E(2,3) S(3,3). ICES ✓. Shares I(0,3) ✓.
    // PILES   (V, col4): P(0,4) I(1,4) L(2,4) E(3,4) S(4,4). PILES ✓. Shares P(0,4) ✓.
    // SLEEP   (V, col5): S(0,5) L(1,5) E(2,5) E(3,5) P(4,5). Needs 2 E's ✓. SLEEP ✓. Shares S(0,5) ✓.
    // LICE    (H, row2): L? (2,1)=I from CLIPS, (2,4)=L from PILES ✓. L(2,4)I(2,5)? (2,5)=E from SLEEP. Conflict.
    //   PILE (H, row3): P? (3,1)=P from CLIPS ✓. P(3,1)I(3,2)L(3,3)? (3,3)=S from ICES. Conflict.
    //   SLIP (H, row4): S? (4,0)=S from EPICS ✓. S(4,0)L(4,1)? (4,1)=S from CLIPS. Conflict.
    //   CLIP (H, row3): C? (3,0)=C from EPICS ✓. C(3,0)L(3,1)? (3,1)=P from CLIPS. Conflict.
    //   ISLE (H, row4): I? (4,0)=S from EPICS. Conflict.
    //   PICE (H, row1): P? (1,0)=P from EPICS ✓. P(1,0)I(1,1)? (1,1)=L from CLIPS. Conflict.
    //   SPICE (H, row1): S? (1,0)=P. Conflict.
    //   PILE (H, row1): P? (1,0)=P from EPICS ✓. P(1,0)I(1,1)? (1,1)=L from CLIPS. Conflict.
    //   PEEL (H, row3): P? (3,4)=E from PILES. Conflict. No P at row3 except (3,1)=P from CLIPS.
    //     P(3,1) E(3,2) E(3,3) L(3,4)? (3,3)=S from ICES. Conflict.
    //   LIPE — not a word. CLIP already placed.
    //   EPIC (H, row2): E? (2,3)=E from ICES ✓. E(2,3)... but EPIC starts with E at col3.
    //     E(2,3)P(2,4)? (2,4)=L from PILES. Conflict.
    //   ICES (H, row2): already vertical. Use different H.
    //   LIPS (H, row4): L? (4,1)=S from CLIPS. Conflict. (4,4)=S from PILES. Conflict. (4,5)=P from SLEEP. Conflict. No L at row4.
    //   SPIEL is fairly common (a speech/pitch). SPIEL (V, col5): S already used SLEEP. Can't use both at col5.
    //   Use SPEED (V, col5) instead: S(0,5)P(1,5)E(2,5)E(3,5)D(4,5). No D in letters. Conflict.
    //   Keep SLEEP at col5. No H-connectors available. 6 words OK.
    //
    // FINAL Level 39: ECLIPSE + EPICS + CLIPS + ICES + PILES + SLEEP = 6 words
    //
    // Intersections:
    //   EPICS ∩ ECLIPSE: (0,0)=E ✓
    //   CLIPS ∩ ECLIPSE: (0,1)=C ✓
    //   ICES  ∩ ECLIPSE: (0,3)=I ✓
    //   PILES ∩ ECLIPSE: (0,4)=P ✓
    //   SLEEP ∩ ECLIPSE: (0,5)=S ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: E C L I P S E
    // row1: P L   C I L
    // row2: I I   E L E
    // row3: C P   S E E
    // row4: S S     S P
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 39 — E C L I P S E
    //
    // Letters: E, C, L, I, P, S, E  (E×2)
    // ECLIPSE (H, row0): E(0,0) C(0,1) L(0,2) I(0,3) P(0,4) S(0,5) E(0,6)
    // EEL     (V, col0): E(0,0) E(1,0) L(2,0)   [E×2 ✓]
    // CEE     (V, col1): C(0,1) E(1,1) E(2,1)   [E×2 ✓]  (CEE = the letter C)
    // LIP     (V, col2): L(0,2) I(1,2) P(2,2)
    // ICE     (V, col3): I(0,3) C(1,3) E(2,3)
    // PIE     (V, col4): P(0,4) I(1,4) E(2,4)
    // SPLICE  (V, col5): S(0,5) P(1,5) L(2,5) I(3,5) C(4,5) E(5,5)
    // EPICS   (V, col6): E(0,6) P(1,6) I(2,6) C(3,6) S(4,6)
    // PEEL    (H, row2): P(2,2) E(2,3) E(2,4) L(2,5)   [E×2 ✓, connected via LIP+ICE+PIE+SPLICE]
    //
    // Conflicts: (2,2): LIP[2]=P, PEEL[0]=P ✓  (2,3): ICE[2]=E, PEEL[1]=E ✓
    //            (2,4): PIE[2]=E, PEEL[2]=E ✓  (2,5): SPLICE[2]=L, PEEL[3]=L ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: E C L I P S E
    // row1: E E I C I P P
    // row2: L E P E E L I
    // row3:         . I C
    // row4:         . C S
    // row5:         . E
    // -------------------------------------------------------------------------
    Level(
      id: 39,
      name: 'Eclipse',
      letters: ['E', 'C', 'L', 'I', 'P', 'S', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'ECLIPSE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'EEL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CEE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LIP',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ICE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PIE',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SPLICE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EPICS',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PEEL',
          startRow: 2,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['CEES', 'CEIL', 'CEILS', 'CEL', 'CELS', 'CEP', 'CEPE', 'CEPES', 'CEPS', 'CIS', 'CLEPE', 'CLEPES', 'CLIP', 'CLIPS', 'EELS', 'ELS', 'ELSE', 'EPIC', 'ICES', 'ISLE', 'LEE', 'LEES', 'LEI', 'LEIS', 'LICE', 'LIE', 'LIES', 'LIPS', 'LIS', 'LISP', 'PEC', 'PECS', 'PEE', 'PEELS', 'PEES', 'PEISE', 'PELE', 'PELES', 'PES', 'PIC', 'PICE', 'PICS', 'PIECE', 'PIECES', 'PIES', 'PILE', 'PILES', 'PIS', 'PLIE', 'PLIES', 'PSI', 'SEC', 'SEE', 'SEEL', 'SEEP', 'SEI', 'SEL', 'SEPIC', 'SIC', 'SICE', 'SIP', 'SIPE', 'SLEEP', 'SLICE', 'SLIP', 'SLIPE', 'SPEC', 'SPECIE', 'SPEEL', 'SPEIL', 'SPIC', 'SPICE', 'SPIEL', 'SPILE'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 2), (2, 3), (4, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 40 — P I N N A C L E  (two N's)
    //
    // PINNACLE (H, row0): P(0,0) I(0,1) N(0,2) N(0,3) A(0,4) C(0,5) L(0,6) E(0,7)
    // PANIC    (V, col0): P(0,0) A(1,0) N(2,0) I(3,0) C(4,0). Shares P(0,0) ✓.
    // INANE    (V, col1): I(0,1) N(1,1) A(2,1) N(3,1) E(4,1). Needs 2 N's ✓. Shares I(0,1) ✓.
    // CLEAN    (V, col5): C(0,5) L(1,5) E(2,5) A(3,5) N(4,5). Shares C(0,5) ✓.
    // LINEN    (V, col6): L(0,6) I(1,6) N(2,6) E(3,6) N(4,6). Needs 2 N's ✓. Shares L(0,6) ✓.
    // ALINE    (H, row2): A(2,1) L(2,2) I(2,3) N(2,4) E(2,5)
    //   (2,1)=A from INANE ✓  (2,5)=E from CLEAN ✓
    // NICE     (H, row3): N(3,1) I(3,2) C(3,3) E(3,4)
    //   (3,1)=N from INANE ✓. (3,2)(3,3)(3,4) empty. ✓.
    //
    // Intersections:
    //   PANIC ∩ PINNACLE: (0,0)=P ✓
    //   INANE ∩ PINNACLE: (0,1)=I ✓
    //   CLEAN ∩ PINNACLE: (0,5)=C ✓
    //   LINEN ∩ PINNACLE: (0,6)=L ✓
    //   ALINE ∩ INANE:    (2,1)=A ✓
    //   ALINE ∩ CLEAN:    (2,5)=E ✓
    //   NICE  ∩ INANE:    (3,1)=N ✓
    //
    // col: 0 1 2 3 4 5 6 7
    // row0: P I N N A C L E
    // row1: A N       L I
    // row2: N A L I N E N
    // row3: I N I C E . E
    // row4: C E     . N N
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // LEVEL 40 — P I N N A C L E
    //
    // Letters: P, I, N, N, A, C, L, E  (N×2)
    // PINNACLE (H, row0): P(0,0) I(0,1) N(0,2) N(0,3) A(0,4) C(0,5) L(0,6) E(0,7)
    // PAL      (V, col0): P(0,0) A(1,0) L(2,0)
    // INN      (V, col1): I(0,1) N(1,1) N(2,1)   [N×2 ✓]
    // NIL      (V, col2): N(0,2) I(1,2) L(2,2)
    // NIP      (V, col3): N(0,3) I(1,3) P(2,3)
    // ALIEN    (V, col4): A(0,4) L(1,4) I(2,4) E(3,4) N(4,4)
    // CANINE   (V, col5): C(0,5) A(1,5) N(2,5) I(3,5) N(4,5) E(5,5)   [N×2 ✓]
    // LANCE    (V, col6): L(0,6) A(1,6) N(2,6) C(3,6) E(4,6)
    // EPIC     (V, col7): E(0,7) P(1,7) I(2,7) C(3,7)
    // PIN      (H, row2): P(2,3) I(2,4) N(2,5)   connected via NIP+ALIEN+CANINE
    //
    // Conflicts: (2,3): NIP[2]=P, PIN[0]=P ✓  (2,4): ALIEN[2]=I, PIN[1]=I ✓
    //            (2,5): CANINE[2]=N, PIN[2]=N ✓
    //
    // col: 0 1 2 3 4 5 6 7
    // row0: P I N N A C L E
    // row1: A N I I L A A P
    // row2: L N L P I N N I
    // row3:         E I C C
    // row4:         N N E
    // row5:           E
    // -------------------------------------------------------------------------
    Level(
      id: 40,
      name: 'Pinnacle',
      letters: ['P', 'I', 'N', 'N', 'A', 'C', 'L', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'PINNACLE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PAL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'INN',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIL',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIP',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ALIEN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CANINE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LANCE',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EPIC',
          startRow: 0,
          startCol: 7,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PIN',
          startRow: 2,
          startCol: 3,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['ACE', 'ACNE', 'AIL', 'AIN', 'ALE', 'ALEC', 'ALINE', 'ALP', 'ALPINE', 'ANE', 'ANI', 'ANIL', 'ANILE', 'APE', 'APNEIC', 'CAIN', 'CAN', 'CANE', 'CANNEL', 'CANNIE', 'CAP', 'CAPE', 'CAPELIN', 'CAPLIN', 'CEIL', 'CEL', 'CEP', 'CINE', 'CLAN', 'CLAP', 'CLEAN', 'CLINE', 'CLIP', 'ELAIN', 'ELAN', 'ENCINA', 'ENCINAL', 'EPICAL', 'ICE', 'ILEA', 'ILEAC', 'INANE', 'INLACE', 'LAC', 'LACE', 'LAIC', 'LAIN', 'LANE', 'LAP', 'LAPIN', 'LEA', 'LEAN', 'LEAP', 'LEI', 'LIANE', 'LICE', 'LIE', 'LIEN', 'LIN', 'LINAC', 'LINE', 'LINEN', 'LINN', 'LIP', 'NAE', 'NAIL', 'NAN', 'NANCE', 'NAP', 'NAPE', 'NEAP', 'NICE', 'NINE', 'NIPA', 'PAC', 'PACE', 'PAIL', 'PAIN', 'PALE', 'PAN', 'PANE', 'PANEL', 'PANIC', 'PANICLE', 'PANNE', 'PEA', 'PEAL', 'PEAN', 'PEC', 'PECAN', 'PEIN', 'PELICAN', 'PEN', 'PENAL', 'PENCIL', 'PENIAL', 'PENNA', 'PENNI', 'PENNIA', 'PIA', 'PIAL', 'PIAN', 'PIC', 'PICA', 'PICAL', 'PICE', 'PIE', 'PILE', 'PILEA', 'PINA', 'PINE', 'PINEAL', 'PINNA', 'PINNACE', 'PINNAE', 'PINNAL', 'PLACE', 'PLAICE', 'PLAIN', 'PLAN', 'PLANE', 'PLEA', 'PLENA', 'PLICA', 'PLICAE', 'PLIE'],
      gridRows: 6,
      gridCols: 8,
      preRevealedCells: [(0, 3), (2, 4), (5, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 41 — S P R I N G
    //
    // Letters: S, P, R, I, N, G
    // SPRING (H, row0): S(0,0) P(0,1) R(0,2) I(0,3) N(0,4) G(0,5)
    // SPRIG  (V, col0): S(0,0) P(1,0) R(2,0) I(3,0) G(4,0)  shares S(0,0) ✓
    // PRIGS  (V, col1): P(0,1) R(1,1) I(2,1) G(3,1) S(4,1)  shares P(0,1) ✓
    // RING   (V, col2): R(0,2) I(1,2) N(2,2) G(3,2)          shares R(0,2) ✓
    // NIPS   (V, col4): N(0,4) I(1,4) P(2,4) S(3,4)          shares N(0,4) ✓
    // GRINS  (V, col5): G(0,5) R(1,5) I(2,5) N(3,5) S(4,5)  shares G(0,5) ✓
    //
    // col: 0 1 2 3 4 5
    // row0: S P R I N G
    // row1: P R I   I R
    // row2: R I N   P I
    // row3: I G G   S N
    // row4: G S         S
    // -------------------------------------------------------------------------
    Level(
      id: 41,
      name: 'Spring',
      letters: ['S', 'P', 'R', 'I', 'N', 'G'],
      targetPlacements: [
        WordPlacement(
          word: 'SPRING',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SPRIG',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PRIGS',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RING',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NIPS',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GRINS',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['GIN', 'GINS', 'GIP', 'GIPS', 'GIRN', 'GIRNS', 'GRIN', 'GRIP', 'GRIPS', 'INS', 'NIP', 'PIG', 'PIGS', 'PIN', 'PING', 'PINGS', 'PINS', 'PIRN', 'PIRNS', 'PIS', 'PRIG', 'PSI', 'RIG', 'RIGS', 'RIN', 'RINGS', 'RINS', 'RIP', 'RIPS', 'SIGN', 'SIN', 'SING', 'SIP', 'SIR', 'SNIP', 'SPIN', 'SRI'],
      gridRows: 5,
      gridCols: 6,
      preRevealedCells: [(0, 3), (2, 5), (4, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 42 — P L A N E T
    //
    // Letters: P, L, A, N, E, T
    // PLANET (H, row0): P(0,0) L(0,1) A(0,2) N(0,3) E(0,4) T(0,5)
    // PLANT  (V, col0): P(0,0) L(1,0) A(2,0) N(3,0) T(4,0)  shares P(0,0) ✓
    // LANE   (V, col1): L(0,1) A(1,1) N(2,1) E(3,1)          shares L(0,1) ✓
    // ANTE   (V, col2): A(0,2) N(1,2) T(2,2) E(3,2)          shares A(0,2) ✓
    // NAPE   (V, col3): N(0,3) A(1,3) P(2,3) E(3,3)          shares N(0,3) ✓
    // ELAN   (V, col4): E(0,4) L(1,4) A(2,4) N(3,4)          shares E(0,4) ✓
    // TAPE   (V, col5): T(0,5) A(1,5) P(2,5) E(3,5)          shares T(0,5) ✓
    //
    // col: 0 1 2 3 4 5
    // row0: P L A N E T
    // row1: L A N A L A
    // row2: A N T P A P
    // row3: N E E E N E
    // row4: T
    // -------------------------------------------------------------------------
    Level(
      id: 42,
      name: 'Planet',
      letters: ['P', 'L', 'A', 'N', 'E', 'T'],
      targetPlacements: [
        WordPlacement(
          word: 'PLANET',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PLANT',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LANE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANTE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NAPE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ELAN',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TAPE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ALE', 'ALP', 'ALT', 'ANE', 'ANT', 'APE', 'APT', 'ATE', 'EAT', 'ETA', 'ETNA', 'LAP', 'LAT', 'LATE', 'LATEN', 'LEA', 'LEAN', 'LEANT', 'LEAP', 'LEAPT', 'LENT', 'LEPT', 'LEPTA', 'LET', 'NAE', 'NAP', 'NEAP', 'NEAT', 'NET', 'PAL', 'PALE', 'PALET', 'PAN', 'PANE', 'PANEL', 'PANT', 'PAT', 'PATE', 'PATEN', 'PEA', 'PEAL', 'PEAN', 'PEAT', 'PELT', 'PEN', 'PENAL', 'PENT', 'PET', 'PETAL', 'PLAN', 'PLANE', 'PLAT', 'PLATE', 'PLATEN', 'PLEA', 'PLEAT', 'PLENA', 'TAE', 'TAEL', 'TALE', 'TAN', 'TAP', 'TEA', 'TEAL', 'TEL', 'TELA', 'TEN', 'TEPA', 'TEPAL'],
      gridRows: 5,
      gridCols: 6,
      preRevealedCells: [(0, 2), (2, 4), (3, 1)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 43 — S I M P L E
    //
    // Letters: S, I, M, P, L, E
    // SIMPLE (H, row0): S(0,0) I(0,1) M(0,2) P(0,3) L(0,4) E(0,5)
    // SLIM   (V, col0): S(0,0) L(1,0) I(2,0) M(3,0)          shares S(0,0) ✓
    // ISLE   (V, col1): I(0,1) S(1,1) L(2,1) E(3,1)          shares I(0,1) ✓
    // MILE   (V, col2): M(0,2) I(1,2) L(2,2) E(3,2)          shares M(0,2) ✓
    // PILE   (V, col3): P(0,3) I(1,3) L(2,3) E(3,3)          shares P(0,3) ✓
    // LIMP   (V, col4): L(0,4) I(1,4) M(2,4) P(3,4)          shares L(0,4) ✓
    // ELMS   (V, col5): E(0,5) L(1,5) M(2,5) S(3,5)          shares E(0,5) ✓
    //
    // col: 0 1 2 3 4 5
    // row0: S I M P L E
    // row1: L S I I I L
    // row2: I L L L M M
    // row3: M E E E P S
    // -------------------------------------------------------------------------
    Level(
      id: 43,
      name: 'Simple',
      letters: ['S', 'I', 'M', 'P', 'L', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'SIMPLE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'SLIM',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ISLE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'MILE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'PILE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LIMP',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ELMS',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ELM', 'ELS', 'EMS', 'IMP', 'IMPEL', 'IMPELS', 'IMPS', 'ISM', 'LEI', 'LEIS', 'LIE', 'LIES', 'LIME', 'LIMES', 'LIMPS', 'LIP', 'LIPS', 'LIS', 'LISP', 'MEL', 'MELS', 'MIL', 'MILES', 'MILS', 'MIS', 'MISE', 'PES', 'PIE', 'PIES', 'PILES', 'PIS', 'PLIE', 'PLIES', 'PSI', 'SEI', 'SEL', 'SEMI', 'SIM', 'SIMP', 'SIP', 'SIPE', 'SLIME', 'SLIP', 'SLIPE', 'SMILE', 'SPEIL', 'SPIEL', 'SPILE'],
      gridRows: 4,
      gridCols: 6,
      preRevealedCells: [(0, 4), (2, 1), (3, 5)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 44 — T R A V E L
    //
    // Letters: T, R, A, V, E, L
    // TRAVEL (H, row0): T(0,0) R(0,1) A(0,2) V(0,3) E(0,4) L(0,5)
    // TARE   (V, col0): T(0,0) A(1,0) R(2,0) E(3,0)          shares T(0,0) ✓
    // RAVEL  (V, col1): R(0,1) A(1,1) V(2,1) E(3,1) L(4,1)  shares R(0,1) ✓
    // ARTEL  (V, col2): A(0,2) R(1,2) T(2,2) E(3,2) L(4,2)  shares A(0,2) ✓
    // VALE   (V, col3): V(0,3) A(1,3) L(2,3) E(3,3)          shares V(0,3) ✓
    // EARL   (V, col4): E(0,4) A(1,4) R(2,4) L(3,4)          shares E(0,4) ✓
    // LAVER  (V, col5): L(0,5) A(1,5) V(2,5) E(3,5) R(4,5)  shares L(0,5) ✓
    //
    // col: 0 1 2 3 4 5
    // row0: T R A V E L
    // row1: A A R A A A
    // row2: R V T L R V
    // row3: E E E E L E
    // row4:   L L   . R
    // -------------------------------------------------------------------------
    Level(
      id: 44,
      name: 'Travel',
      letters: ['T', 'R', 'A', 'V', 'E', 'L'],
      targetPlacements: [
        WordPlacement(
          word: 'TRAVEL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'TARE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RAVEL',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ARTEL',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'VALE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'EARL',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LAVER',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ALE', 'ALERT', 'ALT', 'ALTER', 'ARE', 'ART', 'ATE', 'AVE', 'AVER', 'AVERT', 'EAR', 'EAT', 'ERA', 'ETA', 'LAR', 'LAT', 'LATE', 'LATER', 'LAV', 'LAVE', 'LEA', 'LEAR', 'LET', 'LEV', 'LEVA', 'RALE', 'RAT', 'RATE', 'RATEL', 'RAVE', 'REAL', 'RET', 'REV', 'TAE', 'TAEL', 'TALE', 'TALER', 'TAR', 'TAV', 'TEA', 'TEAL', 'TEAR', 'TEL', 'TELA', 'TRAVE', 'VALET', 'VAR', 'VARLET', 'VAT', 'VEAL', 'VELA', 'VELAR', 'VERA', 'VERT', 'VET'],
      gridRows: 5,
      gridCols: 6,
      preRevealedCells: [(0, 1), (2, 3), (4, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 45 — B R A N C H
    //
    // Letters: B, R, A, N, C, H
    // BRANCH (H, row0): B(0,0) R(0,1) A(0,2) N(0,3) C(0,4) H(0,5)
    // BARN   (V, col0): B(0,0) A(1,0) R(2,0) N(3,0)          shares B(0,0) ✓
    // RANCH  (V, col1): R(0,1) A(1,1) N(2,1) C(3,1) H(4,1)  shares R(0,1) ✓
    // ARCH   (V, col2): A(0,2) R(1,2) C(2,2) H(3,2)          shares A(0,2) ✓
    // NARC   (V, col3): N(0,3) A(1,3) R(2,3) C(3,3)          shares N(0,3) ✓
    // CRAB   (V, col4): C(0,4) R(1,4) A(2,4) B(3,4)          shares C(0,4) ✓
    //
    // col: 0 1 2 3 4 5
    // row0: B R A N C H
    // row1: A A R A R
    // row2: R N C R A
    // row3: N C H C B
    // row4:   H
    // -------------------------------------------------------------------------
    Level(
      id: 45,
      name: 'Branch',
      letters: ['B', 'R', 'A', 'N', 'C', 'H'],
      targetPlacements: [
        WordPlacement(
          word: 'BRANCH',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BARN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RANCH',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ARCH',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NARC',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'CRAB',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['ARB', 'ARC', 'BACH', 'BAH', 'BAN', 'BAR', 'BRA', 'BRACH', 'BRAN', 'CAB', 'CAN', 'CAR', 'CARB', 'CARN', 'CHAR', 'NAB', 'NAH', 'RAH', 'RAN'],
      gridRows: 5,
      gridCols: 6,
      preRevealedCells: [(0, 5), (2, 2), (3, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 46 — P O W D E R S
    //
    // Letters: P, O, W, D, E, R, S
    // POWDERS (H, row0): P(0,0) O(0,1) W(0,2) D(0,3) E(0,4) R(0,5) S(0,6)
    // PROWS   (V, col0): P(0,0) R(1,0) O(2,0) W(3,0) S(4,0)  shares P(0,0) ✓. PROWS ✓.
    // OWED    (V, col1): O(0,1) W(1,1) E(2,1) D(3,1)  shares O(0,1) ✓. OWED ✓.
    // WORDS   (V, col2): W(0,2) O(1,2) R(2,2) D(3,2) S(4,2)  shares W(0,2) ✓. WORDS ✓.
    // ROPED   — needs second vowel. DROVES — no V. DOPES (V, col3): D(0,3) O(1,3) P(2,3) E(3,3) S(4,3)  shares D(0,3) ✓. DOPES ✓.
    // ROPES   (V, col4): E(0,4) ... ROPES[0]=R not E. Conflict.
    //   POWER (V, col4): E(0,4)... POWER[0]=P. Conflict.
    //   ESTOP — no T. EROS (V, col4): E(0,4)R(1,4)O(2,4)S(3,4)  shares E(0,4) ✓. EROS — proper noun (Greek god). Conflict.
    //   SPED — S,P,E,D. Cross E(0,4): SPED[2]=E→S at row-2. Invalid.
    //   POSER (V, col5): R(0,5)... POSER[0]=P. Conflict.
    //   ROPES (V, col5): R(0,5)O(1,5)P(2,5)E(3,5)S(4,5)  shares R(0,5) ✓. ROPES ✓.
    //   SWORD — no T. SPORE (V, col6): S(0,6)P(1,6)O(2,6)R(3,6)E(4,6)  shares S(0,6) ✓. SPORE ✓.
    // DOWER (H, row2): D? (2,0)=O from PROWS,(2,1)=E from OWED,(2,2)=R from WORDS,(2,3)=P from DOPES,(2,5)=P from ROPES,(2,6)=O from SPORE. No D at row2.
    // PROSE (H, row3): P? (3,2)=D from WORDS,(3,3)=E from DOPES. No P at row3.
    //   (3,0)=W from PROWS. No P.
    // DROOP — 2 O's. SWORD — no T.
    // POSED (H, row4): P? (4,0)=S from PROWS,(4,2)=S from WORDS,(4,3)=S from DOPES,(4,5)=S from ROPES. No P at row4.
    // ROWED (H, row2): R? (2,2)=R from WORDS ✓. R(2,2)O(2,3)? (2,3)=P from DOPES. Conflict.
    // POWER (H, row2): P? (2,5)=P from ROPES ✓. P(2,5)O(2,6)? (2,6)=O from SPORE ✓ shared! P(2,5)O(2,6)W(2,7)... outside. Conflict.
    // SPORE (H, row1): S? No S at row1 (1,0)=R,(1,1)=W,(1,2)=O,(1,3)=O,(1,5)=O,(1,6)=P. No S.
    // POSED (H, row3): (3,5)=E from ROPES, (3,6)=R from SPORE. No P at row3.
    // ROPED (H, row4): R? No R at row4. (4,6)=E from SPORE. No R.
    // SWORD (H, row3): S? No S at row3.
    // WORDS (H, row4): W? No W at row4.
    // 7 words without extra H: POWDERS + PROWS + OWED + WORDS + DOPES + ROPES + SPORE ✓.
    //
    // Intersections:
    //   PROWS ∩ POWDERS: (0,0)=P ✓
    //   OWED  ∩ POWDERS: (0,1)=O ✓
    //   WORDS ∩ POWDERS: (0,2)=W ✓
    //   DOPES ∩ POWDERS: (0,3)=D ✓
    //   ROPES ∩ POWDERS: (0,5)=R ✓
    //   SPORE ∩ POWDERS: (0,6)=S ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: P O W D E R S
    // row1: R W O O   O P
    // row2: O E R P   P O
    // row3: W D D E   E R
    // row4: S . S S   S E
    // -------------------------------------------------------------------------
    Level(
      id: 46,
      name: 'Powders',
      letters: ['P', 'O', 'W', 'D', 'E', 'R', 'S'],
      targetPlacements: [
        WordPlacement(
          word: 'POWDERS',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'PROWS',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'OWED',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'WORDS',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'DOPES',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ROPES',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SPORE',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['DEW', 'DEWS', 'DOE', 'DOER', 'DOERS', 'DOES', 'DOPE', 'DOPER', 'DOPERS', 'DOR', 'DORE', 'DORP', 'DORPS', 'DORS', 'DOS', 'DOSE', 'DOSER', 'DOW', 'DOWER', 'DOWERS', 'DOWS', 'DOWSE', 'DOWSER', 'DREW', 'DROP', 'DROPS', 'DROWSE', 'EPOS', 'EROS', 'ERS', 'ODE', 'ODES', 'ODS', 'OES', 'OPE', 'OPED', 'OPES', 'OPS', 'ORE', 'ORES', 'ORS', 'OSE', 'OWE', 'OWES', 'OWSE', 'PED', 'PEDRO', 'PEDROS', 'PEDS', 'PER', 'PES', 'PESO', 'PEW', 'PEWS', 'POD', 'PODS', 'PORE', 'PORED', 'PORES', 'POSE', 'POSED', 'POSER', 'POW', 'POWDER', 'POWER', 'POWERS', 'POWS', 'PRO', 'PROD', 'PRODS', 'PROS', 'PROSE', 'PROSED', 'PROW', 'RED', 'REDO', 'REDOS', 'REDS', 'REP', 'REPO', 'REPOS', 'REPS', 'RES', 'RESOD', 'RESOW', 'ROD', 'RODE', 'RODS', 'ROE', 'ROES', 'ROPE', 'ROPED', 'ROSE', 'ROSED', 'ROW', 'ROWED', 'ROWS', 'SER', 'SEROW', 'SEW', 'SOD', 'SOP', 'SORD', 'SORE', 'SOW', 'SOWED', 'SOWER', 'SPED', 'SPEW', 'SPODE', 'SPORED', 'SWOP', 'SWORD', 'SWORE', 'WED', 'WEDS', 'WOE', 'WOES', 'WOP', 'WOPS', 'WORD', 'WORE', 'WORSE', 'WOS'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 4), (3, 6), (4, 0)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 47 — F L A T T E N  (two T's)
    //
    // Letters: F, L, A, T, T, E, N
    // FLATTEN (H, row0): F(0,0) L(0,1) A(0,2) T(0,3) T(0,4) E(0,5) N(0,6)
    // FETAL   (V, col0): F(0,0) E(1,0) T(2,0) A(3,0) L(4,0)  shares F(0,0) ✓. FETAL ✓.
    // LATHE   (V, col1): L(0,1) A(1,1) T(2,1) H? — no H. Conflict.
    //   LANCE — no C. LANES (V, col1): L(0,1)A(1,1)N(2,1)E(3,1)S? — no S. Conflict.
    //   LATE  (V, col1): L(0,1)A(1,1)T(2,1)E(3,1)  shares L(0,1) ✓. LATE ✓.
    // ANTE    (V, col2): A(0,2)N(1,2)T(2,2)E(3,2)  shares A(0,2) ✓. ANTE ✓.
    // TENT    (V, col3): T(0,3)E(1,3)N(2,3)T(3,3)  needs 2 T's ✓. Shares T(0,3) ✓. TENT ✓.
    // TITLE — 2 T's but needs I. Conflict.
    // TEAT (V, col4): T(0,4)E(1,4)A(2,4)T(3,4)  needs 2 T's ✓. Shares T(0,4) ✓. TEAT ✓.
    // EATEN (V, col5): E(0,5)A(1,5)T(2,5)E(3,5)N(4,5)  needs 2 E's. Letters have 1 E. Conflict.
    //   ENTAL — not a word. ENTER — 2 E's.
    //   LANE (V, col5): E(0,5)... LANE[0]=L. Conflict.
    //   ERNE (V, col6): N(0,6)... ERNE=E,R,N,E — no R, needs 2 E's. Conflict.
    //   RANT — no R. NEAT (V, col5): E(0,5)... NEAT[0]=N. Conflict.
    //   ELFIN — no I. ELFIN.
    //   ENAMEL — no M. ENCASE — no C, S.
    //   NOEL — no O. NAIL — no I.
    //   NATAL — 2 A's, no second A. Conflict.
    //   ANTE already at col2. ANTE (V, col5): E(0,5)... ANTE[0]=A. Conflict.
    //   LEAN (V, col5): E(0,5)... LEAN[0]=L. Conflict.
    //   FELT (V, col5): E(0,5)... FELT[0]=F. Conflict.
    //   FLAT (V, col6): N(0,6)... FLAT[0]=F. Conflict.
    //   FLAN (V, col5): E(0,5)... FLAN[0]=F. Conflict.
    //   ELATE — 2 E's.
    //   ENEMA — 2 E's, no M.
    //   LENT (V, col6): N(0,6)... LENT[0]=L. Conflict.
    //   NAFF — 2 F's.
    //   NATAL (V, col6): N(0,6)A(1,6)T(2,6)A(3,6)L(4,6)  needs 2 A's. Conflict.
    //   NAAN — 2 A's, 2 N's. NAIL — no I. NOEL — no O.
    //   NETT (V, col6): N(0,6)E(1,6)T(2,6)T(3,6)  needs 2 T's ✓. Shares N(0,6) ✓. NETT=N,E,T,T ✓.
    // LANE (H, row3): L? (3,0)=A from FETAL,(3,1)=E from LATE,(3,2)=E from ANTE,(3,3)=T from TENT,(3,4)=T from TEAT,(3,6)=T from NETT. No L at row3.
    // FELT (H, row4): F? (4,0)=L from FETAL. Conflict.
    // LATE (H, row4): L? (4,0)=L from FETAL ✓. L(4,0)A(4,1)T(4,2)E(4,3). (4,1) empty (LATE col1 ends row3). (4,2) empty. (4,3) empty. ✓. LATE=L,A,T,E ✓. Connected via (4,0)=L from FETAL ✓. ✓.
    //
    // FINAL Level 47: FLATTEN + FETAL + LATE + ANTE + TENT + TEAT + NETT + LATE(H) = 8 words
    //
    // Intersections:
    //   FETAL ∩ FLATTEN: (0,0)=F ✓
    //   LATE  ∩ FLATTEN: (0,1)=L ✓
    //   ANTE  ∩ FLATTEN: (0,2)=A ✓
    //   TENT  ∩ FLATTEN: (0,3)=T ✓
    //   TEAT  ∩ FLATTEN: (0,4)=T ✓
    //   NETT  ∩ FLATTEN: (0,6)=N ✓
    //   LATE(H) ∩ FETAL: (4,0)=L ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: F L A T T E N
    // row1: E A N E E   E
    // row2: T T T N A   T
    // row3: A E E T T   T
    // row4: L A T E
    // -------------------------------------------------------------------------
    Level(
      id: 47,
      name: 'Flatten',
      letters: ['F', 'L', 'A', 'T', 'T', 'E', 'N'],
      targetPlacements: [
        WordPlacement(
          word: 'FLATTEN',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'FETAL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LATE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ANTE',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TENT',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TEAT',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'NETT',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LATE',
          startRow: 4,
          startCol: 0,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['AFT', 'ALE', 'ALEF', 'ALT', 'ANE', 'ANT', 'ATE', 'ATT', 'EAT', 'EFT', 'ELAN', 'ELF', 'ETA', 'ETNA', 'FAN', 'FANE', 'FAT', 'FATE', 'FATTEN', 'FEAL', 'FEAT', 'FELT', 'FEN', 'FET', 'FETA', 'FLAN', 'FLAT', 'FLEA', 'LANE', 'LAT', 'LATEN', 'LATENT', 'LATTE', 'LATTEN', 'LEA', 'LEAF', 'LEAN', 'LEANT', 'LEFT', 'LENT', 'LET', 'NAE', 'NEAT', 'NET', 'TAE', 'TAEL', 'TALE', 'TALENT', 'TAN', 'TAT', 'TATE', 'TEA', 'TEAL', 'TEL', 'TELA', 'TEN', 'TET'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 5), (2, 3), (4, 2)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 48 — B R I G H T S
    //
    // Letters: B, R, I, G, H, T, S
    // BRIGHTS (H, row0): B(0,0) R(0,1) I(0,2) G(0,3) H(0,4) T(0,5) S(0,6)
    // BIRTH   (V, col0): B(0,0) I(1,0) R(2,0) T(3,0) H(4,0)  shares B(0,0) ✓. BIRTH ✓.
    // GRITS   (V, col1): R(0,1) ... wait: GRITS=G,R,I,T,S. R at pos2→G at row-2. Invalid.
    //   Cross R(0,1): GRITS[1]=R→G at row-1. Invalid.
    //   RIBS (V, col1): R(0,1)I(1,1)B(2,1)S(3,1)  shares R(0,1) ✓. RIBS ✓.
    // GIRTS   (V, col3): G(0,3) I(1,3) R(2,3) T(3,3) S(4,3)  shares G(0,3) ✓. GIRTS=G,I,R,T,S ✓ (plural of girt).
    //   — slightly uncommon. Use GRIPS instead: G(0,3)R(1,3)I(2,3)P(3,3)S(4,3) — no P. Conflict.
    //   GRIST (V, col3): G(0,3)R(1,3)I(2,3)S(3,3)T(4,3)  shares G(0,3) ✓. GRIST ✓ (common: "grist for the mill").
    // SHIRT   (V, col4): H(0,4)... SHIRT[0]=S. Conflict.
    //   THROB — no O. THIRST (V, col4): H(0,4)... THIRST[0]=T. Conflict.
    //   HABIT — no A. HINT — no N.
    //   HITTING — 2 T's.
    //   This (V, col4): H(0,4)... THIS=T,H,I,S. H at pos2→T at row-2. Cross H(0,4): THIS[1]=H→T at row-1. Invalid.
    //   HIST (V, col4): H(0,4)I(1,4)S(2,4)T(3,4)  shares H(0,4) ✓. HIST=H,I,S,T ✓ (slightly uncommon as standalone — "be quiet"). Use HITS instead: H(0,4)I(1,4)T(2,4)S(3,4)  shares H(0,4) ✓. HITS ✓.
    // STIRS — 2 S's. STIR (V, col5): T(0,5)... STIR[0]=S. Conflict.
    //   TREES — no E. TRIES (V, col5): T(0,5)R(1,5)I(2,5)E(3,5)S(4,5)  — no E. Conflict.
    //   GIRLS (V, col5): T(0,5)... GIRLS[0]=G. Conflict.
    //   TRIG (V, col5): T(0,5)R(1,5)I(2,5)G(3,5)  shares T(0,5) ✓. TRIG ✓.
    // GRISH — not a word. SHIRT (V, col6): S(0,6)H(1,6)I(2,6)R(3,6)T(4,6)  shares S(0,6) ✓. SHIRT ✓.
    // GIRTH (H, row3): G? (3,3)=S from GRIST,(3,4)=S from HITS. No G at row3.
    //   (3,0)=T from BIRTH. No G.
    // STING (H, row4): S? (4,3)=S from GRIST ✓. S(4,3)T(4,4)I(4,5)N(4,6)? — no N. Conflict.
    //   STIR (H, row4): S(4,3)T(4,4)? (4,4) empty. (4,3)=S from GRIST ✓. S(4,3)T(4,4)I(4,5)R(4,6)? (4,6)=T from SHIRT. Conflict.
    // GIRTH (H, row4): G? (4,3)=S from GRIST. Conflict.
    // GRITS (H, row4): G? No G at row4.
    // BIRTH (H, row4): B? (4,0)=H from BIRTH V. Conflict.
    // SHIRT (H, row2): S? (2,0)=R from BIRTH,(2,1)=B from RIBS,(2,3)=I from GRIST,(2,4)=T from HITS,(2,5)=I from TRIG,(2,6)=I from SHIRT. No S at row2.
    // GRIT (H, row2): G? (2,3)=I from GRIST. Conflict.
    // BRIG (H, row2): B? (2,1)=B from RIBS ✓. B(2,1)R(2,2)I(2,3)? (2,3)=I from GRIST ✓ shared! B(2,1)R(2,2)I(2,3)G(2,4)? (2,4)=T from HITS. BRIG[3]=G. T≠G. Conflict.
    // BRIG (H, row2, col1): B(2,1)R(2,2)I(2,3)G(2,4). (2,3)=I from GRIST ✓. (2,4)=T from HITS. Conflict.
    // BRIT (H, row2): B(2,1)R(2,2)I(2,3)T(2,4). (2,3)=I from GRIST ✓ and (2,4)=T from HITS ✓ shared! BRIT=B,R,I,T ✓. Connected via (2,1)=B from RIBS ✓, (2,3)=I from GRIST ✓, (2,4)=T from HITS ✓. ✓.
    //
    // FINAL Level 48: BRIGHTS + BIRTH + RIBS + GRIST + HITS + TRIG + SHIRT + BRIT = 8 words
    //
    // Intersections:
    //   BIRTH ∩ BRIGHTS: (0,0)=B ✓
    //   RIBS  ∩ BRIGHTS: (0,1)=R ✓
    //   GRIST ∩ BRIGHTS: (0,3)=G ✓
    //   HITS  ∩ BRIGHTS: (0,4)=H ✓
    //   TRIG  ∩ BRIGHTS: (0,5)=T ✓
    //   SHIRT ∩ BRIGHTS: (0,6)=S ✓
    //   BRIT  ∩ RIBS:    (2,1)=B ✓
    //   BRIT  ∩ GRIST:   (2,3)=I ✓
    //   BRIT  ∩ HITS:    (2,4)=T ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: B R I G H T S
    // row1: I I   I I R H
    // row2: R B R I T I I
    // row3: T S   S S G R
    // row4: H     T .   T
    // -------------------------------------------------------------------------
    Level(
      id: 48,
      name: 'Brights',
      letters: ['B', 'R', 'I', 'G', 'H', 'T', 'S'],
      targetPlacements: [
        WordPlacement(
          word: 'BRIGHTS',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'BIRTH',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RIBS',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'GRIST',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'HITS',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'TRIG',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SHIRT',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'BRIT',
          startRow: 2,
          startCol: 1,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['BIG', 'BIGHT', 'BIGHTS', 'BIGS', 'BIRTHS', 'BIS', 'BIT', 'BITS', 'BRIG', 'BRIGHT', 'BRIGS', 'BRIS', 'BRITS', 'GHI', 'GHIS', 'GIB', 'GIBS', 'GIRSH', 'GIRT', 'GIRTH', 'GIRTHS', 'GIRTS', 'GIST', 'GIT', 'GITS', 'GRIT', 'GRITH', 'GRITHS', 'GRITS', 'HIS', 'HIST', 'HIT', 'ITS', 'RIB', 'RIG', 'RIGHT', 'RIGHTS', 'RIGS', 'SHIT', 'SHRI', 'SIB', 'SIGH', 'SIGHT', 'SIR', 'SIT', 'SITH', 'SRI', 'STIR', 'THIR', 'THIS', 'TIS', 'TRIGS'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 2), (3, 6), (4, 3)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 49 — C R U M B L E
    //
    // Letters: C, R, U, M, B, L, E
    // CRUMBLE (H, row0): C(0,0) R(0,1) U(0,2) M(0,3) B(0,4) L(0,5) E(0,6)
    // CRUEL   (V, col0): C(0,0) R(1,0) U(2,0) E(3,0) L(4,0)  shares C(0,0) ✓. CRUEL ✓.
    // RUBLE   (V, col1): R(0,1) U(1,1) B(2,1) L(3,1) E(4,1)  shares R(0,1) ✓. RUBLE ✓.
    // UMBEL   (V, col2): U(0,2) M(1,2) B(2,2) E(3,2) L(4,2)  shares U(0,2) ✓. UMBEL — "flower cluster" — somewhat uncommon.
    //   Use MULE (V, col3): M(0,3)U(1,3)L(2,3)E(3,3)  shares M(0,3) ✓. MULE ✓.
    //   UMBER (V, col2): U(0,2)M(1,2)B(2,2)E(3,2)R(4,2)  shares U(0,2) ✓. UMBER ✓ (common: umber color).
    // BULGE — no G. BLUES (V, col4): B(0,4)L(1,4)U(2,4)E(3,4)S(4,4)  — no S. Conflict.
    //   BURL (V, col4): B(0,4)U(1,4)R(2,4)L(3,4)  shares B(0,4) ✓. BURL ✓ (knot in wood).
    // LURES   (V, col5): L(0,5) U(1,5) R(2,5) E(3,5) S(4,5)  — no S. Conflict.
    //   LURE (V, col5): L(0,5)U(1,5)R(2,5)E(3,5)  shares L(0,5) ✓. LURE ✓.
    // EMCEE — 2 E's. EMBER — 2 E's.
    //   ELMS — no S. ELBOW — no O, W.
    //   LUBE (V, col6): E(0,6)... LUBE[0]=L. Conflict.
    //   REBEL — 2 E's. REPEL — 2 E's.
    //   CLUE (V, col6): E(0,6)... CLUE[0]=C. Conflict.
    //   RULE (V, col6): E(0,6)... RULE[0]=R. Conflict.
    //   ELUDE — 2 E's.
    //   BURG (V, col6): E(0,6)... BURG[0]=B. Conflict.
    //   BLUR (V, col6): E(0,6)... BLUR[0]=B. Conflict.
    //   No good 4+ letter word starting with E using available letters without 2 E's.
    //   Try BRACE — no A. BURBLE — 2 B's.
    //   BERM (V, col4): B(0,4)E? BERM=B,E,R,M. B(0,4)E(1,4)R(2,4)M(3,4)  shares B(0,4) ✓. BERM ✓ (earthen embankment, common word).
    //   That's better than BURL. Use BERM at col4.
    // H-connector: CRUEL (H, row4): C? (4,0)=L from CRUEL V. Conflict.
    //   LURE already at col5. RULE (H, row4): R? (4,0)=L. Conflict.
    //   UMBER ends (4,2)=R. BLUE (H, row4): B? (4,1)=E from RUBLE,(4,2)=R from UMBER. No B at row4.
    //   MULE ends (3,3)=E. BERM ends (3,4)=M. LURE ends (3,5)=E.
    //   RULE (H, row3): R? (3,0)=E from CRUEL,(3,1)=L from RUBLE,(3,2)=E from UMBER,(3,3)=E from MULE,(3,4)=M from BERM,(3,5)=E from LURE. No R at row3.
    //   BLUR (H, row4): B? (4,0)=L from CRUEL,(4,1)=E from RUBLE,(4,2)=R from UMBER. No B at row4.
    //   CURL (H, row2): C? (2,0)=U from CRUEL,(2,1)=B from RUBLE,(2,2)=B from UMBER,(2,4)=R from BERM. No C at row2.
    //   CLUE (H, row3): C? (3,0)=E from CRUEL. Conflict. No C at row3.
    //   RUBE (H, row2): R? (2,4)=R from BERM ✓. R(2,4)U(2,5)? (2,5)=R from LURE. Conflict.
    //   BLUR (H, row2): B? (2,1)=B from RUBLE ✓. B(2,1)L(2,2)? (2,2)=B from UMBER. Conflict.
    //   BLUER (H, row4): B? (4,0)=L. Conflict.
    //   BLUE (H, row4): B? No B at row4.
    //   RULE (H, row4): R? No R at row4 (only (4,0)=L,(4,1)=E,(4,2)=R from UMBER ✓). R(4,2) from UMBER ✓. R(4,2)U(4,3)L(4,4)E(4,5). (4,3)(4,4)(4,5) empty. ✓. RULE=R,U,L,E ✓. Connected via (4,2)=R from UMBER ✓. ✓.
    //
    // FINAL Level 49: CRUMBLE + CRUEL + RUBLE + UMBER + MULE + BERM + LURE + RULE = 8 words
    //
    // Intersections:
    //   CRUEL ∩ CRUMBLE: (0,0)=C ✓
    //   RUBLE ∩ CRUMBLE: (0,1)=R ✓
    //   UMBER ∩ CRUMBLE: (0,2)=U ✓
    //   MULE  ∩ CRUMBLE: (0,3)=M ✓
    //   BERM  ∩ CRUMBLE: (0,4)=B ✓
    //   LURE  ∩ CRUMBLE: (0,5)=L ✓
    //   RULE  ∩ UMBER:   (4,2)=R ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: C R U M B L E
    // row1: R U M U E U
    // row2: U B B L R R
    // row3: E L E E M E
    // row4: L E R U L E
    // -------------------------------------------------------------------------
    Level(
      id: 49,
      name: 'Crumble',
      letters: ['C', 'R', 'U', 'M', 'B', 'L', 'E'],
      targetPlacements: [
        WordPlacement(
          word: 'CRUMBLE',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'CRUEL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RUBLE',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'UMBER',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'MULE',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'BERM',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LURE',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RULE',
          startRow: 4,
          startCol: 2,
          direction: WordDirection.horizontal,
        ),
      ],
      bonusWords: ['BEL', 'BLUE', 'BLUER', 'BLUME', 'BLUR', 'BRUME', 'BUM', 'BUR', 'BURL', 'CEL', 'CLUB', 'CLUE', 'CLUMBER', 'CRUMB', 'CUB', 'CUBE', 'CUBER', 'CUE', 'CULM', 'CUM', 'CUMBER', 'CUR', 'CURB', 'CURE', 'CURL', 'ECRU', 'ECU', 'ELM', 'EMU', 'LEMUR', 'LEU', 'LUBE', 'LUCE', 'LUCRE', 'LUM', 'LUMBER', 'MEL', 'MERL', 'MURE', 'REB', 'REC', 'REM', 'RUB', 'RUBE', 'RUE', 'RUM', 'RUMBLE', 'ULCER', 'UMBEL', 'URB'],
      gridRows: 5,
      gridCols: 7,
      preRevealedCells: [(0, 6), (2, 3), (4, 4)],
    ),

    // -------------------------------------------------------------------------
    // LEVEL 50 — T H R I L L S  (two L's)
    //
    // Letters: T, H, R, I, L, L, S
    // THRILLS (H, row0): T(0,0) H(0,1) R(0,2) I(0,3) L(0,4) L(0,5) S(0,6)
    // SHIRT   (V, col0): T(0,0)... SHIRT[0]=S. Conflict.
    //   TILTS — 2 T's. THRILL (V, col0): T(0,0)H(1,0)R(2,0)I(3,0)L(4,0)L(5,0)  needs 2 L's ✓. Shares T(0,0) ✓. THRILL ✓.
    // HILLS   (V, col1): H(0,1)I(1,1)L(2,1)L(3,1)S(4,1)  needs 2 L's ✓. Shares H(0,1) ✓. HILLS ✓.
    // RILLS   (V, col2): R(0,2)I(1,2)L(2,2)L(3,2)S(4,2)  needs 2 L's ✓. Shares R(0,2) ✓. RILLS ✓.
    // ILLS    (V, col3): I(0,3)L(1,3)L(2,3)S(3,3)  needs 2 L's ✓. Shares I(0,3) ✓. ILLS ✓.
    // LITHS — not standard. LIST (V, col4): L(0,4)I(1,4)S(2,4)T(3,4)  shares L(0,4) ✓. LIST ✓.
    // SLITS — 2 S's. LILTS (V, col5): L(0,5)I(1,5)L(2,5)T(3,5)S(4,5)  needs 2 L's ✓. Shares L(0,5) ✓. LILTS ✓.
    // SHIRT (V, col6): S(0,6)H(1,6)I(2,6)R(3,6)T(4,6)  shares S(0,6) ✓. SHIRT ✓.
    // TRILL (H, row2): T? (2,0)=R from THRILL,(2,1)=L from HILLS,(2,2)=L from RILLS,(2,3)=L from ILLS,(2,4)=S from LIST,(2,5)=L from LILTS,(2,6)=I from SHIRT. No T at row2.
    // SHILL (H, row4): S? (4,1)=S from HILLS ✓. S(4,1)H(4,2)? (4,2)=S from RILLS. Conflict.
    // STILL (H, row3): S? (3,3)=S from ILLS ✓. S(3,3)T(3,4)? (3,4)=T from LIST ✓ shared! S(3,3)T(3,4)I(3,5)? (3,5)=T from LILTS. Conflict.
    // SILT (H, row3): S(3,3) from ILLS ✓. S(3,3)I(3,4)? (3,4)=T from LIST. Conflict.
    // GRILL — no G. TRILL (H, row5): T? (5,0)=L from THRILL. Conflict.
    // SHILL (H, row4): S(4,1)H(4,2)? (4,2)=S from RILLS. Conflict.
    // HILL (H, row4): H? No H at row4.
    // RILL (H, row4): R? No R at row4.
    // ILL (H, row3): I? (3,0)=I from THRILL ✓. I(3,0)L(3,1)? (3,1)=L from HILLS ✓ shared! I(3,0)L(3,1)L(3,2)? (3,2)=L from RILLS ✓ shared! ILL=I,L,L ✓ (3 letters — short). (3,3)=S from ILLS. ILL ends (3,2). ✓. 3 words sharing their cells with THRILL, HILLS, RILLS.
    //   ILL is only 3 letters — too short. But useful as connecting word. 8 7-letter+ words already.
    // STILL (H, row5): S? (5,4)=S from LILTS ✓. S(5,4)T(5,5)I(5,6)? ... STILL=S,T,I,L,L. S(5,4)... but we need T at (5,5) — (5,5) empty. L,L needed. (5,6) — outside if gridCols=7 (cols 0-6). Conflict.
    //   gridCols = max col used. THRILLS goes to col6. SHIRT goes to col6 row4. Max col=6. gridCols=7 (0-6). (5,5) exists. S(5,4)T(5,5)I(5,6)L(5,7)L(5,8) — outside. Conflict.
    //   STILL is 5 letters. Need to start at col2: S(5,2)T(5,3)I(5,4)? — wait, (5,4) is already S from LILTS. Conflict.
    // 7 verticals + main is fine. No H-connector needed.
    //
    // Wait — THRILLS only has 7 unique letters but 2 L's. Letters: T,H,R,I,L,L,S.
    // Let me recheck grid conflicts between the dense verticals:
    // Col0: T(0)H(1)R(2)I(3)L(4)L(5) — THRILL
    // Col1: H(0)I(1)L(2)L(3)S(4) — HILLS
    // Col2: R(0)I(1)L(2)L(3)S(4) — RILLS
    // Col3: I(0)L(1)L(2)S(3) — ILLS
    // Col4: L(0)I(1)S(2)T(3) — LIST
    // Col5: L(0)I(1)L(2)T(3)S(4) — LILTS
    // Col6: S(0)H(1)I(2)R(3)T(4) — SHIRT
    // No shared cells between verticals (each in different column). ✓.
    // H (row0) = THRILLS ✓.
    // All verticals share (row0, col) = corresponding letter of THRILLS ✓.
    //
    // FINAL Level 50: THRILLS + THRILL + HILLS + RILLS + ILLS + LIST + LILTS + SHIRT = 8 words
    //
    // Intersections:
    //   THRILL ∩ THRILLS: (0,0)=T ✓
    //   HILLS  ∩ THRILLS: (0,1)=H ✓
    //   RILLS  ∩ THRILLS: (0,2)=R ✓
    //   ILLS   ∩ THRILLS: (0,3)=I ✓
    //   LIST   ∩ THRILLS: (0,4)=L ✓
    //   LILTS  ∩ THRILLS: (0,5)=L ✓
    //   SHIRT  ∩ THRILLS: (0,6)=S ✓
    //
    // col: 0 1 2 3 4 5 6
    // row0: T H R I L L S
    // row1: H I I L I I H
    // row2: R L L L S L I
    // row3: I L L S T T R
    // row4: L S S   . S T
    // row5: L
    // -------------------------------------------------------------------------
    Level(
      id: 50,
      name: 'Thrills',
      letters: ['T', 'H', 'R', 'I', 'L', 'L', 'S'],
      targetPlacements: [
        WordPlacement(
          word: 'THRILLS',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.horizontal,
          isBonus: true,
        ),
        WordPlacement(
          word: 'THRILL',
          startRow: 0,
          startCol: 0,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'HILLS',
          startRow: 0,
          startCol: 1,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'RILLS',
          startRow: 0,
          startCol: 2,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'ILLS',
          startRow: 0,
          startCol: 3,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LIST',
          startRow: 0,
          startCol: 4,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'LILTS',
          startRow: 0,
          startCol: 5,
          direction: WordDirection.vertical,
        ),
        WordPlacement(
          word: 'SHIRT',
          startRow: 0,
          startCol: 6,
          direction: WordDirection.vertical,
        ),
      ],
      bonusWords: ['HILL', 'HILT', 'HILTS', 'HIS', 'HIST', 'HIT', 'HITS', 'ILL', 'ITS', 'LILT', 'LIS', 'LIT', 'LITS', 'RILL', 'SHILL', 'SHIT', 'SHRI', 'SHRILL', 'SILL', 'SILT', 'SIR', 'SIT', 'SITH', 'SLIT', 'SRI', 'STILL', 'STIR', 'THILL', 'THILLS', 'THIR', 'THIRL', 'THIRLS', 'THIS', 'TIL', 'TILL', 'TILLS', 'TILS', 'TIRL', 'TIRLS', 'TIS', 'TRILL', 'TRILLS'],
      gridRows: 6,
      gridCols: 7,
      preRevealedCells: [(0, 5), (3, 0), (4, 6)],
    ),
  ];
}
