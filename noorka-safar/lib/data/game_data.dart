/// Urdu letter data for Noor Ka Safar
/// Contains all letters with their sounds and example words

class UrduLetter {
  final String letter;
  final String name;
  final String sound;
  final String exampleWord;
  final String exampleMeaning;
  
  const UrduLetter({
    required this.letter,
    required this.name,
    required this.sound,
    required this.exampleWord,
    required this.exampleMeaning,
  });
}

/// All Urdu alphabet letters (حروفِ ابجد)
class UrduAlphabet {
  static const List<UrduLetter> letters = [
    // First 10 letters
    UrduLetter(
      letter: 'ا',
      name: 'الف',
      sound: 'A',
      exampleWord: 'ابو',
      exampleMeaning: 'Father',
    ),
    UrduLetter(
      letter: 'ب',
      name: 'بے',
      sound: 'B',
      exampleWord: 'باپ',
      exampleMeaning: 'Father',
    ),
    UrduLetter(
      letter: 'پ',
      name: 'پے',
      sound: 'P',
      exampleWord: 'پپیتا',
      exampleMeaning: 'Grandfather',
    ),
    UrduLetter(
      letter: 'ت',
      name: 'تے',
      sound: 'T',
      exampleWord: 'تاپا',
      exampleMeaning: 'Blanket',
    ),
    UrduLetter(
      letter: 'ٹ',
      name: 'ٹے',
      sound: 'TT',
      exampleWord: 'ٹاپا',
      exampleMeaning: 'Cup',
    ),
    UrduLetter(
      letter: 'ث',
      name: 'ثے',
      sound: 'S',
      exampleWord: 'ثابت',
      exampleMeaning: 'Proven',
    ),
    UrduLetter(
      letter: 'ج',
      name: 'جیم',
      sound: 'J',
      exampleWord: 'جان',
      exampleMeaning: 'Life',
    ),
    UrduLetter(
      letter: 'چ',
      name: 'چے',
      sound: 'CH',
      exampleWord: 'چاند',
      exampleMeaning: 'Moon',
    ),
    UrduLetter(
      letter: 'ح',
      name: 'حے',
      sound: 'H',
      exampleWord: 'حالاں',
      exampleMeaning: 'Now',
    ),
    UrduLetter(
      letter: 'خ',
      name: 'خے',
      sound: 'KH',
      exampleWord: 'خواب',
      exampleMeaning: 'Dream',
    ),
    // Continue with remaining letters...
    UrduLetter(
      letter: 'د',
      name: 'دال',
      sound: 'D',
      exampleWord: 'دادا',
      exampleMeaning: 'Grandfather',
    ),
    UrduLetter(
      letter: 'ڈ',
      name: 'ڈال',
      sound: 'DD',
      exampleWord: 'ڈبا',
      exampleMeaning: 'Box',
    ),
    UrduLetter(
      letter: 'ر',
      name: 'رے',
      sound: 'R',
      exampleWord: 'راہ',
      exampleMeaning: 'Way',
    ),
    UrduLetter(
      letter: 'ز',
      name: 'زے',
      sound: 'Z',
      exampleWord: 'زمين',
      exampleMeaning: 'Earth',
    ),
    UrduLetter(
      letter: 'ژ',
      name: 'ژے',
      sound: 'ZH',
      exampleWord: 'ژالہ',
      exampleMeaning: 'Frost',
    ),
    UrduLetter(
      letter: 'س',
      name: 'سین',
      sound: 'S',
      exampleWord: 'سورج',
      exampleMeaning: 'Sun',
    ),
    UrduLetter(
      letter: 'ش',
      name: 'شین',
      sound: 'SH',
      exampleWord: 'شمس',
      exampleMeaning: 'Sun',
    ),
    UrduLetter(
      letter: 'ص',
      name: 'صاد',
      sound: 'S',
      exampleWord: 'صبح',
      exampleMeaning: 'Morning',
    ),
    UrduLetter(
      letter: 'ض',
      name: 'ضاد',
      sound: 'Z',
      exampleWord: 'ضائع',
      exampleMeaning: 'Wasted',
    ),
    UrduLetter(
      letter: 'ط',
      name: 'طے',
      sound: 'T',
      exampleWord: 'طبيب',
      exampleMeaning: 'Doctor',
    ),
    UrduLetter(
      letter: 'ظ',
      name: 'ظے',
      sound: 'Z',
      exampleWord: 'ظالم',
      exampleMeaning: 'Cruel',
    ),
    UrduLetter(
      letter: 'ع',
      name: 'عین',
      sound: 'A',
      exampleWord: 'عالم',
      exampleMeaning: 'World',
    ),
    UrduLetter(
      letter: 'غ',
      name: 'غین',
      sound: 'GH',
      exampleWord: 'غذا',
      exampleMeaning: 'Food',
    ),
    UrduLetter(
      letter: 'ف',
      name: 'فے',
      sound: 'F',
      exampleWord: 'فيل',
      exampleMeaning: 'Elephant',
    ),
    UrduLetter(
      letter: 'ق',
      name: 'قاف',
      sound: 'Q',
      exampleWord: 'قمر',
      exampleMeaning: 'Moon',
    ),
    UrduLetter(
      letter: 'ک',
      name: 'کاف',
      sound: 'K',
      exampleWord: 'کتا',
      exampleMeaning: 'Dog',
    ),
    UrduLetter(
      letter: 'گ',
      name: 'گاف',
      sound: 'G',
      exampleWord: 'گھوڑا',
      exampleMeaning: 'Horse',
    ),
    UrduLetter(
      letter: 'ل',
      name: 'لام',
      sound: 'L',
      exampleWord: 'لڑکی',
      exampleMeaning: 'Girl',
    ),
    UrduLetter(
      letter: 'م',
      name: 'میم',
      sound: 'M',
      exampleWord: 'ماں',
      exampleMeaning: 'Mother',
    ),
    UrduLetter(
      letter: 'ن',
      name: 'نون',
      sound: 'N',
      exampleWord: 'ناں',
      exampleMeaning: 'Name',
    ),
    UrduLetter(
      letter: 'و',
      name: 'واؤ',
      sound: 'W',
      exampleWord: 'والا',
      exampleMeaning: 'Owner',
    ),
    UrduLetter(
      letter: 'ہ',
      name: 'ہے',
      sound: 'H',
      exampleWord: 'ہاتھ',
      exampleMeaning: 'Hand',
    ),
    UrduLetter(
      letter: 'ء',
      name: 'HAMZA',
      sound: 'A',
      exampleWord: 'اؤت',
      exampleMeaning: 'Came',
    ),
    UrduLetter(
      letter: 'ی',
      name: 'یے',
      sound: 'Y',
      exampleWord: 'یہاں',
      exampleMeaning: 'Here',
    ),
    UrduLetter(
      letter: 'ے',
      name: 'یے',
      sound: 'AI',
      exampleWord: 'ہے',
      exampleMeaning: 'Is',
    ),
  ];
  
