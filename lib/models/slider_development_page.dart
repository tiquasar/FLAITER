class IntroSliderModel {
  String imagePath, title, description;

  IntroSliderModel({this.imagePath, this.title, this.description});
}

final List<IntroSliderModel> introSlider = [
  IntroSliderModel(
      imagePath: 'assets/illustrations/ai.svg',
      title: 'Artificial Intelligence',
      description: 'AI is becoming popular today.'),
  IntroSliderModel(
      imagePath: 'assets/illustrations/cloud.svg',
      title: 'Cloud',
      description: 'ML models are pretrained on cloud.'),
  IntroSliderModel(
      imagePath: 'assets/illustrations/iphone.svg',
      title: 'Mobile',
      description: 'Now you can use it on mobile devices.')
];
