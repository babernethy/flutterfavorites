# Flutter Favorites

A demo of some favorite Flutter libraries working together

The idea for this app came from a starter discussion in the fledgling West Michigan Flutter Discord discussion group (https://discord.gg/gvu8HFFQ)

The idea was to create a sample app using some of your favorite Flutter packages to show how they work together.

![App Idea](/readme/Flutter_Favorites_App.png)
- [Flutter Favorites](#flutter-favorites)
- [code generation stuff](#code-generation-stuff)
  - [freezed - for easy creating of immutable objects / code-gen](#freezed---for-easy-creating-of-immutable-objects--code-gen)
  - [json_serializable - for easy creating of serializable/deserializable objects / code-gen](#json_serializable---for-easy-creating-of-serializabledeserializable-objects--code-gen)
  - [envify - for reading secrets in from environment files (in this case API keys)](#envify---for-reading-secrets-in-from-environment-files-in-this-case-api-keys)
  - [build_runner - for doing the code-gen](#build_runner---for-doing-the-code-gen)
- [riverpod - for easy state management](#riverpod---for-easy-state-management)
- [dio - for an http client for API calls](#dio---for-an-http-client-for-api-calls)
- [go_router - for painless Navigation 2.0 routing on all platforms, and clean web URIs](#go_router---for-painless-navigation-20-routing-on-all-platforms-and-clean-web-uris)
- [fonts, colors, and graphics](#fonts-colors-and-graphics)
  - [flutter_svg - library to render svg files in Flutter](#flutter_svg---library-to-render-svg-files-in-flutter)
  - [lottie - library to render Lottie (Adobe After Effects) animations in Flutter](#lottie---library-to-render-lottie-adobe-after-effects-animations-in-flutter)
  - [font_awesome_flutter - library to easily access Font Awesome Icons in Flutter](#font_awesome_flutter---library-to-easily-access-font-awesome-icons-in-flutter)
  - [flex_color_scheme - a nice library that easily combines colors and schemes and fonts](#flex_color_scheme---a-nice-library-that-easily-combines-colors-and-schemes-and-fonts)
  - [google_fonts - enables access to the library of Google Fonts](#google_fonts---enables-access-to-the-library-of-google-fonts)
- [Pages](#pages)
  - [Login](#login)
  - [Genres](#genres)
  - [Genre - Detail](#genre---detail)
  - [Game - Detail](#game---detail)
  - [Settings](#settings)
- [Services](#services)
  - [Game API](#game-api)
  - [Authentication / Login State](#authentication--login-state)
  - [Logger](#logger)
  - [Secrets](#secrets)
- [Models](#models)
  - [Game API](#game-api-1)
    - [genre.dart - the game genres from the API](#genredart---the-game-genres-from-the-api)
    - [game.dart - the game details from the API](#gamedart---the-game-details-from-the-api)
    - [genreapiresult.dart - the raw result from the genre API - generated largely from https://jsontodart.com/ - with parts passed to the above other classes](#genreapiresultdart---the-raw-result-from-the-genre-api---generated-largely-from-httpsjsontodartcom---with-parts-passed-to-the-above-other-classes)
    - [gameapiresult.dart - the raw result from the game API - generated largely from https://jsontodart.com/ - with parts passed to the above other classes](#gameapiresultdart---the-raw-result-from-the-game-api---generated-largely-from-httpsjsontodartcom---with-parts-passed-to-the-above-other-classes)
  - [authentication.dart - the authentication immutable state object](#authenticationdart---the-authentication-immutable-state-object)
  - [user.dart - the user immutable object](#userdart---the-user-immutable-object)



For this app I chose to highlight some packages I like including ...
# code generation stuff
## [freezed](https://pub.dev/packages/freezed) - for easy creating of immutable objects / code-gen
## [json_serializable](https://pub.dev/packages/json_serializable) - for easy creating of serializable/deserializable objects / code-gen
## [envify](https://pub.dev/packages/envify) - for reading secrets in from environment files (in this case API keys)
## [build_runner](https://pub.dev/packages/build_runner) - for doing the code-gen

# [riverpod](https://pub.dev/packages/riverpod) - for easy state management
# [dio](https://pub.dev/packages/dio) - for an http client for API calls
# [go_router](https://pub.dev/packages/go_router) - for painless Navigation 2.0 routing on all platforms, and clean web URIs

# fonts, colors, and graphics
## [flutter_svg](https://pub.dev/packages/flutter_svg) - library to render svg files in Flutter
## [lottie](https://pub.dev/packages/lottie) - library to render Lottie (Adobe After Effects) animations in Flutter
## [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) - library to easily access Font Awesome Icons in Flutter
## [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) - a nice library that easily combines colors and schemes and fonts
## [google_fonts](https://pub.dev/packages/google_fonts) - enables access to the library of Google Fonts

----


# Pages

## Login

I borrowed a nice login page from https://github.com/skanaujiya/Login-App which was very nice looking.  And I wired it up to the Authentication provider (RiverPod - below).

## Genres

I used the RapidAPI implementation of the RAWG.io video game API endpoint to get a list of video game genres to display on this page.  This uses the Dio http client inside a RiverPod Notifier (below).

## Genre - Detail

Grabs some detail information in the Genres call and passes it on to the detail page

## Game - Detail

Makes another call to the game api to get game details to show more on another page.

## Settings

Wanted to have a settings page that could change theme / colors and show off the fonts and themes updates in the flex_color_scheme library

# Services

## Game API

A wrapper for the RapidAPI implementation of the RAWG.io video game API endpoints.

## Authentication / Login State

This is honestly just a mock for a fake authentication module to hold the state for a logged in user. This could be any kind of custom or Firebase auth module.

## Logger

An ability to track the changing state of the application for logging and debugging purposes.

## Secrets

How to include secrets (in this case API keys (which, I know, aren't technically "secret")) in code but not necessarily include them in source control (but can inject them in the build process, etc.)

----

# Models
Note - each model will include a *.freezed.dart which is the part of the model/class that is the immutable part of the class (created by "freezed") (with associated methods) and a *.g.dart part of the class which is the serialization/deserialization part of the class (which is generated by "json_serializable").

## Game API

### genre.dart - the game genres from the API
### game.dart - the game details from the API
### genreapiresult.dart - the raw result from the genre API - generated largely from https://jsontodart.com/ - with parts passed to the above other classes
### gameapiresult.dart - the raw result from the game API - generated largely from https://jsontodart.com/ - with parts passed to the above other classes

## authentication.dart - the authentication immutable state object

## user.dart - the user immutable object