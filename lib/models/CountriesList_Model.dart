class CountriesList {
  final String country;
  final String slug;

  CountriesList({this.country, this.slug});

  factory CountriesList.fromJSON(Map<String, dynamic> json) {
    return CountriesList(
      country: json['Country'],
      slug: json['Slug'],
    );
  }
}
