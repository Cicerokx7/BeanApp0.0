// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 0;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data()
      ..standardCoffeeStack = (fields[0] as List).cast<dynamic>()
      ..recentCoffeeStack = (fields[1] as List).cast<dynamic>()
      ..favoritesCoffeeStack = (fields[2] as List).cast<dynamic>()
      ..cart = (fields[3] as List).cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.standardCoffeeStack)
      ..writeByte(1)
      ..write(obj.recentCoffeeStack)
      ..writeByte(2)
      ..write(obj.favoritesCoffeeStack)
      ..writeByte(3)
      ..write(obj.cart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
