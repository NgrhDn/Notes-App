import 'package:flutter/material.dart';
import '../controllers/catatan_controller.dart';
import '../widgets/grid_catatan.dart';
import 'form_tambah.dart';
import 'form_edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CatatanController controller = CatatanController();

  void bukaTambah() async {
    String? hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormTambah()),
    );

    if (hasil != null) {
      setState(() {
        controller.tambah(hasil);
      });
    }
  }

  void bukaEdit(int index) async {
    String? hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormEdit(textAwal: controller.notes[index]),
      ),
    );

    if (hasil != null) {
      setState(() {
        controller.edit(index, hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CATATAN APP')),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaTambah,
        child: const Icon(Icons.add),
      ),
      body: GridCatatan(
        notes: controller.notes,
        onTap: bukaEdit,
        onDelete: (i) {
          setState(() {
            controller.hapus(i);
          });
        },
      ),
    );
  }
}
