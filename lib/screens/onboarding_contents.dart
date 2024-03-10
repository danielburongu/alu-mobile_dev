class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track your Market placement",
    image: "lib/images/image1.png",
    desc: "Remember to keep track of Market Prices.",
  ),
  OnboardingContents(
    title: "Stay updated with our team",
    image: "lib/images/image2.png",
    desc:
        "Lets understand the contributions of our colleagues.",
  ),
  OnboardingContents(
    title: "Get notified when Price changes",
    image: "lib/images/image3.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
