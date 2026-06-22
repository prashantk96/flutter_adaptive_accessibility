/// Flutter Adaptive Accessibility
///
/// A Flutter package for:
/// - Accessibility-aware layouts
/// - Font scale protection
/// - Automatic Row ↔ Column transformations
/// - Responsive grids and forms
/// - Mobile, Tablet, Desktop support
/// - Adaptive navigation and dialogs
library;

// =======================
// Core
// =======================

export 'src/core/adaptive_app.dart';
export 'src/core/adaptive_config.dart';
export 'src/core/adaptive_controller.dart';
export 'src/core/adaptive_context.dart';

// =======================
// Accessibility
// =======================

export 'src/accessibility/overflow_detector.dart';
export 'src/accessibility/accessibility_mode.dart';
export 'src/accessibility/text_scale_detector.dart';
export 'src/accessibility/font_scale_guard.dart';

// =======================
// Models
// =======================

export 'src/models/device_type.dart';
export 'src/models/screen_info.dart';
export 'src/models/adaptive_state.dart';

// =======================
// Services
// =======================

export 'src/services/adaptive_service.dart';

// =======================
// Extensions
// =======================

export 'src/extensions/context_extension.dart';
export 'src/extensions/media_query_extension.dart';
export 'src/extensions/widget_extension.dart';
export 'src/extensions/context_spacing_extension.dart';

// =======================
// Responsive
// =======================

export 'src/responsive/adaptive_value.dart';
export 'src/responsive/adaptive_responsive_value.dart';

// =======================
// Theme
// =======================

export 'src/theme/adaptive_theme.dart';
export 'src/theme/adaptive_typography.dart';

// =======================
// Constants
// =======================

export 'src/constants/adaptive_constants.dart';

// =======================
// Providers
// =======================

export 'src/providers/adaptive_provider.dart';

// =======================
// Layout Widgets
// =======================

export 'src/widgets/adaptive_row.dart';
export 'src/widgets/adaptive_column.dart';
export 'src/widgets/adaptive_wrap.dart';
export 'src/widgets/adaptive_builder.dart';
export 'src/widgets/adaptive_screen.dart';
export 'src/widgets/adaptive_layout_switcher.dart';
export 'src/widgets/adaptive_orientation_builder.dart';

// =======================
// Content Widgets
// =======================

export 'src/widgets/adaptive_text.dart';
export 'src/widgets/adaptive_card.dart';
export 'src/widgets/adaptive_container.dart';
export 'src/widgets/adaptive_spacing.dart';
export 'src/widgets/adaptive_visibility.dart';

// =======================
// Data Widgets
// =======================

export 'src/widgets/adaptive_grid.dart';
export 'src/widgets/adaptive_list.dart';
export 'src/widgets/adaptive_sliver_grid.dart';

// =======================
// Form Widgets
// =======================

export 'src/widgets/adaptive_form.dart';

// =======================
// Navigation Widgets
// =======================

export 'src/widgets/adaptive_navigation.dart';

// =======================
// Page Widgets
// =======================

export 'src/widgets/adaptive_page.dart';
export 'src/widgets/adaptive_scaffold.dart';

// =======================
// Dialog Widgets
// =======================

export 'src/widgets/adaptive_dialog.dart';
export 'src/widgets/adaptive_bottom_sheet.dart';
