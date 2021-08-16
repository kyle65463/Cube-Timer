// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspect_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InspectTimeAdapter extends TypeAdapter<InspectTime> {
  @override
  final int typeId = 143;

  @override
  InspectTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InspectTime(
      enabled: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InspectTime obj) {
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
      other is InspectTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
