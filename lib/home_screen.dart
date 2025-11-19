import 'package:flutter/material.dart';
import 'package:eva_app/app_router.dart'; // Importa el enrutador
import 'package:eva_app/service/flutter_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Este es el widget de tu pantalla principal
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _tipsStorageKey = 'daily_tips';
  static const _tipsTimestampKey = 'daily_tips_timestamp';
  static const _assistantIntroKey = 'daily_tips_intro';
  static const _assistantIntroFallback =
      'Hola, soy Eva. Estoy aquí para ayudarte con la seguridad eléctrica de tu hogar.';

  List<String> _tips = const [];
  String? _assistantIntro;
  bool _isLoadingTips = true;
  String? _tipsError;
  DateTime? _lastUpdated;

  @override
  void initState() {
    super.initState();
    _loadTips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar personalizada para "Eva"
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            Icon(Icons.bolt, color: Colors.black87, size: 50),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eva',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Tu asistente de seguridad eléctrica',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Botón de menú para abrir el endDrawer
          Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              tooltip: 'Menú',
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. Cuerpo de la pantalla
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. Botón de Emergencia
              _buildEmergencyButton(context),
              SizedBox(height: 16),

              // 4. Botón de Consejos de Prevención
              _buildPreventionButton(context),
              SizedBox(height: 24),

              // 5. Título de la sección
              _buildDailyTipsSection(),
            ],
          ),
        ),
      ),

      // Sidebar derecho con opciones estilizadas
      endDrawer: Drawer(
        width: 300,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.yellow.shade700,
                      child: const Icon(Icons.bolt, color: Colors.black87),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Menú rápido',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Gestiona tu experiencia en Eva',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 0,
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text(
                    'Ajustes',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('Tema, accesibilidad y más'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, AppRouter.settingsRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Se eliminó el botón flotante de Ajustes; ahora está en el menú lateral
    );
  }

  // --- LÓGICA DE CONSEJOS ---

  Future<void> _loadTips({bool forceFetch = false}) async {
    final prefs = await SharedPreferences.getInstance();
    final storedTips = prefs.getStringList(_tipsStorageKey) ?? const [];
    final storedIntro = prefs.getString(_assistantIntroKey);
    final lastMs = prefs.getInt(_tipsTimestampKey);
    final lastFetch = lastMs != null
        ? DateTime.fromMillisecondsSinceEpoch(lastMs)
        : null;
    final now = DateTime.now();
    final isExpired =
        lastFetch == null ||
        now.difference(lastFetch) > const Duration(hours: 24);

    if (storedTips.isNotEmpty && (!isExpired || !forceFetch)) {
      setState(() {
        _tips = storedTips;
        _assistantIntro = (storedIntro != null && storedIntro.trim().isNotEmpty)
            ? storedIntro
            : _assistantIntroFallback;
        _lastUpdated = lastFetch;
        _isLoadingTips = false;
        if (_tipsError != null && !forceFetch) {
          _tipsError = null;
        }
      });
      if (!forceFetch && !isExpired) {
        return;
      }
    }

    try {
      if (mounted) {
        setState(() {
          _isLoadingTips = true;
          _tipsError = null;
        });
      }
      final tips = await GeminiService.instance.fetchDailySafetyTips(
        count: 3,
        userName: 'tu familia',
      );
      if (!mounted) return;
      await prefs.setStringList(_tipsStorageKey, tips.tips);
      await prefs.setString(_assistantIntroKey, tips.intro);
      await prefs.setInt(_tipsTimestampKey, now.millisecondsSinceEpoch);
      setState(() {
        _tips = tips.tips;
        _assistantIntro = tips.intro;
        _lastUpdated = now;
        _isLoadingTips = false;
      });
    } catch (e, s) {
      debugPrint('Gemini tips error: $e');
      debugPrintStack(stackTrace: s);
      if (!mounted) return;
      setState(() {
        _tipsError =
            'No pude actualizar los consejos. Mostrando los últimos guardados.';
        _isLoadingTips = false;
      });
    }
  }

  Widget _buildDailyTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Consejos del día',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Actualizar ahora',
              onPressed: _isLoadingTips
                  ? null
                  : () => _loadTips(forceFetch: true),
            ),
          ],
        ),
        if (_lastUpdated != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Última actualización: ${_formatLastUpdated(_lastUpdated!)}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),
        SizedBox(height: 16),
        if (_assistantIntro != null && _assistantIntro!.isNotEmpty) ...[
          _buildAssistantIntro(_assistantIntro!),
          SizedBox(height: 12),
        ],
        if (_isLoadingTips && _tips.isEmpty)
          ...List.generate(3, (_) => _buildLoadingTipCard()),
        if (!_isLoadingTips && _tips.isEmpty)
          _buildErrorTipCard(
            message: _tipsError ?? 'No hay consejos disponibles por ahora.',
          )
        else if (_tips.isNotEmpty)
          ..._tips.map((tip) => _buildDailyTipCard(tip: tip)),
        if (_tipsError != null && _tips.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _tipsError!,
              style: TextStyle(color: Colors.orange.shade800, fontSize: 12),
            ),
          ),
      ],
    );
  }

  String _formatLastUpdated(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }

  // --- WIDGETS REUTILIZABLES ---

  Widget _buildEmergencyButton(BuildContext context) {
    return Card(
      color: Colors.red.shade700,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.firstAidRoute);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white, size: 30),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primeros Auxilios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Toca para ver los pasos',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreventionButton(BuildContext context) {
    return Card(
      color: Colors.yellow.shade700,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navega usando la ruta nombrada
          Navigator.pushNamed(context, AppRouter.preventionTipsRoute);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bolt, color: Colors.black87),
              SizedBox(width: 12),
              Text(
                'Consejos de Prevención',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyTipCard({required String tip}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.lightbulb_outline,
              color: Colors.yellow.shade800,
              size: 28,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                tip,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssistantIntro(String intro) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.yellow.shade200,
            child: Icon(Icons.bolt, color: Colors.black87),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eva, tu asistente',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  intro,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingTipCard() {
    return Card(
      elevation: 0,
      color: Colors.grey.shade200,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: 14,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorTipCard({required String message}) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.orange.shade800),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _loadTips(forceFetch: true),
                icon: const Icon(Icons.refresh),
                label: const Text('Intentar de nuevo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
