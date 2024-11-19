import 'package:hive/hive.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/core/constants/name_hive_box.dart';

class PersonLocalDataSource {
  final Box<PersonEntity> personBox = Hive.box<PersonEntity>(NameHiveBox.personBox);
  final Box<int> timestampsBox;

  PersonLocalDataSource({required this.timestampsBox});
  static const personTimestampKey = 'personTimestampKey';

  Future<void> savePerson(List<PersonEntity> personList) async {
    personBox.addAll(personList);
  }
  Future<void> saveAndClearPerson(List<PersonEntity> personList) async {
    await personBox.clear();
    personBox.addAll(personList);
  }

  PersonEntity? getPerson(int id) {
    return personBox.get(id);
  }

  List<PersonEntity> getAllPersons() {
    return personBox.values.toList();
  }

  Future<void> deletePerson(int id) async {
    await personBox.delete(id);
  }
  int? getLastUpdateTimestamp(String key) {
    return timestampsBox.get(key);
  }
}
