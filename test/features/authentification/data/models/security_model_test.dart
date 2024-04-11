import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
class MockSecurityModel extends Mock implements SecurityModel {}

void main() {

  late MockDocumentSnapshot mockDocumentSnapshot;
  late MockSecurityModel mockSecurityModel;
  late SecurityModel securityModel;

  setUp(() {
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockSecurityModel = MockSecurityModel();
    securityModel = SecurityModel(
      uid: 'uid',
      name: 'name',
      phone: 'phone',
      role: UserRole.gardien,
      workDuration: 2,
      startAt: DateTime.now(),
      endAt: DateTime.now());
  });

  final userJson = {
    'uid': securityModel.uid,
    'name': securityModel.name,
    'phone': securityModel.phone,
    'role': 'gardien',
    'workDuration': 2,
    'startAt': securityModel.startAt.toIso8601String(),
    'endAt': securityModel.endAt.toIso8601String()
  };
  const uid = 'test-uid';
  const name = 'test-name';
  const phone = 'test-phone';
  const role = UserRole.gardien;
  const workDuration = 8;
  final startAt = DateTime.utc(2022, 1, 1);
  final endAt = DateTime.utc(2022, 1, 2);

  group('SecurityModel', () {
    test('should create a SecurityModel instance with the correct properties when SecurityModel.fromDocumentSnapshot is called', () {

      when(() => mockDocumentSnapshot.id).thenReturn(uid);
      when(() => mockDocumentSnapshot['name']).thenReturn(name);
      when(() => mockDocumentSnapshot['phone']).thenReturn(phone);
      when(() => mockDocumentSnapshot['role']).thenReturn(role);
      when(() => mockDocumentSnapshot['workDuration']).thenReturn(workDuration);
      when(() => mockDocumentSnapshot['startAt']).thenReturn(startAt);
      when(() => mockDocumentSnapshot['endAt']).thenReturn(endAt);

      final securityModel = SecurityModel.fromDocumentSnapshot(mockDocumentSnapshot);

      expect(securityModel, isA<SecurityModel>());
      expect(securityModel, isA<UserModel>());
      expect(securityModel.uid, uid);
      expect(securityModel.name, name);
      expect(securityModel.phone, phone);
      expect(securityModel.role, UserRole.gardien);
      expect(securityModel.workDuration, workDuration);
      expect(securityModel.startAt, startAt);
      expect(securityModel.endAt, endAt);
      
    });

    test('should convert [SecuritModel] into [Map<String, dynamic>] when SecurityModel.toJson is called', () {
      when(() => mockSecurityModel.toJson()).thenReturn(userJson);

      final result = securityModel.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result, userJson);

    });

    test('should create a SecurityModel instance with the correct properties when SecurityModel.fromJson is called', () {

      when(() => userJson['uid']).thenReturn(uid);
      when(() => userJson['name']).thenReturn(name);
      when(() => userJson['phone']).thenReturn(phone);
      when(() => userJson['phone']).thenReturn(phone);
      when(() => userJson['role']).thenReturn(role);
      when(() => userJson['workDuration']).thenReturn(workDuration);
      when(() => userJson['startAt']).thenReturn(startAt);
      when(() => userJson['endAt']).thenReturn(endAt);

      final securityModel = SecurityModel.fromJson(userJson);

      expect(securityModel, isA<SecurityModel>());
      expect(securityModel, isA<UserModel>());
      expect(securityModel.uid, uid);
      expect(securityModel.name, name);
      expect(securityModel.phone, phone);
      expect(securityModel.role, UserRole.gardien);
      expect(securityModel.workDuration, workDuration);
      expect(securityModel.startAt, startAt);
      expect(securityModel.endAt, endAt);

    });
  });
}