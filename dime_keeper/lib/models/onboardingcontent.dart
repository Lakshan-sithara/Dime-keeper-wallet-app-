class OnboardingCotent {
  String image;
  String title;
  String description;

  OnboardingCotent(
      {required this.image, required this.title, required this.description});

  static getContent() {
    List<OnboardingCotent> contents = [
      OnboardingCotent(
          image: "images/onboardingScreen1.svg",
          title: "Empover your financial future",
          description: "Securing and mananging your money"),
      OnboardingCotent(
          image: "images/onboardingScreen2.svg",
          title: "Save today, thrive tommorow",
          description:
              "Your path to financial freedom starts with every penny saved"),
      OnboardingCotent(
          image: "images/onboardingScreen3.svg",
          title: "Goals realized, dreams unlocked ",
          description: "Your journey to success begins now")
    ];
    return contents;
  }
}
