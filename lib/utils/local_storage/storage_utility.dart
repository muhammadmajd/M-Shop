
import 'package:get_storage/get_storage.dart';
class TLocalStorage {
  //static final TLocalStorage _instance = TLocalStorage._internal();
  //TLocalStorage._internal();
  late final GetStorage _storage;
  // Singleton instance
  static   TLocalStorage? _instance;

  TLocalStorage._internal ();

  factory TLocalStorage.instance () {
    _instance ??= TLocalStorage._internal(); // in this way it won't to be cache
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }



 // final _storage = GetStorage();
  // final _storage = GetStorage("CwT"); // here we can define multi storage
  // Generic method to save data
  Future<void> saveData<T>(String key, T value) // this T will take the value type
  async {
    await _storage.write (key, value);
    }
  // Generic method to read data
  T? readData<T> (String key) {
    return _storage.read<T>(key);
  }
  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage. remove (key);
  }
  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}

///*** *** *** *** *** Example *** *** *** *** *** ///
// Localstorage LocalStorage = Localstorage);
// Save data
// Localstorage.saveData('username', 'JohnDoe');
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//Remove data
// Localstorage.removeData('username');
// // Clear all data
/// Localstorage.clearAll();