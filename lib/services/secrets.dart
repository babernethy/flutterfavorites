import 'package:envify/envify.dart';

part 'secrets.g.dart';

@Envify(name: 'Secrets')
abstract class Secrets {
  static const String gameapikey = _Secrets.gameapikey;
  static const String rapidapikey = _Secrets.rapidapikey;
}
