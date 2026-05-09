# ADHD-Friendly Mental Health App UI Patterns

Research doc surveying UI/UX patterns from leading ADHD- and self-care-focused mobile apps. Sources include Finch, Tiimo, Inflow, Numo, Routinery (RoutineFlow), plus general accessibility/cognitive-load research and mood-tracking studies.

Scope: onboarding, daily check-ins, task/habit tracking, mood logging.

---

## 1. Cross-cutting design principles

These show up repeatedly across every app surveyed and across the broader neurodivergent UX literature. They form the baseline any ADHD-friendly UI should meet before specializing per feature.

| Principle | What it looks like | Why it matters for ADHD |
|---|---|---|
| Reduce cognitive load | Whitespace, one primary action per screen, limited options per choice | ADHD working memory drops fast under clutter; Hick's law penalty is amplified |
| Progressive disclosure | Reveal complexity over days/weeks, not at signup | Avoids decision paralysis; lets users get to a "win" quickly |
| Visual hierarchy | Soft colors, rounded shapes, color-coded categories, large touch targets | Scannable interfaces beat dense text walls |
| Predictable structure | Same nav layout every session, no surprise UI changes | Reduces re-orientation cost on returning |
| Personalization & control | User-controlled animations, sound, density, notifications | ADHD users have wide variation in stimulation tolerance; 39% retention lift reported on personalized ADHD apps |
| Immediate dopamine feedback | Confetti, animations, XP, streaks on completion | Compensates for blunted internal reward response |
| Forgiveness & flexibility | Pause/skip/reorder, "freeze streak" tokens, no shaming language | Rigid streaks become punishing; flexibility prevents the "blew it on day 4, quit forever" pattern |
| Gentle tone | "When you're ready, try…" beats "You're losing your streak!" | Mental-health context: urgent prompts amplify anxiety/avoidance |
| Sans-serif / dyslexia-friendly type | Inter, Open Sans, OpenDyslexic options | Reduces visual noise during low-energy reading |
| Bundled, optional notifications | Default cap ~3/day, fully user-tunable | Heavy reminder volume is a top reason users uninstall |

---

## 2. Onboarding patterns

### Pattern A — Companion/avatar creation first (Finch)
- Hatch a pet, name it, pick personality traits.
- Frame the app as nurturing something else, not "fixing" yourself.
- Strength: low emotional pressure, immediate ownership.
- Risk: Finch front-loads color, traits, naming, AND a self-assessment, which UX critics flag as a progressive-disclosure violation.

**Takeaway:** the avatar hook is great; defer the full self-assessment to day 2 or later.

### Pattern B — Diagnostic/goals quiz with payoff reveal (Inflow)
- Quiz covers symptoms, support systems, life goals.
- Ends in a personalized program reveal that demonstrates value.
- Inflow's quiz reportedly runs ~47 steps — meaningful drop-off risk.

**Takeaway:** quiz-style onboarding works when the reveal feels earned. Cap at ~10–15 steps, show a progress bar, allow "skip for now."

### Pattern C — Calm visual intro + opt-in setup (Tiimo)
- Soft colors, rounded shapes, no aggressive prompts.
- Asks for the minimum needed to render a first useful timeline; deeper config (energy levels, AI breakdown style) comes later.

**Takeaway:** "show value in <60 seconds" is the right north star.

### Pattern D — Gradual onboarding (general best practice)
- Collect only what's essential for safety up front.
- Profile completion is optional, surfaced contextually ("want sharper insights? add X").

### Onboarding UI checklist
- Single primary CTA per screen.
- Visible progress (`Step 2 of 8`) — explicit progress is one of the highest-impact ADHD patterns.
- Allow back navigation without losing answers.
- "Skip" or "I'll do this later" on every non-essential question.
- Animated, low-stakes first interaction (hatch / pick a color / drag a tile) before any text input.
- Defer permission prompts (notifications, health data) until after first value moment.

---

## 3. Daily check-in patterns

### Multi-touchpoint check-ins (Finch)
- Morning: "outlook for the day."
- Afternoon: "how are you feeling?"
- Evening: "overall satisfaction."
- If the user logs low, a **First Aid** button surfaces tasks (affirmations, breathing, journaling).

