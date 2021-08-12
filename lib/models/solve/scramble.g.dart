// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scramble.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScrambleAdapter extends TypeAdapter<Scramble> {
  @override
  final int typeId = 6;

  @override
  Scramble read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scramble(
      moves: (fields[0] as List).cast<Move>(),
    );
  }

  @override
  void write(BinaryWriter writer, Scramble obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.moves);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScrambleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
