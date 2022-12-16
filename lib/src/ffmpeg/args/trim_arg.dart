import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

class TrimArgument implements CliArguments {
  /// Trim video
  final Duration start;
  final Duration end;
  const TrimArgument({
    required this.start,
    required this.end,
  });

  @override
  String toCli() {
    return '-ss $start -to $end';
  }
}
