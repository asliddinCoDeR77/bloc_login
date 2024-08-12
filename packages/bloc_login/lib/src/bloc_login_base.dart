import 'package:bloc/bloc.dart';
import 'package:bloc_login/src/bloc_event_basa.dart';
import 'package:bloc_login/src/bloc_state_base.dart';
import 'package:bloc_login/src/repository/bloc_repository_base.dart';

/// [LoginBloc] manages the state of the login flow, handling
/// events such as username and password changes and submission.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  /// Creates a [LoginBloc] with the provided [UserRepository].
  ///
  /// The [UserRepository] is used to authenticate the user.
  LoginBloc({required this.userRepository}) : super(LoginState.empty());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      // Update the username in the state when it changes.
      yield state.update(username: event.username);
    } else if (event is LoginPasswordChanged) {
      // Update the password in the state when it changes.
      yield state.update(password: event.password);
    } else if (event is LoginSubmitted) {
      // Set the state to loading when the login is submitted.
      yield LoginState.loading();
      try {
        // Attempt to authenticate with the given username and password.
        final isSuccess = await userRepository.authenticate(
          username: state.username,
          password: state.password,
        );
        if (isSuccess) {
          // Set the state to success if authentication is successful.
          yield LoginState.success();
        } else {
          // Set the state to failure if authentication fails.
          yield LoginState.failure();
        }
      } catch (error) {
        // Handle any errors that occur during authentication.
        yield LoginState.failure();
      }
    }
  }
}
