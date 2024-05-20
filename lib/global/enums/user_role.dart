enum UserRole {
  farmer('farmer'),
  consumer('consumer'),
  none('none');

  const UserRole(this.name);
  final String name;

  static UserRole? fromString(String role) {
    switch (role) {
      case 'farmer':
        return UserRole.farmer;
      case 'consumer':
        return UserRole.consumer;
      default:
        return UserRole.none;
    }
  }
}
