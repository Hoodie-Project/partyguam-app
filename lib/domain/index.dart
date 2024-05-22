/// Entity
/// blueprint of data.
/// define the core data of the application.
export 'entities/auth/auth_tokens.dart';
export 'entities/auth/sign_up_auth_token.dart';
export 'entities/users/user_credential.dart';
export 'entities/users/user_information.dart';
export 'entities/users/user_nickname.dart';

/// Repository
/// blueprint of what functionality will be in usecase.
/// a format, contact of how domain layer and data layer will be interact.
/// there is no body/implementation part.
/// use abstract class.
export 'repositories/user_repository.dart';

/// types
export 'types/usecase.dart';

/// Usecase
/// business logic of application.
/// pure dart codes.
/// it depends on repository and call its methods to perform data operations (loosely coupled)
export 'usecases/user_usecase.dart';

/*
* abstract class
* EXTENDS the abstract class, doesn't have to implement all the methods.
* However, if there are abstract methods in the class, the subclass must implement
* all abstract methods from the abstract class.
* */
