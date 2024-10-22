import 'package:get_storage/get_storage.dart';

class KVService {
  var storage = GetStorage();

  void setStringPrefValue(
      {required String key, required String value})  {
    storage.write(key, value);
  }

  String getStringPrefValue(
      {required String key, String? returnValue})  {
    return storage.read(key) ?? returnValue ?? "";
  }

  Future<dynamic> clearAllLocalData() async {
    final keys = List.from(storage.getKeys());
    for (final key in keys) {
      await storage.remove(key);
    }
  }

  Future<dynamic> removeKeyData({required String key}) async {
    await storage.remove(key);
  }
}

class KvConstants {
  static const String languageCode = "LANGUAGE_CODE";
  static const String countryCode = "COUNTRY_CODE";
  static const String languageName = "LANGUAGE_NAME";
  static const String walletList = "WALLET_LIST";
  static const String theme = "THEME";
  static const String mnemonicList = "MNEMONIC_LIST";
  static const String privateKey = "PRIVATE_KEY";
  static const String walletPassword = "WALLET_PASSWORD";
  static const String networkList = "NETWORK_LIST";
}