  // Get letter by index
  static UrduLetter getLetter(int index) {
    if (index < 0 || index >= letters.length) {
      return letters[0];
    }
    return letters[index];
  }
  
  // Get total count
  static int get totalLetters => letters.length;
}

/// Urdu vowels (ہجورے)
class UrduVowels {
  static const List<UrduLetter> vowels = [
    UrduLetter(
      letter: 'ا',
      name: 'الف',
      sound: 'AA',
      exampleWord: 'آب',
      exampleMeaning: 'Water',
    ),
    UrduLetter(
      letter: 'و',
      name: 'واؤ',
      sound: 'OO',
      exampleWord: 'ودا',
      exampleMeaning: 'Uncle',
    ),
    UrduLetter(
      letter: 'ی',
      name: 'یاؤ',
      sound: 'AI',
      exampleWord: 'یاہل',
      exampleMeaning: 'Helper',
    ),
    UrduLetter(
      letter: 'َ',
      name: 'زبر',
      sound: 'A',
      exampleWord: 'بَ',
      exampleMeaning: 'B (with vowel)',
    ),
    UrduLetter(
      letter: 'ُ',
      name: 'زیر',
      sound: 'U',
      exampleWord: 'بُ',
      exampleMeaning: 'B (with vowel)',
    ),
    UrduLetter(
      letter: 'ِ',
      name: 'پیش',
      sound: 'I',
      exampleWord: 'بِ',
      exampleMeaning: 'B (with vowel)',
    ),
  ];
}

