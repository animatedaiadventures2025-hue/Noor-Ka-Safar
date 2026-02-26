# UrduBachche - Educational Game for Kids

## Project Plan & Architecture Document

---

## 1. Project Overview

**Project Name:** UrduBachche (UrduBachche - Urdu for Children)

**Tagline:** Learn Urdu through Play!

**Mission:** Create an engaging, game-based Urdu learning experience for children (ages 4-8) that makes learning fun through interactive gameplay, similar to Teach Your Monster to Read.

**Target Audience:**
- Primary: Children ages 4-8 in Pakistan, India, and diaspora
- Secondary: Parents and educators

**Platforms:**
- Web Browser (PWA)
- Android App

---

## 2. Tech Stack (100% Free Tier)

### Frontend

| Component | Technology | Justification |
|-----------|------------|---------------|
| **Framework** | Flutter 3.x | Single codebase web + Android |
| **Language** | Dart 3.x | Modern, type-safe |
| **State Management** | Riverpod | Lightweight, testable |
| **Audio** | flutter_tts | Free TTS engine |
| **Storage** | shared_preferences | Local game progress |
| **HTTP** | dio | API calls |

### Backend (Serverless)

| Component | Technology | Free Tier Limit |
|-----------|------------|-----------------|
| **Database** | Firebase Firestore | 1GB storage |
| **Auth** | Firebase Auth | Unlimited |
| **Storage** | Firebase Storage | 5GB |
| **Hosting** | Firebase Hosting | 1GB |
| **Analytics** | Firebase Analytics | Free |
| **Functions** | Firebase Functions | 125K invocations/month |

### Development Tools

| Tool | Purpose | Cost |
|------|---------|------|
| **Flutter SDK** | Development | Free |
| **Android Studio** | IDE | Free |
| **VS Code** | Alternative IDE | Free |
| **Firebase Console** | Backend | Free |
| **GitHub** | Version Control | Free |
| **GitHub Actions** | CI/CD | 2000 min/month free |

---

## 3. System Architecture

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        FRONTEND                             │
│                      (Flutter App)                          │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────────┐  │
│  │  Game   │  │  Audio  │  │  State  │  │  Analytics  │  │
│  │ Engine  │  │ Manager │  │   (Riverpod)  │  (Firebase)  │  │
│  └────┬────┘  └────┬────┘  └────┬────┘  └──────┬──────┘  │
│       │             │             │               │         │
│       └─────────────┴──────┬──────┴───────────────┘         │
│                            │                                 │
│                     ┌──────▼──────┐                         │
│                     │  API Layer  │                         │
│                     └──────┬──────┘                         │
└────────────────────────────┼────────────────────────────────┘
                             │
              ┌──────────────┼──────────────┐
              │              │              │
        ┌─────▼─────┐ ┌────▼────┐ ┌─────▼─────┐
        │ Firestore │ │Firebase │ │Firebase   │
        │  (Data)   │ │ Storage │ │ Functions │
        └───────────┘ └─────────┘ └───────────┘
              │              │              │
              └──────────────┼──────────────┘
                             │
                    ┌────────▼────────┐
                    │   Firebase      │
                    │   Backend       │
                    └─────────────────┘
```

### Data Flow

```
User Action → Flutter App → Firebase API → Firestore
                    ↓
            Analytics Event → Firebase Analytics
                    ↓
            Audio Request → TTS / Storage
```

---

## 4. Feature Specification

### Core Features

#### 4.1 Character System
- **Main Character:** "Bachcha" (Child-friendly Urdu character)
- Customizable appearance (color, accessories)
- Earn rewards for progress
- Interactive animations

#### 4.2 Learning Modules

| Module | Description | Games |
|--------|-------------|-------|
| **Alif Se Ya** | Alphabet (حروفِ ابجد) | Letter matching, tracing |
| **Kachra** | Vowels (ہجورے) | Vowel identification |
| **Jodta** | Word Building (جوڑے والے الفاظ) | Combine letters |
| **Likho** | Writing (تحریر) | Trace letters |
| **Bolo** | Speaking (تلفظ) | Pronunciation |

#### 4.3 Game Mechanics

- **Worlds:** 5 different themed worlds to explore
- **Levels:** 10 levels per world
- **Stars:** 3 stars per level (based on accuracy)
- **Badges:** Achievement badges
- **Power-ups:** Hint, extra time, double points
- **Lives:** Game over on 3 mistakes (respawn available)

#### 4.4 Audio System (Configurable)

```dart
// Audio Provider Configuration
abstract class AudioProvider {
  Future<void> speak(String text, {String language});
  Future<void> playSound(String soundId);
}

