# eva_app

Un proyecto Flutter enfocado en seguridad eléctrica.

## Primeros pasos

Este repositorio sirve como punto de partida para tu aplicación. Si es tu primer proyecto Flutter, revisa estos recursos:

- [Laboratorio: Escribe tu primera app Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

Para más referencias consulta la [documentación oficial](https://docs.flutter.dev/), donde encontrarás tutoriales, muestras y la API completa.

## Integración con Gemini (Google AI Studio)

1. Genera tu API Key en [Google AI Studio](https://ai.google.dev/).
2. Nunca la subas al repositorio. Ejecuta la app pasando la clave como `--dart-define`:

	```powershell
	flutter run --dart-define=GEMINI_API_KEY=tu_api_key_real
	```

	Para builds:

	```powershell
	flutter build apk --dart-define=GEMINI_API_KEY=tu_api_key_real
	```

3. `main.dart` valida que `GEMINI_API_KEY` exista y luego inicializa `flutter_gemini`.
4. Usa `GeminiService.instance.fetchDailySafetyTips()` para obtener consejos desde la IA.

### Ejemplo de uso en la UI

```dart
import 'package:eva_app/service/flutter_gemini.dart';

class TipsDelDia extends StatefulWidget {
	const TipsDelDia({super.key});

	@override
	State<TipsDelDia> createState() => _TipsDelDiaState();
}

class _TipsDelDiaState extends State<TipsDelDia> {
	late Future<List<String>> _tipsFuture;

	@override
	void initState() {
		super.initState();
		_tipsFuture = GeminiService.instance.fetchDailySafetyTips(
			count: 3,
			userName: 'Jesús',
		);
	}

	@override
	Widget build(BuildContext context) {
		return FutureBuilder<List<String>>(
			future: _tipsFuture,
			builder: (context, snapshot) {
				if (snapshot.connectionState == ConnectionState.waiting) {
					return const CircularProgressIndicator();
				}
				if (snapshot.hasError) {
					return const Text('No pude obtener consejos, reintenta más tarde.');
				}
				final tips = snapshot.data ?? const [];
				return Column(
					children: tips
							.map((tip) => ListTile(
										leading: const Icon(Icons.bolt),
										title: Text(tip),
									))
							.toList(),
				);
			},
		);
	}
}
```

Recomendaciones:

- Maneja errores mostrando un mensaje y permite reintentar.
- Considera cachear los tips en `shared_preferences` para mostrarlos offline.
- Ajusta el `userName` con el nombre del usuario que tengas disponible para personalizar la respuesta.
