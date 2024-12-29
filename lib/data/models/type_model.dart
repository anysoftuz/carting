class CargoType {
  final String title;
  final String subtitle;

  CargoType({
    required this.title,
    required this.subtitle,
  });
}

List<CargoType> list = [
  CargoType(
    title: 'Boshqa materiallar',
    subtitle: 'Boshqa materiallar',
  ),
  CargoType(
    title: 'Qurilish mollari',
    subtitle: 'Mebel, plintus, gipsokarton',
  ),
  CargoType(
    title: 'Oziq ovqat',
    subtitle: 'Ichimliklar, gazli, mineral suvlar',
  ),
  CargoType(
    title: 'Uskunalar va ehtiyot qismlar',
    subtitle: 'kuzovlar, yoritgich, generator',
  ),
];

List<CargoType> list2 = [
  CargoType(
    title: 'Yuk tashuvchilarsiz',
    subtitle: 'Yordam kerak emas',
  ),
  CargoType(
    title: 'Haydovchi yuklarni tashishi kerak',
    subtitle: '50 kgdan ortiq bo’lmagan yuklarni tashish',
  ),
];
