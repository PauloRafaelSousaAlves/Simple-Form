import 'package:simple_form/share/boundaries/url_launcher/email.dart';
import 'package:simple_form/share/boundaries/url_launcher/exception/url_launcher_facade_exception.dart';
import 'package:simple_form/share/boundaries/url_launcher/url_launcher_facade.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherFacadeImpl implements UrlLauncherFacade {
  UrlLauncherFacadeImpl();

  @override
  call(
      {String? url,
      Email? email,
      LaunchMode mode = LaunchMode.platformDefault}) async {
    late Uri uri;
    if (url != null) {
      uri = Uri.parse(url);
    } else if (email != null) {
      uri = Uri(
        scheme: 'mailto',
        path: email.adress,
        query: _encodeQueryParameters(<String, String>{
          'subject': email.subject,
          'body': email.body,
        }),
      );
    } else {
      throw UrlLauncherFacadeException('All parameters are null');
    }

    await launchUrl(uri, mode: mode);
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
