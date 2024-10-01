import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_footer.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_header.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_indicator_widget.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_item_data.codegen.dart';
import 'package:impostor/src/shared/measuring_widget/measuring_widget.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

/// A [EzSidebar] widget that displays a customizable navigation sidebar.
///
/// This widget includes a header, a list of items with selection
/// indicators, and a footer. It supports dynamic item heights and
/// scrolling.
class EzSidebar extends StatefulWidget {
  /// Creates a [EzSidebar] widget.
  ///
  /// The [logo], [headerText], [items], [currentIndex], [onItemTap],
  /// [scrollController], [itemHeights], and [updateItemHeight] parameters
  /// are required.
  const EzSidebar({
    super.key,
    required this.logo,
    required this.headerText,
    this.headerDropdown,
    required this.items,
    required this.currentIndex,
    required this.onItemTap,
    required this.scrollController,
    required this.itemHeights,
    required this.updateItemHeight,
  });

  /// The logo widget displayed in the header.
  final Widget? logo;

  /// The text displayed in the header.
  final String? headerText;

  /// An optional dropdown widget displayed in the header.
  final Widget? headerDropdown;

  /// The list of items to display in the sidebar.
  final List<EzSidebarItemData> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback when an item is tapped, providing the tapped item's index.
  final ValueChanged<int> onItemTap;

  /// Controller to manage the scrolling of the item list.
  final ScrollController scrollController;

  /// A list of heights for each sidebar item.
  final List<double> itemHeights;

  /// Updates the height of an item at the given index.
  ///
  /// Takes the item's index and its new height as parameters.
  final void Function(int, double) updateItemHeight;

  @override
  State<EzSidebar> createState() => _EzSidebarState();
}

class _EzSidebarState extends State<EzSidebar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Determine the sidebar background color based on the color scheme
    final sidebarBackgroundColor =
    EzSidebarConsts.getSidebarBackgroundColor(colorScheme);

    // Define the divider widget using constants and dynamic colors
    final divider = Padding(
      padding: EzSidebarConsts.horizontalPadding,
      child: Divider(
        thickness: EzSidebarConsts.dividerThickness,
        color: EzSidebarConsts.getDividerColor(colorScheme),
      ),
    );

    return SizedBox(
      width: EzSidebarConsts.sidebarWidth,
      child: ColoredBox(
        color: sidebarBackgroundColor,
        child: Column(
          children: [
            EzSidebarHeader(
              onTap: () => print('Logo tapped'),
              appName: 'Ez Dashboard',
            ),
            divider,
            Expanded(
              child: Stack(
                children: [
                  NotificationListener<SizeChangedLayoutNotification>(
                    onNotification: (notification) => true,
                    child: WebSmoothScroll(
                      controller: widget.scrollController,
                      child: ListView.builder(
                        controller: widget.scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final item = widget.items[index];
                          return MeasuringWidget(
                            onSize: (size) => widget.updateItemHeight(
                              index,
                              size.height,
                            ),
                            child: Padding(
                              padding: EzSidebarConsts.horizontalPadding,
                              child: EzSidebarItem(
                                text: item.text,
                                iconPath: item.iconPath,
                                isSelected: index == widget.currentIndex,
                                onTap: () {
                                  widget.onItemTap(index);
                                  item.onTap.call();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  EzSidebarIndicatorWidget(
                    scrollController: widget.scrollController,
                    itemHeights: widget.itemHeights,
                    selectedIndex: widget.currentIndex,
                    indicatorColor:
                    EzSidebarConsts.getIndicatorColor(colorScheme),
                    indicatorPadding: EzSidebarConsts.indicatorVerticalPadding,
                  ),
                ],
              ),
            ),
            divider,
            EzSidebarFooter(
              name: 'Benjamin Sx',
              email: 'benjamin@ez.io',
              onTap: () => print('Footer button tapped'),
            ),
          ],
        ),
      ),
    );
  }
}
