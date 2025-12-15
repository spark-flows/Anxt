import 'package:a_nxt/app/theme/colors_value.dart';
import 'package:a_nxt/app/theme/styles.dart';
import 'package:flutter/material.dart';

class DetailsExpansion extends StatefulWidget {
  final String title;
  final List<List<String>> rows;
  final List<String> header;
  final List<String>? totalRow;

  const DetailsExpansion({
    super.key,
    required this.title,
    required this.header,
    required this.rows,
    this.totalRow,
  });

  @override
  State<DetailsExpansion> createState() => _DetailsExpansionState();
}

class _DetailsExpansionState extends State<DetailsExpansion> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsValue.color94A3B8, width: 1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: Styles.txtBlackColorW70018),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: _isExpanded ? 0 : 0.5,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF374151),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Table Section - Expandable
          if (_isExpanded)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: ColorsValue.color94A3B8, width: 1),
                ),
              ),
              child: Column(
                children: [
                  // Header Row
                  _buildTableRow(
                    cells: widget.header,
                    isHeader: true,
                    backgroundColor: ColorsValue.greyCBD5E1,
                    style: Styles.txtBlackColorW70014,
                  ),

                  // Data Rows
                  ...widget.rows
                      .map(
                        (row) => _buildTableRow(
                          cells: row,
                          isHeader: false,
                          backgroundColor: Colors.white,
                          style: Styles.lineColorW40014,
                        ),
                      )
                      .toList(),

                  // Total Row
                  if (widget.totalRow != null)
                    _buildTableRow(
                      cells: widget.totalRow!,
                      isHeader: false,
                      backgroundColor: ColorsValue.color64748B,
                      textColor: Colors.white,
                      isLast: true,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTableRow({
    required List<String> cells,
    required bool isHeader,
    required Color backgroundColor,
    TextStyle? style,
    Color? textColor,
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: isLast ? Radius.circular(19) : Radius.zero,
          bottomRight: isLast ? Radius.circular(19) : Radius.zero,
        ),
        border: Border(
          bottom:
              isLast
                  ? BorderSide.none
                  : BorderSide(color: ColorsValue.greyCBD5E1, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(cells.length, (index) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  right:
                      index < cells.length - 1
                          ? BorderSide(color: ColorsValue.color94A3B8, width: 1)
                          : BorderSide.none,
                ),
              ),
              child: Text(
                cells[index],
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: false,
                style:
                    style ??
                    TextStyle(
                      fontSize: 14,
                      fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
                      color: textColor ?? const Color(0xFF374151),
                    ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// Data Model
class MetalDetail {
  final String code;
  final double gw;
  final double nw;
  final double purity;
  final double fine;
  final double rate;

  MetalDetail({
    required this.code,
    required this.gw,
    required this.nw,
    required this.purity,
    required this.fine,
    required this.rate,
  });

  List<String> toRowData() {
    return [
      code,
      gw.toStringAsFixed(3),
      nw.toStringAsFixed(3),
      purity.toStringAsFixed(2),
      fine.toStringAsFixed(3),
      rate.toStringAsFixed(0),
    ];
  }
}