**Why it works:** structured but spaced, and the negative-mood branch turns logging into a path to relief, not just data capture.

### One-tap entry, optional depth
- Default state is a single tap (emoji / face / color).
- Tapping further opens optional fields: emotion tags, free-text, photo.
- Mirrors Daylio, Moodnotes, Moodistory patterns.

### Conversational check-in (chatbot pattern)
- Daily prompt from a character (Finch's birb, Numo's mascot, generic chatbot apps).
- Users report the "little interactions" — picking between emojis, head-tilt animations — feel disproportionately impactful.
- Always-skippable: "skip for today" must be a first-class action.

### Notification design for check-ins
- Calm, invitational copy: *"When you're ready, your birb is waiting."*
- Cap at 3/day by default; fully configurable.
- Avoid streak-loss panic copy ("You'll lose your streak!").
- Prefer time-windowed reminders (any time in 8–11 AM) over fixed times.

### Check-in UI checklist
- Single screen, single primary affordance (tap an emoji / drag a slider).
- Optional depth on tap, not by default.
- Empathetic response to low mood — never just "logged ✓".
- Visible "skip" / "not today."
- Recap ("You've checked in 4 days this week 🌱") — celebratory not punitive.

---

## 4. Task & habit tracking patterns

### Visual timeline of the day (Tiimo)
- Color-coded blocks across a vertical or horizontal timeline.
- AI breaks a freeform task into steps and time estimates.
- Visual focus timer shows time as a shrinking shape — concrete, not abstract.

### Step-by-step guided routine (Routinery / RoutineFlow)
- Routines are sequences; the app advances you through them with timer + voice + vibration.
- Auto-next, but pause/skip/reorder always available.
- 800+ icons, ADHD/Pomodoro/morning templates ship pre-built.

### Card-based home + simple checkbox tracker (Inflow)
- Home page split into Daily Routine / Explore / Live Events.
- Habits are not auto-tracked; user manually checks them off (lighter cognitive contract).
- Optional 1-day or 14-day challenges encode progressive commitment.

### Gamified task list (Numo, Habitica, Finch)
- XP, streaks, unlockable themes/colors/pet items.
- Confetti on completion = immediate dopamine.
- Numo ships home- and lock-screen widgets (tasks, streak, quick-add).

### Friction-reducing primitives (universal)
- One task in focus at a time — Routinery's "every task has its own timer" is the canonical version.
- "Add task" reachable in one tap from any screen, including widget/lock screen.
- Voice / natural-language input ("Tiimo, plan my afternoon").
- Drag-to-reorder; never modal "edit task" forms when an inline edit will do.

### Streak design — the nuance
Streaks drive engagement but break ADHD users who miss a day. Best practice:
- Show streaks as celebration, not a threat.
- "Streak freeze" / grace day tokens (Duolingo-style).
- De-emphasize "longest streak"; emphasize "7-day average."
- Never use red, alarm icons, or loss-aversion copy on streaks.

### Task/habit UI checklist
- Clear *what's next* — "Step 2 of 4" pattern.
- Visual time representation (countdown ring, shrinking bar) — not just digital clock.
- Completion = celebration animation + sound (toggleable).
- Never shame missed days. Show "today is a fresh start" as the default empty state.
- Templates for ADHD-typical routines (morning, bedtime, focus block).
- Pause/skip without penalty.

---

## 5. Mood logging patterns

### Entry models
| Model | Examples | Pros | Cons |
|---|---|---|---|
| Discrete emoji set (5–7 faces) | Finch, Daylio | Fast, low-load, consistent | Limits granularity |
| Slider (1–10 with face on thumb) | Moodnotes-style | Granular, single-gesture | Harder one-handed; ambiguous middle |
| Color/photo selection | Moodistory, aesthetic trackers | Expressive, visual | Less consistent for trend analysis |
| Emotion wheel / tag set | Moodnotes, Plutchik wheels | 34% better emotional granularity vs. free-form (per cited study) | Higher cognitive load if shown by default |

**Recommendation:** start with 5-emoji default; offer emotion wheel as optional second step, surfaced only when user taps "tell me more." This is the Finch-style "constraint as a guide" approach with progressive depth on demand.

