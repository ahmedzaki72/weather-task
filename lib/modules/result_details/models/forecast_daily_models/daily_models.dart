import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_models.g.dart';

@JsonSerializable()
class DailyModels extends Equatable {
  final List<String>? time;
  final List<double>? temperature_2m_max;
  final List<double>? temperature_2m_min;
  final List<int>? weather_code;
  final double? temperatureMax;
  final double? temperatureMin;
  final String? weatherDescription;
  final IconData? weatherIcon;
  final List<IconData>? listIcons;
  final List<String?>? listName;
  final List<DateTime>? listDateTime;

  DailyModels({
    this.time,
    this.temperature_2m_max,
    this.weather_code,
    this.temperature_2m_min,
  })  : weatherDescription = _getWeatherDescription(weather_code![0]),
        weatherIcon = _getWeatherIcon(weather_code![0]),
        temperatureMax = temperature_2m_max![0],
        temperatureMin = temperature_2m_min![0],
        listIcons = _getWeatherListIcons(weather_code),
        listName = _getWeatherDescriptions(weather_code),
        listDateTime = _getWeatherListDatetime(time);

  factory DailyModels.fromJson(Map<String, dynamic> json) {
    return _$DailyModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyModelsToJson(this);

  @override
  List<Object?> get props => [
        time,
        temperature_2m_max,
        weather_code,
        temperature_2m_min,
        weatherDescription,
        weatherIcon,
        temperatureMin,
        temperatureMax,
        listIcons
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

  static List<String?> _getWeatherDescriptions(List<int>? weatherCodes) {
    List<String?> descriptions = [];

    for (var weatherCode in weatherCodes!) {
      switch (weatherCode) {
        case 0:
          descriptions.add('Clear sky');
          break;
        case 1:
          descriptions.add('Clear sky');
          break;
        case 2:
          descriptions.add('Mostly clear');
          break;
        case 3:
          descriptions.add('Partly cloudy');
          break;
        case 4:
          descriptions.add('Cloudy');
          break;
        case 5:
          descriptions.add('Light rain');
          break;
        case 6:
          descriptions.add('Moderate rain');
          break;
        case 7:
          descriptions.add('Heavy rain');
          break;
        case 8:
          descriptions.add('Thunderstorm');
          break;
        case 9:
          descriptions.add('Light snow');
          break;
        case 10:
          descriptions.add('Snow');
          break;
        case 11:
          descriptions.add('Heavy snow');
          break;
        case 12:
          descriptions.add('Sleet');
          break;
        case 13:
          descriptions.add('Fog');
          break;
        case 14:
          descriptions.add('Mist');
          break;
        case 15:
          descriptions.add('Haze');
          break;
        case 16:
          descriptions.add('Windy');
          break;
        case 17:
          descriptions.add('Tornado');
          break;
        case 18:
          descriptions.add('Hot');
          break;
        case 19:
          descriptions.add('Cold');
          break;
        case 20:
          descriptions.add('Calm');
          break;
        case 21:
          descriptions.add('Calm');
          break;
        case 22:
          descriptions.add('Light breeze');
          break;
        case 23:
          descriptions.add('Gentle breeze');
          break;
        case 24:
          descriptions.add('Moderate breeze');
          break;
        case 25:
          descriptions.add('Fresh breeze');
          break;
        case 26:
          descriptions.add('Strong breeze');
          break;
        case 27:
          descriptions.add('High wind, near gale');
          break;
        case 28:
          descriptions.add('Gale');
          break;
        case 29:
          descriptions.add('Severe gale');
          break;
        case 30:
          descriptions.add('Storm');
          break;
        case 31:
          descriptions.add('Violent storm');
          break;
        case 32:
          descriptions.add('Hurricane');
          break;
        case 33:
          descriptions.add('Cold wave');
          break;
        case 34:
          descriptions.add('Heat wave');
          break;
        case 35:
          descriptions.add('Light rain showers');
          break;
        case 36:
          descriptions.add('Heavy rain showers');
          break;
        case 37:
          descriptions.add('Isolated showers');
          break;
        case 38:
          descriptions.add('Scattered showers');
          break;
        case 39:
          descriptions.add('Isolated thunderstorms');
          break;
        case 40:
          descriptions.add('Scattered thunderstorms');
          break;
        case 41:
          descriptions.add('Patchy rain possible');
          break;
        case 42:
          descriptions.add('Patchy snow possible');
          break;
        case 43:
          descriptions.add('Patchy sleet possible');
          break;
        case 44:
          descriptions.add('Patchy freezing drizzle possible');
          break;
        case 45:
          descriptions.add('Mist');
          break;
        case 46:
          descriptions.add('Fog');
          break;
        case 47:
          descriptions.add('Freezing fog');
          break;
        case 48:
          descriptions.add('Light drizzle');
          break;
        case 49:
          descriptions.add('Drizzle');
          break;
        case 50:
          descriptions.add('Heavy drizzle');
          break;
        case 51:
          descriptions.add('Light rain');
          break;
        case 52:
          descriptions.add('Moderate rain');
          break;
        case 53:
          descriptions.add('Heavy rain');
          break;
        case 54:
          descriptions.add('Light snow');
          break;
        case 55:
          descriptions.add('Moderate snow');
          break;
        case 56:
          descriptions.add('Heavy snow');
          break;
        case 57:
          descriptions.add('Ice pellets');
          break;
        case 58:
          descriptions.add('Light sleet');
          break;
        case 59:
          descriptions.add('Moderate sleet');
          break;
        case 60:
          descriptions.add('Heavy sleet');
          break;
        case 61:
          descriptions.add('Light showers of ice pellets');
          break;
        case 62:
          descriptions.add('Moderate or heavy showers of ice pellets');
          break;
        case 63:
          descriptions.add('Light rain with thunder');
          break;
        case 64:
          descriptions.add('Moderate or heavy rain with thunder');
          break;
        case 65:
          descriptions.add('Light snow with thunder');
          break;
        case 66:
          descriptions.add('Moderate or heavy snow with thunder');
          break;
        case 67:
          descriptions.add('Blowing snow');
          break;
        case 68:
          descriptions.add('Blizzard');
          break;
        case 69:
          descriptions.add('Sandstorm');
          break;
        case 70:
          descriptions.add('Duststorm');
          break;
        case 71:
          descriptions.add('Volcanic ash');
          break;
        case 72:
          descriptions.add('Tornado');
          break;
        default:
          descriptions.add('Unknown');
      }
    }

    return descriptions;
  }

  static List<IconData>? _getWeatherListIcons(List<int>? weatherCodes) {
    List<IconData> data = [];
    for (var code in weatherCodes!) {
      switch (code) {
        case 0:
          data.add(WeatherIcons.day_sunny);
          break;
        case 1:
          data.add(WeatherIcons.day_sunny); // Clear sky
          break;
        case 2:
          data.add(WeatherIcons.day_sunny_overcast); // Mostly clear
          break;
        case 3:
          data.add(WeatherIcons.day_cloudy); // Partly cloudy
          break;
        case 4:
          data.add(WeatherIcons.cloud); // Cloudy
          break;
        case 5:
          data.add(WeatherIcons.rain); // Light rain
          break;
        case 6:
          data.add(WeatherIcons.rain); // Moderate rain
          break;
        case 7:
          data.add(WeatherIcons.rain); // Heavy rain
          break;
        case 8:
          data.add(WeatherIcons.thunderstorm); // Thunderstorm
          break;
        case 9:
          data.add(WeatherIcons.snow); // Light snow
          break;
        case 10:
          data.add(WeatherIcons.snow); // Snow
          break;
        case 11:
          data.add(WeatherIcons.snow); // Heavy snow
          break;
        case 12:
          data.add(WeatherIcons.sleet); // Sleet
          break;
        case 13:
          data.add(WeatherIcons.fog); // Fog
          break;
        case 14:
          data.add(WeatherIcons.fog); // Mist
          break;
        case 15:
          data.add(WeatherIcons.day_haze); // Haze
          break;
        case 16:
          data.add(WeatherIcons.strong_wind); // Windy
          break;
        case 17:
          data.add(WeatherIcons.tornado); // Tornado
          break;
        case 18:
          data.add(WeatherIcons.hot); // Hot
          break;
        case 19:
          data.add(WeatherIcons.snowflake_cold); // Cold
          break;
        case 20:
          data.add(WeatherIcons.day_sunny); // Calm
          break;
        case 21:
          data.add(WeatherIcons.day_sunny); // Calm
          break;
        case 22:
          data.add(WeatherIcons.day_windy); // Light breeze
          break;
        case 23:
          data.add(WeatherIcons.day_windy); // Gentle breeze
          break;
        case 24:
          data.add(WeatherIcons.strong_wind); // Moderate breeze
          break;
        case 25:
          data.add(WeatherIcons.strong_wind); // Fresh breeze
          break;
        case 26:
          data.add(WeatherIcons.strong_wind); // Strong breeze
          break;
        case 27:
          data.add(WeatherIcons.gale_warning); // High wind, near gale
          break;
        case 28:
          data.add(WeatherIcons.gale_warning); // Gale
          break;
        case 29:
          data.add(WeatherIcons.hurricane_warning); // Severe gale
          break;
        case 30:
          data.add(WeatherIcons.storm_warning); // Storm
          break;
        case 31:
          data.add(WeatherIcons.storm_warning); // Violent storm
          break;
        case 32:
          data.add(WeatherIcons.hurricane); // Hurricane
          break;
        case 33:
          data.add(WeatherIcons.snowflake_cold); // Cold wave
          break;
        case 34:
          data.add(WeatherIcons.hot); // Heat wave
          break;
        case 35:
          data.add(WeatherIcons.showers); // Light rain showers
          break;
        case 36:
          data.add(WeatherIcons.rain); // Heavy rain showers
          break;
        case 37:
          data.add(WeatherIcons.showers); // Isolated showers
          break;
        case 38:
          data.add(WeatherIcons.showers); // Scattered showers
          break;
        case 39:
          data.add(WeatherIcons.thunderstorm); // Isolated thunderstorms
          break;
        case 40:
          data.add(WeatherIcons.thunderstorm); // Scattered thunderstorms
          break;
        case 41:
          data.add(WeatherIcons.showers); // Patchy rain possible
          break;
        case 42:
          data.add(WeatherIcons.snow); // Patchy snow possible
          break;
        case 43:
          data.add(WeatherIcons.sleet); // Patchy sleet possible
          break;
        case 44:
          data.add(WeatherIcons.sleet); // Patchy freezing drizzle possible
          break;
        case 45:
          data.add(WeatherIcons.fog); // Mist
          break;
        case 46:
          data.add(WeatherIcons.fog); // Fog
          break;
        case 47:
          data.add(WeatherIcons.snowflake_cold); // Freezing fog
          break;
        case 48:
          data.add(WeatherIcons.sprinkle); // Light drizzle
          break;
        case 49:
          data.add(WeatherIcons.sprinkle); // Drizzle
          break;
        case 50:
          data.add(WeatherIcons.sprinkle); // Heavy drizzle
          break;
        case 51:
          data.add(WeatherIcons.showers); // Light rain
          break;
        case 52:
          data.add(WeatherIcons.rain); // Moderate rain
          break;
        case 53:
          data.add(WeatherIcons.rain); // Heavy rain
          break;
        case 54:
          data.add(WeatherIcons.snow); // Light snow
          break;
        case 55:
          data.add(WeatherIcons.snow); // Moderate snow
          break;
        case 56:
          data.add(WeatherIcons.snow); // Heavy snow
          break;
        case 57:
          data.add(WeatherIcons.hail); // Ice pellets
          break;
        case 58:
          data.add(WeatherIcons.sleet); // Light sleet
          break;
        case 59:
          data.add(WeatherIcons.sleet); // Moderate sleet
          break;
        case 60:
          data.add(WeatherIcons.sleet); // Heavy sleet
          break;
        case 61:
          data.add(WeatherIcons.hail); // Light showers of ice pellets
          break;
        case 62:
          data.add(
              WeatherIcons.hail); // Moderate or heavy showers of ice pellets
          break;
        case 63:
          data.add(WeatherIcons.thunderstorm); // Light rain with thunder
          break;
        case 64:
          data.add(
              WeatherIcons.thunderstorm); // Moderate or heavy rain with thunder
          break;
        case 65:
          data.add(WeatherIcons.thunderstorm); // Light snow with thunder
          break;
        case 66:
          data.add(
              WeatherIcons.thunderstorm); // Moderate or heavy snow with thunder
          break;
        case 67:
          data.add(WeatherIcons.snow_wind); // Blowing snow
          break;
        case 68:
          data.add(WeatherIcons.snow_wind); // Blizzard
          break;
        case 69:
          data.add(WeatherIcons.sandstorm); // Sandstorm
          break;
        case 70:
          data.add(WeatherIcons.dust); // Duststorm
          break;
        case 71:
          data.add(WeatherIcons.volcano); // Volcanic ash
          break;
        case 72:
          data.add(WeatherIcons.tornado); // Tornado
          break;
        default:
          data.add(WeatherIcons.na); // Unknown or unsupported code
      }
    }
    return data;
  }

  static List<DateTime>? _getWeatherListDatetime(List<String>? time) {
    List<DateTime> data = [];
    for (var code in time!) {
      data.add(DateTime.parse(code));
    }
    return data;
  }
}
