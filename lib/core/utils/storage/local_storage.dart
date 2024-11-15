import 'local_storage_cubit.dart';

class VexoraLocalStorage {
  static final VexoraLocalStorage _instance = VexoraLocalStorage._internal();
  final LocalStorageCubit _cubit = LocalStorageCubit();

  factory VexoraLocalStorage() {
    return _instance;
  }

  VexoraLocalStorage._internal();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _cubit.saveData<T>(key, value);
  }

  Future<T?> readData<T>(String key) async {
    return _cubit.readData<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _cubit.removeData(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _cubit.clearAll();
  }
}
