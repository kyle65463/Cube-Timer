// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_warning.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeleteRecordWarningAdapter extends TypeAdapter<DeleteRecordWarning> {
  @override
  final int typeId = 142;

  @override
  DeleteRecordWarning read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeleteRecordWarning(
      enabled: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DeleteRecordWarning obj) {
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
      other is DeleteRecordWarningAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
