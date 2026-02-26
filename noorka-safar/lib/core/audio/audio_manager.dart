import 'package:flutter_tts/flutter_tts.dart';

/// Audio Manager for Noor Ka Safar
/// Handles TTS and sound effects with configurable providers

enum AudioProviderType {
  deviceTTS,      // Built-in device TTS (free)
  googleCloudTTS, // Google Cloud TTS (free tier)
  elevenLabs,     // Premium TTS
  awsPolly,       // Amazon Polly (free tier)
}

/// Audio configuration
class AudioConfig {
  final AudioProviderType provider;
  final String language;
  final double rate;
  final double pitch;
  final double volume;
  
  const AudioConfig({
    this.provider = AudioProviderType.deviceTTS,
    this.language = 'ur-PK',
    this.rate = 0.5,
    this.pitch = 1.0,
    this.volume = 1.0,
  });
  
  AudioConfig copyWith({
    AudioProviderType? provider,
    String? language,
    double? rate,
    double? pitch,
    double? volume,
  }) {
    return AudioConfig(
      provider: provider ?? this.provider,
      language: language ?? this.language,
      rate: rate ?? this.rate,
      pitch: pitch ?? this.pitch,
      volume: volume ?? this.volume,
    );
  }
}

/// Main audio manager class
class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();
  
  FlutterTts? _flutterTts;
  AudioConfig _config = const AudioConfig();
  bool _isInitialized = false;
  bool _isMuted = false;
  
  // Callback for when speech starts/ends
  Function()? onSpeechStart;
  Function()? onSpeechEnd;
  
  /// Initialize the audio manager
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    _flutterTts = FlutterTts();
    
    // Configure TTS
    await _flutterTts!.setLanguage(_config.language);
    await _flutterTts!.setSpeechRate(_config.rate);
    await _flutterTts!.setPitch(_config.pitch);
    await _flutterTts!.setVolume(_config.volume);
    
    // Set up handlers
    _flutterTts!.setStartHandler(() {
      onSpeechStart?.call();
    });
    
    _flutterTts!.setCompletionHandler(() {
      onSpeechEnd?.call();
    });
    
    _flutterTts!.setErrorHandler((msg) {
      print('TTS Error: $msg');
      onSpeechEnd?.call();
    });
    
    // Get available languages
    final languages = await _flutterTts!.getLanguages;
    print('Available TTS Languages: $languages');
    
    _isInitialized = true;
  }
  
  /// Update audio configuration
  void updateConfig(AudioConfig config) {
    _config = config;
    if (_flutterTts != null) {
      _flutterTts!.setLanguage(config.language);
      _flutterTts!.setSpeechRate(config.rate);
      _flutterTts!.setPitch(config.pitch);
      _flutterTts!.setVolume(config.volume);
    }
  }
  
  /// Speak text using TTS
  Future<void> speak(String text) async {
    if (_isMuted || !_isInitialized) return;
    
    await stop();
    
    switch (_config.provider) {
      case AudioProviderType.deviceTTS:
        await _speakWithDeviceTTS(text);
        break;
      case AudioProviderType.googleCloudTTS:
        // Would require API key setup
        await _speakWithDeviceTTS(text);
        break;
      case AudioProviderType.elevenLabs:
        // Would require API key setup
        await _speakWithDeviceTTS(text);
        break;
      case AudioProviderType.awsPolly:
        // Would require AWS setup
        await _speakWithDeviceTTS(text);
        break;
    }
  }
  
  Future<void> _speakWithDeviceTTS(String text) async {
    await _flutterTts?.speak(text);
  }
  
  /// Stop speaking
  Future<void> stop() async {
    await _flutterTts?.stop();
  }
  
  /// Speak letter with pronunciation
  Future<void> speakLetter(String letter, {String? exampleWord}) async {
    String text = letter;
    
    if (exampleWord != null) {
      text = '$letter (${exampleWord})';
    }
    
    await speak(text);
  }
  
  /// Speak encouragement
  Future<void> speakEncouragement() async {
    const encouragements = [
      'بہت اچھا! - Very good!',
      'عارف! - Great!',
      'ماشاءاللہ! - Well done!',
      'بہت زیادہ اچھا! - Very good!',
      'تم ہو سکتے ہو! - You can do it!',
    ];
    
    final encouragement = encouragements[
      DateTime.now().millisecond % encouragements.length
    ];
    
    await speak(encouragement);
  }
  
  /// Speak celebration
  Future<void> speakCelebration() async {
    await speak('واہ! تم نے کامیاب ہو گئے! - Wow! You succeeded!');
  }
  
  /// Speak try again
  Future<void> speakTryAgain() async {
    const messages = [
      'دوبارہ کوشش کرو - Try again',
      'یہ غلط ہے - This is wrong',
      'دیکھو بھلائی - Look carefully',
    ];
    
    final message = messages[DateTime.now().millisecond % messages.length];
    await speak(message);
  }
  
  /// Mute/unmute
  void toggleMute() {
    _isMuted = !_isMuted;
    if (_isMuted) {
      stop();
    }
  }
  
  bool get isMuted => _isMuted;
  
  /// Dispose resources
  void dispose() {
    _flutterTts?.stop();
    _isInitialized = false;
  }
}

/// Sound effect types
enum SoundEffect {
  tap,
  success,
  failure,
  star,
  click,
  celebrate,
  unlock,
}

/// Sound manager for game effects (placeholder for future implementation)
class SoundManager {
  static final SoundManager _instance = SoundManager._internal();
  factory SoundManager() => _instance;
  SoundManager._internal();
  
  bool _isMuted = false;
  
  /// Play sound effect (requires audio files)
  Future<void> playSound(SoundEffect effect) async {
    if (_isMuted) return;
    
    // Future: Load and play audio files
    // For now, this is a placeholder
    print('Playing sound: $effect');
  }
  
  void toggleMute() {
    _isMuted = !_isMuted;
  }
}
