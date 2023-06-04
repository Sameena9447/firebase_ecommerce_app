import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:staggered_grid_view_flutter/rendering/sliver_staggered_grid.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class Gridexample extends StatelessWidget {
  Gridexample({super.key});
//   List<StaggeredTile> _cardTile = <StaggeredTile>[
//     StaggeredTile.count(2, 3),
//     StaggeredTile.count(2, 2),
//     StaggeredTile.count(2, 3),
//     StaggeredTile.count(2, 2),
//     StaggeredTile.count(2, 3),
//     StaggeredTile.count(2, 2),
//     StaggeredTile.count(2, 3),
//     StaggeredTile.count(2, 2),
//     StaggeredTile.count(2, 3),
//     StaggeredTile.count(2, 2),
//   ];

// //List of Cards with color and icon
//   List<Widget> _listTile = <Widget>[
//     BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
//     BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
//     BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
//     BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
//     BackGroundTile(
//         backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
//     BackGroundTile(backgroundColor: Colors.blue, icondata: Icons.access_alarms),
//     BackGroundTile(
//         backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined),
//     BackGroundTile(backgroundColor: Colors.cyan, icondata: Icons.search_sharp),
//     BackGroundTile(
//         backgroundColor: Colors.yellowAccent, icondata: Icons.adjust_rounded),
//     BackGroundTile(
//         backgroundColor: Colors.deepOrange, icondata: Icons.attach_money),
//   ];
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 200,
        child: StaggeredGridView.countBuilder(
            scrollDirection: Axis.horizontal,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: imageList.length,
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text("data")
                  ],
                ),
              );
            },
            staggeredTileBuilder: (context) => const StaggeredTile.fit(1)),
      )

          //  StaggeredGridView.countBuilder(
          //     scrollDirection: Axis.horizontal,
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 12,
          //     itemCount: imageList.length,
          //     itemBuilder: (context, index) {
          // return Container(
          //   decoration: BoxDecoration(
          //       color: Colors.transparent,
          //       borderRadius: BorderRadius.all(Radius.circular(10))),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     child: FadeInImage.memoryNetwork(
          //       placeholder: kTransparentImage,
          //       image: imageList[index],
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // );
          //     },
          //     staggeredTileBuilder: (index) {
          //       return StaggeredTile.count(1, index.isOdd ? 1.3 : 1.5);
          //     }),
          ),
    );
    //  StaggeredGridView.builder(
    //     scrollDirection: Axis.horizontal,

    //     // crossAxisCount: 4,
    //     // staggeredTiles: _cardTile,
    //     // mainAxisSpacing: 4,
    //     // crossAxisSpacing: 4,
    //     padding: const EdgeInsets.all(4),
    //     // children: _listTile,
    //     itemBuilder: (context, index) {
    //       return Container();
    //     }, gridDelegate: SliverStaggeredGridDelegate(),),
    // );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData? icondata;

  BackGroundTile({required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}
