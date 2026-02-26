# UrduBachche - Game Mechanics & Design Document

## 1. Market Research - What Works in Educational Apps

### Top Performing Apps Analysis

| App | Platform | Rating | Strengths |
|-----|----------|--------|-----------|
| **Teach Your Monster to Read** | iOS/Android/Web | 4.7⭐ | Monster character, progression, rewards, letter-sound association |
| **Khan Academy Kids** | iOS/Android | 4.8⭐ | Broad subjects, adaptive difficulty, offline play |
| **Endless Alphabet** | iOS/Android | 4.6⭐ | Word definitions, fun animations, vocabulary building |
| **PBS Kids Games** | iOS/Android | 4.5⭐ | TV show characters, variety of games, learning through play |
| **Sesame Street** | iOS/Android | 4.5⭐ | Trusted brand, songs, emotional connection |
| **Lingokids** | iOS/Android | 4.4⭐ | Game-based, progress tracking, parent dashboard |
| **Homer** | iOS/Android | 4.3⭐ | Personalized learning, phonics focus, stories |

### Key Strengths to Model

| Strength | Implementation for UrduBachche |
|----------|------------------------------|
| **Character-based learning** | Bachcha character guides kids through journey |
| **Phonetic association** | Each letter = sound + image + word |
| **Progressive difficulty** | Start easy, get harder (months-based) |
| **Instant feedback** | Positive sounds, visual rewards |
| **No fail state** | Keep trying until success (no frustration) |
| **Short sessions** | 3-5 min per game session |
| **Bite-sized content** | One letter/word per screen |
| **Parental controls** | Settings behind parent gate |

---

## 2. App Name Options

### Option A: Playful + Educational

| Name | Meaning | Appeal |
|------|---------|--------|
| **UrduBachche** | Urdu + Child | Direct, memorable |
| **Bachche Seekho** | Kids Learn | Action-oriented |
| **Urdu Khel** | Urdu Play | Fun association |
| **Alif Aap** | Alphabet Step | Educational |
| **Hafta Urdu** | Urdu Week | Regular engagement |

### Option B: Character-Based

| Name | Meaning | Appeal |
|------|---------|--------|
| **Bachcha's Journey** | Main character adventure | Story-driven |
| **Bachcha ki Duniya** | Bachcha's World | Ownership |
| **Sath Bachcha** | With Bachcha | Companion feel |

### Option C: Rhyming & Fun

| Name | Meaning | Appeal |
|------|---------|--------|
| **Urdu Umeed** | Urdu Hope | Positive |
| **Parhay Bachche** | Reading Kids | Motivational |
| **Khelo Seekho** | Play Learn | Action + Learning |

### 🏆 Recommended: **UrduBachche**

**Rationale:**
- Easy to pronounce
- Memorable
- Defines target audience
- Works in English and Urdu script

---

## 3. Character Name Options

### Main Character

| Name | Meaning | Personality |
|------|---------|--------------|
| **Bachcha** (بچہ) | Child | Curious, playful, eager learner |
| **Chhota** (چھوٹا) | Little One | Small but mighty |
| **Nukhba** (نخبا) | Little Star | Shining, special |
| **Afeef** (عفیف) | Pure | Innocent, good |
| **Noor** (نور) | Light | Guiding, bright |

### 🏆 Recommended: **Bachcha** (بچہ)

