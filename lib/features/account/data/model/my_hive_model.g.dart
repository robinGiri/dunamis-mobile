// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeHiveModelAdapter extends TypeAdapter<MeHiveModel> {
  @override
  final int typeId = 0;

  @override
  MeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeHiveModel(
      studentId: fields[0] as String?,
      fName: fields[1] as String,
      lName: fields[2] as String,
      image: fields[3] as String?,
      phone: fields[4] as String,
      courses: (fields[6] as List).cast<CourseHiveModel>(),
      username: fields[7] as String,
      password: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MeHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.studentId)
      ..writeByte(1)
      ..write(obj.fName)
      ..writeByte(2)
      ..write(obj.lName)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.courses)
      ..writeByte(7)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
