import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobstate/app/services/constants.dart';
import 'package:jobstate/login/state/auth_notifier.dart';

final appThemeNotifier = StateNotifierProvider<AppThemeNotifier, AppThemeState>(
    (ref) => AppThemeNotifier());

class AppThemeNotifier extends StateNotifier<AppThemeState> {
  AppThemeNotifier() : super(ThemeSet(1, ThemeMode.light));

  void setNewThemeSet(int selectedIndex, ThemeMode newThemeMode) {
    state = ThemeSet(selectedIndex, newThemeMode);
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    if (state is ThemeNotSet) {
      state = ThemeNotSet(newThemeMode);
    } else {
      final ThemeSet themeSet = state as ThemeSet;
      state = ThemeSet(themeSet.selectedIndex, newThemeMode);
    }
  }
}

abstract class AppThemeState {
  ThemeMode themeMode = ThemeMode.light;
  ThemeData lightTheme = ThemeData.light();
  ThemeData darkTheme = ThemeData.dark();
}

class ThemeNotSet extends AppThemeState {
  ThemeNotSet(ThemeMode mode) {
    themeMode = mode;
  }
}

class ThemeSet extends AppThemeState {
  ThemeSet(this.selectedIndex, ThemeMode mode) {
    themeMode = mode;

    darkTheme = FlexColorScheme.dark(
            colors: myFlexSchemes[selectedIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            textTheme: GoogleFonts.ebGaramondTextTheme()
                .apply(bodyColor: Colors.white, displayColor: Colors.white))
        .toTheme;

    lightTheme = FlexColorScheme.light(
            colors: myFlexSchemes[selectedIndex].light,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            textTheme: GoogleFonts.ebGaramondTextTheme())
        .toTheme;
  }

  final int selectedIndex;
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings"), actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                ref.watch(authStateProvider.notifier).signOut();
              }),
        ]),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            const Text("Settings"),
            Expanded(child: ColorSchemePicker(context))
          ],
        ));
  }
}

class ColorSchemePicker extends ConsumerWidget {
  ColorSchemePicker(this.context, {Key? key})
      : theme = Theme.of(context),
        colorScheme = Theme.of(context).colorScheme,
        textTheme = Theme.of(context).textTheme,
        headline4 = Theme.of(context).textTheme.headline4!,
        isLight = Theme.of(context).brightness == Brightness.light,
        super(key: key);

  final BuildContext context;
  final ThemeData theme;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final TextStyle headline4;
  final bool isLight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState appThemeState = ref.read(appThemeNotifier);

    if (appThemeState is ThemeNotSet) {
      // context.read(appThemeNotifier).setNewThemeSet(1, appThemeState.themeMode);
      return Container();
    }

    final ThemeSet appThemeSet = appThemeState as ThemeSet;