/// Common Urdu words for beginners
class UrduWords {
  static const List<UrduLetter> words = [
    UrduLetter(
      letter: 'بابا',
      name: 'Father',
      sound: 'BA-BA',
      exampleWord: 'بابا',
      exampleMeaning: 'Father',
    ),
    UrduLetter(
      letter: 'ماں',
      name: 'Mother',
      sound: 'MAAN',
      exampleWord: 'ماں',
      exampleMeaning: 'Mother',
    ),
    UrduLetter(
      letter: 'بہن',
      name: 'Sister',
      sound: 'BE-HAN',
      exampleWord: 'بہن',
      exampleMeaning: 'Sister',
    ),
    UrduLetter(
      letter: 'بھائی',
      name: 'Brother',
      sound: 'BHAI',
      exampleWord: 'بھائی',
      exampleMeaning: 'Brother',
    ),
    UrduLetter(
      letter: 'چاند',
      name: 'Moon',
      sound: 'CHAND',
      exampleWord: 'چاند',
      exampleMeaning: 'Moon',
    ),
    UrduLetter(
      letter: 'سورج',
      name: 'Sun',
      sound: 'SURAJ',
      exampleWord: 'سورج',
      exampleMeaning: 'Sun',
    ),
    UrduLetter(
      letter: 'پتہ',
      name: 'Leaf',
      sound: 'PATTA',
      exampleWord: 'پتہ',
      exampleMeaning: 'Leaf',
    ),
    UrduLetter(
      letter: 'کتا',
      name: 'Dog',
      sound: 'KUTA',
      exampleWord: 'کتا',
      exampleMeaning: 'Dog',
    ),
    UrduLetter(
      letter: 'بلی',
      name: 'Cat',
      sound: 'BILLI',
      exampleWord: 'بلی',
      exampleMeaning: 'Cat',
    ),
    UrduLetter(
      label: 'پرندہ',
      name: 'Bird',
      sound: 'PARINDA',
      exampleWord: 'پرندہ',
      exampleMeaning: 'Bird',
    ),
  ];
}

/// Game world data
class GameWorld {
  final String id;
  final String name;
  final String nameUrdu;
  final String description;
  final int unlockStars;
  final String themeColor;
  
  const GameWorld({
    required this.id,
    required this.name,
    required this.nameUrdu,
    required this.description,
    required this.unlockStars,
    required this.themeColor,
  });
  
  static const List<GameWorld> worlds = [
    GameWorld(
      id: 'world_1',
      name: "Children's Room",
      nameUrdu: 'بچوں کا کمرہ',
      description: 'A colorful room full of toys!',
      unlockStars: 0,
      themeColor: '#E91E63', // Pink
    ),
    GameWorld(
      id: 'world_2',
      name: 'Garden',
      nameUrdu: 'باغ',
      description: 'Beautiful flowers and butterflies!',
      unlockStars: 15,
      themeColor: '#4CAF50', // Green
    ),
    GameWorld(
      id: 'world_3',
      name: 'Beach',
      nameUrdu: 'ساحل',
      description: 'Fun in the sun and sand!',
      unlockStars: 30,
      themeColor: '#2196F3', // Blue
    ),
    GameWorld(
      id: 'world_4',
      name: 'Palace',
      nameUrdu: 'دربار',
      description: 'A majestic Mughal palace!',
      unlockStars: 50,
      themeColor: '#9C27B0', // Purple
    ),
    GameWorld(
      id: 'world_5',
      name: 'Sky',
      nameUrdu: 'آسمان',
      description: 'Fly among the clouds!',
      unlockStars: 75,
      themeColor: '#03A9F4', // Light Blue
    ),
  ];
}
