import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

class GifArgument implements CliArguments {
  /// Convert to gif, use in conjunction with fps=10
  const GifArgument();

  @override
  String toCli() {
    return '-loop 0';
  }
}
