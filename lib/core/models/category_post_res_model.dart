class CategoryPostResModel {
  int? id;
  String? date;
  String? dateGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  List<int>? categories;
  String? msg;
  YoastHeadJson? yoastHeadJson;

  CategoryPostResModel({
    this.id,
    this.date,
    this.dateGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.author,
    this.yoastHeadJson,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.msg,
    this.categories,
  });

  CategoryPostResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];

    categories = json['categories'].cast<int>();

    msg = json["message"];
    yoastHeadJson = json["yoast_head_json"] == null
        ? null
        : YoastHeadJson.fromJson(json["yoast_head_json"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;

    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    data['categories'] = this.categories;

    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class YoastHeadJson {
  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  String? ogSiteName;
  String? articlePublishedTime;
  List<OgImage>? ogImage;
  String? twitterCard;
  TwitterMisc? twitterMisc;
  // Schema? schema;

  YoastHeadJson({
    this.title,
    this.description,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublishedTime,
    this.ogImage,
    this.twitterCard,
    this.twitterMisc,
    // this.schema
  });

  YoastHeadJson.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    robots =
        json['robots'] != null ? new Robots.fromJson(json['robots']) : null;
    canonical = json['canonical'];
    ogLocale = json['og_locale'];
    ogType = json['og_type'];
    ogTitle = json['og_title']?.toString().replaceAll("&#8230", "");
    ogDescription = json['og_description']?.toString().replaceAll("&#8230", "");
    ogUrl = json['og_url'];
    ogSiteName = json['og_site_name'];
    articlePublishedTime = json['article_published_time'];
    if (json['og_image'] != null) {
      ogImage = <OgImage>[];
      json['og_image'].forEach((v) {
        ogImage!.add(new OgImage.fromJson(v));
      });
    }
    twitterCard = json['twitter_card'];
    twitterMisc = json['twitter_misc'] != null
        ? new TwitterMisc.fromJson(json['twitter_misc'])
        : null;
    // schema =
    //     json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.robots != null) {
      data['robots'] = this.robots!.toJson();
    }
    data['canonical'] = this.canonical;
    data['og_locale'] = this.ogLocale;
    data['og_type'] = this.ogType;
    data['og_title'] = this.ogTitle;
    data['og_description'] = this.ogDescription;
    data['og_url'] = this.ogUrl;
    data['og_site_name'] = this.ogSiteName;
    data['article_published_time'] = this.articlePublishedTime;
    if (this.ogImage != null) {
      data['og_image'] = this.ogImage!.map((v) => v.toJson()).toList();
    }
    data['twitter_card'] = this.twitterCard;
    if (this.twitterMisc != null) {
      data['twitter_misc'] = this.twitterMisc!.toJson();
    }
    // if (this.schema != null) {
    //   data['schema'] = this.schema!.toJson();
    // }
    return data;
  }
}

class Robots {
  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

  Robots(
      {this.index,
      this.follow,
      this.maxSnippet,
      this.maxImagePreview,
      this.maxVideoPreview});

  Robots.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    follow = json['follow'];
    maxSnippet = json['max-snippet'];
    maxImagePreview = json['max-image-preview'];
    maxVideoPreview = json['max-video-preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['follow'] = this.follow;
    data['max-snippet'] = this.maxSnippet;
    data['max-image-preview'] = this.maxImagePreview;
    data['max-video-preview'] = this.maxVideoPreview;
    return data;
  }
}

class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

  OgImage({this.width, this.height, this.url, this.type});

  OgImage.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class TwitterMisc {
  String? writtenBy;
  String? estReadingTime;

  TwitterMisc({this.writtenBy, this.estReadingTime});

  TwitterMisc.fromJson(Map<String, dynamic> json) {
    writtenBy = json['Written by'];
    estReadingTime = json['Est. reading time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Written by'] = this.writtenBy;
    data['Est. reading time'] = this.estReadingTime;
    return data;
  }
}

// class Schema {
//   String? context;
//   List<Graph>? graph;

//   Schema({this.context, this.graph});

//   Schema.fromJson(Map<String, dynamic> json) {
//     context = json['@context'];
//     if (json['@graph'] != null) {
//       graph = <Graph>[];
//       json['@graph'].forEach((v) {
//         graph!.add(new Graph.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@context'] = this.context;
//     if (this.graph != null) {
//       data['@graph'] = this.graph!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Graph {
//   String? type;
//   String? id;
//   String? url;
//   String? name;
//   String? description;
//   List<PotentialAction>? potentialAction;
//   String? inLanguage;
//   String? contentUrl;
//   int? width;
//   int? height;
//   IsPartOf? isPartOf;
//   IsPartOf? primaryImageOfPage;
//   String? datePublished;
//   String? dateModified;
//   IsPartOf? author;
//   IsPartOf? breadcrumb;
//   List<ItemListElement>? itemListElement;
//   Image? image;

