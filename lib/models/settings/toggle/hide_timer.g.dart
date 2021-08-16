// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_timer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HideTimerAdapter extends TypeAdapter<HideTimer> {
  @override
  final int typeId = 144;

  @override
  HideTimer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HideTimer(
      enabled: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HideTimer obj) {
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
      other is HideTimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