    return ListView(
      padding: EdgeInsets.all(edgePadding),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: edgePadding),
          child: FlexThemeModeSwitch(
            themeMode: appThemeState.themeMode,
            onThemeModeChanged: (ThemeMode val) {
              print(val);
              ref.read(appThemeNotifier.notifier).changeThemeMode(val);
            },
            flexSchemeData: myFlexSchemes[appThemeSet.selectedIndex],
          ),
        ),
        const Divider(),
        // Popup menu button to select color scheme.
        PopupMenuButton<int>(
          padding: EdgeInsets.zero,
          onSelected: (int val) {
            ref
                .read(appThemeNotifier.notifier)
                .setNewThemeSet(val, appThemeState.themeMode);
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
            for (int i = 0; i < myFlexSchemes.length; i++)
              PopupMenuItem<int>(
                value: i,
                child: ListTile(
                  leading: Icon(Icons.lens,
                      color: isLight
                          ? myFlexSchemes[i].light.primary
                          : myFlexSchemes[i].dark.primary,
                      size: 35),
                  title: Text(myFlexSchemes[i].name),
                ),
              )
          ],
          child: ListTile(
            title:
                Text('${myFlexSchemes[appThemeSet.selectedIndex].name} theme'),
            subtitle:
                Text(myFlexSchemes[appThemeSet.selectedIndex].description),
            trailing: Icon(
              Icons.lens,
              color: colorScheme.primary,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Active theme color indicators.
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edgePadding),
          child: const ShowThemeColors(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppThemeState appThemeState = ref.read(appThemeNotifier);
    print(appThemeState);
    print(appThemeState.themeMode);
    final bool switchState =
        ref.watch(appThemeNotifier).themeMode == ThemeMode.dark;
    return Switch(
      value: switchState,
      onChanged: (bool enabled) {
        if (enabled) {
          ref.read(appThemeNotifier.notifier).changeThemeMode(ThemeMode.dark);
        } else {
          ref.read(appThemeNotifier.notifier).changeThemeMode(ThemeMode.light);
        }
      },
    );
  }
}

class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Color appBarColor =
        theme.appBarTheme.backgroundColor ?? theme.primaryColor;

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ThemeCard(
          label: 'Primary',
          color: colorScheme.primary,
          textColor: colorScheme.onPrimary,
        ),
        ThemeCard(
          label: 'Primary\nColor',
          color: theme.primaryColor,
          textColor: theme.primaryTextTheme.subtitle1!.color ?? Colors.white,
        ),
        ThemeCard(
          label: 'Primary\nColorDark',
          color: theme.primaryColorDark,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.primaryColorDark) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Primary\nColorLight',
          color: theme.primaryColorLight,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.primaryColorLight) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary\nHeader',
          color: theme.secondaryHeaderColor,
          textColor: ThemeData.estimateBrightnessForColor(
                      theme.secondaryHeaderColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Primary\nVariant',
          color: colorScheme.primary,
          textColor:
              ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary',
          color: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
        ),
        ThemeCard(
          label: 'Accent\nColor',
          color: theme.colorScheme.secondary,
          textColor: colorScheme.onPrimary,
        ),
        ThemeCard(
          label: 'Toggleable\nActive',
          color: theme.toggleableActiveColor,
          textColor: ThemeData.estimateBrightnessForColor(
                      theme.toggleableActiveColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Secondary\nVariant',
          color: colorScheme.secondary,
          textColor:
              ThemeData.estimateBrightnessForColor(colorScheme.secondary) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'AppBar',
          color: appBarColor,
          textColor: ThemeData.estimateBrightnessForColor(appBarColor) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        ThemeCard(
          label: 'Bottom\nAppBar',
          color: theme.bottomAppBarColor,
          textColor:
              ThemeData.estimateBrightnessForColor(theme.bottomAppBarColor) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
        ThemeCard(
          label: 'Divider',
          color: theme.dividerColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Background',
          color: colorScheme.background,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Canvas',
          color: theme.canvasColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Surface',
          color: colorScheme.surface,
          textColor: colorScheme.onSurface,
        ),
        ThemeCard(
          label: 'Card',
          color: theme.cardColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Dialog',
          color: theme.dialogBackgroundColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Scaffold\nbackground',
          color: theme.scaffoldBackgroundColor,
          textColor: colorScheme.onBackground,
        ),
        ThemeCard(
          label: 'Error',
          color: colorScheme.error,
          textColor: colorScheme.onError,
        ),
      ],
    );
  }
}

// This is just simple SizedBox with a Card with a passed in label, background
// and text label color. Used to show the colors of a theme color property.
class ThemeCard extends StatelessWidget {
  const ThemeCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 85,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        elevation: 0,
        color: color,
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

const FlexSchemeColor myScheme1Light = FlexSchemeColor(
  primary: Color(0xFF4E0028),
  primaryVariant: Color(0xFF320019),
  secondary: Color(0xFF003419),
  secondaryVariant: Color(0xFF002411),
  appBarColor: Color(0xFF002411),
);
const FlexSchemeColor myScheme1Dark = FlexSchemeColor(
  primary: Color(0xFF9E7389),
  primaryVariant: Color(0xFF775C69),
  secondary: Color(0xFF738F81),
  secondaryVariant: Color(0xFF5C7267),
  appBarColor: Color(0xFF5C7267),
);

final FlexSchemeColor myScheme2Light =
    FlexSchemeColor.from(primary: const Color(0xFF4C4E06));
final FlexSchemeColor myScheme2Dark =
    FlexSchemeColor.from(primary: const Color(0xFF9D9E76));

final FlexSchemeColor myScheme3Light = FlexSchemeColor.from(
  primary: const Color(0xFF993200),
  secondary: const Color(0xFF1B5C62),
);
final List<FlexSchemeData> myFlexSchemes = <FlexSchemeData>[
  ...FlexColor.schemesList,
  const FlexSchemeData(
    name: 'Toledo purple',
    description: 'Purple theme, created from full custom defined color scheme.',
    light: myScheme1Light,
    dark: myScheme1Dark,
  ),
  FlexSchemeData(
    name: 'Olive green',
    description:
        'Olive green theme, created from primary light and dark colors.',
    light: myScheme2Light,
    dark: myScheme2Dark,
  ),
  FlexSchemeData(
    name: 'Oregon orange',
    description: 'Custom orange and blue theme, from only light scheme colors.',
    light: myScheme3Light,
    dark: myScheme3Light.toDark(),
  ),
];
