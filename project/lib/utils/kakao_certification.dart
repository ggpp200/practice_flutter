import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:project/utils/keys.dart';
import 'package:project/utils/social_login.dart';
import 'package:flutter/services.dart';
import 'package:project/utils/main_view_model.dart';

void kakaoInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(nativeAppKey: myKeys['nativeAppKey']);
  try {
    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    debugPrint('카카오톡으로 로그인 성공 ${token.accessToken}');
  } catch (error) {
    debugPrint('asdf');
    debugPrint('카카오톡으로 로그인 실패 $error');
    debugPrint('asdf');
  }
}

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled(); //카카오톡 설치 확인
      if (isInstalled) {
        //설치되어 있다면
        try {
          //카카오톡 로그인 시도
          await UserApi.instance.loginWithKakaoTalk(); //카카오톡 로그인
          return true; //성공하면 true
        } catch (error) {
          //error 발견하면
          return false; //return false
        }
      } else {
        //카카오톡 설치되어 있지 않다면
        try {
          //카카오톡 계정으로 로그인 시도
          await UserApi.instance.loginWithKakaoAccount(); //카카오톡 계정 로그인
          return true; //성공하면 true
        } catch (error) {
          //error 발견하면
          return false; //return false
        }
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return true;
    } catch (error) {
      return false;
    }
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final viewmodel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Image.asset('assets/kakao_login_medium_narrow.png'),
      onPressed: () async {
        await viewmodel.login();
        print(myKeys['nativeAppKey']);
      },
    );
  }
}