class TTSProvider implements AudioProvider {
  String engine; // 'android', 'ios', 'google'
  String voice;  // Voice package identifier
  double rate;   // 0.0 to 1.0
  double pitch;  // 0.0 to 2.0
}

// Configuration Options
class AudioConfig {
  AudioProviderType provider; // 'tts', 'firebase_tts', 'elevenlabs', 'aws_polly'
  Map<String, dynamic> settings;
  String defaultLanguage; // 'ur-PK', 'hi-IN'
  bool cacheEnabled;
}
```

#### 4.5 Progress & Rewards

- Local storage for offline play
- Cloud sync (optional, Firebase)
- Daily login rewards
- Achievement system
- Parent dashboard (future)

---

## 5. Audio Configuration

### Supported Audio Providers

| Provider | Quality | Cost | Configuration |
|----------|---------|------|---------------|
| **Device TTS** | Basic | Free | Built-in Android/iOS TTS |
| **Google Cloud TTS** | Good | 1M chars free | API key |
| **Amazon Polly** | Good | 5M chars/month free | AWS credentials |
| **ElevenLabs** | Premium | 10K chars free | API key |

### Audio Config Structure

```dart
// lib/config/audio_config.dart
class AudioConfig {
  static const AudioProviderType defaultProvider = AudioProviderType.deviceTTS;
  
  static const Map<AudioProviderType, AudioProviderConfig> providers = {
    AudioProviderType.deviceTTS: AudioProviderConfig(
      name: 'Device TTS',
      quality: AudioQuality.basic,
      cost: 'Free',
      languages: ['ur-PK', 'hi-IN'],
      requiresAuth: false,
    ),
    AudioProviderType.googleCloudTTS: AudioProviderConfig(
      name: 'Google Cloud TTS',
      quality: AudioQuality.good,
      cost: '1M chars free/month',
      languages: ['ur-PK'],
      requiresAuth: true,
      envVars: ['GOOGLE_TTS_API_KEY'],
    ),
    AudioProviderType.elevenLabs: AudioProviderConfig(
      name: 'ElevenLabs',
      quality: AudioQuality.premium,
      cost: '10K chars free/month',
      languages: ['ur'],
      requiresAuth: true,
      envVars: ['ELEVENLABS_API_KEY'],
    ),
  };
}
```

### Environment Configuration

```dart
// lib/config/environment.dart
class Environment {
  static const String appName = 'UrduBachche';
  static const String version = '1.0.0';
  
  // Firebase (free tier)
  static const String firebaseProjectId = 'urdubachche-app';
  
  // Audio providers (configure based on tier)
  static AudioConfig audioConfig = AudioConfig.fromEnvironment();
  
  // Feature flags
  static const bool enableCloudSync = true; // Firebase free tier
  static const bool enableAnalytics = true;
  static const bool enableAds = false; // Disabled for MVP
}
```

---

## 6. Character Design

### Main Character: "Bachcha" (بچہ)

**Concept:** A friendly, round, educational character that represents a young Urdu learner.

**Design Specifications:**
- **Shape:** Round, blob-like, approachable
- **Colors:** Primary (green/teal), Secondary (orange/yellow)
- **Eyes:** Large, expressive, friendly
- **Accessories:** Backpack, hat (customizable)
- **Animations:** Walking, jumping, celebrating, thinking

**Variants:**
- 6 base colors
- 12 accessory options
- 5 expression styles

**Why not Monster:**
- More culturally appropriate
- Appeals to parents (educational feel)
- Easier to animate
- Universal child appeal

---

## 7. Database Schema (Firestore)

### Collections

```
users/
  {userId}/
    profile/
      displayName: string
      avatar: string
      createdAt: timestamp
    progress/
      currentWorld: number
      currentLevel: number
      totalStars: number
      badges: string[]
      lastPlayed: timestamp
    settings/
      soundEnabled: boolean
      musicEnabled: boolean
      language: string

