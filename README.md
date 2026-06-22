# flutter_adaptive_accessibility

[![pub package](https://img.shields.io/pub/v/flutter_adaptive_accessibility.svg)](https://pub.dev/packages/flutter_adaptive_accessibility)
[![likes](https://img.shields.io/pub/likes/flutter_adaptive_accessibility)](https://pub.dev/packages/flutter_adaptive_accessibility)
[![popularity](https://img.shields.io/pub/popularity/flutter_adaptive_accessibility)](https://pub.dev/packages/flutter_adaptive_accessibility)

A Flutter package that automatically adapts layouts for accessibility, screen size, text scaling, and orientation changes.

Stop writing repetitive:

* LayoutBuilder
* MediaQuery
* OrientationBuilder
* Width checks
* Accessibility checks

and focus on building your UI.

---

# ✨ Features

✅ Font Scale Protection

✅ Accessibility Mode Detection

✅ Row → Column Conversion

✅ Adaptive Grid Layout

✅ Adaptive Forms

✅ Adaptive Navigation

✅ Adaptive Dialogs

✅ Adaptive Bottom Sheets

✅ Adaptive Visibility

✅ Adaptive Responsive Values

✅ Adaptive Layout Switching

✅ Mobile / Tablet / Desktop Support

---

# 📸 Screenshots

## Usecase1 

![Usecase1](assets/screenshots/usage1.png)

---

## Usecase2

![Usecase2](assets/screenshots/usage2.png)

---


# 🚀 Installation

Add dependency:

```yaml
dependencies:
  flutter_adaptive_accessibility: ^1.0.0
```

Run:

```bash
flutter pub get
```

---

# Quick Start

Wrap your application:

```dart
void main() {
  runApp(
    AdaptiveApp(
      config: const AdaptiveConfig(
        maxTextScaleFactor: 1.2,
      ),
      child: MyApp(),
    ),
  );
}
```

---

# Adaptive Row

Automatically converts Row → Column when required.

```dart
AdaptiveRow(
  breakpoint: 700,
  children: [
    CircleAvatar(),
    Text('Profile'),
    FilledButton(
      onPressed: () {},
      child: Text('Contact'),
    ),
  ],
)
```

Desktop:

```text
Avatar | Profile | Contact
```

Mobile:

```text
Avatar
Profile
Contact
```

---

# Adaptive Grid

```dart
AdaptiveGrid(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 4,
  children: products,
)
```

---

# Adaptive Form

```dart
AdaptiveForm(
  children: [
    TextField(),
    TextField(),
    TextField(),
    TextField(),
  ],
)
```

---

# Adaptive Text

```dart
AdaptiveText(
  'Accessibility friendly text',
)
```

---

# Adaptive Visibility

```dart
AdaptiveVisibility(
  desktop: false,
  child: MyWidget(),
)
```

---

# Adaptive Value

```dart
final padding =
    AdaptiveValue<double>(
      mobile: 8,
      tablet: 16,
      desktop: 24,
    ).resolve(context);
```

---

# Accessibility Mode

```dart
AccessibilityMode(
  builder: (
    context,
    enabled,
  ) {
    return Text(
      enabled
          ? 'Accessibility Enabled'
          : 'Accessibility Disabled',
    );
  },
)
```

---

# Text Scale Detector

```dart
TextScaleDetector(
  builder: (
    context,
    scale,
  ) {
    return Text(
      'Scale: $scale',
    );
  },
)
```

---

# Adaptive Layout Switcher

```dart
AdaptiveLayoutSwitcher(
  breakpoint: 700,
  children: [
    widget1,
    widget2,
    widget3,
  ],
)
```

---

# Adaptive Navigation

```dart
AdaptiveNavigation(
  selectedIndex: index,
  onDestinationSelected: onChanged,
  body: body,
  destinations: destinations,
)
```

Automatically switches:

```text
NavigationBar
↓
NavigationRail
```

---

# Adaptive Dialog

```dart
showDialog(
  context: context,
  builder: (_) => AdaptiveDialog(
    child: MyWidget(),
  ),
);
```

---

# Adaptive Bottom Sheet

```dart
AdaptiveBottomSheet.show(
  context,
  child: MyWidget(),
);
```

---

# 📊 Comparison

## Without flutter_adaptive_accessibility

Typical Flutter code:

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 700) {
      return Column(
        children: children,
      );
    }

    return Row(
      children: children,
    );
  },
);
```

Grid:

```dart
LayoutBuilder(
  builder: (context, constraints) {
    int columns;

    if (constraints.maxWidth >= 1200) {
      columns = 4;
    } else if (constraints.maxWidth >= 600) {
      columns = 2;
    } else {
      columns = 1;
    }

    return GridView.builder(...);
  },
);
```

Accessibility:

```dart
final scale =
    MediaQuery.textScalerOf(context)
        .scale(1);

final accessibilityMode =
    scale > 1.2;
```

Result:

❌ Repeated LayoutBuilders

❌ Repeated MediaQuery checks

❌ Accessibility logic everywhere

❌ Boilerplate code

❌ Harder maintenance

---

## With flutter_adaptive_accessibility

```dart
AdaptiveRow(...)
AdaptiveGrid(...)
AdaptiveForm(...)
AdaptiveNavigation(...)
AdaptiveVisibility(...)
AdaptiveValue(...)
```

Result:

✅ Less code

✅ Better accessibility

✅ Cleaner architecture

✅ Automatic adaptation

✅ Easier maintenance

---

# Real World Example

## Without Package

Desktop:

```text
[Avatar] [Profile] [Contact]
```

Small Screen:

```text
[Avatar] [Profile] [Contact]
```

Possible Result:

```text
❌ Overflow
❌ Compressed text
❌ Broken layout
```

---

## With Package

Desktop:

```text
[Avatar] [Profile] [Contact]
```

Small Screen:

```text
[Avatar]

[Profile]

[Contact]
```

Result:

```text
✅ No overflow

✅ Better readability

✅ Accessibility friendly
```

---

# 📦 Included Widgets

## Layout

* AdaptiveRow
* AdaptiveColumn
* AdaptiveWrap
* AdaptiveGrid
* AdaptiveLayoutSwitcher

## Content

* AdaptiveText
* AdaptiveCard
* AdaptiveContainer

## Accessibility

* AccessibilityMode
* TextScaleDetector
* OverflowDetector
* FontScaleGuard

## Forms

* AdaptiveForm

## Navigation

* AdaptiveNavigation

## Dialogs

* AdaptiveDialog
* AdaptiveBottomSheet

## Utilities

* AdaptiveValue
* AdaptiveVisibility
* AdaptiveBuilder
* AdaptivePage
* AdaptiveScaffold

---

# 📁 Example Project

```bash
git clone <repository>

cd example

flutter pub get

flutter run
```

---

# 🗺️ Roadmap

### v1.1

* AdaptiveSidebar
* AdaptiveDrawer
* AdaptiveStepper

### v1.2

* AdaptiveDataTable
* AdaptiveCalendar
* AdaptiveDashboard

### v2.0

* AdaptiveCharts
* AdaptiveMasterDetail
* AdaptiveSplitView

---

# 🤝 Contributing

Contributions are welcome.

Feel free to open issues and pull requests.

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Made with ❤️ for Flutter Developers.
