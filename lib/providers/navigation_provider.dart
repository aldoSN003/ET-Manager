import 'package:riverpod/riverpod.dart';

// Define the screens as an enum
enum Screen { welcome, home }

// Create a StateProvider to hold the current screen state
final screenProvider = StateProvider<Screen>((ref) => Screen.welcome);
