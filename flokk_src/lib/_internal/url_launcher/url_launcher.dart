import 'url_launcher_locator.dart'
    if (dart.library.html) 'url_launcher_web.dart'
    if (dart.library.io) 'url_launcher_io.dart';

class UrlLauncher {
  static Future<bool> open(String value) async {
    if (value == null) return false;
    bool success = await urlLauncherOpen(value);
    if (!success) print('Could not launch $value');
    return success;
  }

  static Future<bool> openHttp(String value) async {
    if (value == null) return false;
    if (!value.contains("http") && !value.contains("http")) {
      value = "http://$value";
    }
    bool success = await urlLauncherOpen(value);
    if (!success) print('Could not launch $value');
    return success;
  }

  static void openPhoneNumber(String value) {
    if (value == null) return;
    value =
        RegExp(r"([\d+])").allMatches(value).map((m) => m.group(0)).join("");
    open("tel:$value");
  }

  static void openEmail(String value) {
    if (value == null) return;

    /// TODO: Add regEx check, don't bother opening if it's not a valid email
    open("mailto:$value");
  }

  static void openGoogleMaps(String value) =>
      open("https://www.google.com/maps/search/${Uri.encodeFull(value)}/");

  static void openGitUser(String value) => open("https://github.com/$value/");

  static void openTwitterUser(String value) =>
      open("https://twitter.com/${value.replaceAll("@", "")}/");
}
