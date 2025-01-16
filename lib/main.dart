import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/list_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  try {
    await dotenv.load(fileName: ".env"); // Load environment variables
  } catch (e) {
    throw Exception('Error loading .env file: $e'); // Print error if any
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final brightness = themeProvider.isDarkMode ? Brightness.dark : Brightness.light;
          return MaterialApp(
            title: 'Flutter Movie Browser',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: brightness,
              ),
              useMaterial3: true,
              brightness: brightness,
            ),
            initialRoute: '/login',
            routes: {
              '/': (context) => const HomeScreen(),
              '/details': (context) => const DetailsScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/list': (context) => const ListScreen(),
              '/register': (context) => const RegistrationScreen(),
              '/login': (context) => const LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
