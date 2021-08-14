// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_record_count.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatRecordCountAdapter extends TypeAdapter<StatRecordCount> {
  @override
  final int typeId = 141;

  @override
  StatRecordCount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatRecordCount(
      value: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StatRecordCount obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatRecordCountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
