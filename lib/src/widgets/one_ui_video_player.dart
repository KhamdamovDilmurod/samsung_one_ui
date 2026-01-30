import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';
import 'one_ui_button.dart';

/// Samsung One UI Video Player UI
///
/// This is the UI component only - you need to integrate with
/// actual video player packages like video_player, better_player, or chewie
///
/// Features:
/// - Play/Pause button
/// - Progress bar
/// - Time display
/// - Volume control
/// - Fullscreen toggle
/// - One UI styled controls
class OneUIVideoPlayerUI extends StatefulWidget {
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  final double volume;
  final bool isFullscreen;
  final VoidCallback? onPlayPause;
  final ValueChanged<Duration>? onSeek;
  final ValueChanged<double>? onVolumeChange;
  final VoidCallback? onFullscreenToggle;
  final Widget? videoWidget;

  const OneUIVideoPlayerUI({
    super.key,
    required this.isPlaying,
    required this.currentPosition,
    required this.totalDuration,
    this.volume = 1.0,
    this.isFullscreen = false,
    this.onPlayPause,
    this.onSeek,
    this.onVolumeChange,
    this.onFullscreenToggle,
    this.videoWidget,
  });

  @override
  State<OneUIVideoPlayerUI> createState() => _OneUIVideoPlayerUIState();
}

class _OneUIVideoPlayerUIState extends State<OneUIVideoPlayerUI> {
  bool _showControls = true;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
    return '$minutes:${twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls = !_showControls;
        });
      },
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            // Video widget (provided by user)
            if (widget.videoWidget != null)
              Center(child: widget.videoWidget!),

            // Controls overlay
            if (_showControls)
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: OneUIDuration.fast,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top bar (optional)
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(OneUISpacing.md),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OneUIIconButton(
                                icon: widget.isFullscreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                                onPressed: widget.onFullscreenToggle,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Center play button
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: IconButton(
                            icon: Icon(
                              widget.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 48,
                              color: Colors.white,
                            ),
                            onPressed: widget.onPlayPause,
                            iconSize: 64,
                          ),
                        ),
                      ),

                      // Bottom controls
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(OneUISpacing.md),
                          child: Column(
                            children: [
                              // Progress bar
                              Row(
                                children: [
                                  Text(
                                    _formatDuration(widget.currentPosition),
                                    style: OneUITypography.bodySmall.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: OneUISpacing.sm),
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        trackHeight: 3.0,
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 6.0,
                                        ),
                                        overlayShape: RoundSliderOverlayShape(
                                          overlayRadius: 12.0,
                                        ),
                                        activeTrackColor: OneUIColors.primaryBlueDark,
                                        inactiveTrackColor: Colors.white.withOpacity(0.3),
                                        thumbColor: OneUIColors.primaryBlueDark,
                                        overlayColor: OneUIColors.primaryBlueDark.withOpacity(0.2),
                                      ),
                                      child: Slider(
                                        value: widget.currentPosition.inMilliseconds
                                            .toDouble(),
                                        min: 0.0,
                                        max: widget.totalDuration.inMilliseconds
                                            .toDouble(),
                                        onChanged: (value) {
                                          widget.onSeek?.call(
                                            Duration(milliseconds: value.toInt()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: OneUISpacing.sm),
                                  Text(
                                    _formatDuration(widget.totalDuration),
                                    style: OneUITypography.bodySmall.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Simple video player controls bar (horizontal)
class OneUIVideoControlsBar extends StatelessWidget {
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  final VoidCallback? onPlayPause;
  final ValueChanged<Duration>? onSeek;

  const OneUIVideoControlsBar({
    super.key,
    required this.isPlaying,
    required this.currentPosition,
    required this.totalDuration,
    this.onPlayPause,
    this.onSeek,
  });

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(OneUISpacing.sm),
      decoration: BoxDecoration(
        color: isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight,
        borderRadius: BorderRadius.circular(OneUIRadius.card),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: onPlayPause,
            color: isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue,
          ),
          Text(
            _formatDuration(currentPosition),
            style: OneUITypography.bodySmall,
          ),
          SizedBox(width: OneUISpacing.xs),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 3.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                activeTrackColor: isDark
                    ? OneUIColors.primaryBlueDark
                    : OneUIColors.primaryBlue,
                inactiveTrackColor: isDark
                    ? OneUIColors.borderDark
                    : OneUIColors.borderLight,
                thumbColor: isDark
                    ? OneUIColors.primaryBlueDark
                    : OneUIColors.primaryBlue,
              ),
              child: Slider(
                value: currentPosition.inMilliseconds.toDouble(),
                min: 0.0,
                max: totalDuration.inMilliseconds.toDouble(),
                onChanged: (value) {
                  onSeek?.call(Duration(milliseconds: value.toInt()));
                },
              ),
            ),
          ),
          SizedBox(width: OneUISpacing.xs),
          Text(
            _formatDuration(totalDuration),
            style: OneUITypography.bodySmall,
          ),
        ],
      ),
    );
  }
}