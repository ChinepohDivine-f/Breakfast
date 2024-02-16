class RecommendationModel {
  String iconPath;
  String name;
  String mode;
  String duration;
  String cal;
  bool isVied;

  RecommendationModel({
    required this.iconPath,
    required this.name,
    required this.mode,
    required this.duration,
    required this.cal,
    required this.isVied,
    // required this.iconPath,
  });

  static List<RecommendationModel> getRecommendations() {
    List<RecommendationModel> recommendation = [];

    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: true));
    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: false));
    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: false));
    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: false));
    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: false));
    recommendation.add(RecommendationModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: 'Honey Pancake',
        mode: 'Easy',
        duration: '30mins',
        cal: "180kcal",
        isVied: false));

    return recommendation;
  }
}
