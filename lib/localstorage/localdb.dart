import 'package:hive/hive.dart';

part 'localdb.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String token;

  User(this.email, this.token);
}
