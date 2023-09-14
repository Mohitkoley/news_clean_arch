import 'package:clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "articles", primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          id: id,
          author: author ?? "",
          title: title ?? "",
          description: description ?? "",
          url: url ?? "",
          urlToImage: urlToImage ?? "",
          publishedAt: publishedAt ?? "",
          content: content ?? "",
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? "",
      );

  factory ArticleModel.fromEntity(ArticleEntity) {
    return ArticleModel(
      id: ArticleEntity.id,
      author: ArticleEntity.author,
      title: ArticleEntity.title,
      description: ArticleEntity.description,
      url: ArticleEntity.url,
      urlToImage: ArticleEntity.urlToImage,
      publishedAt: ArticleEntity.publishedAt,
      content: ArticleEntity.content,
    );
  }
}
