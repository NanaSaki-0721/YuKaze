import 'dart:math';

import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/models/models.dart';
import 'package:flutter/material.dart';

class DailyTrafficSeries {
  final List<double> upload;
  final List<double> download;
  final List<double> total;
  final List<int> recordAts;

  const DailyTrafficSeries({
    required this.upload,
    required this.download,
    required this.total,
    required this.recordAts,
  });

  bool get isEmpty => upload.isEmpty;

  int get length => upload.length;
}

DailyTrafficSeries buildDailyTrafficSeries(
  List<PanelTrafficRecord> records,
) {
  final daily = <int, PanelTrafficRecord>{};
  for (final record in records) {
    final recordAt = record.recordAt;
    if (recordAt == null || recordAt == 0) {
      continue;
    }
    final date = DateTime.fromMillisecondsSinceEpoch(recordAt * 1000);
    final key = date.year * 10000 + date.month * 100 + date.day;
    final rate = record.serverRate ?? 1;
    final existing = daily[key];
    daily[key] = PanelTrafficRecord(
      recordAt: recordAt,
      u: (existing?.u ?? 0) + ((record.u ?? 0) * rate).round(),
      d: (existing?.d ?? 0) + ((record.d ?? 0) * rate).round(),
    );
  }
  final keys = daily.keys.toList()..sort();
  final start = keys.length > 30 ? keys.length - 30 : 0;
  final upload = <double>[];
  final download = <double>[];
  final total = <double>[];
  final recordAts = <int>[];
  for (var i = start; i < keys.length; i++) {
    final record = daily[keys[i]]!;
    upload.add((record.u ?? 0).toDouble());
    download.add((record.d ?? 0).toDouble());
    total.add(((record.u ?? 0) + (record.d ?? 0)).toDouble());
    recordAts.add(record.recordAt ?? 0);
  }
  return DailyTrafficSeries(
    upload: upload,
    download: download,
    total: total,
    recordAts: recordAts,
  );
}

class TrafficChart extends StatelessWidget {
  final DailyTrafficSeries series;
  final Color uploadColor;
  final Color downloadColor;
  final Color totalColor;
  final String uploadLabel;
  final String downloadLabel;
  final String totalLabel;

  const TrafficChart({
    super.key,
    required this.series,
    required this.uploadColor,
    required this.downloadColor,
    required this.totalColor,
    required this.uploadLabel,
    required this.downloadLabel,
    required this.totalLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (series.isEmpty) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: CustomPaint(
            painter: _TrafficChartPainter(
              seriesList: [series.upload, series.download, series.total],
              colors: [uploadColor, downloadColor, totalColor],
              fillLast: true,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _LegendItem(color: uploadColor, label: uploadLabel),
            _LegendItem(color: downloadColor, label: downloadLabel),
            _LegendItem(color: totalColor, label: totalLabel),
          ],
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(label, style: context.textTheme.labelSmall?.toLight),
        ],
      ),
    );
  }
}

class _TrafficChartPainter extends CustomPainter {
  final List<List<double>> seriesList;
  final List<Color> colors;
  final bool fillLast;

  const _TrafficChartPainter({
    required this.seriesList,
    required this.colors,
    this.fillLast = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var maxValue = 1.0;
    for (final series in seriesList) {
      for (final value in series) {
        maxValue = max(maxValue, value);
      }
    }
    final baselinePaint = Paint()
      ..color = Colors.grey.opacity30
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      baselinePaint,
    );
    for (var i = 0; i < seriesList.length; i++) {
      final values = seriesList[i];
      if (values.isEmpty) {
        continue;
      }
      final color = colors[i];
      final points = <Offset>[];
      final count = values.length;
      for (var j = 0; j < count; j++) {
        final x = count == 1 ? size.width / 2 : j / (count - 1) * size.width;
        final y = size.height - (values[j] / maxValue) * (size.height - 8);
        points.add(Offset(x, y));
      }
      if (fillLast && i == seriesList.length - 1) {
        final fillPath = Path()
          ..moveTo(points.first.dx, size.height)
          ..lineTo(points.first.dx, points.first.dy);
        for (var j = 1; j < points.length; j++) {
          fillPath.lineTo(points[j].dx, points[j].dy);
        }
        fillPath
          ..lineTo(points.last.dx, size.height)
          ..close();
        canvas.drawPath(
          fillPath,
          Paint()..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.opacity38, color.opacity10],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
        );
      }
      final linePaint = Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (var j = 1; j < points.length; j++) {
        final prev = points[j - 1];
        final current = points[j];
        final midX = (prev.dx + current.dx) / 2;
        path.quadraticBezierTo(prev.dx, prev.dy, midX, (prev.dy + current.dy) / 2);
      }
      path.lineTo(points.last.dx, points.last.dy);
      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _TrafficChartPainter oldDelegate) {
    return oldDelegate.seriesList != seriesList || oldDelegate.colors != colors;
  }
}
