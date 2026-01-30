# One UI Flutter

[![pub package](https://img.shields.io/badge/pub-v1.0.0-blue)](https://pub.dev/packages/one_ui_flutter)
[![license](https://img.shields.io/badge/license-MIT-green)](LICENSE)

Professional Samsung One UI design system implementation for Flutter. Create beautiful, consistent applications following Samsung's official design guidelines.

## 🎨 Features

- ✅ **Complete Theme System** - Light & Dark modes with One UI color palette
- ✅ **Rich Widget Library** - Buttons, TextFields, Cards, and more
- ✅ **Loading Indicators** - Circular, Linear, Shimmer effects
- ✅ **Media Players** - Video and Audio player UIs
- ✅ **Form Controls** - Switch, Checkbox, Radio, Slider
- ✅ **Design Tokens** - Colors, Typography, Spacing, Border Radius
- ✅ **Accessibility** - Proper touch targets and contrast ratios
- ✅ **Responsive** - Optimized for all screen sizes

## 📱 Screenshots

<img src="screenshots/light_mode.png" width="300" /> <img src="screenshots/dark_mode.png" width="300" />

## 🚀 Getting Started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  one_ui_flutter: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:one_ui_flutter/one_ui_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One UI App',
      theme: OneUITheme.lightTheme(),
      darkTheme: OneUITheme.darkTheme(),
      home: HomePage(),
    );
  }
}
```

## 📚 Widgets

### Buttons

```dart
// Contained Button
OneUIButton.contained(
  text: 'Submit',
  onPressed: () {},
)

// Outlined Button
OneUIButton.outlined(
  text: 'Cancel',
  onPressed: () {},
)

// Text Button
OneUIButton.text(
  text: 'Learn More',
  onPressed: () {},
)

// Loading State
OneUIButton.contained(
  text: 'Processing...',
  isLoading: true,
  onPressed: () {},
)

// With Icons
OneUIButton.contained(
  text: 'Save',
  leading: Icon(Icons.save),
  onPressed: () {},
)
```

### Text Fields

```dart
// Basic TextField
OneUITextField(
  labelText: 'Email',
  hintText: 'Enter your email',
  prefixIcon: Icon(Icons.email),
)

// Password Field
OneUIPasswordField(
  labelText: 'Password',
  hintText: 'Enter password',
)

// Search Field
OneUISearchField(
  hintText: 'Search...',
  onChanged: (query) {
    // Handle search
  },
)
```

### Cards

```dart
// Standard Card
OneUICard(
  child: Column(
    children: [
      Text('Card Title', style: OneUITypography.titleLarge),
      Text('Card content goes here'),
    ],
  ),
)

// Focus Block (Type 1)
OneUIFocusBlock(
  child: Text('Highlighted content'),
)

// Custom Card
OneUICard.bordered(
  child: Text('Bordered card'),
  borderColor: Colors.blue,
)
```

### Loading Indicators

```dart
// Circular Progress
OneUILoadingIndicator.large()

// Linear Progress
OneUILinearProgress(value: 0.7)

// Shimmer Effect
OneUIShimmer(
  child: Container(
    height: 100,
    color: Colors.white,
  ),
)

// Skeleton Loader
OneUISkeletonLoader(height: 20, width: 200)
```

### Form Controls

```dart
// Switch
OneUISwitchTile(
  title: 'Enable notifications',
  subtitle: 'Receive push notifications',
  value: isEnabled,
  onChanged: (value) {
    setState(() => isEnabled = value);
  },
)

// Checkbox
OneUICheckboxTile(
  title: 'Remember me',
  value: rememberMe,
  onChanged: (value) {
    setState(() => rememberMe = value ?? false);
  },
)

// Radio
OneUIRadioTile<String>(
  title: 'Option 1',
  value: 'option1',
  groupValue: selectedOption,
  onChanged: (value) {
    setState(() => selectedOption = value);
  },
)

// Slider
OneUISlider(
  value: sliderValue,
  min: 0.0,
  max: 100.0,
  onChanged: (value) {
    setState(() => sliderValue = value);
  },
)
```

### Media Players

```dart
// Audio Player
OneUIAudioPlayer(
  title: 'Song Title',
  artist: 'Artist Name',
  isPlaying: isPlaying,
  currentPosition: currentPosition,
  totalDuration: totalDuration,
  onPlayPause: () {
    // Handle play/pause
  },
)

// Mini Audio Player
OneUIMiniAudioPlayer(
  title: 'Now Playing',
  artist: 'Artist',
  isPlaying: true,
  onPlayPause: () {},
  onExpand: () {},
)

// Video Player UI
OneUIVideoPlayerUI(
  isPlaying: isPlaying,
  currentPosition: currentPosition,
  totalDuration: totalDuration,
  onPlayPause: () {},
  onSeek: (duration) {},
  videoWidget: YourVideoPlayerWidget(),
)
```

## 🎨 Design Tokens

### Colors

```dart
// Primary Colors
OneUIColors.primaryBlue
OneUIColors.primaryBlueDark

// Functional Colors
OneUIColors.success
OneUIColors.error
OneUIColors.warning

// Background Colors
OneUIColors.backgroundLight
OneUIColors.backgroundDark
OneUIColors.surfaceLight
OneUIColors.surfaceDark
```

### Typography

```dart
// Display Styles
OneUITypography.displayLarge
OneUITypography.displayMedium

// Headline Styles
OneUITypography.headlineLarge
OneUITypography.headlineMedium

// Body Styles
OneUITypography.bodyLarge
OneUITypography.bodyMedium

// Label Styles
OneUITypography.labelLarge
OneUITypography.labelMedium
```

### Spacing

```dart
// Margins & Padding
OneUISpacing.screenMargin  // 24dp
OneUISpacing.xs            // 8dp
OneUISpacing.sm            // 12dp
OneUISpacing.md            // 16dp
OneUISpacing.lg            // 20dp
OneUISpacing.xl            // 24dp

// Touch Targets
OneUISpacing.minTouchTarget    // 48dp
OneUISpacing.touchTarget       // 56dp
```

### Border Radius

```dart
// Button Radius
OneUIRadius.button         // 18dp

// Card Radius
OneUIRadius.card           // 26dp
OneUIRadius.cardSmall      // 16dp
OneUIRadius.cardLarge      // 32dp

// Input Radius
OneUIRadius.input          // 18dp

// Dialog Radius
OneUIRadius.dialog         // 28dp
```

## 🎯 Design Principles

This package follows Samsung One UI's four core principles:

1. **Simplicity** - Clean, decluttered interfaces that are easy to understand
2. **Effortlessness** - Intuitive interactions with minimal user effort
3. **Consistency** - Unified experience across all components
4. **Authenticity** - Meaningful and genuine user experiences

## 📖 Official Guidelines

Based on official Samsung One UI design guidelines:
- Minimum 24dp margins on screen edges
- Large rounded corners (18-26dp) for visual emphasis
- Touch targets minimum 48dp for accessibility
- Rich, solid colors with proper contrast ratios
- Scalable typography with clear hierarchy

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Samsung for the One UI design system
- Flutter team for the amazing framework
- Community contributors

## 📧 Contact

For questions or support, please open an issue on GitHub.

---

Made with ❤️ by the Flutter community
