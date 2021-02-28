import 'package:flutter/material.dart';
import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/ui/colors.dart';

class ItemPopularLoader extends StatelessWidget {
  final ItemModel itemModel;
  final String baseUrl = "https://image.tmdb.org/t/p/original";

  const ItemPopularLoader({Key key, this.itemModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          height: 280.0,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              //Left part ...
              Container(
                width: 165.0,
                height: 280.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    image: baseUrl + itemModel.results[index].posterPath,
                    placeholder: 'assets/loading.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Right part ...
              Container(
                width: MediaQuery.of(context).size.width - 205,
                margin: EdgeInsets.only(left: 10.0, top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      itemModel.results[index].title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.0),
                    Text(itemModel.results[index].releaseDate),
                    SizedBox(height: 8.0),
                    Flexible(
                      child: Text(
                        itemModel.results[index].genresString,
                        style: TextStyle(color: textColor, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: iconColor,
                          size: 28.0,
                        ),
                        SizedBox(width: 4.0),
                        RichText(
                          text: TextSpan(
                            text:
                                itemModel.results[index].voteAverage.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' / 10',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
