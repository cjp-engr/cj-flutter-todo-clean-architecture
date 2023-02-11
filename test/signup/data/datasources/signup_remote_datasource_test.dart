import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:test/test.dart';

//https://github.com/atn832/firebase_auth_mocks/blob/master/test/firebase_auth_mocks_test.dart

void main() {
  group('Returns a mocked user user after sign up', () {
    test('with email and password', () async {
      const email = 'some@email.com';
      const password = 'some!password';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      expect(user.email, email);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
      expect(user.isAnonymous, isFalse);
    });
  });
}
