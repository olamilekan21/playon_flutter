import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:playon/providers/home_provider.dart';
import 'package:provider/provider.dart';

const List<String> items = ["Home", "Movies", "Series"];

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider state = context.watch<HomeProvider>();
    final double scrollOffset = state.scrollOffset;
    final String active = state.activeMenu;

    final Color color =
        Colors.black.withOpacity((scrollOffset / 250).clamp(0, 1).toDouble());

    return AppBar(
      leadingWidth: double.infinity,
      backgroundColor: color,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: color),
      leading: Row(
        children: [
          const SizedBox(width: 8.0),
          ...items
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<HomeProvider>().updateActive(e);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: active == e ? 2.0 : 0.0,
                      backgroundColor:
                          active == e ? Colors.white : Colors.transparent,
                      foregroundColor:
                          active == e ? Colors.black : Colors.white,
                    ),
                    child: Text(e),
                  ),
                ),
              )
              .toList(),
        ],
      ),
      surfaceTintColor: Colors.black,
      shadowColor: Colors.black,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.search_normal_1, color: Colors.white),
          style: IconButton.styleFrom(backgroundColor: Colors.white10),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