### Branching on low mood
- Detect low score → surface a **lightweight intervention menu** (breathing, affirmation, journaling, contact a friend).
- Never just log and dismiss; never auto-launch heavy CBT exercises.
- Make the intervention a 1-tap shortcut, with "not now" always present.

### Reflection & insight surface
- Calendar heatmap (most common) — easy to scan, ADHD-friendly.
- Weekly recap card pushed to home screen (not as a notification).
- Pattern insights ("you tend to feel low on Sundays") — phrased gently, never diagnostic.

### Mood logging UI checklist
- ≤ 3 seconds to log a baseline mood.
- Optional depth: tags, note, photo, voice memo.
- Show the trend visually (weekly grid > line chart for ADHD).
- Privacy first — local-first or clearly explained sync.
- Personalizable mood labels (top user request in research).

---

## 6. App-by-app summary

### Finch (self-care / virtual pet)
- **Hooks:** hatch-a-pet onboarding, virtual companion, multi-touchpoint daily check-in, First Aid branch on low mood, animated birb (head-tilts, blinks, confetti).
- **Watch-outs:** front-loaded onboarding overwhelms some users; rigid emotion categories.
- **Steal:** companion as accountability partner; First Aid pattern; celebration animations.

### Tiimo (visual planner, neurodivergent-built)
- **Hooks:** color-coded timeline, AI task breakdown, visual focus timer, calm low-stimulation aesthetic.
- **Watch-outs:** plan-heavy paradigm assumes user can articulate tasks; timeline density on busy days.
- **Steal:** "see your day" timeline, time-as-shape visualization, soft-color/rounded design tokens.

### Inflow (CBT-based ADHD program)
- **Hooks:** structured psychoeducational program, 1/14-day challenges, journaling, community, daily routine card on home.
- **Watch-outs:** ~47-step onboarding quiz; manual habit check-off (less automatic).
- **Steal:** challenge-as-commitment-ladder pattern; 3-section card home; goals-and-support quiz with personalized program reveal.

### Numo ("cringe-free" ADHD app for adults)
- **Hooks:** vibrant but adult-feeling UI, XP + unlockable themes, confetti, multi-format learning content (text/gif/voice/polls), home + lock screen widgets.
- **Watch-outs:** UX polish reportedly trails the visual polish.
- **Steal:** widget strategy, micro-rewards (XP unlocks customization), short-form interactive learning.

### Routinery / RoutineFlow (routine builder)
- **Hooks:** step-by-step timer flow, auto-next with voice/vibration, 800+ icons, ADHD/Pomodoro templates, Apple Watch sync, fully editable mid-routine.
- **Watch-outs:** very structured — users wanting freeform won't fit.
- **Steal:** auto-advancing routine engine, multi-modal cues (visual + voice + haptic), templates as a cold-start solution.

---

## 7. Synthesis: a recommended pattern stack

If building an ADHD-friendly mental health app from scratch, the consensus pattern stack looks like:

**Onboarding**
1. Warm, low-stakes interaction (avatar / color / drag a tile) — <30s.
2. ≤10-step quiz with visible progress and "skip" on every step.
3. Personalized program/dashboard reveal as a payoff.
4. Defer notification + health permission prompts until after first real value moment.

**Home / daily check-in**
1. Single primary check-in card — one tap to log baseline mood.
2. Optional second tap for depth (tags, note).
3. Low-mood branch → soft First Aid menu.
4. Today's plan as a color-coded timeline OR 3-card hierarchy (Daily / Explore / Tools).
5. Companion micro-interaction once per session (animation, line of empathetic copy).

**Tasks & habits**
1. Templates for common ADHD routines.
2. Step-by-step engine with visual time + optional voice/haptic cues.
3. One-task-in-focus mode; everything else dimmed.
4. Pause/skip/reorder always reachable in one tap.
5. Streaks present but freeze-tokened and reframed as 7-day averages.
6. XP / unlockables for dopamine without shame.

**Mood**
1. 5-emoji default; emotion wheel on demand.
2. Calendar heatmap as the primary visualization.
3. Gentle weekly recap on home, not as a notification.
4. Personalizable mood labels.

**Notifications**
- Bundled, ≤3/day default.
- Invitational copy.
- Time windows, not exact times.
- Per-feature toggles in settings.

