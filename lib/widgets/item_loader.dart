import 'package:flutter/material.dart';
import 'package:movie_app/models/item_model.dart';

class ItemLoader extends StatelessWidget {
  const ItemLoader({
    Key key,
    @required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;
  final String baseUrl = "https://image.tmdb.org/t/p/original";
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          width: 145.0,
          margin: EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 145.0,
                height: 212,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    image: baseUrl + itemModel.results[index].posterPath,
                    placeholder: 'assets/loading.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Flexible(
                child: Text(
                  itemModel.results[index].title,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
