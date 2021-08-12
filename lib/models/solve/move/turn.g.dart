// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TurnRAdapter extends TypeAdapter<TurnR> {
  @override
  final int typeId = 11;

  @override
  TurnR read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnR(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnR obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnRAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnLAdapter extends TypeAdapter<TurnL> {
  @override
  final int typeId = 12;

  @override
  TurnL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnL(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnL obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnLAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnUAdapter extends TypeAdapter<TurnU> {
  @override
  final int typeId = 13;

  @override
  TurnU read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnU(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnU obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnUAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnDAdapter extends TypeAdapter<TurnD> {
  @override
  final int typeId = 14;

  @override
  TurnD read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnD(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnD obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnDAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnBAdapter extends TypeAdapter<TurnB> {
  @override
  final int typeId = 15;

  @override
  TurnB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnB(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnB obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnFAdapter extends TypeAdapter<TurnF> {
  @override
  final int typeId = 16;

  @override
  TurnF read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnF(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnF obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnFAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnMAdapter extends TypeAdapter<TurnM> {
  @override
  final int typeId = 17;

  @override
  TurnM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnM(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnM obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnSAdapter extends TypeAdapter<TurnS> {
  @override
  final int typeId = 18;

  @override
  TurnS read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnS(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnS obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnSAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TurnEAdapter extends TypeAdapter<TurnE> {
  @override
  final int typeId = 19;

  @override
  TurnE read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TurnE(
      positive: fields[0] as bool,
      count: fields[1] as int,
      wideness: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TurnE obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.wideness)
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
      other is TurnEAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
