
import 'package:simple_form/share/base/exception/base_exception.dart';

class UrlLauncherFacadeException extends BaseException {
  UrlLauncherFacadeException(String cause) : super(cause: cause);

  @override
  String toString() => 'UrlLauncherFacadeException: $cause';
}
