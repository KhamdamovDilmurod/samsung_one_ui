/// Samsung One UI Spacing & Dimensions
///
/// Based on official One UI design guidelines:
/// - Minimum 24dp margins on each side
/// - Safe area considerations for rounded corners and edge displays
/// - Optimized touch targets for easy interaction
class OneUISpacing {
  OneUISpacing._();

  // === MARGINS & PADDING ===

  /// Minimum recommended margin for screen edges (24dp)
  static const double screenMargin = 24.0;

  /// Standard padding values
  static const double xxxs = 2.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 48.0;

  // === COMPONENT SPACING ===

  /// Space between components
  static const double componentSpacing = 16.0;

  /// Space between sections
  static const double sectionSpacing = 24.0;

  /// Space between list items
  static const double listItemSpacing = 8.0;

  // === TOUCH TARGET SIZES ===

  /// Minimum touch target size for accessibility
  static const double minTouchTarget = 48.0;

  /// Recommended touch target size
  static const double touchTarget = 56.0;

  /// Large touch target for primary actions
  static const double largeTouchTarget = 64.0;
}

/// Samsung One UI Border Radius Values
///
/// One UI uses big rounded corners to capture user attention
/// Based on official specifications and Android drawable resources
class OneUIRadius {
  OneUIRadius._();

  // === BUTTON RADIUS ===

  /// Standard button corner radius (18dp from official specs)
  static const double button = 18.0;

  /// Small button radius
  static const double buttonSmall = 14.0;

  /// Large button radius
  static const double buttonLarge = 24.0;

  // === CARD & FOCUS BLOCK RADIUS ===

  /// Standard card/focus block radius (large rounded corners)
  static const double card = 26.0;

  /// Medium card radius
  static const double cardMedium = 20.0;

  /// Small card radius
  static const double cardSmall = 16.0;

  /// Extra large radius for hero cards
  static const double cardLarge = 32.0;

  // === INPUT FIELD RADIUS ===

  /// TextField and input components
  static const double input = 18.0;

  /// Small input radius
  static const double inputSmall = 14.0;

  // === DIALOG & SHEET RADIUS ===

  /// Bottom sheet and dialog radius
  static const double dialog = 28.0;

  /// Modal bottom sheet top corners
  static const double bottomSheet = 28.0;

  // === WIDGET RADIUS ===

  /// Widget corner radius (from One UI 7 specs)
  /// Standard widgets use 39dp, 1x1 widgets use 69dp
  static const double widget = 39.0;
  static const double widgetSmall = 69.0;

  // === CHIP & TAG RADIUS ===

  /// Chip/tag components
  static const double chip = 16.0;

  /// Fully rounded (pill shape) - use half of height
  static const double pill = 999.0;

  // === MISC RADIUS ===

  /// Avatar/profile picture
  static const double avatar = 999.0; // Fully circular

  /// Small decorative elements
  static const double small = 8.0;

  /// Medium decorative elements
  static const double medium = 12.0;
}

/// Samsung One UI Elevation (Shadow) Values
class OneUIElevation {
  OneUIElevation._();

  static const double none = 0.0;
  static const double xs = 1.0;
  static const double sm = 2.0;
  static const double md = 4.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  static const double xxl = 16.0;

  /// Card elevation
  static const double card = 2.0;

  /// Button elevation
  static const double button = 2.0;

  /// Dialog elevation
  static const double dialog = 24.0;

  /// Bottom sheet elevation
  static const double bottomSheet = 16.0;

  /// App bar elevation
  static const double appBar = 4.0;
}

/// Samsung One UI Icon Sizes
class OneUIIconSize {
  OneUIIconSize._();

  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 32.0;
  static const double xl = 48.0;
  static const double xxl = 64.0;
}

/// Samsung One UI Animation Durations
class OneUIDuration {
  OneUIDuration._();

  /// Fast animations (micro-interactions)
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal animations (standard transitions)
  static const Duration normal = Duration(milliseconds: 250);

  /// Slow animations (page transitions)
  static const Duration slow = Duration(milliseconds: 350);

  /// Extra slow (complex animations)
  static const Duration xSlow = Duration(milliseconds: 500);
}