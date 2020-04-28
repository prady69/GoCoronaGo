import 'package:flutter/material.dart';
import 'package:go_corona_go/models/NewsHeadline_Model.dart';
import 'package:go_corona_go/themes/theme.dart';
import '../themes/dark_color.dart';
import 'package:random_color/random_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final news;

  NewsCard(this.news);
  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    Container makeNewsTile(NewsHeadline news, Color randomColor) => Container(
        height: 130,
        decoration: new BoxDecoration(
          border: Border(right: BorderSide(width: 5.0, color: randomColor)),
          shape: BoxShape.rectangle,
          color: DarkColor.background,
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new FittedBox(
                      child: Image.network(
                          news.urlToImage != null
                              ? news.urlToImage
                              : 'https://control.quicksuvidha.com/files/item/image_file/5be122c1-8110-46df-a916-62260a0809db/hd_md_md_Image-not-available_(1).png',
                          width: 140,
                          height: 130,
                          fit: BoxFit.fill, loadingBuilder:
                              (BuildContext context, Widget child,
                                  ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Container(
                          width: 140,
                          height: 120,
                          child: Center(
                              child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          )),
                        );
                      }),
                      alignment: Alignment.centerLeft,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              color: randomColor,
                              margin: EdgeInsets.only(left: 15),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: new Text(
                                  news.source,
                                  textAlign: TextAlign.left,
                                  style: AppTheme.headlineSource,
                                ),
                              ),
                            ),
                            Container(
                              height: 82,
                              child: Padding(
                                child: new Text(
                                  news.title,
                                  style: AppTheme.headlineTitle,
                                  maxLines: 4,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                            ),
                            Container(
                              child: new Text(
                                timeago
                                    .format(DateTime.parse(news.publishedAt)),
                                style: AppTheme.headlineDate,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              color: randomColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ));

    return Card(
      elevation: 6.0,
      color: Colors.transparent,
      child: Container(
        decoration:
            new BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
        padding: EdgeInsets.all(5),
        child: makeNewsTile(news,
            _randomColor.randomColor(colorBrightness: ColorBrightness.dark)),
      ),
    );
  }
}