worlds/
  {worldId}/
    name: string
    nameUrdu: string
    description: string
    unlockRequirement: number
    levels/
      {levelId}/
        name: string
        games: string[]
        starsRequired: number

games/
  {gameId}/
    type: string // 'match', 'trace', 'speak', 'build'
    difficulty: number
    content: map // dynamic based on game type
```

---

## 8. Scalability Design

### Current Architecture (MVP - Free Tier)

```
Flutter App → Firebase (Free Tier)
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
    Firestore    Storage    Functions
    (1GB)       (5GB)      (125K/mo)
```

### Scaling Strategy

| Growth Stage | Changes | Cost |
|--------------|---------|------|
| **MVP** | Firebase Free Tier | $0 |
| **1K Users** | Same | $0 |
| **10K Users** | Optimize queries | $0-10/mo |
| **100K Users** | Add CDN, optimize | $25-50/mo |
| **500K+ Users** | Multi-region, custom backend | $100+/mo |

### Scalability Principles

1. **Offline-First:** Local storage primary, sync when online
2. **Asset Optimization:** Compressed audio/images
3. **Caching:** Aggressive caching of static assets
4. **Lazy Loading:** Load content on-demand

---

## 9. Monetization Strategy

### Phase 1: Free (MVP)
- Full game free
- No ads (user experience focus)
- Goal: Build user base, prove product

### Phase 2: Freemium
- Basic levels: Free
- Premium worlds: $1.99-4.99 one-time
- No ads in kids section

### Phase 3: Subscription (Future)
- Family plan: $4.99/month
- School license: $49/year
- Parent dashboard: $2.99/month

### Revenue Projections

| Users | Conversion | Price | Monthly Revenue |
|-------|------------|-------|-----------------|
| 10,000 | 2% | $2.99 | $598 |
| 50,000 | 3% | $2.99 | $4,485 |
| 100,000 | 5% | $2.99 | $14,950 |

---

## 10. Development Phases

### Phase 1: MVP (Weeks 1-4)
**Goal:** Core gameplay working

- [ ] Flutter project setup
- [ ] Firebase configuration
- [ ] Character system (Bachcha)
- [ ] Alphabet module (3 games)
- [ ] Device TTS integration
- [ ] Local progress storage
- [ ] Web build
- [ ] Android APK build

### Phase 2: Content Expansion (Weeks 5-8)
**Goal:** Full alphabet + words

- [ ] All 5 learning modules
- [ ] 5 worlds, 50 levels
- [ ] Audio assets (letter sounds)
- [ ] Parent gate (prevent accidental purchases)
- [ ] Progress sync
- [ ] Analytics integration

### Phase 3: Polish (Weeks 9-12)
**Goal:** Production-ready

- [ ] Animations & transitions
- [ ] Rewards system
- [ ] Sound effects
- [ ] Performance optimization
- [ ] Beta testing
- [ ] Play Store listing

### Phase 4: Launch (Week 13)
**Goal:** Live on stores

- [ ] Publish to Google Play
- [ ] Publish as PWA
- [ ] Marketing materials
- [ ] Launch announcement

---

## 11. File Structure

```
urdubachche/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   │
│   ├── core/
│   │   ├── config/
│   │   │   ├── audio_config.dart
│   │   │   ├── environment.dart
│   │   │   └── game_config.dart
│   │   ├── constants/
│   │   │   ├── colors.dart
│   │   │   └── strings.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── utils/
│   │       └── extensions.dart
│   │
│   ├── data/
│   │   ├── models/
│   │   │   ├── user_progress.dart
│   │   │   ├── level.dart
│   │   │   └── world.dart
│   │   ├── repositories/
│   │   │   ├── progress_repository.dart
│   │   │   └── settings_repository.dart
│   │   └── services/
│   │       ├── firebase_service.dart
│   │       └── analytics_service.dart
│   │
│   ├── features/
│   │   ├── game/
│   │   │   ├── game_engine.dart
│   │   │   ├── game_widget.dart
│   │   │   └── games/
│   │   │       ├── letter_match.dart
│   │   │       ├── word_build.dart
│   │   │       └── letter_trace.dart
│   │   ├── character/
│   │   │   ├── character.dart
│   │   │   └── character_customization.dart
│   │   ├── world/
│   │   │   ├── world_map.dart
│   │   │   └── world_widget.dart
│   │   └── audio/
│   │       ├── audio_manager.dart
│   │       └── providers/
│   │           ├── tts_provider.dart
│   │           └── google_tts_provider.dart
│   │
│   ├── providers/
│   │   ├── game_provider.dart
│   │   ├── progress_provider.dart
│   │   ├── audio_provider.dart
│   │   └── settings_provider.dart
│   │
│   └── widgets/
│       ├── common/
│       ├── buttons/
│       └── animations/
│
├── assets/
│   ├── audio/
│   │   ├── letters/
│   │   └── sounds/
│   ├── images/
│   │   ├── characters/
│   │   ├── worlds/
│   │   └── ui/
│   └── data/
│       └── levels.json
│
├── firebase/
│   ├── firebase_options.dart
│   └── firestore.rules
│
├── test/
│   ├── unit/
│   └── widget/
│
├── ios/
├── android/
├── web/
└── pubspec.yaml
```

---

## 12. Configuration Files

### pubspec.yaml (Dependencies)

```yaml
name: urdubachche
description: Learn Urdu through play!
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  
  # Firebase
  firebase_core: ^2.15.0
  cloud_firestore: ^4.8.0
  firebase_auth: ^4.7.0
  firebase_analytics: ^10.4.0
  firebase_storage: ^11.2.0
  firebase_storage_mocks: ^0.6.0
  firebase_core_platform_interface: ^4.8.0
  
  # Audio
  flutter_tts: ^3.6.3
  audioplayers: ^5.2.1
  
  # Storage
  shared_preferences: ^2.2.0
  hive: ^2.2.3
  
  # Utils
  uuid: ^4.1.0
  intl: ^0.18.1
  json_annotation: ^4.8.1
  
  # UI
  flutter_svg: ^2.0.7
  cached_network_image: ^3.3.0
  lottie: ^3.0.0
  
  # HTTP
  dio: ^5.3.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.6
  json_serializable: ^6.7.1

