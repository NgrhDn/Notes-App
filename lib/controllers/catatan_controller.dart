class CatatanController {
  List<String> notes = [];

  void tambah(String text) {
    notes.add(text);
  }

  void edit(int index, String text) {
    notes[index] = text;
  }

  void hapus(int index) {
    notes.removeAt(index);
  }
}
