import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CancelModal extends StatelessWidget {
  const CancelModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancelar'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Center(
        child: Text('Cancelar', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
