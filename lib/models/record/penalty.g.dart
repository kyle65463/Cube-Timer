// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PenaltyNoneAdapter extends TypeAdapter<PenaltyNone> {
  @override
  final int typeId = 6;

  @override
  PenaltyNone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PenaltyNone();
  }

  @override
  void write(BinaryWriter writer, PenaltyNone obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PenaltyNoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PenaltyDNFAdapter extends TypeAdapter<PenaltyDNF> {
  @override
  final int typeId = 7;

  @override
  PenaltyDNF read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PenaltyDNF();
  }

  @override
  void write(BinaryWriter writer, PenaltyDNF obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PenaltyDNFAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PenaltyPlus2SecAdapter extends TypeAdapter<PenaltyPlus2Sec> {
  @override
  final int typeId = 8;

  @override
  PenaltyPlus2Sec read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PenaltyPlus2Sec();
  }

  @override
  void write(BinaryWriter writer, PenaltyPlus2Sec obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PenaltyPlus2SecAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
