import 'package:firebase_auth/firebase_auth.dart';
import 'package:socar/services/sms_send.dart';
import 'dart:math';

import 'package:socar/utils/user_input_validator.dart';

class UserAuthenticateService {
  static String? _currentCode;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool checkLoginStatus() {
    var user = _auth.currentUser;
    if (user != null) {
      // 사용자가 로그인되어 있음
      return true;
    }
    // 사용자가 로그인되어 있지 않음
    return false;
  }

  void sendVerifyCode(String phoneNumber) async {
    UserAuthenticateService._currentCode = _createNewCode();
    SmsSendService.sendMessage(
        "[쏘카] 회원가입을 위한 인증 코드는 $_currentCode 입니다.", phoneNumber);
  }

  bool isAuthenticateSucceed(String code) {
    return code == UserAuthenticateService._currentCode;
  }

  Future<UserCredential> doRegister(
      String emailAddress, String password) async {
    if (!UserInputValidator.validPasswordFormat(password)) {
      throw FirebaseAuthException(code: 'weak-password');
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception("비밀번호 양식이 맞지 않습니다.");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("이미 가입된 이메일입니다.");
      }
    } catch (e) {
      throw Exception("알 수 없는 오류입니다.");
    }
    throw Exception("알 수 없는 오류입니다.");
  }

  Future<bool> doLogin(String emailAddress, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  String _createNewCode() {
    Random random = Random();
    String code = random.nextInt(1000000).toString().padLeft(6, "0");

    return code;
  }

  void logout() {
    _auth.signOut();
  }
}
