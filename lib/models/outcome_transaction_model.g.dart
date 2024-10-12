// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OutcomeModelAdapter extends TypeAdapter<OutcomeModel> {
  @override
  final int typeId = 1;

  @override
  OutcomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OutcomeModel(
      title: fields[0] as String,
      amount: fields[1] as double,
      category: fields[2] as String,
      date: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, OutcomeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutcomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
