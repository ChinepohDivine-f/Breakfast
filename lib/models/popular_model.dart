class PopularModel {
  String iconPath;
  String name;
  String mode;
  String duration;
  String cal;
  bool isSelected;

  PopularModel(
      {required this.iconPath,
      required this.name,
      required this.mode,
      required this.duration,
      required this.cal,
      required this.isSelected});

  static List<PopularModel> getPopularDiets() {
    List<PopularModel> popularDiets = [];

    popularDiets.add(PopularModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: "Latte",
        mode: "Easy",
        duration: "15mins",
        cal: "100kcal",
        isSelected: true));
        popularDiets.add(PopularModel(
        iconPath: "assets/images/coffee-icon.svg",
        name: "Banna Cake",
        mode: "Easy",
        duration: "30mins",
        cal: "190kcal",
        isSelected: false));
        
    return popularDiets;
  }
}
