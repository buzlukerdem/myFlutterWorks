// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ogrenci.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OgrenciAdapter extends TypeAdapter<Ogrenci> {
  @override
  final int typeId = 1;

  @override
  Ogrenci read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ogrenci(
      fields[0] as int,
      fields[1] as String,
      fields[2] as GozRenk,
    );
  }

  @override
  void write(BinaryWriter writer, Ogrenci obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ogrid)
      ..writeByte(1)
      ..write(obj.ograd)
      ..writeByte(2)
      ..write(obj.gozRenk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OgrenciAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GozRenkAdapter extends TypeAdapter<GozRenk> {
  @override
  final int typeId = 2;

  @override
  GozRenk read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GozRenk.mavi;
      case 1:
        return GozRenk.siyah;
      case 2:
        return GozRenk.yesil;
      case 3:
        return GozRenk.kahverengi;
      default:
        return GozRenk.mavi;
    }
  }

  @override
  void write(BinaryWriter writer, GozRenk obj) {
    switch (obj) {
      case GozRenk.mavi:
        writer.writeByte(0);
        break;
      case GozRenk.siyah:
        writer.writeByte(1);
        break;
      case GozRenk.yesil:
        writer.writeByte(2);
        break;
      case GozRenk.kahverengi:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GozRenkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
