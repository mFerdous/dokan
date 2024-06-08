
import '../../data/model/sign_up_request.dart';
import '../../data/model/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);
}
