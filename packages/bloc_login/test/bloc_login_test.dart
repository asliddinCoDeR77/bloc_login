

// import 'package:bloc_login/bloc_login.dart';
// import 'package:bloc_login/src/bloc_event_basa.dart';
// import 'package:bloc_login/src/bloc_state_base.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';


// void main() {
//   group('LoginBloc', () {
//     late LoginBloc loginBloc;
//      MockUserRepository mockUserRepository;

//     setUp(() {
//       mockUserRepository = MockUserRepository();
//       loginBloc = LoginBloc(userRepository: mockUserRepository);
//     });

//     test('initial state is empty', () {
//       expect(loginBloc.state, LoginState.empty());
//     });

//     test('emits [LoginState.loading(), LoginState.success()] when login is successful', () async {
//       when(mockUserRepository.authenticate(
//         username: anyNamed('username'),
//         password: anyNamed('password'),
//       )).thenAnswer((_) async => true);

//       final expected = [
//         LoginState.loading(),
//         LoginState.success(),
//       ];

//       expectLater(loginBloc.stream, emitsInOrder(expected));

//       loginBloc.add(LoginSubmitted());
//     });

//     test('emits [LoginState.loading(), LoginState.failure()] when login fails', () async {
//       when(mockUserRepository.authenticate(
//         username: anyNamed('username'),
//         password: anyNamed('password'),
//       )).thenAnswer((_) async => false);

//       final expected = [
//         LoginState.loading(),
//         LoginState.failure(),
//       ];

//       expectLater(loginBloc.stream, emitsInOrder(expected));

//       loginBloc.add(LoginSubmitted());
//     });

//     test('emits updated username when LoginUsernameChanged is added', () {
//       final updatedUsername = 'new_username';
//       final expectedState = LoginState.empty().update(username: updatedUsername);

//       loginBloc.add(LoginUsernameChanged(updatedUsername, username: ''));

//       expect(loginBloc.state, expectedState);
//     });

//     test('emits updated password when LoginPasswordChanged is added', () {
//       final updatedPassword = 'new_password';
//       final expectedState = LoginState.empty().update(password: updatedPassword);

//       loginBloc.add(LoginPasswordChanged(updatedPassword, password: ''));

//       expect(loginBloc.state, expectedState);
//     });
//   });
// }

// MockUserRepository() {
// }

// anyNamed(String s) {
// }
