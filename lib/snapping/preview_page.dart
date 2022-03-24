import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import 'appbar.dart';
import 'default_grabbing.dart';
import 'dummy_background.dart';
import 'dummy_content.dart';

class PreviewPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  SnappingSheetController _sheetController = SnappingSheetController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const DarkAppBar(title: "Snapping Sheet").build(context),
      body: SnappingSheet(
        controller: _sheetController,
        lockOverflowDrag: false,
        snappingPositions: const [
          SnappingPosition.factor(
            positionFactor: 0.0,
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          SnappingPosition.factor(positionFactor: 0.9),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 50,
        grabbing: DefaultGrabbing(),
        sheetBelow: SnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}