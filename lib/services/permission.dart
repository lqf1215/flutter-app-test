import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> getPermissions() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage, Permission.photos].request();
  }
}
