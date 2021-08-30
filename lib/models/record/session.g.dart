// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<Session> {
  @override
  final int typeId = 1;

  @override
  Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Session(
      id: fields[0] as String,
      title: fields[1] as String,
      records: (fields[2] as List).cast<Record>(),
      createTime: fields[3] as DateTime,
      lastUpdateTime: fields[4] as DateTime,
      isArchived: fields[5] as bool,
      isCurrentTrack: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Session obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.records)
      ..writeByte(3)
      ..write(obj.createTime)
      ..writeByte(4)
      ..write(obj.lastUpdateTime)
      ..writeByte(5)
      ..write(obj.isArchived)
      ..writeByte(6)
      ..write(obj.isCurrentTrack);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
