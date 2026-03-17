# Material Design Version Management POC

This package is a Proof of Concept (POC) demonstrating a subfolder architecture for managing different versions of Material Design (e.g., Material 3 and Material 3 Expressive) within a decoupled Material library.

The goal is to simulate a scenario where the Material library operates independently of the Flutter core, allowing for smoother version transitions and side-by-side support for multiple design iterations.

## Architecture Overview

The package uses a subfolder strategy to isolate version-specific implementations while sharing common widgets (like `ButtonStyleButton`, `Scaffold` or `ListView`) as a base:

```text
lib/
├── material.dart               # Default entry point
├── material_m3.dart            # Material 3 entry point
├── material_m3e.dart           # Material 3 Expressive entry point
└── src/
    ├── button_style_button.dart # Common widget shared across versions
    ├── Scaffold.dart # Common widget shared across versions
    ├── ListView.dart # Common widget shared across versions
    ├── m3/                     # Material 3 implementations
    │   ├── switch.dart
    │   └── text_button.dart
    └── m3e/                    # Material 3 Expressive (M3E) implementations
        ├── switch.dart
        └── text_button.dart
```

## Versioning Strategies Showcased

This POC highlights how to handle varying degrees of component changes between design versions without duplicating common widget implementations.

### 1. Components with Updates (`TextButton`)
For components that require style updates, visual tweaks, or token changes in a new version:
- **Approach**: Subclassing and default overriding.
- **Implementation**: `src/m3e/text_button.dart` defines `TextButton` which extends `m3.TextButton` and overrides the `themeDefaults` method to return `_TextButtonDefaultsM3E`.

### 2. Components without Updates (`Switch`)
For components that remain visually and functionally identical across versions:
- **Approach**: Direct Re-exporting.
- **Implementation**: `src/m3e/switch.dart` simply contains:
  ```dart
  export '../m3/switch.dart';
  ```

## Common Widgets and Shared Structures

The file `src/button_style_button.dart` represents a common widget structure that is shared across versions to prevent maintaining duplicate code. 

By keeping these common widgets in `src/` and only duplicating or re-exporting the version-specific widgets in the folder structure, we achieve a lightweight, scalable system that supports:
- **Version Isolation**: Side-by-side consumption of M3 and M3E.
- **Tree Shaking**: Ideal for ensuring fast builds and compact outputs.
- **Developer Intent**: Explicit structure on how widgets grow over time.
