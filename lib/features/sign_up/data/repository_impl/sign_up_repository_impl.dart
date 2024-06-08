

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/sign_up_repository.dart';
import '../model/sign_up_request.dart';
import '../model/sign_up_response.dart';
import '../remote/sign_up_remote.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final ConnectionChecker _connectionChecker;
  final SignUpRemote signUpRemote;

  SignUpRepositoryImpl(this._connectionChecker, this.signUpRemote);

  @override
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    if (!await _connectionChecker.isConnected()) throw NoInternetException();
    SignUpResponse commonResponse = await signUpRemote.signUp(signUpRequest);
    return commonResponse;
  }
}
