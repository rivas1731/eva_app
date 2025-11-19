import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart' as google_gemini;
import 'package:eva_app/app_router.dart'; // Importa el enrutador

const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (_apiKey.isEmpty) {
    throw FlutterError(
      'GEMINI_API_KEY no está definido. Ejecuta con --dart-define=GEMINI_API_KEY=TU_API_KEY',
    );
  }

  google_gemini.Gemini.init(apiKey: _apiKey, enableDebugging: kDebugMode);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.light,
  );
  static final ValueNotifier<double> textScaleNotifier = ValueNotifier<double>(
    1.0,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return ValueListenableBuilder<double>(
          valueListenable: textScaleNotifier,
          builder: (_, double scale, __) {
            return MaterialApp(
              title: 'Eva App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.yellow,
                scaffoldBackgroundColor: Colors.grey.shade100,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.yellow.shade700,
                  foregroundColor: Colors.black87,
                ),
              ),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              // Usa el enrutador para la navegación
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRouter.homeRoute,
              builder: (context, child) {
                final media = MediaQuery.of(context);
                return MediaQuery(
                  data: media.copyWith(textScaler: TextScaler.linear(scale)),
                  child: child ?? const SizedBox.shrink(),
                );
              },
            );
          },
        );
      },
    );
  }
}
