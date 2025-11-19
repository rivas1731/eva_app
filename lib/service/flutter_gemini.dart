import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart' as google_gemini;

/// Resultado de la consulta diaria a Gemini.
class DailyTipsResult {
  const DailyTipsResult({required this.intro, required this.tips});

  /// Mensaje de bienvenida/introducción de Eva.
  final String intro;

  /// Consejos ya limpios y listos para mostrar.
  final List<String> tips;
}

/// Servicio centralizado para interactuar con Google Gemini.
class GeminiService {
  GeminiService._();

  /// Instancia única reutilizable.
  static final GeminiService instance = GeminiService._();

  google_gemini.Gemini get _client => google_gemini.Gemini.instance;

  /// Obtiene [count] consejos de seguridad eléctrica personalizados.
  Future<DailyTipsResult> fetchDailySafetyTips({
    int count = 3,
    String userName = 'familia',
  }) async {
    final prompt =
        '''
Eres Eva, una asistente experta en seguridad eléctrica para el hogar.
Primero escribe una frase corta de presentación sin viñetas, sin negritas y sin enumeraciones.
Luego genera exactamente $count consejos accionables en español dirigidos a $userName.
Usa máximo dos oraciones por consejo, tono cálido y enfoque preventivo.
Responde con una lista enumerada simple (1., 2., 3.) y evita usar asteriscos.
''';

    try {
      final response = await _client.prompt(
        parts: [google_gemini.Part.text(prompt)],
        generationConfig: google_gemini.GenerationConfig(
          temperature: 0.4,
          maxOutputTokens: 256,
        ),
      );

      final raw = _collapseOutput(response);
      if (raw.isEmpty) {
        throw StateError('Respuesta vacía de Gemini');
      }

      final lines = raw
          .split(RegExp(r'\n+'))
          .map(_sanitizeLine)
          .where((line) => line.isNotEmpty)
          .toList();

      if (lines.isEmpty) {
        throw StateError('No se pudo obtener la introducción de Eva');
      }

      final intro = lines.first;
      final tips = lines
          .skip(1)
          .map((line) => line.replaceFirst(RegExp(r'^\d+[\).\s-]*'), '').trim())
          .where((line) => line.isNotEmpty)
          .take(count)
          .toList();

      if (tips.isEmpty) {
        throw StateError('No se generaron consejos de seguridad');
      }

      return DailyTipsResult(intro: intro, tips: tips);
    } on TimeoutException catch (e, stack) {
      debugPrint('Gemini timeout: $e');
      Error.throwWithStackTrace(e, stack);
    } on google_gemini.GeminiException catch (e, stack) {
      debugPrint('Gemini error: ${e.message}');
      Error.throwWithStackTrace(e, stack);
    }
  }

  /// Completa texto libre usando un prompt personalizado.
  Future<String> completeText(
    String prompt, {
    google_gemini.GenerationConfig? config,
  }) async {
    final response = await _client.prompt(
      parts: [google_gemini.Part.text(prompt)],
      generationConfig: config,
    );
    return _collapseOutput(response).trim();
  }

  String _collapseOutput(google_gemini.Candidates? response) {
    final output = response?.output;
    if (output != null && output.trim().isNotEmpty) {
      return output;
    }

    final parts = response?.content?.parts;
    if (parts == null) return '';

    final buffer = parts
        .map((part) => _partToText(part))
        .where((text) => text != null && text.trim().isNotEmpty)
        .map((text) => text!.trim())
        .toList();

    return buffer.join('\n');
  }

  String? _partToText(google_gemini.Part part) {
    if (part is google_gemini.TextPart) {
      return part.text;
    }
    if (part is google_gemini.FilePart) {
      return '[Archivo adjunto]';
    }
    return null;
  }

  String _sanitizeLine(String line) {
    var clean = line.trim();
    clean = clean.replaceAll(RegExp(r'\*\*([^*]+)\*\*'), r'$1');
    clean = clean.replaceAll(RegExp(r'\*([^*]+)\*'), r'$1');
    clean = clean.replaceAll(RegExp(r'_([^_]+)_'), r'$1');
    clean = clean.replaceFirst(RegExp(r'^[-•]\s*'), '');
    return clean.trim();
  }
}
