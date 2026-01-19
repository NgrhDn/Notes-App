import 'package:flutter/material.dart';

class FormEdit extends StatelessWidget {
  final String titleAwal;
  final String bodyAwal;

  const FormEdit({super.key, required this.titleAwal, required this.bodyAwal});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: titleAwal);
    TextEditingController bodyController = TextEditingController(text: bodyAwal);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul',
                  hintText: 'Masukkan judul catatan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: TextField(
                  controller: bodyController,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    labelText: 'Isi Catatan',
                    hintText: 'Masukkan isi catatan',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty || bodyController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Judul dan isi tidak boleh kosong!'),
                        ),
                      );
                    } else {
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'body': bodyController.text,
                      });
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
