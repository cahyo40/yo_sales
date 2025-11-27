import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/login_provider.dart';

class LoginImageScreen extends ConsumerWidget {
  const LoginImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // You can watch specific providers here
    // final state = ref.watch(someProvider);
    
    return const Center(
      child: Text('LoginImageScreen is working'),
    );
  }
}
