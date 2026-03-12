# Material Design Version Management for Decoupled Material Library

**Author:** [Qun Cheng](mailto:quncheng@google.com)  
**Last Updated:** 2026-03-12  

---

### Objective
To establish a reliable, maintainable, and tree-shaking optimized architecture for managing parallel versions of Material Design (e.g., Material 3 and Material 3 Expressive) inside the standalone (decoupled) Material library package, while minimizing duplicate code footprint for symmetric components.

### Background
With the Material library transitioning into a decoupled standalone package separate from standard `flutter/flutter` core updates, we are introducing **Material 3 Expressive (M3E)** to Flutter.

M3E has dozens of update specs comprising visual components structure diverges (e.g., 14 introduce/update components containing dynamic motion, shapes presets, and updated sizing/styling variables for standard containers). We need a mechanism to house both M3 Standard and M3 Expressive inside the standalone libraries without forcing breaking changes on developers who explicitly pin back to static baseline defaults.

### Problem Statement
Standard Flutter approaches historically rely on monolithic style definitions or enum toggle triggers (`ThemeData.useMaterial3`) that force entire trees to upgrade immediately on release bumps. This model will lead to continuous asset bloat inside solitary files and creates regression maintenance debt as continuous Material iterations (M4, M5) scale up over the years.

#### Non-Goals:
* Adding parallel dynamic runtime state engines (e.g., hot-swapping design guidelines in memory).
* Replacing foundational underlying heavy machines (like common ButtonStyleButton interactions logic overlays).

---

### Proposed Solutions

Three main options exist to manage branching component targets:

* **Option 1: Update styles directly (Implicit upgrade)**  
  * Replaces existing fallback component defaults to align strictly with the newest design benchmarks natively.
* **Option 2: Introduce runtime model enums (`MaterialVersion.expressive`)**  
  * Creates global version configuration hooks and routes internal widgets (`if version == m3e`) conditionally on unified monolithic templates files.
* **Option 3: Subfolder Isolation with Version Subclassing (Recommended)**  
  * Establishes folder namespaces isolates (`lib/src/m3/` and `lib/src/m3e/`). Divergent elements subclass upstream targets cleanly; symmetrical assets are transparently re-exported.

---

### Comparison of Solutions

#### Option 1: Update styles directly
* **Pros:** 
  * Linear foot footprint overhead; 100% deduplicated code states natively.
* **Cons:** 
  * **Destructive breaking change:** Forces all developers pinned to historical layout frames benchmark visually to manually fix frame breaking layout crashes on update bumps. Scales independently non-viable.

#### Option 2: Introduce runtime model enums
* **Pros:** 
  * Dynamic version toggles frames in unified runtime scope.
* **Cons:** 
  * **Linear File Bloating:** Solitary scripts swell with appending parameters with every version added.
  * **Unscalable Maintenance loops:** High regression loop risk to maintain backward branches inside the exact same conditional files blocks.

#### Option 3: Subfolder Isolation (Recommended)
* **Pros:** 
  * **High Tree-Shaking Scalability:** Isolated imports isolates ensure compiling targets carry 0% weight from unmapped files trees setup benchmarks.
  * **Clean Deduplication on Symmetrical sheets:** Component sheets that remain visually static between indices simply re-export transparently inside forward layouts.
  * **Safe Deprecation triggers:** Older version branches can cleanly be depreciated and dropped without deleting lines manually across internal framework parameters.
* **Cons:** 
  * Requires shallow wrapper subclassing isolates to house divergant defaulted token definitions.

---

### Detailed Design for Subfolder Architecture (Option 3)

We will isolate version branches into isolated namespaces layers (`/m3/` and `/m3e/`). Developers simply target their aggregating namespace entry endpoint sheet to lock design frames without colliding structures.

#### 1. Symmetrical Components (Implicit Re-Exports)
For components that do NOT diverged between versions (e.g., original layout `Switch`), the M3E isolations node simply mirrors the upstream node endpoint transparently with absolute deduplication:

```dart
// lib/src/m3e/switch.dart
export '../m3/switch.dart';
```

#### 2. Diverging Components (Subclass/Wrapper Isolates)
For components that deviate on shapes presets or defaults variables (e.g., `TextButton` requiring heavy elevation bumps or specialized labels scales), the expressive isolate node **creates a subclass subclassing the M3 target wrapper** to simply house divergent defaults overriding hooks cleanly:

```dart
// lib/src/m3e/text_button.dart
import '../m3/text_button.dart' as m3;

class TextButton extends m3.TextButton {
  const TextButton({
    super.key,
    required super.onPressed,
    super.style,
    required super.child,
  });

  @override
  ButtonStyle themeDefaults(BuildContext context) => _TextButtonDefaultsM3E(context);
}
```

This allows the heavy framework logic to reside solely inside `/m3`, while giving the token generators a clean, isolated `/m3e` sheet endpoint to deposit styling constants into, preventing compile block leaks.

---

### Tests
Verification relies on side-by-side snapshotting rendering:
* **Side-by-side comparison files formats:** Added comparing frame rows demonstrations triggers cleanly inside standard mock widgets demo.
* **Aggregating compile metrics:** Analyzer hooks on decoupled isolate targets verify static limits setup models seamlessly without type safety collision lock branches setups.

---

### Open Questions
* **Timelines scale increments:** How frequently do visual triggers bump backwards lock compatibility?
* **Mismatched namespaces overlap cleanup triggers:** Handling aggregate aggregate imports locks for large frameworks scale loads without introducing tree depth lags.
