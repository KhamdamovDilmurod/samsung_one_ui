import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';
import 'one_ui_button.dart';
import 'one_ui_card.dart';

/// Samsung One UI Audio Player UI
///
/// This is the UI component only - integrate with audio player packages
/// like audioplayers, just_audio, or assets_audio_player
///
/// Features:
/// - Play/Pause/Stop controls
/// - Previous/Next track
/// - Progress bar
/// - Time display
/// - Volume control
/// - Album artwork display
/// - One UI styled interface
class OneUIAudioPlayer extends StatefulWidget {
  final String? title;
  final String? artist;
  final String? albumArt;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  final double volume;
  final VoidCallback? onPlayPause;
  final VoidCallback? onStop;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final ValueChanged<Duration>? onSeek;
  final ValueChanged<double>? onVolumeChange;

  const OneUIAudioPlayer({
    super.key,
    this.title,
    this.artist,
    this.albumArt,
    required this.isPlaying,
    required this.currentPosition,
    required this.totalDuration,
    this.volume = 1.0,
    this.onPlayPause,
    this.onStop,
    this.onPrevious,
    this.onNext,
    this.onSeek,
    this.onVolumeChange,
  });

  @override
  State<OneUIAudioPlayer> createState() => _OneUIAudioPlayerState();
}

class _OneUIAudioPlayerState extends State<OneUIAudioPlayer> {
  bool _showVolumeSlider = false;

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

    return OneUICard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Album Art
          if (widget.albumArt != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(OneUIRadius.cardMedium),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(
                  widget.albumArt!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderArt(isDark);
                  },
                ),
              ),
            )
          else
            _buildPlaceholderArt(isDark),

          SizedBox(height: OneUISpacing.lg),

          // Title and Artist
          if (widget.title != null)
            Text(
              widget.title!,
              style: OneUITypography.titleLarge,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (widget.artist != null) ...[
            SizedBox(height: OneUISpacing.xxs),
            Text(
              widget.artist!,
              style: OneUITypography.bodyMedium.copyWith(
                color: isDark
                    ? OneUIColors.textSecondaryDark
                    : OneUIColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          SizedBox(height: OneUISpacing.lg),

          // Progress Bar
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
                  activeTrackColor: isDark
                      ? OneUIColors.primaryBlueDark
                      : OneUIColors.primaryBlue,
                  inactiveTrackColor: isDark
                      ? OneUIColors.borderDark
                      : OneUIColors.borderLight,
                  thumbColor: isDark
                      ? OneUIColors.primaryBlueDark
                      : OneUIColors.primaryBlue,
                  overlayColor: (isDark
                      ? OneUIColors.primaryBlueDark
                      : OneUIColors.primaryBlue)
                      .withOpacity(0.2),
                ),
                child: Slider(
                  value: widget.currentPosition.inMilliseconds.toDouble(),
                  min: 0.0,
                  max: widget.totalDuration.inMilliseconds.toDouble(),
                  onChanged: (value) {
                    widget.onSeek?.call(Duration(milliseconds: value.toInt()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: OneUISpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDuration(widget.currentPosition),
                      style: OneUITypography.bodySmall.copyWith(
                        color: isDark
                            ? OneUIColors.textSecondaryDark
                            : OneUIColors.textSecondaryLight,
                      ),
                    ),
                    Text(
                      _formatDuration(widget.totalDuration),
                      style: OneUITypography.bodySmall.copyWith(
                        color: isDark
                            ? OneUIColors.textSecondaryDark
                            : OneUIColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.md),

          // Playback Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous
              if (widget.onPrevious != null)
                OneUIIconButton(
                  icon: Icons.skip_previous,
                  onPressed: widget.onPrevious,
                  size: OneUIIconSize.lg,
                ),

              SizedBox(width: OneUISpacing.md),

              // Play/Pause
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? OneUIColors.primaryBlueDark
                      : OneUIColors.primaryBlue,
                ),
                child: IconButton(
                  icon: Icon(
                    widget.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: isDark ? Colors.black : Colors.white,
                  ),
                  iconSize: OneUIIconSize.xl,
                  onPressed: widget.onPlayPause,
                ),
              ),

              SizedBox(width: OneUISpacing.md),

              // Next
              if (widget.onNext != null)
                OneUIIconButton(
                  icon: Icons.skip_next,
                  onPressed: widget.onNext,
                  size: OneUIIconSize.lg,
                ),
            ],
          ),

          SizedBox(height: OneUISpacing.sm),

          // Volume Control
          if (widget.onVolumeChange != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: OneUISpacing.md),
              child: Row(
                children: [
                  Icon(
                    Icons.volume_down,
                    size: OneUIIconSize.sm,
                    color: isDark
                        ? OneUIColors.textSecondaryDark
                        : OneUIColors.textSecondaryLight,
                  ),
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
                        value: widget.volume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: widget.onVolumeChange,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.volume_up,
                    size: OneUIIconSize.sm,
                    color: isDark
                        ? OneUIColors.textSecondaryDark
                        : OneUIColors.textSecondaryLight,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderArt(bool isDark) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight,
          borderRadius: BorderRadius.circular(OneUIRadius.cardMedium),
        ),
        child: Icon(
          Icons.music_note,
          size: 64,
          color: isDark
              ? OneUIColors.textSecondaryDark
              : OneUIColors.textSecondaryLight,
        ),
      ),
    );
  }
}

/// Compact audio player (mini player)
class OneUIMiniAudioPlayer extends StatelessWidget {
  final String? title;
  final String? artist;
  final String? thumbnail;
  final bool isPlaying;
  final VoidCallback? onPlayPause;
  final VoidCallback? onExpand;

  const OneUIMiniAudioPlayer({
    super.key,
    this.title,
    this.artist,
    this.thumbnail,
    required this.isPlaying,
    this.onPlayPause,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return OneUICard(
      onTap: onExpand,
      padding: EdgeInsets.all(OneUISpacing.sm),
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(OneUIRadius.small),
            child: thumbnail != null
                ? Image.network(
              thumbnail!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder(isDark);
              },
            )
                : _buildPlaceholder(isDark),
          ),

          SizedBox(width: OneUISpacing.sm),

          // Title and Artist
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: OneUITypography.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (artist != null)
                  Text(
                    artist!,
                    style: OneUITypography.bodySmall.copyWith(
                      color: isDark
                          ? OneUIColors.textSecondaryDark
                          : OneUIColors.textSecondaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),

          // Play/Pause Button
          OneUIIconButton(
            icon: isPlaying ? Icons.pause : Icons.play_arrow,
            onPressed: onPlayPause,
            backgroundColor: isDark
                ? OneUIColors.primaryBlueDark.withOpacity(0.2)
                : OneUIColors.primaryBlue.withOpacity(0.1),
            color: isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isDark) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight,
        borderRadius: BorderRadius.circular(OneUIRadius.small),
      ),
      child: Icon(
        Icons.music_note,
        size: 24,
        color: isDark
            ? OneUIColors.textSecondaryDark
            : OneUIColors.textSecondaryLight,
      ),
    );
  }
}