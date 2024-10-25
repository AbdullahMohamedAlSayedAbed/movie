// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeEntityAdapter extends TypeAdapter<HomeEntity> {
  @override
  final int typeId = 0;

  @override
  HomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeEntity(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
      backdropPath: fields[3] as String?,
      overview: fields[4] as String?,
      releaseDate: fields[5] as String?,
      voteAverage: fields[6] as num,
      genreIds: (fields[7] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.genreIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
