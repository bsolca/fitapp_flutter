import 'package:ez_fit_app/src/features/user_fake/data/user_repository.codegen.dart';
import 'package:ez_fit_app/src/features/user_fake/model/user_model.codegen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_service.codegen.g.dart';

@riverpod
UserService userService(UserServiceRef ref) {
  final repository = ref.read(userRepositoryProvider);
  return UserService(repository);
}

class UserService {

  UserService(this._repository);
  final UserRepository _repository;

  /// Retrieves a list of users from the repository.
  Stream<List<UserModel>> getUsersStream() {
    return _repository.fetchUsersStream();
  }
}
