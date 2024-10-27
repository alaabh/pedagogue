import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressWidget extends StatefulWidget {
  final String label;
  final double value;
  const ProgressWidget({super.key, required this.label, required this.value});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.19,
      child: SfRadialGauge(
          title: GaugeTitle(
            text: "${widget.value.ceil()}%",
            alignment: GaugeAlignment.center,
          ),
          axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                radiusFactor: 0.8,
                axisLineStyle: AxisLineStyle(
                    cornerStyle: CornerStyle.bothFlat,
                    color: Colors.black12,
                    thickness: 12),
                pointers: <GaugePointer>[
                  RangePointer(
                      value: widget.value,
                      cornerStyle: CornerStyle.bothFlat,
                      width: 12,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      color: Colors.orangeAccent,
                      gradient: const SweepGradient(
                          colors: <Color>[Color(0XFFFFD180), Color(0XFFFFAB40)],
                          stops: <double>[0.25, 0.75])),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.1,
                      widget: Text(widget.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFFFAB40))))
                ])
          ]),
    );
  }
}
