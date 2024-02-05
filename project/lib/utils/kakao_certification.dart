import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:project/utils/keys.dart';

void kakaoInit() {
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: myKeys['nativeAppKey'],
    javaScriptAppKey: myKeys['javaScriptAppKey'],
  );
}