**Character Design:**
- Round, friendly blob shape
- Big expressive eyes
- Primary color: Teal/Green (#00BFA5)
- Secondary: Warm Orange (#FF9800)
- Accessories: Backpack, cap (unlockable)
- Expressions: Happy, thinking, celebrating, surprised

### Companion Characters (Unlockable)

| Character | Unlock Condition | Personality |
|-----------|-----------------|-------------|
| **Gudiya** (Doll) | Complete Module 1 | Helpful, reminds of favorite toy |
| **Chuhe** (Mouse) | Complete Module 2 | Quick, clever |
| **Murghi** (Chicken) | Complete Module 3 | Energetic, sings |
| **Sher** (Lion) | Complete Module 4 | Brave, protector |
| **Hathi** (Elephant) | Complete Module 5 | Wise, big friend |

---

## 4. Storyline - Islamic World Theme

### Setting: "Dastaan-e-Taleem" (Story of Learning)

**Premise:**
Bachcha is a young student who dreams of becoming a **Hafiz** (memorizer of Quran) and wants to learn to read the beautiful Urdu alphabet. The app follows Bachcha's journey from the first letter (Alif) to being able to read complete words and sentences.

### Story Arc

| Chapter | Theme | Lesson |
|---------|-------|--------|
| **Chapter 1: Safeer-e-Alif** | The traveler Alif | Introduction to first letters |
| **Chapter 2: Gharana-e-Huruf** | Family of Letters | Vowels and consonants |
| **Chapter 3: Dosti-e-Kalima** | Word Friends | Word building |
| **Chapter 4: Raah-e-Qiraat** | Path of Reading | Reading practice |
| **Chapter 5: Dastaan-e-Khat** | Story of Writing | Writing letters |

### Cultural Elements

| Element | Usage |
|---------|-------|
| **Mosque silhouette** | Background for certain levels |
| **Date palm trees** | World decoration |
| **Arabic patterns** | UI borders, frames |
| **Islamic geometric art** | Reward animations |
| **Traditional foods** | Reward celebrations (sheermal, halwa) |
| **Family values** | Parents/grandparents in backstory |

### Opening Story (Screen 1)

> *"Assalamu Alaikum! I'm Bachcha. I want to learn to read Urdu just like my Dada (grandfather) reads the Quran. Will you help me on my journey from Alif to Ya?"*

### Progression Story

```
Week 1-4:    "I learned my first letters! Alif, Ba, Ta..."
Week 5-8:    "Now I know all the letters! They're like my friends."
Week 9-12:   "I can read words now! Like 'Baba', 'Dada', 'Kitab'!"
Week 13-16:  "I can read sentences! Look, I read the whole Kalima!"
Week 17-20:  "I can write too! Let me write your name!"
```

---

## 5. Age Progression (Months-Based)

### Age Groups (in Months)

| Age Group | Months | Developmental Stage |
|-----------|--------|---------------------|
| **Tiny Learners** | 24-36 months | Toddlers - basic recognition |
| **Little Learners** | 36-48 months | Pre-K - letter sounds |
| **Junior Learners** | 48-60 months | Kindergarten - word building |
| **Rising Readers** | 60-72 months | Grade 1 - reading |

### Progression by Months (not years!)

| Month | Module | Focus | Skills |
|-------|--------|-------|--------|
| **1** | Alif Se Ya - Part 1 | First 10 letters | Recognition |
| **2** | Alif Se Ya - Part 2 | Letters 11-20 | Recognition |
| **3** | Alif Se Ya - Part 3 | Letters 21-40 | Recognition |
| **4** | Kachra - Part 1 | Basic vowels | Sounds |
| **5** | Kachra - Part 2 | Vowel combinations | Sounds |
| **6** | Review & Celebrate | All letters | Mastery |
| **7** | Jodta - Part 1 | 2-letter words | Building |
| **8** | Jodta - Part 2 | 3-letter words | Building |
| **9** | Jodta - Part 3 | Common words | Reading |
| **10** | Likho - Part 1 | Trace letters | Writing |
| **11** | Likho - Part 2 | Trace words | Writing |
| **12** | Bolo - Part 1 | Pronunciation | Speaking |
| **13** | Bolo - Part 2 | Full sentences | Speaking |
| **14** | Review & Graduation | All modules | Mastery |
| **15+** | Review & Explore | Free play | Reinforcement |

### Difficulty Scaling (Within Each Level)

| Attempt | Difficulty |
|---------|------------|
| 1st try | 3-4 items, slower timing |
| 2nd try | Same items, normal timing |
| 3rd try | Same items, faster timing |
| Mastered | Bonus round, stars awarded |

---

## 6. Game Types (Minigames)

### Core Game Types

| # | Game Type | Description | Letters | Words |
|---|-----------|-------------|---------|-------|
| 1 | **Letter Splash** | Tap letters as they float | ✅ | ❌ |
| 2 | **Trace Quest** | Trace letter on screen | ✅ | ❌ |
| 3 | **Sound Match** | Match letter to sound | ✅ | ❌ |
| 4 | **Word Builder** | Drag letters to form word | ❌ | ✅ |
| 5 | **Find the Letter** | Spot letter in grid | ✅ | ❌ |
| 6 | **Say It Right** | Speak letter/word | ✅ | ✅ |
| 7 | **Pop the Bubble** | Pop correct letter bubble | ✅ | ❌ |
| 8 | **Feed Bachcha** | Feed letter to character | ✅ | ❌ |
| 9 | **Memory Match** | Match letter pairs | ✅ | ❌ |
| 10 | **Jump and Grab** | Jump to catch letters | ✅ | ❌ |
| 11 | **Paint by Letter** | Fill letter with color | ✅ | ❌ |
| 12 | **Story Reader** | Read simple sentences | ❌ | ✅ |

### Game Details

#### 1. Letter Splash (لکڑی کھیل)
```
Mechanic: Letters float in water, tap the correct one
UI: Water ripple effect, fish swimming
Audio: Splash sound + letter sound
Difficulty: 3-5 letters per round
```

#### 2. Trace Quest (لکھنے کا سفر)
```
Mechanic: Trace letter on dotted line
UI: Sand/paper texture background
Audio: Pencil scratching, letter name
Difficulty: 1 letter at a time, 3 attempts
```

#### 3. Sound Match (آواز جوڑ)
```
Mechanic: Hear sound, tap matching letter
UI: Musical notes, speakers
Audio: Letter pronunciation + example word
Difficulty: 4 options, increase speed
```

#### 4. Word Builder (لفظ ساز)
```
Mechanic: Drag letter cards to build word
UI: Building blocks
Audio: Letter sounds combine into word
Difficulty: 2-4 letter words
```

#### 5. Find the Letter (تلاش حرف)
```
Mechanic: Find target letter in grid
UI: Grid of various letters
Audio: "Find [letter]!" + celebration
Difficulty: 3x3 → 4x4 → 5x5 grid
```

#### 6. Say It Right (صحیح بولو)
```
Mechanic: TTS says word, child repeats
UI: Microphone icon, wave animation
Audio: Word + "Now you try!"
Difficulty: Single word → phrase
```

#### 7. Pop the Bubble (بلبلے پھوڑ)
```
Mechanic: Pop bubbles with correct letter
UI: Bubbles floating up
Audio: Pop sound, letter sound
Difficulty: 3-5 bubbles, moving targets
```

#### 8. Feed Bachcha (بچہ کو کھانا)
```
Mechanic: Drop correct letter in Bachcha's mouth
UI: Bachcha with open mouth, food items
Audio: Munching, happy sounds
Difficulty: 5-8 letters per round
```

#### 9. Memory Match (یادداشت کھیل)
```
Mechanic: Flip cards, match letter pairs
UI: Cards face down
Audio: Flip sound, match celebration
Difficulty: 4 → 6 → 8 → 12 cards
```

#### 10. Jump and Grab (کود کر پکڑو)
```
Mechanic: Tap to jump, catch correct letter
UI: Side-scrolling platform
Audio: Jump sound, collect sound
Difficulty: Moving platforms, speed increases
```

#### 11. Paint by Letter (رنگ بھرو)
```
Mechanic: Fill letter with different colors
UI: Outline with color palette
Audio: Paint swoosh
Difficulty: 3 color options
```

#### 12. Story Reader (کہانی پڑھو)
```
Mechanic: Read simple Urdu sentence
UI: Story book format
Audio: TTS reads, child reads
Difficulty: 3-word → 5-word → sentence
```

### MVP Games (Phase 1)

| Priority | Game | Reason |
|----------|------|--------|
| 1 | Letter Splash | Core learning mechanic |
| 2 | Trace Quest | Writing skill |
| 3 | Sound Match | Audio learning |
| 4 | Find the Letter | Recognition |
| 5 | Feed Bachcha | Character engagement |

### Phase 2 Games

| Priority | Game | Reason |
|----------|------|--------|
| 6 | Word Builder | Word formation |
| 7 | Memory Match | Reinforcement |
| 8 | Pop the Bubble | Fun variation |

---

## 7. Star & Reward System

### Stars (1-5 Per Level)

| Stars | Criteria | Visual |
|-------|----------|--------|
| ⭐ | 60%+ accuracy, 3+ attempts | Bronze star |
| ⭐⭐ | 70%+ accuracy, 2 attempts | Silver star |
| ⭐⭐⭐ | 80%+ accuracy, 1 attempt | Gold star |
| ⭐⭐⭐⭐ | 90%+ accuracy, 1 attempt | Glowing star |
| ⭐⭐⭐⭐⭐ | 100% accuracy, 1 attempt | Rainbow star |

### Star Accumulation

```
Level Stars Required to Unlock Next Level
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Level 1 → 2  : Any 1 star
Level 2 → 3  : Any 1 star  
Level 3 → 4  : 2 stars
Level 4 → 5  : 2 stars
Level 5 → 6  : 3 stars
...
World 1 → 2  : 15 stars total
World 2 → 3  : 30 stars total
```

### Rewards & Unlocks

| Reward | How to Earn | Description |
|--------|-------------|-------------|
| 🏅 **New Accessory** | Complete module | Hats, glasses, backpacks |
| 🎨 **New Color** | 10 stars | Change Bachcha's color |
| 🌟 **New Character** | Complete world | Unlock companion |
| 🗺️ **New World** | Complete module | New themed world |
| 🎵 **New Song** | 25 stars | Celebration song |
| 📖 **New Story** | 50 stars | Readable story |

### Badge System

| Badge | Requirement |
|-------|-------------|
| 🌙 **Alif Se Aap** | Complete alphabet module |
| ⭐ **Star Collector** | Earn 100 stars |
| 🎯 **Sharp Shooter** | 10 perfect rounds |
| 💪 **Never Gives Up** | Complete after 5 attempts |
| 📚 **Word Builder** | Build 50 words |
| 🎤 **Voice Star** | Complete 20 speaking games |

---

## 8. Progression Flow

### First-Time User Flow

```
┌─────────────────┐
│   Splash Screen │ → 3 sec logo
└────────┬────────┘
         ▼
┌─────────────────┐
│  Welcome Story  │ → "Hi! I'm Bachcha..."
└────────┬────────┘
         ▼
┌─────────────────┐
│  Age Selection  │ → Parent gate (2+2=?)
└────────┬────────┘
         ▼
┌─────────────────┐
│   World Map 1   │ → First letter (Alif)
└────────┬────────┘
         ▼
┌─────────────────┐
│   Level 1.1    │ → Letter Splash
└────────┬────────┘
         ▼
┌─────────────────┐
│   ⭐⭐⭐ Result │ → Stars + Story
└────────┬────────┘
         ▼
┌─────────────────┐
│  Next Level /   │
│  World Select   │
└─────────────────┘
```

### Daily Play Flow

```
┌─────────────────┐
│  Open App       │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Continue/      │ → Resume or select
│  New Game       │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Mini Game      │ → 3-5 minutes
└────────┬────────┘
         ▼
┌─────────────────┐
│  ⭐⭐⭐ Result  │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Reward +       │ → Stars, badge, unlock
│  Next Level     │
└────────┬────────┘
         ▼
┌─────────────────┐
│  Daily Bonus    │ → Calendar reward
└─────────────────┘
```

---

## 9. Technical Implementation Notes

### Game State Machine

```dart
enum GameState {
  intro,      // Show instructions
  playing,    // Active gameplay
  checking,   // Verify answer
  success,    // Correct answer
  failure,    // Wrong answer
  complete,   // Level complete
}

enum StarRating {
  none,
  one,   // 60%+
  two,    // 70+
  three,  // 80+
  four,   // 90+
  five,   // 100%
}
```

### Audio Feedback Mapping

| Action | Sound Effect |
|--------|--------------|
| Letter tap correct | " Ding!" |
| Letter tap wrong | " Bonk" |
| Level complete | Cheering + music |
| Star earned | Chime per star |
| New unlock | Fanfare |
| Button tap | Soft click |

---

## 10. Summary Table

| Aspect | Decision |
|--------|----------|
| **App Name** | UrduBachche |
| **Character** | Bachcha (بچہ) |
| **Theme** | Islamic World / Learning Journey |
| **Age Range** | 24-72 months (2-6 years) |
| **Modules** | 5 (Alif, Kachra, Jodta, Likho, Bolo) |
| **Duration** | 15 months full progression |
| **Games per Module** | 8-12 minigames |
| **Stars per Level** | 1-5 stars |
| **Reward Types** | Accessories, colors, characters, worlds |

---

*Document Version: 1.0*
*For: UrduBachche Educational Game*
*Date: 2026-02-25*
