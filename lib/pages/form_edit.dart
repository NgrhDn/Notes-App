import 'package:flutter/material.dart';

class FormEdit extends StatelessWidget {
  final String textAwal;

  const FormEdit({super.key, required this.textAwal});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: textAwal);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Navigator.pop(context, controller.text);
                  }
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
