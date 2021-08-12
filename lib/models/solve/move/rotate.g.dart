// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RotateXAdapter extends TypeAdapter<RotateX> {
  @override
  final int typeId = 41;

  @override
  RotateX read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RotateX(
      positive: fields[0] as bool,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RotateX obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.positive)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RotateXAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RotateYAdapter extends TypeAdapter<RotateY> {
  @override
  final int typeId = 42;

  @override
  RotateY read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RotateY(
      positive: fields[0] as bool,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RotateY obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.positive)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RotateYAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RotateZAdapter extends TypeAdapter<RotateZ> {
  @override
  final int typeId = 43;

  @override
  RotateZ read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RotateZ(
      positive: fields[0] as bool,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RotateZ obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.positive)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RotateZAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
