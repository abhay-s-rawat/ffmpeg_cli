import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Audio bitrate in kbps , eg: 1000kbps
class AudioBitrateArgument implements CliArguments {
  final int bitrate;

  const AudioBitrateArgument(this.bitrate);

  @override
  String toCli() {
    return '-b:a ${bitrate}k';
  }
}
