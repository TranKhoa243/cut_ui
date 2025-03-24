const kUser = 1;
const kAdmin = 2;

enum UserRole { user, admin }

extension UserRoleValue on UserRole {
  int get value {
    switch (this) {
      case UserRole.user:
        return kUser;
      case UserRole.admin:
        return kAdmin;
    }
  }
}

UserRole getUserRoleFromInt({required int code}) {
  switch (code) {
    case kUser:
      return UserRole.user;
    case kAdmin:
      return UserRole.admin;
    default:
      return UserRole.user;
  }
}
