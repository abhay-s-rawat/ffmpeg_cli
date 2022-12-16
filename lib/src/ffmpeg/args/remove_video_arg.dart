import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Remove audio track
class RemoveVideoArgument implements CliArguments {
  const RemoveVideoArgument();

  @override
  String toCli() {
    return '-vn';
  }
}
