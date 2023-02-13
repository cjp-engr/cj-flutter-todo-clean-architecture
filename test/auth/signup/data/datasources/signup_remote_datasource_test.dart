import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:test/test.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/datasources/signup_remote_datasource.dart';
import 'package:todo_app_clean_arch/features/auth/signup/data/models/signup_model.dart';

const uid = 'abc';

//https://github.com/atn832/firebase_auth_mocks/blob/master/test/firebase_auth_mocks_test.dart

void main() {
  group('Returns a mocked user user after sign up', () {
    const expectedDumpAfterset = '''{
  "users": {
    "abc": {
      "userId": "abc",
      "name": "name",
      "email": "some@email.com",
      "password": "secret",
      "profileImage": "profileImage"
    }
  }
}''';
    test('with email and password', () async {
      const email = 'some@email.com';
      const password = 'secret';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      expect(user.email, email);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
      expect(user.isAnonymous, isFalse);
    });

    test('Sets data for a document within a collection', () async {
      const email = 'some@email.com';
      const password = 'secret';
      final instance = FakeFirebaseFirestore();
      final userDetails = SignupModel(
          userId: uid,
          name: 'name',
          email: email,
          password: password,
          profileImage: 'profileImage');

      await instance.collection('users').doc(uid).set(userDetails.toJson());

      expect(instance.dump(), equals(expectedDumpAfterset));
    });

    test('test only', () async {
      const email = 'some@email.com';
      const password = 'secret';
      final auth = MockFirebaseAuth();
      final instance = FakeFirebaseFirestore();
      final signupRemoteDatasourceUnderTest =
          SignupRemoteDatasourceImpl(firebaseAuth: auth);
      final te = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final userDetails = SignupModel(
          userId: te.user!.uid,
          name: 'name',
          email: email,
          password: password,
          profileImage: 'profileImage');

      await instance.collection('users').doc(uid).set(userDetails.toJson());
      final result =
          await signupRemoteDatasourceUnderTest.setNewUserRemoteDatasource(
              userId: te.user!.uid,
              name: 'name',
              email: email,
              password: password,
              profileImage: 'profileImage');

      expect(result, userDetails);
    });
  });
}
