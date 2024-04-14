import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
class MockConductorModel extends Mock implements ConductorModel {}

void main() {

  late MockDocumentSnapshot mockDocumentSnapshot;
  late MockConductorModel mockConductorModel;
  late ConductorModel conductor;

  setUp(() {
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockConductorModel = MockConductorModel();
    conductor = const ConductorModel(
      uid: 'uid', 
      name: 'name', 
      phone: 'phone', 
      role: UserRole.conducteur);
  });

  final userJson = {
    'uid': conductor.uid,
    'name': conductor.name,
    'phone': conductor.phone,
    'role': 'conducteur',
  };
  const uid = 'test-uid';
  const name = 'test-name';
  const phone = 'test-phone';
  const role = UserRole.conducteur;

  group('ConductorModel', () {
    test('should create a ConductorModel instance with the correct properties when ConductorModel.fromDocumentSnapshot is called', () {

      when(() => mockDocumentSnapshot.id).thenReturn(uid);
      when(() => mockDocumentSnapshot['name']).thenReturn(name);
      when(() => mockDocumentSnapshot['phone']).thenReturn(phone);
      when(() => mockDocumentSnapshot['role']).thenReturn(role);

      final conductorModel = ConductorModel.fromDocumentSnapshot(mockDocumentSnapshot);

      expect(conductorModel, isA<ConductorModel>());
      expect(conductorModel, isA<UserModel>());
      expect(conductorModel.uid, uid);
      expect(conductorModel.name, name);
      expect(conductorModel.phone, phone);
      expect(conductorModel.role, UserRole.conducteur);
      
    });

    test('should convert [ConductorModel] into [Map<String, dynamic>] when ConductorModel.toJson is called', () {
      when(() => mockConductorModel.toJson()).thenReturn(userJson);

      final result = conductor.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result, userJson);

    });

    test('should create a [ConductorModel] instance with the correct properties when ConductorModel.fromJson is called', () {

      when(() => userJson['uid']).thenReturn(uid);
      when(() => userJson['name']).thenReturn(name);
      when(() => userJson['phone']).thenReturn(phone);
      when(() => userJson['phone']).thenReturn(phone);
      when(() => userJson['role']).thenReturn('conductor');

      final result = ConductorModel.fromJson(userJson);

      expect(result, isA<ConductorModel>());
      expect(result, isA<UserModel>());
      expect(result.uid, uid);
      expect(result.name, name);
      expect(result.phone, phone);
      expect(result.role, UserRole.conducteur);

    });
  });
}