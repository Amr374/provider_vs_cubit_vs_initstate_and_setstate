class Articles {
   List<Article>? articles = [];
   Articles({this.articles});

   Articles.fromJson(Map<String, dynamic> json){

     json['articles'].forEach((element){
       articles!.add(Article.fromJson(element));
     });

  }
}
class Article {
   String? title;
   String? description;
   String? imageUrl;
   String? articleUrl;

  Article({this.title, this.description, this.imageUrl, this.articleUrl});

   Article.fromJson(Map<String, dynamic> json) {
        title= json['title'];
        description= json['description'];
        imageUrl= json['urlToImage'];
        articleUrl= json['url'];
  }
}