// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalsModelAdapter extends TypeAdapter<GoalsModel> {
  @override
  final int typeId = 2;

  @override
  GoalsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalsModel(
      amount: fields[1] as double,
      leftAmount: fields[2] as double,
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GoalsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.leftAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
