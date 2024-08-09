import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_icons/weather_icons.dart';

part 'current_weather_models.g.dart';

@JsonSerializable()
class CurrentWeatherModels extends Equatable {
  final String? time;
  final int? interval;
  final double? temperature;
  final double? windspeed;
  final int? winddirection;
  final int? is_day;
  final int? weathercode;
  final String? weatherDescription;
  final IconData? weatherIcon;

  CurrentWeatherModels({
    this.interval,
    this.is_day,
    this.temperature,
    this.time,
    this.weathercode,
    this.winddirection,
    this.windspeed,
  })  : weatherDescription = _getWeatherDescription(weathercode),
        weatherIcon = _getWeatherIcon(weathercode);

  factory CurrentWeatherModels.fromJson(Map<String, dynamic> json) {
    return _$CurrentWeatherModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentWeatherModelsToJson(this);

  @override
  List<Object?> get props => [
        interval,
        is_day,
        temperature,
        time,
        weathercode,
        winddirection,
        windspeed,
        weatherDescription,
        weatherIcon,
      ];


  static String? _getWeatherDescription(int? weatherCode) {
    switch (weatherCode) {
      case 0:
        return 'Clear sky';
      case 1:
        return 'Clear sky';
      case 2:
        return 'Mostly clear';
      case 3:
        return 'Partly cloudy';
      case 4:
        return 'Cloudy';
      case 5:
        return 'Light rain';
      case 6:
        return 'Moderate rain';
      case 7:
        return 'Heavy rain';
      case 8:
        return 'Thunderstorm';
      case 9:
        return 'Light snow';
      case 10:
        return 'Snow';
      case 11:
        return 'Heavy snow';
      case 12:
        return 'Sleet';
      case 13:
        return 'Fog';
      case 14:
        return 'Mist';
      case 15:
        return 'Haze';
      case 16:
        return 'Windy';
      case 17:
        return 'Tornado';
      case 18:
        return 'Hot';
      case 19:
        return 'Cold';
      case 20:
        return 'Calm';
      case 21:
        return 'Calm';
      case 22:
        return 'Light breeze';
      case 23:
        return 'Gentle breeze';
      case 24:
        return 'Moderate breeze';
      case 25:
        return 'Fresh breeze';
      case 26:
        return 'Strong breeze';
      case 27:
        return 'High wind, near gale';
      case 28:
        return 'Gale';
      case 29:
        return 'Severe gale';
      case 30:
        return 'Storm';
      case 31:
        return 'Violent storm';
      case 32:
        return 'Hurricane';
      case 33:
        return 'Cold wave';
      case 34:
        return 'Heat wave';
      case 35:
        return 'Light rain showers';
      case 36:
        return 'Heavy rain showers';
      case 37:
        return 'Isolated showers';
      case 38:
        return 'Scattered showers';
      case 39:
        return 'Isolated thunderstorms';
      case 40:
        return 'Scattered thunderstorms';
      case 41:
        return 'Patchy rain possible';
      case 42:
        return 'Patchy snow possible';
      case 43:
        return 'Patchy sleet possible';
      case 44:
        return 'Patchy freezing drizzle possible';
      case 45:
        return 'Mist';
      case 46:
        return 'Fog';
      case 47:
        return 'Freezing fog';
      case 48:
        return 'Light drizzle';
      case 49:
        return 'Drizzle';
      case 50:
        return 'Heavy drizzle';
      case 51:
        return 'Light rain';
      case 52:
        return 'Moderate rain';
      case 53:
        return 'Heavy rain';
      case 54:
        return 'Light snow';
      case 55:
        return 'Moderate snow';
      case 56:
        return 'Heavy snow';
      case 57:
        return 'Ice pellets';
      case 58:
        return 'Light sleet';
      case 59:
        return 'Moderate sleet';
      case 60:
        return 'Heavy sleet';
      case 61:
        return 'Light showers of ice pellets';
      case 62:
        return 'Moderate or heavy showers of ice pellets';
      case 63:
        return 'Light rain with thunder';
      case 64:
        return 'Moderate or heavy rain with thunder';
      case 65:
        return 'Light snow with thunder';
      case 66:
        return 'Moderate or heavy snow with thunder';
      case 67:
        return 'Blowing snow';
      case 68:
        return 'Blizzard';
      case 69:
        return 'Sandstorm';
      case 70:
        return 'Duststorm';
      case 71:
        return 'Volcanic ash';
      case 72:
        return 'Tornado';
      default:
        return 'Unknown';
    }
  }

  static IconData? _getWeatherIcon(int? weatherCode) {
    switch (weatherCode) {
      case 0:
        return WeatherIcons.day_sunny; // day sunny
      case 1:
        return WeatherIcons.day_sunny; // Clear sky
      case 2:
        return WeatherIcons.day_sunny_overcast; // Mostly clear
      case 3:
        return WeatherIcons.day_cloudy; // Partly cloudy
      case 4:
        return WeatherIcons.cloud; // Cloudy
      case 5:
        return WeatherIcons.rain; // Light rain
      case 6:
        return WeatherIcons.rain; // Moderate rain
      case 7:
        return WeatherIcons.rain; // Heavy rain
      case 8:
        return WeatherIcons.thunderstorm; // Thunderstorm
      case 9:
        return WeatherIcons.snow; // Light snow
      case 10:
        return WeatherIcons.snow; // Snow
      case 11:
        return WeatherIcons.snow; // Heavy snow
      case 12:
        return WeatherIcons.sleet; // Sleet
      case 13:
        return WeatherIcons.fog; // Fog
      case 14:
        return WeatherIcons.fog; // Mist
      case 15:
        return WeatherIcons.day_haze; // Haze
      case 16:
        return WeatherIcons.strong_wind; // Windy
      case 17:
        return WeatherIcons.tornado; // Tornado
      case 18:
        return WeatherIcons.hot; // Hot
      case 19:
        return WeatherIcons.snowflake_cold; // Cold
      case 20:
        return WeatherIcons.day_sunny; // Calm
      case 21:
        return WeatherIcons.day_sunny; // Calm
      case 22:
        return WeatherIcons.day_windy; // Light breeze
      case 23:
        return WeatherIcons.day_windy; // Gentle breeze
      case 24:
        return WeatherIcons.strong_wind; // Moderate breeze
      case 25:
        return WeatherIcons.strong_wind; // Fresh breeze
      case 26:
        return WeatherIcons.strong_wind; // Strong breeze
      case 27:
        return WeatherIcons.gale_warning; // High wind, near gale
      case 28:
        return WeatherIcons.gale_warning; // Gale
      case 29:
        return WeatherIcons.hurricane_warning; // Severe gale
      case 30:
        return WeatherIcons.storm_warning; // Storm
      case 31:
        return WeatherIcons.storm_warning; // Violent storm
      case 32:
        return WeatherIcons.hurricane; // Hurricane
      case 33:
        return WeatherIcons.snowflake_cold; // Cold wave
      case 34:
        return WeatherIcons.hot; // Heat wave
      case 35:
        return WeatherIcons.showers; // Light rain showers
      case 36:
        return WeatherIcons.rain; // Heavy rain showers
      case 37:
        return WeatherIcons.showers; // Isolated showers
      case 38:
        return WeatherIcons.showers; // Scattered showers
      case 39:
        return WeatherIcons.thunderstorm; // Isolated thunderstorms
      case 40:
        return WeatherIcons.thunderstorm; // Scattered thunderstorms
      case 41:
        return WeatherIcons.showers; // Patchy rain possible
      case 42:
        return WeatherIcons.snow; // Patchy snow possible
      case 43:
        return WeatherIcons.sleet; // Patchy sleet possible
      case 44:
        return WeatherIcons.sleet; // Patchy freezing drizzle possible
      case 45:
        return WeatherIcons.fog; // Mist
      case 46:
        return WeatherIcons.fog; // Fog
      case 47:
        return WeatherIcons.snowflake_cold; // Freezing fog
      case 48:
        return WeatherIcons.sprinkle; // Light drizzle
      case 49:
        return WeatherIcons.sprinkle; // Drizzle
      case 50:
        return WeatherIcons.sprinkle; // Heavy drizzle
      case 51:
        return WeatherIcons.showers; // Light rain
      case 52:
        return WeatherIcons.rain; // Moderate rain
      case 53:
        return WeatherIcons.rain; // Heavy rain
      case 54:
        return WeatherIcons.snow; // Light snow
      case 55:
        return WeatherIcons.snow; // Moderate snow
      case 56:
        return WeatherIcons.snow; // Heavy snow
      case 57:
        return WeatherIcons.hail; // Ice pellets
      case 58:
        return WeatherIcons.sleet; // Light sleet
      case 59:
        return WeatherIcons.sleet; // Moderate sleet
      case 60:
        return WeatherIcons.sleet; // Heavy sleet
      case 61:
        return WeatherIcons.hail; // Light showers of ice pellets
      case 62:
        return WeatherIcons.hail; // Moderate or heavy showers of ice pellets
      case 63:
        return WeatherIcons.thunderstorm; // Light rain with thunder
      case 64:
        return WeatherIcons.thunderstorm; // Moderate or heavy rain with thunder
      case 65:
        return WeatherIcons.thunderstorm; // Light snow with thunder
      case 66:
        return WeatherIcons.thunderstorm; // Moderate or heavy snow with thunder
      case 67:
        return WeatherIcons.snow_wind; // Blowing snow
      case 68:
        return WeatherIcons.snow_wind; // Blizzard
      case 69:
        return WeatherIcons.sandstorm; // Sandstorm
      case 70:
        return WeatherIcons.dust; // Duststorm
      case 71:
        return WeatherIcons.volcano; // Volcanic ash
      case 72:
        return WeatherIcons.tornado; // Tornado
      default:
        return WeatherIcons.na; // Unknown or unsupported code
    }
  }
}
