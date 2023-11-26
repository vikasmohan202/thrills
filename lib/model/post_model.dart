class Post {
  String? description;
  List<String?> photo = [];
  List<String?> video = [];
  List<String?> tags = [];
  int like = 0;
  bool isActive = true;

  // Constructor
  Post({
    required this.description,
    this.photo = const [],
    this.video = const [],
    this.tags = const [],
    this.like = 0,
    this.isActive = true,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      description: json['description'],
      photo: List<String?>.from(json['photos']),
      video: List<String?>.from(json['videos']),
      tags: List<String?>.from(json['tags']),
      like: json['like'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'photos': List<String?>.from(photo),
      'videos': List<String?>.from(video),
      'tags': List<String?>.from(tags),
      'like': like,
      'is_active': isActive,
    };
  }
}