//   Graph(
//       {this.type,
//       this.id,
//       this.url,
//       this.name,
//       this.description,
//       this.potentialAction,
//       this.inLanguage,
//       this.contentUrl,
//       this.width,
//       this.height,
//       this.isPartOf,
//       this.primaryImageOfPage,
//       this.datePublished,
//       this.dateModified,
//       this.author,
//       this.breadcrumb,
//       this.itemListElement,
//       this.image});

//   Graph.fromJson(Map<String, dynamic> json) {
//     type = json['@type'];
//     id = json['@id'];
//     url = json['url'];
//     name = json['name'];
//     description = json['description'];
//     if (json['potentialAction'] != null) {
//       potentialAction = <PotentialAction>[];
//       json['potentialAction'].forEach((v) {
//         potentialAction!.add(new PotentialAction.fromJson(v));
//       });
//     }
//     inLanguage = json['inLanguage'];
//     contentUrl = json['contentUrl'];
//     width = json['width'];
//     height = json['height'];
//     isPartOf = json['isPartOf'] != null
//         ? new IsPartOf.fromJson(json['isPartOf'])
//         : null;
//     primaryImageOfPage = json['primaryImageOfPage'] != null
//         ? new IsPartOf.fromJson(json['primaryImageOfPage'])
//         : null;
//     datePublished = json['datePublished'];
//     dateModified = json['dateModified'];
//     author =
//         json['author'] != null ? new IsPartOf.fromJson(json['author']) : null;
//     breadcrumb = json['breadcrumb'] != null
//         ? new IsPartOf.fromJson(json['breadcrumb'])
//         : null;
//     if (json['itemListElement'] != null) {
//       itemListElement = <ItemListElement>[];
//       json['itemListElement'].forEach((v) {
//         itemListElement!.add(new ItemListElement.fromJson(v));
//       });
//     }
//     image = json['image'] != null ? new Image.fromJson(json['image']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@type'] = this.type;
//     data['@id'] = this.id;
//     data['url'] = this.url;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     if (this.potentialAction != null) {
//       data['potentialAction'] =
//           this.potentialAction!.map((v) => v.toJson()).toList();
//     }
//     data['inLanguage'] = this.inLanguage;
//     data['contentUrl'] = this.contentUrl;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     if (this.isPartOf != null) {
//       data['isPartOf'] = this.isPartOf!.toJson();
//     }
//     if (this.primaryImageOfPage != null) {
//       data['primaryImageOfPage'] = this.primaryImageOfPage!.toJson();
//     }
//     data['datePublished'] = this.datePublished;
//     data['dateModified'] = this.dateModified;
//     if (this.author != null) {
//       data['author'] = this.author!.toJson();
//     }
//     if (this.breadcrumb != null) {
//       data['breadcrumb'] = this.breadcrumb!.toJson();
//     }
//     if (this.itemListElement != null) {
//       data['itemListElement'] =
//           this.itemListElement!.map((v) => v.toJson()).toList();
//     }
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     return data;
//   }
// }

// // class PotentialAction {
// //   String? type;
// //   Target? target;
// //   String? queryInput;

// //   PotentialAction({this.type, this.target, this.queryInput});

// //   PotentialAction.fromJson(Map<String, dynamic> json) {
// //     type = json['@type'];
// //     target =
// //         json['target'] != null ? new Target.fromJson(json['target']) : null;
// //     queryInput = json['query-input'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['@type'] = this.type;
// //     if (this.target != null) {
// //       data['target'] = this.target!.toJson();
// //     }
// //     data['query-input'] = this.queryInput;
// //     return data;
// //   }
// // }

// class Target {
//   String? type;
//   String? urlTemplate;

//   Target({this.type, this.urlTemplate});

//   Target.fromJson(Map<String, dynamic> json) {
//     type = json['@type'];
//     urlTemplate = json['urlTemplate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['@type'] = this.type;
//     data['urlTemplate'] = this.urlTemplate;
//     return data;
//   }
// }

class IsPartOf {
  String? id;

  IsPartOf({this.id});

  IsPartOf.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    return data;
  }
}

class ItemListElement {
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  ItemListElement.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    position = json['position'];
    name = json['name'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['position'] = this.position;
    data['name'] = this.name;
    data['item'] = this.item;
    return data;
  }
}

class Image {
  String? type;
  String? id;
  String? inLanguage;
  String? url;
  String? contentUrl;
  String? caption;

  Image(
      {this.type,
      this.id,
      this.inLanguage,
      this.url,
      this.contentUrl,
      this.caption});

  Image.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['@id'];
    inLanguage = json['inLanguage'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['@id'] = this.id;
    data['inLanguage'] = this.inLanguage;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['caption'] = this.caption;
    return data;
  }
}
