import 'package:flutter/material.dart';
import 'package:samsung_one_ui/one_ui_flutter.dart';

void main() {
  runApp(const OneUIExampleApp());
}

class OneUIExampleApp extends StatefulWidget {
  const OneUIExampleApp({super.key});

  @override
  State<OneUIExampleApp> createState() => _OneUIExampleAppState();
}

class _OneUIExampleAppState extends State<OneUIExampleApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One UI Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: OneUITheme.lightTheme(),
      darkTheme: OneUITheme.darkTheme(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ExampleHomePage(
        isDarkMode: _isDarkMode,
        onThemeToggle: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const ExampleHomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One UI Flutter'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(OneUISpacing.screenMargin),
        children: [
          // Buttons Section
          _buildSection(
            context,
            'Buttons',
            [
              OneUIButton.contained(
                text: 'Contained Button',
                onPressed: () {},
              ),
              SizedBox(height: OneUISpacing.sm),
              OneUIButton.outlined(
                text: 'Outlined Button',
                onPressed: () {},
              ),
              SizedBox(height: OneUISpacing.sm),
              OneUIButton.text(
                text: 'Text Button',
                onPressed: () {},
              ),
              SizedBox(height: OneUISpacing.sm),
              OneUIButton.contained(
                text: 'Loading...',
                isLoading: true,
                onPressed: () {},
              ),
              SizedBox(height: OneUISpacing.sm),
              OneUIButton.contained(
                text: 'With Icon',
                leading: Icon(Icons.star),
                onPressed: () {},
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Text Fields Section
          _buildSection(
            context,
            'Text Fields',
            [
              OneUITextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: OneUISpacing.md),
              OneUIPasswordField(
                labelText: 'Password',
                hintText: 'Enter password',
                prefixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: OneUISpacing.md),
              OneUISearchField(
                hintText: 'Search...',
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Cards Section
          _buildSection(
            context,
            'Cards',
            [
              OneUICard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'One UI Card',
                      style: OneUITypography.titleLarge,
                    ),
                    SizedBox(height: OneUISpacing.xs),
                    Text(
                      'This is a card with large rounded corners following One UI design guidelines.',
                      style: OneUITypography.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: OneUISpacing.md),
              OneUIFocusBlock(
                child: Text(
                  'Focus Block Type 1',
                  style: OneUITypography.bodyMedium,
                ),
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Loading Indicators
          _buildSection(
            context,
            'Loading Indicators',
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OneUILoadingIndicator.small(),
                  OneUILoadingIndicator.medium(),
                  OneUILoadingIndicator.large(),
                ],
              ),
              SizedBox(height: OneUISpacing.md),
              OneUILinearProgress(value: 0.7),
              SizedBox(height: OneUISpacing.md),
              OneUISkeletonLoader(height: 20, width: 200),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Controls Section
          _buildSection(
            context,
            'Controls',
            [
              OneUISwitchTile(
                title: 'Enable notifications',
                subtitle: 'Receive push notifications',
                value: true,
                onChanged: (value) {},
              ),
              OneUICheckboxTile(
                title: 'Remember me',
                subtitle: 'Stay logged in',
                value: true,
                onChanged: (value) {},
              ),
              OneUIRadioTile<int>(
                title: 'Option 1',
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
              ),
              SizedBox(height: OneUISpacing.md),
              OneUISlider(
                value: 0.5,
                onChanged: (value) {},
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Chips
          _buildSection(
            context,
            'Chips',
            [
              Wrap(
                spacing: OneUISpacing.xs,
                runSpacing: OneUISpacing.xs,
                children: [
                  OneUIChip(label: 'Flutter', onTap: () {}),
                  OneUIChip(label: 'Dart', selected: true, onTap: () {}),
                  OneUIChip(
                    label: 'One UI',
                    onDeleted: () {},
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Audio Player
          _buildSection(
            context,
            'Audio Player',
            [
              OneUIMiniAudioPlayer(
                title: 'Song Title',
                artist: 'Artist Name',
                isPlaying: true,
                onPlayPause: () {},
                onExpand: () {},
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.sectionSpacing),

          // Video Player Controls
          _buildSection(
            context,
            'Video Player Controls',
            [
              OneUIVideoControlsBar(
                isPlaying: false,
                currentPosition: Duration(minutes: 1, seconds: 30),
                totalDuration: Duration(minutes: 5, seconds: 0),
                onPlayPause: () {},
                onSeek: (duration) {},
              ),
            ],
          ),

          SizedBox(height: OneUISpacing.xl),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: OneUITypography.headlineSmall,
        ),
        SizedBox(height: OneUISpacing.md),
        ...children,
      ],
    );
  }
}