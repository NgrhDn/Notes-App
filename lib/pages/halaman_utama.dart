import 'package:flutter/material.dart';
import 'halaman_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  void tambahCatatan() async {
    String? hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );

    if (hasil != null) {
      setState(() {
        notes.add(hasil);
      });
    }
  }

  void editCatatan(int index) async {
    String? hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormPage(textAwal: notes[index])),
    );

    if (hasil != null) {
      setState(() {
        notes[index] = hasil;
      });
    }
  }

  void hapusCatatan(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CATATAN APP'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahCatatan,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => editCatatan(index),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          notes[index],
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => hapusCatatan(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
