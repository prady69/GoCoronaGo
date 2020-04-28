class CountryStats {
  final String country;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;

  CountryStats(
      {this.country, this.confirmed, this.deaths, this.recovered, this.active});

  factory CountryStats.fromJSON(Map<String, dynamic> json) {
    return CountryStats(
        country: json['Country'],
        confirmed: json['Confirmed'],
        deaths: json['Deaths'],
        recovered: json['Recovered'],
        active: json['Active']);
  }
}
