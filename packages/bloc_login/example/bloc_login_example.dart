import 'package:bloc_login/src/bloc_event_basa.dart';
import 'package:bloc_login/src/bloc_login_base.dart';
import 'package:bloc_login/src/repository/bloc_repository_base.dart';

void main() {
  // Create a mock UserRepository for demonstration
  final userRepository = UserRepository();

  // Create an instance of LoginBloc
  final loginBloc = LoginBloc(userRepository: userRepository);

  // Listen to the state changes of the LoginBloc
  loginBloc.stream.listen((state) {
    if (state.isSubmitting) {
      print('Logging in...');
    } else if (state.isSuccess) {
      print('Login successful!');
    } else if (state.isFailure) {
      print('Login failed.');
    }
  });

  // Dispatch events to the LoginBloc
  loginBloc.add(LoginUsernameChanged('user123', username: ''));
  loginBloc.add(LoginPasswordChanged('password', password: ''));
  loginBloc.add(LoginSubmitted());
}
