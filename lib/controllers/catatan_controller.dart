import 'package:http/http.dart' as http;
import 'dart:convert';

class CatatanController {
  List<Map<String, dynamic>> notes = [];
  bool sedangMuatData = false;
  String pesanError = '';

  Future<void> ambilDataDariAPI() async {
    sedangMuatData = true;
    pesanError = '';

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        List<dynamic> dataList = jsonDecode(response.body);

        notes = dataList.map((item) {
          return {'title': item['title'], 'body': item['body']};
        }).toList();
      } else {
        pesanError = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      pesanError = 'Error: $e';
    }

    sedangMuatData = false;
  }

  void tambah(String title, String body) {
    notes.add({'title': title, 'body': body});
  }

  void edit(int index, String title, String body) {
    notes[index] = {'title': title, 'body': body};
  }

  void hapus(int index) {
    notes.removeAt(index);
  }
}
