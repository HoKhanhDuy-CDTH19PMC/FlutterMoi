import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView
    (
         padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
 
  children:  <Widget>[
     Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ).copyWith(
        right: 0
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
              backgroundImage :   NetworkImage(
               
                 "https://nichetravel.com.vn/wp-content/uploads/2020/08/travel-world.jpg",
            
                  ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyText2,
                      child: Text('hokhanhduy'),),
                  Text('BenTre, Viet Nam', style: Theme.of(context).textTheme.caption,)
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              showDialog(
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: ListView(
                        padding: EdgeInsets.symmetric(
                            vertical: 16
                        ),
                        shrinkWrap: true,
                        children: [
                          'Report...', 'Turn on Post notification', 'Copy Link', 'Share to...', 'Mute'
                        ].map(
                                (e) => InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16
                                ),
                                child: Text(e),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                        ).toList()
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
    ),
     AspectRatio(
       aspectRatio: 1,
      
       child:    Image.network(
                 "https://nichetravel.com.vn/wp-content/uploads/2020/08/travel-world.jpg",
                 fit: BoxFit.cover,
              
             ),
     ),
        // Row(
        //   children: [
        //          CircleAvatar(
        //     radius: 16,
        //       backgroundImage : AssetImage('assets/sample/ic_avatar_1.jpg')
        //   ),
        //   Expanded(
        //     child: Padding(
        //       padding: EdgeInsets.only(
        //         left: 8,
        //       ),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           DefaultTextStyle(
        //               style: Theme.of(context).textTheme.bodyText2,
        //               child: Text('dangngocduc'),),
        //           Text('Ha Noi, Viet Nam', style: Theme.of(context).textTheme.caption,)
        //         ],
        //       ),
        //     ),
        //   ),
        //       IconButton(
        //     onPressed: (){
        //       showDialog(
        //         useRootNavigator: false,
        //         context: context,
        //         builder: (context) {
        //           return Dialog(
        //             child: ListView(
        //                 padding: EdgeInsets.symmetric(
        //                     vertical: 16
        //                 ),
        //                 shrinkWrap: true,
        //                 children: [
        //                   'Report...', 'Turn on Post notification', 'Copy Link', 'Share to...', 'Mute'
        //                 ].map(
        //                         (e) => InkWell(
        //                       child: Container(
        //                         padding: EdgeInsets.symmetric(
        //                             vertical: 12,
        //                             horizontal: 16
        //                         ),
        //                         child: Text(e),
        //                       ),
        //                       onTap: () {
        //                         Navigator.pop(context);
        //                       },
        //                     )
        //                 ).toList()
        //             ),
        //           );
        //         },
        //       );
        //     },
        //     icon: Icon(Icons.more_vert),
        //   )
        //   ],
        // ),
         Container(
           padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
       
        children: <Widget>[
     Container(
       margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
       child  :   Icon(
      Icons.favorite,
      color: Colors.pink,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
     ),
   Container(
       margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
       child  :   Icon(
      Icons.comment,
      color: Colors.green,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
   ),),
 Container(
       margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
       child  :  Icon(
      Icons.share,
      color: Colors.blue,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
 ),),
          Expanded(child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(icon: Icon(Icons.bookmark_border), onPressed: (){}),
          ))
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.w800
              ),
              child: Text('1,102 likes', style: Theme.of(context).textTheme.bodyText2,)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'salysane:', style: Theme.of(context).textTheme.bodyText2),
                  TextSpan(text: '  how to rear mount pec dec instal slideshow. Note: the hite:::..',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w400
                      )),
                      
                ]
              ),
            ),
          ),
          InkWell(
            child: Container(
              child: Text(
                'View all 4 comment',
                style: Theme.of(context).textTheme.caption,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 4
              ),
            ),
            onTap: (){},
          )
        ],
      ),
    ),
  ],

    );
  }
}
