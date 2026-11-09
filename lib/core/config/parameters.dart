const String stage = Environment.dev;

class Environment {
  Environment._();

  static const String dev = 'dev';
  static const String qa = 'qa';
  static const String prod = 'prod';

  static const String appName =
      stage == prod ? 'KYC Practice' : 'KYC Practice $stage';

}
