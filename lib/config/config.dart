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
        return "http://www.aaa.com/service-article-app";
      case Env.DEV:
        return "http://dev.aaa.com/service-article-app";
      case Env.LOCAL:
        return "http://localhost:3000/service-article-app";
      default:
        return "http://localhost:3000/service-article-app";
    }
  }
}