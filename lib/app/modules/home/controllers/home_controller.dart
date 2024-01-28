import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    readDataFromStorage(); // Membaca data dari storage saat inisialisasi
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    count.value++;
    writeDataToStorage(); // Menulis data ke storage setiap kali nilai count berubah
  }

  void writeDataToStorage() {
    storage.write('count', count.value);
    print('Data berhasil ditulis ke dalam storage');
  }

  void readDataFromStorage() {
    if (storage.hasData('count')) {
      count.value = storage.read('count');
      print('Data yang terdapat di dalam storage: ${count.value}');
    } else {
      print('Data tidak ditemukan di dalam storage');
    }
  }

  void removeDataFromStorage() {
    if (storage.hasData('count')) {
      storage.remove('count');
      count.value = 0; // Mengatur ulang nilai count ke 0 setelah data dihapus
      print('Data berhasil dihapus dari storage');
    } else {
      print('Data tidak ditemukan di dalam storage');
    }
  }
}