// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detailes_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
  @override
  final int typeId = 2;

  @override
  MovieDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsEntity(
      backdropPath: fields[0] as String,
      overview: fields[1] as String,
      id: fields[2] as int,
      title: fields[3] as String,
      genres: (fields[4] as List).cast<GenreEntity>(),
      voteAverage: fields[5] as num,
      runtime: fields[6] as int,
      releaseDate: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.overview)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.runtime)
      ..writeByte(7)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreEntityAdapter extends TypeAdapter<GenreEntity> {
  @override
  final int typeId = 3;

  @override
  GenreEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreEntity(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GenreEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
