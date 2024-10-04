import 'package:example/shared/model/exception/app_exception.dart';

abstract interface class IUserRepository {
  Future<bool> isUsernameTaken(String username);

  Future<void> register({
    required String username,
    required String password,
  });
}

class UserRepository implements IUserRepository {
  @override
  Future<bool> isUsernameTaken(String username) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'User1') {
      throw BadResponseException('Username "$username" already taken');
    }

    return false;
  }

  @override
  Future<void> register(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));

    if (username == 'User1') {
      throw BadResponseException(
        'Invalid form',
        errors: {'username': 'Username "$username" already taken'},
      );
    }
  }
}
