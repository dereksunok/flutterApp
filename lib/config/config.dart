enum Env {
  PROD,
  DEV,
  LOCAL,
}

class Config {
  static Env env;

  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "http://www.aaa.com";
      case Env.DEV:
        return "http://dev.aaa.com";
      case Env.LOCAL:
        return "http://local.aaa.com";
      default:
        return "http://local.aaa.com";
    }
  }
}