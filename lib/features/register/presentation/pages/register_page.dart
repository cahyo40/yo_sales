import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/register_provider.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(registerNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: asyncState.when(
        data: (data) => const Center(
          child: Text(
            'RegisterPage is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
