# Noor Ka Safar (نور کا سفر) - Game Design Document

## 1. Project Overview

**Project Name:** Noor Ka Safar (نور کا سفر)  
**Tagline:** Learn Urdu through Play!  
**Backup Name:** Urdu Dhamaal (اردو دھماکہ)

**Character:** Noor (نور) - A friendly, round, child-like character that guides kids through the learning journey.

---

## 2. Core Gameplay Loop

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Home      │ ──→ │  World     │ ──→ │   Game      │
│   Screen    │     │  Select    │     │   Play      │
└─────────────┘     └─────────────┘     └─────────────┘
        ↑                                        │
        │           ┌─────────────┐              │
        └────────── │   Result   │ ←────────────┘
                    │   Screen    │
                    └─────────────┘
```

---

## 3. Learning Modules (Months-Based Progression)

| Module | Urdu Name | Focus | Months | Letters/Words |
|--------|-----------|--------|--------|---------------|
| **Alif Se Ya** | الف سے یا | Alphabet | 1-3 | 40 letters |
| **Kachra** | کھرے | Vowels | 4-6 | 10 vowels |
| **Jodta** | جوڑے | Word Building | 7-9 | 2-3 letter words |
| **Likho** | لکھو | Writing | 10-11 | Tracing |
| **Bolo** | بولو | Speaking | 12-13 | Pronunciation |

---

## 4. Game Types (Minigames)

### Alphabet Learning Games

| # | Game | Description | Mechanics |
|---|------|-------------|-----------|
| 1 | **Letter Splash** | Tap floating letters | Tap correct letter from 3-5 options |
| 2 | **Trace Quest** | Trace on screen | Follow dotted line to trace letter |
| 3 | **Sound Match** | Match sound to letter | Listen and select matching letter |
| 4 | **Find the Letter** | Spot in grid | Find target in 3x3 to 5x5 grid |
| 5 | **Feed Noor** | Drop letters to Noor | Drag correct letter to character |

### Word Building Games

| # | Game | Description | Mechanics |
|---|------|-------------|-----------|
| 6 | **Word Builder** | Form words | Drag letters to build 2-3 letter words |
| 7 | **Memory Match** | Card matching | Match letter pairs |
| 8 | **Pop Bubble** | Pop bubbles | Pop bubbles with correct letter |
| 9 | **Story Reader** | Read sentences | Read simple Urdu sentences |

---

## 5. Character System

### Main Character: Noor (نور)

**Design:** Round, friendly, blob-like character with big expressive eyes

**Moods:**
- Happy (default)
- Celebrating (on success)
- Thinking (during challenges)
- Surprised (on wrong answer)
- Sad (on failure - rare)

**Customization:**
- 6 body colors (teal default)
- 12 accessory options (hats, glasses, backpacks)
- Unlocked through progress

### Companion Characters (Unlockable)

| Character | Unlock | Personality |
|-----------|--------|-------------|
| Gudiya (Doll) | Module 1 complete | Helpful |
| Chuhe (Mouse) | Module 2 complete | Quick & clever |
| Murghi (Chicken) | Module 3 complete | Energetic, sings |
| Sher (Lion) | Module 4 complete | Brave |
| Hathi (Elephant) | Module 5 complete | Wise |

---

## 6. Reward System

### Stars (1-5 per level)

| Stars | Accuracy | Attempt | Visual |
|-------|----------|---------|--------|
| ⭐ | 60%+ | 3+ tries | Bronze |
| ⭐⭐ | 70%+ | 2 tries | Silver |
| ⭐⭐⭐ | 80%+ | 1 try | Gold |
| ⭐⭐⭐⭐ | 90%+ | 1 try | Glowing |
| ⭐⭐⭐⭐⭐ | 100% | 1 try | Rainbow |

### Progression Unlocks

| Reward | How to Earn |
|--------|-------------|
| 🎩 New Hat | Complete level |
| 👓 Glasses | 10 stars |
| 🎨 Color Change | 15 stars |
| 🧸 New Character | Complete world |
| 🗺️ New World | Complete module |
| 🎵 New Song | 25 stars |
| 📖 New Story | 50 stars |

### Badge System

| Badge | Requirement |
|-------|-------------|
| 🌙 الف سے یا | Complete alphabet |
| ⭐ Star Collector | 100 stars |
| 🎯 Sharp Shooter | 10 perfect rounds |
| 💪 Never Gives Up | Complete after 5 attempts |
| 📚 Word Builder | Build 50 words |
| 🎤 Voice Star | 20 speaking games |

---

## 7. World/Chapter System

### World 1: Bachon ki Duniya (بچوں کی دنیا)
**Theme:** Kid's room, colorful, toys  
**Unlock:** Start  
**Levels:** 10

### World 2: Bagh (باغ)
**Theme:** Garden with flowers, butterflies  
**Unlock:** 15 stars  
**Levels:** 10

### World 3: Sahil (ساحل)
**Theme:** Beach, ocean, fish  
**Unlock:** 30 stars  
**Levels:** 10

### World 4: Darbar (دربار)
**Theme:** Palace, Mughal style  
**Unlock:** 50 stars  
**Levels:** 10

### World 5: Aasman (آسمان)
**Theme:** Sky, clouds, stars  
**Unlock:** 75 stars  
**Levels:** 10

---

## 8. Technical Design

### Adaptive Graphics System

- **Base Resolution:** 1920x1080
- **Scaling:** Proportional to screen size
- **Supported:** Mobile (portrait/landscape), Tablet, Desktop

### Audio System (Configurable)

| Provider | Quality | Free Tier |
|----------|---------|-----------|
| Device TTS | Basic | ✅ Free |
| Google Cloud TTS | Good | 1M chars/month |
| Amazon Polly | Good | 5M chars/month |
| ElevenLabs | Premium | 10K chars/month |

### State Management

- **Riverpod** for reactive state
- **Local Storage** for offline progress
- **Firebase** (optional cloud sync)

---

## 9. Monetization

### Phase 1: Free (MVP)
- All content free
- No ads

### Phase 2: Freemium
- Basic modules: Free
- Premium worlds: $1.99-4.99

### Phase 3: Subscription
- Family plan: $4.99/month
- School license: $49/year

---

## 10. File Structure

```
noorka-safar/
├── lib/
│   ├── main.dart                    # App entry
│   ├── core/
│   │   ├── theme/
│   │   │   └── game_theme.dart     # Colors, dimensions, theme
│   │   └── widgets/
│   │       └── responsive_widgets.dart  # Adaptive UI components
│   ├── features/
│   │   ├── character/
│   │   │   └── noor_character.dart # Noor character widget
│   │   └── home/
│   │       └── home_screen.dart    # Home screen
│   └── data/
│       └── game_data.dart          # Game content data
├── assets/
│   └── (images, audio)
├── pubspec.yaml
└── build/web/                       # Built output
```

---

## 11. Build Commands

```bash
# Development
flutter run -d chrome

# Build Web
flutter build web --release

# Build Android (needs SDK)
flutter build apk --release
```

---

*Document Version: 1.0*
*Project: Noor Ka Safar*
*Date: 2026-02-25*
