import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_view_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/big_card.dart';
import 'package:rinjani_visitor/widget/category_item.dart';
import 'package:rinjani_visitor/widget/small_card.dart';
import 'package:rinjani_visitor/widget/status.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _categoriesWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem(
                label: 'Rinjani',
                iconName: Icons.landscape,
              ),
              CategoryItem(
                label: 'Home Stay',
                iconName: Icons.hotel,
              ),
              CategoryItem(
                label: 'Culture',
                iconName: Icons.self_improvement,
              ),
              CategoryItem(
                label: 'Landscape',
                iconName: Icons.hiking,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recommendedWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Text(
            'Recommeded',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // fixed horizontal list, source: https://gist.github.com/Abushawish/048acfdaf956640ea6fa8b3991dbbd81
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(3, (index) {
              return const SmallCard(
                  title: "rinjani Trip",
                  image: AssetImage('assets/rinjani.jpeg'));
            }),
          ),
        )
      ],
    );
  }

  Widget _rinjaniTripWidgets() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Upcoming Event',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // TODO: update this with new repository structure
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: BigCard(
                    image: AssetImage("assets/rinjani.jpeg"),
                    title: "Presean Dance",
                    price: "\$80 - \$90 - Person",
                    status: StatusColor.available,
                    rating: "4.9"),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double appBarHeight = deviceHeight * 0.15;
    final username =
        ref.read(authViewModelProvider).asData?.value?.username ?? "User";
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bigRadius),
                    bottomRight: Radius.circular(bigRadius))),
            child: SafeArea(
              child: Column(
                children: [
                  // Spacer(),
                  Row(
                    children: [
                      Text(
                        'Hi, $username',
                        style: whiteTextStyle.copyWith(
                            fontSize: deviceHeight * 0.04, fontWeight: bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            color: whiteColor,
                            size: deviceHeight * 0.04,
                          )),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: CupertinoSearchTextField(
                      backgroundColor: whiteColor,
                      enabled: false,
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          )),
      body: CustomScrollView(
        scrollBehavior: const CupertinoScrollBehavior(),
        primary: false,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              _categoriesWidgets(),
              const SizedBox(
                height: 24,
              ),
              _recommendedWidgets(),
              const SizedBox(
                height: 24,
              ),
              _rinjaniTripWidgets(),
              const SizedBox(
                height: 80,
              )
            ],
          )),
        ],
      ),
    );
  }
}
