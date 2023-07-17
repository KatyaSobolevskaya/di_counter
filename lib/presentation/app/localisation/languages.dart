import 'package:di_counter/presentation/app/localisation/strings_consts.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': {
          StringsConsts.save: 'сохранить',
          StringsConsts.result: 'результат',
          StringsConsts.weightBefore: 'Вес до',
          StringsConsts.weightAfter: 'Вес после',
          StringsConsts.name: 'Название',
          StringsConsts.calories: 'кк',
          StringsConsts.grams: 'г',
        },
      };
}
