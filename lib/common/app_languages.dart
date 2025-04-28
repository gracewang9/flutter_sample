import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {'hello': '你好 世界'},
    'en_US': {'hello': 'Hallo Welt'},
  };
}
