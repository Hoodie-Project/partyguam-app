/// datasource
export 'datasources/remote/user_datasource.dart';

/// dto
export 'dto/auth/auth_tokens_dto.dart';
export 'dto/user/user_credential_dto.dart';

/// repository
export 'repositories/user_repository_impl.dart';

/*
 * data/repository
 * implementation of the repository defined in the domain layer.
 * interact with dataSource to retrieve data
 * ex) there is a change made in the server, we only need to modify the datasource
 * as the data still have to return the required data that is defined as a model.
 * /
