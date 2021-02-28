import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/blocs/movies_bloc.dart';
import 'package:movie_app/blocs/movies_popular_bloc.dart';
import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/ui/colors.dart';
import 'package:movie_app/widgets/custom_streambuilder.dart';
import 'package:movie_app/widgets/custom_title.dart';
import 'package:movie_app/widgets/item_loader.dart';
import 'package:movie_app/widgets/item_popular_loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    blocPopular.fetchAllPopularMovies();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness:
          Brightness.light, /* set Status bar icons color in Android devices.*/
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 45.0,
              left: 15.0,
              right: 15.0,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: bgColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
                TextField(
                  style: TextStyle(fontSize: 20.0, color: textColor),
                  decoration: InputDecoration.collapsed(
                    hintStyle: TextStyle(color: textColor),
                    hintText: 'Movies, Actors, Directors...',
                    // border: InputBorder.none,
                  ),
                ),
                Divider(
                  color: textColor,
                  thickness: 2.0,
                  height: 20.0,
                ),
                // Recent
                CustomTitle(
                  text: 'Recent',
                ),
                Container(
                  height: 250.0,
                  child: CustomStreamBuilder<ItemModel>(
                    stream: bloc.allMovies,
                    loaderWidget: (itemModel) {
                      return ItemLoader(itemModel: itemModel);
                    },
                  ),
                ),
                SizedBox(height: 10.0),

                //Popular
                CustomTitle(
                  text: "Popular",
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 455,
                  child: CustomStreamBuilder<ItemModel>(
                    stream: blocPopular.allPopularMovies,
                    loaderWidget: (itemModel) {
                      return ItemPopularLoader(itemModel: itemModel);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
