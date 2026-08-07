class Project {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final List<String> technologies;
  final String github;
  final String? liveDemo;
  final bool featured;

  const Project({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.technologies,
    required this.github,
    this.liveDemo,
    this.featured = false,
  });
}