flutter:
  uses-material-design: true
  
  assets:
    - assets/audio/
    - assets/images/
    - assets/data/
```

### Environment Variables (.env)

```bash
# Firebase
FIREBASE_PROJECT_ID=urdubachche-app
FIREBASE_ANDROID_APP_ID=1:123456789:android:abcdef
FIREBASE_IOS_APP_ID=1:123456789:ios:abcdef

# Audio Providers (Optional - for premium voices)
GOOGLE_TTS_API_KEY=your_key_here
ELEVENLABS_API_KEY=your_key_here

# Feature Flags
ENABLE_ANALYTICS=true
ENABLE_CLOUD_SYNC=true
ENABLE_PREMIUM_CONTENT=false
```

---

## 13. Risk Analysis

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| TTS Quality | Medium | Medium | Configurable provider |
| Firebase costs | Low | High | Optimize queries, cache |
| App Store rejection | Medium | High | Follow guidelines, age rating |
| Audio files size | High | Low | Compress, lazy load |
| User retention | Medium | High | Gamification, rewards |

---

## 14. Success Metrics

| Metric | Target (6 months) |
|--------|------------------|
| Downloads | 10,000 |
| Daily Active Users | 1,000 |
| Retention (Day 7) | 30% |
| Completion Rate | 20% |
| Play Store Rating | 4.5+ |

---

## 15. Next Steps

1. **Confirm project** - User approval to proceed
2. **Create Flutter project** - Initialize codebase
3. **Set up Firebase** - Create project, configure
4. **Build MVP** - Core gameplay
5. **Test** - Internal + beta
6. **Launch** - Publish to stores

---

*Document Version: 1.0*
*Created: 2026-02-25*
*Author: BatCave (AI Assistant)*
