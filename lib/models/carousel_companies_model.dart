
class CarouselCompaniesModel {

  final String image;
  int index;
  bool isSelected;

  CarouselCompaniesModel({
    
    this.image,
    this.index,
    this.isSelected
  });
}

List<CarouselCompaniesModel> carouselCompanies = [
  CarouselCompaniesModel(index: 0, image: 'accenture.png', isSelected: true),
  CarouselCompaniesModel(index: 1, image: 'bam.png', isSelected: false),
  CarouselCompaniesModel(index: 3, image: 'zte.png',  isSelected: false),
  CarouselCompaniesModel(index: 2, image: 'claro.png',  isSelected: false),
];