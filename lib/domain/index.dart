/**
 * Entity
 * blueprint of data.
 * define the core data of the application.
 */
export 'entities/user_credential.dart';
export 'entities/user_nickname.dart';

/**
 * Repository
 * blueprint of what functionality will be in usecase.
 * a format, contact of how domain layer and data layer will be interact.
 * use abstract class.
 */
export 'repositories/user_repository.dart';

/**
 * Usecase
 * business logic of application.
 * pure dart codes.
 * it depends on repository and call its methods to perform data operations (loosely coupled)
 */
export 'usecases/user_usecase.dart';
