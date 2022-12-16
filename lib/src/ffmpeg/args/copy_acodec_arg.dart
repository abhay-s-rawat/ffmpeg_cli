import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

class CopyAudioCodecArgument implements CliArguments {
  /// Copy Audio codec
  const CopyAudioCodecArgument();

  @override
  String toCli() {
    return '-c:a copy';
  }
}
