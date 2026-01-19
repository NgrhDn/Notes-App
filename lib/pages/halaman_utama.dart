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

  @override
  void initState() {
    super.initState();
    muatData();
  }

  void muatData() async {
    await controller.ambilDataDariAPI();
    setState(() {});
  }

  void bukaTambah() async {
    var hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormTambah()),
    );

    if (hasil != null) {
      setState(() {
        controller.tambah(hasil['title'], hasil['body']);
      });
    }
  }

  void bukaEdit(int index) async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormEdit(
          titleAwal: controller.notes[index]['title'],
          bodyAwal: controller.notes[index]['body'],
        ),
      ),
    );

    if (hasil != null) {
      setState(() {
        controller.edit(index, hasil['title'], hasil['body']);
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (controller.sedangMuatData) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.pesanError.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.pesanError,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: muatData, child: const Text('Coba Lagi')),
          ],
        ),
      );
    }

    return GridCatatan(
      notes: controller.notes,
      onTap: bukaEdit,
      onDelete: (index) {
        setState(() {
          controller.hapus(index);
        });
      },
    );
  }
}
