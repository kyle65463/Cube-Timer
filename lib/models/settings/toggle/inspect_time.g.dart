// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspect_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InspectionTimeAdapter extends TypeAdapter<InspectionTime> {
  @override
  final int typeId = 143;

  @override
  InspectionTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InspectionTime(
      enabled: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InspectionTime obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.enabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InspectionTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
