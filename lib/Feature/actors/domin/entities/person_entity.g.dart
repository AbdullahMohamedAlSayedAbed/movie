// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonEntityAdapter extends TypeAdapter<PersonEntity> {
  @override
  final int typeId = 4;

  @override
  PersonEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonEntity(
      id: fields[0] as int,
      name: fields[1] as String?,
      profilePath: fields[2] as String?,
      knownFor: (fields[3] as List).cast<KnownForEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, PersonEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePath)
      ..writeByte(3)
      ..write(obj.knownFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KnownForEntityAdapter extends TypeAdapter<KnownForEntity> {
  @override
  final int typeId = 5;

  @override
  KnownForEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownForEntity(
      id: fields[0] as int,
      title: fields[1] as String?,
      posterPath: fields[2] as String?,
      releaseDate: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownForEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnownForEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
