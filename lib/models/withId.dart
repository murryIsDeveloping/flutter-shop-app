import 'package:uuid/uuid.dart';

class WithId {
  final String id = Uuid().v1();
}
