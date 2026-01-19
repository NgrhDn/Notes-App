import 'package:flutter/material.dart';

class FormTambah extends StatelessWidget {
  const FormTambah({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
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
                    if (titleController.text.isEmpty ||
                        bodyController.text.isEmpty) {
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
