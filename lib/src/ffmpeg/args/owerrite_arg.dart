import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Video bitrate in kbps , eg: 1000kbps
class OverwriteArgument implements CliArguments {
  const OverwriteArgument();

  @override
  String toCli() {
    return '-y';
  }
}