**Tone & accessibility**
- No urgency, no shame, no loss-aversion copy.
- Sans-serif type, OpenDyslexic option.
- Reduced-motion and reduced-sound toggles.
- Dark mode + low-stimulation theme.

---

## Sources

- [UX Teardown: Finch Self-Care App — Medium](https://medium.com/@deepthi.aipm/ux-teardown-finch-self-care-app-18122357fae7)
- [The Magic of Finch: Where Self-Care Meets Enchanted Design — Sophie Pilley](https://www.sophiepilley.com/post/the-magic-of-finch-where-self-care-meets-enchanted-design)
- [Design Critique: Finch (iOS App) — IXD@Pratt](https://ixd.prattsi.org/2025/09/design-critique-finch-ios-app-2/)
- [Finch onboarding flow — Page Flows](https://pageflows.com/post/ios/onboarding/finch/)
- [Finch Self-Care App Review — Webisoft](https://webisoft.com/articles/finch-self-care-app/)
- [Tiimo — Visual Planner for Every Neurotype](https://www.tiimoapp.com/)
- [Tiimo product overview](https://www.tiimoapp.com/product)
- [Building routines for ADHD brains — Tiimo](https://www.tiimoapp.com/resource-hub/designing-routines-for-adhd-brains)
- [Gamification & ADHD — Tiimo](https://www.tiimoapp.com/resource-hub/gamification-adhd)
- [Inflow — Manage Your ADHD (App Store)](https://apps.apple.com/us/app/inflow-manage-your-adhd/id1528183849)
- [Inflow App case study — Sanika Mehta](https://www.sanikamehta.com/work/inflowapp)
- [Inflow ADHD App Review 2025 — Choosing Therapy](https://www.choosingtherapy.com/inflow-adhd-app-review/)
- [Usability of a CBT mobile app for adult ADHD — PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC9931323/)
- [Numo 3.5 release notes](https://numo.ai/journal/numo-3-5-ai-for-adhd)
- [Numo (App Store)](https://apps.apple.com/gb/app/numo-adhd-app-for-adults/id1628994767)
- [Routinery — How Routinery helps ADHD](https://www.routinery.app/blog/how-routinery-helps-adhd)
- [RoutineFlow: Routine for ADHD (App Store)](https://apps.apple.com/us/app/routineflow-routine-for-adhd/id1639800794)
- [Routinery — designing a routine with ADHD](https://www.routinery.app/routinetips/how-to-design-a-routine-with-adhd-a-practical-structure-for-building-routines-that-work-for-you)
- [UI/UX for ADHD — Din Studio](https://din-studio.com/ui-ux-for-adhd-designing-interfaces-that-actually-help-students/)
- [Inclusive UX/UI for Neurodivergent Users — Bootcamp](https://medium.com/design-bootcamp/inclusive-ux-ui-for-neurodivergent-users-best-practices-and-challenges-488677ed2c6e)
- [Designing for Cognitive Accessibility — Medium](https://medium.com/@varsharavisankar0705/designing-for-cognitive-accessibility-reducing-mental-load-in-ux-49194e1a9047)
- [Designing for ADHD in UX — UXPA International](https://uxpa.org/designing-for-adhd-in-ux/)
- [Mobile apps for mood tracking — PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC5977660/)
- [Mental Health App Design Guide — Gapsy Studio](https://gapsystudio.com/blog/mental-health-app-design/)
- [Personalisation and Recommendation for Mental Health Apps — Tandfonline](https://www.tandfonline.com/doi/full/10.1080/0144929X.2024.2356630)
- [How Gamification in ADHD Apps Boosts Retention — Imaginovation](https://imaginovation.net/blog/gamification-adhd-apps-user-retention/)
- [Gamified to-do apps ADHD brains stick with — AFFiNE](https://affine.pro/blog/gamified-to-do-list-apps-adhd)
- [When mental health apps become worry engines — The Conversation](https://theconversation.com/when-mental-health-apps-become-worry-engines-how-digital-care-can-hijack-our-anxieties-263930)
- [Push notifications RCT in mHealth — PMC](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6293241/)
- [Chatbot-based mental health apps overview — PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC10242473/)
