class UserRepository {
  Future<bool> authenticate(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return username == 'user' && password == 'password';
  }
}
