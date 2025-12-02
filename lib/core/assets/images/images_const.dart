class YoAssetsImage {
  YoAssetsImage._();
  static String _path(String image) => 'assets/image/$image.png';

  static String onboarding1 = _path('onboard-1');
  static String onboarding2 = _path('onboard-2');
  static String onboarding3 = _path('onboard-3');
  static String login = _path('login');
  static String register1 = _path('register-1');
  static String register2 = _path('register-2');
  static String registerSuccess = _path('register-success');
}
