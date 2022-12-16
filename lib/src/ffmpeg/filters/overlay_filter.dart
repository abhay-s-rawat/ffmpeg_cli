import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Overlays one video on top of another.
///
/// First video stream is the "main" and the second video stream is the "overlay".
class OverlayFilter implements Filter {
  final int x;
  final int y;
  final String? eval;

  const OverlayFilter({
    required this.x,
    required this.y,
    this.eval,
  });

  @override
  String toCli() {
    final List<String> properties = <String>['x=$x', 'y=$y'];
    if (eval != null) {
      properties.add('eval=$eval');
    }
    if (properties.isNotEmpty) {
      return 'overlay=${properties.join(':')}';
    } else {
      return '';
    }
  }
}
