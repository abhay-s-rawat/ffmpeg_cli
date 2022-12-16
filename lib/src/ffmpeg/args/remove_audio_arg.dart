import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Remove audio track
class RemoveAudioArgument implements CliArguments {
  const RemoveAudioArgument();

  @override
  String toCli() {
    return '-an';
  }
}
