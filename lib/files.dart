import 'package:flutter/material.dart';

class Item {
  late String name;
  bool starred = false;
  bool offline = false;
  String lastOpened = "Today";
  late Icon itemType;
  late String thumbnail;
  int recentCount = 0;

  Item(this.name, this.itemType, this.thumbnail);
}

Icon pdf = const Icon(
  Icons.picture_as_pdf,
  color: Color.fromARGB(255, 215, 74, 66),
);

Icon png = const Icon(
  Icons.image,
  color: Color.fromARGB(255, 215, 74, 66),
);

Icon mp4 = const Icon(
  Icons.movie,
  color: Color.fromARGB(255, 215, 74, 66),
);

List<Item> common = [
  Item("Nine", mp4,
      "http://s3.media.squarespace.com/production/465215/5366925/wp-content/uploads/2009/05/9_poster.jpg"),
  Item("SSL certifaces", pdf,
      "https://images.techhive.com/images/article/2013/05/pdfeditorpro3_1-100037591-orig.jpg"),
  Item("Assignment 1", pdf,
      "https://www.greenfoothills.org/wp-content/uploads/2017/11/PDF-icon-1.png"),
  Item("Pink Rose", png,
      "http://www.photos-public-domain.com/wp-content/uploads/2011/09/pink-rose-close-up.jpg"),
  Item("Chair", png,
      "https://i5.walmartimages.com/asr/0524c749-e8c6-43ea-bd7f-59506a5e9316.8a7bb1aaf59ae6bb0c48ee77a5e637fb.jpeg"),
  Item("Climbing Roses", png,
      "https://fthmb.tqn.com/h5jtr9eDUuA9zQr1TKzyOsd2_h0=/2000x1333/filters:fill(auto,1)/climbing_roses-522159621-58993bf05f9b5874ee66606f.jpg"),
  Item("Floribunda", png,
      "https://images.immediate.co.uk/production/volatile/sites/10/2018/02/4554f805-ecc3-4eea-9f9e-78e558ff4862-992fb2b.jpg?quality=90&resize=960%2C640"),
  Item("Anthemis", png,
      "https://www.flowerglossary.com/wp-content/uploads/2020/01/an-anthemis-4278593_960_720.jpg"),
  Item("Fern", png,
      "https://images.esellerpro.com/3048/I/619/56/Nephrolepis%20boston%20fern-3.jpg"),
  Item("NineBark", png,
      "https://www.growjoy.com/store/pc/catalog/coppertina_ninebark_1649_detail.jpg"),
  Item("Flushed Away", mp4,
      "https://content.internetvideoarchive.com/content/hdphotos/924/000924/000924_960x720_125179_020.jpg"),
  Item("Goofy", mp4,
      "http://images4.fanpop.com/image/photos/15100000/-A-Goofy-Movie-a-goofy-movie-15167012-1032-768.jpg"),
  Item("Jhin the Virtuoso", png,
      "https://i1.sndcdn.com/artworks-000145499989-ht4q7k-t500x500.jpg"),
  Item("Stratocaster guitar", mp4,
      "https://images.reverb.com/image/upload/s--E2WhUAN1--/f_auto,t_supersize/v1553362879/fypgkflf0xot99brqfv8.jpg"),
  Item("Cloudy with a Chance of Meatballs", mp4,
      "https://image.tmdb.org/t/p/original/qhOhIKf7QEyQ5dMrRUqs5eTX1Oq.jpg"),
];
