import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class Localization {
  Map<String, dynamic> _localisedValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  static Future<Localization> load(Locale locale, {bool showLocalizationKeys = false, bool useCaching = true}) async {
    final localizations = Localization();
    if (showLocalizationKeys) {
      return localizations;
    }
    final jsonContent = await rootBundle.loadString('assets/locale/${locale.languageCode}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>; // ignore: avoid_as
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = _localisedValues[key] as String?; // ignore: avoid_as
      if (value == null) return '$key';
      if (args == null || args.isEmpty) return value;
      var newValue = value;
      // ignore: avoid_annotating_with_dynamic
      args.asMap().forEach((index, dynamic arg) => newValue = _replaceWith(newValue, arg, index + 1));
      return newValue;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String _replaceWith(String value, Object? arg, int argIndex) {
    if (arg == null) return value;
    if (arg is String) {
      return value.replaceAll('%$argIndex\$s', arg);
    } else if (arg is num) {
      return value.replaceAll('%$argIndex\$d', '$arg');
    }
    return value;
  }

  /// Translations:
  ///
  /// nl:  **'klimb'**
  ///
  /// en:  **'Climb'**
  ///
  /// fr:  **''**
  String get climbTitle => _t(LocalizationKeys.climbTitle);

  /// Translations:
  ///
  /// nl:  **'Animaties'**
  ///
  /// en:  **'Animations'**
  ///
  /// fr:  **''**
  String get debugAnimationsTitle => _t(LocalizationKeys.debugAnimationsTitle);

  /// Translations:
  ///
  /// nl:  **'Database'**
  ///
  /// en:  **'Database'**
  ///
  /// fr:  **''**
  String get debugDatabase => _t(LocalizationKeys.debugDatabase);

  /// Translations:
  ///
  /// nl:  **'Bekijk de licenties'**
  ///
  /// en:  **'View licenses'**
  ///
  /// fr:  **''**
  String get debugLicensesGoTo => _t(LocalizationKeys.debugLicensesGoTo);

  /// Translations:
  ///
  /// nl:  **'Licenties'**
  ///
  /// en:  **'Licenses'**
  ///
  /// fr:  **''**
  String get debugLicensesTitle => _t(LocalizationKeys.debugLicensesTitle);

  /// Translations:
  ///
  /// nl:  **'Huidige taal: %1$s'**
  ///
  /// en:  **'Current language: %1$s'**
  ///
  /// fr:  **''**
  String debugLocaleCurrentLanguage(String arg1) => _t(LocalizationKeys.debugLocaleCurrentLanguage, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Selecteer uw taal'**
  ///
  /// en:  **'Select your language'**
  ///
  /// fr:  **''**
  String get debugLocaleSelector => _t(LocalizationKeys.debugLocaleSelector);

  /// Translations:
  ///
  /// nl:  **'Taal'**
  ///
  /// en:  **'Language'**
  ///
  /// fr:  **''**
  String get debugLocaleTitle => _t(LocalizationKeys.debugLocaleTitle);

  /// Translations:
  ///
  /// nl:  **'Native brug'**
  ///
  /// en:  **'Native bridge'**
  ///
  /// fr:  **''**
  String get debugNativeBridge => _t(LocalizationKeys.debugNativeBridge);

  /// Translations:
  ///
  /// nl:  **'Stuur native log'**
  ///
  /// en:  **'Send native log'**
  ///
  /// fr:  **''**
  String get debugNativeBridgeLog => _t(LocalizationKeys.debugNativeBridgeLog);

  /// Translations:
  ///
  /// nl:  **'Toon vertalingen'**
  ///
  /// en:  **'Show translations'**
  ///
  /// fr:  **''**
  String get debugShowTranslations => _t(LocalizationKeys.debugShowTranslations);

  /// Translations:
  ///
  /// nl:  **'Trage animaties'**
  ///
  /// en:  **'Slow animations'**
  ///
  /// fr:  **''**
  String get debugSlowAnimations => _t(LocalizationKeys.debugSlowAnimations);

  /// Translations:
  ///
  /// nl:  **'Huidig platfrom: %1$s'**
  ///
  /// en:  **'Current platfrom: %1$s'**
  ///
  /// fr:  **''**
  String debugTargetPlatformSubtitle(String arg1) => _t(LocalizationKeys.debugTargetPlatformSubtitle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Doelplatform'**
  ///
  /// en:  **'Target platfrom'**
  ///
  /// fr:  **''**
  String get debugTargetPlatformTitle => _t(LocalizationKeys.debugTargetPlatformTitle);

  /// Translations:
  ///
  /// nl:  **'Thema'**
  ///
  /// en:  **'Theme'**
  ///
  /// fr:  **''**
  String get debugThemeTitle => _t(LocalizationKeys.debugThemeTitle);

  /// Translations:
  ///
  /// nl:  **'Debuggen'**
  ///
  /// en:  **'Debug'**
  ///
  /// fr:  **''**
  String get debugTitle => _t(LocalizationKeys.debugTitle);

  /// Translations:
  ///
  /// nl:  **'Vertaling sluitels'**
  ///
  /// en:  **'Translation Keys'**
  ///
  /// fr:  **''**
  String get debugTranslationsTitle => _t(LocalizationKeys.debugTranslationsTitle);

  /// Translations:
  ///
  /// nl:  **'Toon database'**
  ///
  /// en:  **'View database'**
  ///
  /// fr:  **''**
  String get debugViewDatabase => _t(LocalizationKeys.debugViewDatabase);

  /// Translations:
  ///
  /// nl:  **'Foute request error'**
  ///
  /// en:  **'Bad request error'**
  ///
  /// fr:  **''**
  String get errorBadRequest => _t(LocalizationKeys.errorBadRequest);

  /// Translations:
  ///
  /// nl:  **'Je hebt een programmeerfout gemaakt'**
  ///
  /// en:  **'You coded something wrong'**
  ///
  /// fr:  **''**
  String get errorDuringDev => _t(LocalizationKeys.errorDuringDev);

  /// Translations:
  ///
  /// nl:  **'Geen toegang error'**
  ///
  /// en:  **'Forbidden error'**
  ///
  /// fr:  **''**
  String get errorForbidden => _t(LocalizationKeys.errorForbidden);

  /// Translations:
  ///
  /// nl:  **'Er liep iets mis'**
  ///
  /// en:  **'Something went wrong'**
  ///
  /// fr:  **''**
  String get errorGeneral => _t(LocalizationKeys.errorGeneral);

  /// Translations:
  ///
  /// nl:  **'Er liep iets mis (code: %1$s)'**
  ///
  /// en:  **'Something went wrong (code: %1$s)'**
  ///
  /// fr:  **''**
  String errorGeneralWithCode(String arg1) => _t(LocalizationKeys.errorGeneralWithCode, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Intern server probleem'**
  ///
  /// en:  **'Internal server error'**
  ///
  /// fr:  **''**
  String get errorInternalServer => _t(LocalizationKeys.errorInternalServer);

  /// Translations:
  ///
  /// nl:  **'Geen internet verbinding beschikbaar'**
  ///
  /// en:  **'No internet connection available'**
  ///
  /// fr:  **''**
  String get errorNoNetwork => _t(LocalizationKeys.errorNoNetwork);

  /// Translations:
  ///
  /// nl:  **'Ongeautoriseerde fout'**
  ///
  /// en:  **'Unauthorized error'**
  ///
  /// fr:  **''**
  String get errorUnauthorized => _t(LocalizationKeys.errorUnauthorized);

  /// Translations:
  ///
  /// nl:  **'Android'**
  ///
  /// en:  **'Android'**
  ///
  /// fr:  **''**
  String get generalLabelAndroid => _t(LocalizationKeys.generalLabelAndroid);

  /// Translations:
  ///
  /// nl:  **'Annuleer'**
  ///
  /// en:  **'Cancel'**
  ///
  /// fr:  **''**
  String get generalLabelCancel => _t(LocalizationKeys.generalLabelCancel);

  /// Translations:
  ///
  /// nl:  **'Verwijder'**
  ///
  /// en:  **'Delete'**
  ///
  /// fr:  **''**
  String get generalLabelDelete => _t(LocalizationKeys.generalLabelDelete);

  /// Translations:
  ///
  /// nl:  **'iOS'**
  ///
  /// en:  **'iOS'**
  ///
  /// fr:  **''**
  String get generalLabelIos => _t(LocalizationKeys.generalLabelIos);

  /// Translations:
  ///
  /// nl:  **'Nee'**
  ///
  /// en:  **'No'**
  ///
  /// fr:  **''**
  String get generalLabelNo => _t(LocalizationKeys.generalLabelNo);

  /// Translations:
  ///
  /// nl:  **'Ok'**
  ///
  /// en:  **'Ok'**
  ///
  /// fr:  **''**
  String get generalLabelOk => _t(LocalizationKeys.generalLabelOk);

  /// Translations:
  ///
  /// nl:  **'Opslaan'**
  ///
  /// en:  **'Save'**
  ///
  /// fr:  **''**
  String get generalLabelSave => _t(LocalizationKeys.generalLabelSave);

  /// Translations:
  ///
  /// nl:  **'Systeem standaard'**
  ///
  /// en:  **'System default'**
  ///
  /// fr:  **''**
  String get generalLabelSystemDefault => _t(LocalizationKeys.generalLabelSystemDefault);

  /// Translations:
  ///
  /// nl:  **'Ja'**
  ///
  /// en:  **'Yes'**
  ///
  /// fr:  **''**
  String get generalLabelYes => _t(LocalizationKeys.generalLabelYes);

  /// Translations:
  ///
  /// nl:  **'Instellingen'**
  ///
  /// en:  **'Settings'**
  ///
  /// fr:  **''**
  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  /// Translations:
  ///
  /// nl:  **'Vul hier uw todo in'**
  ///
  /// en:  **'Enter your todo'**
  ///
  /// fr:  **''**
  String get todoAddInputHint => _t(LocalizationKeys.todoAddInputHint);

  /// Translations:
  ///
  /// nl:  **'Todo toevoegen'**
  ///
  /// en:  **'Add todo'**
  ///
  /// fr:  **''**
  String get todoAddTitle => _t(LocalizationKeys.todoAddTitle);

  /// Translations:
  ///
  /// nl:  **'Er is nog geen data toegevoegd in uw database. Je kan een paar todo's ophalen van een api calll (download icoon) of je kan er zelf toevoegen door op het plus icoon te drukken.'**
  ///
  /// en:  **'No data added to your database. Fetch some todos with an api call (download icon) or add one yourself by clicking the add icon.'**
  ///
  /// fr:  **''**
  String get todoEmptyState => _t(LocalizationKeys.todoEmptyState);

  /// Translations:
  ///
  /// nl:  **'Todo'**
  ///
  /// en:  **'Todo'**
  ///
  /// fr:  **''**
  String get todoTitle => _t(LocalizationKeys.todoTitle);

  /// Translations:
  ///
  /// nl:  **'Fietsen'**
  ///
  /// en:  **'Cycling'**
  ///
  /// fr:  **'Fietsen'**
  String get clubSelectionCyclingTitle => _t(LocalizationKeys.clubSelectionCyclingTitle);

  /// Translations:
  ///
  /// nl:  **'Lopen'**
  ///
  /// en:  **'Running'**
  ///
  /// fr:  **'Lopen'**
  String get clubSelectionRunningTitle => _t(LocalizationKeys.clubSelectionRunningTitle);

  /// Translations:
  ///
  /// nl:  **'Leden'**
  ///
  /// en:  **'Members'**
  ///
  /// fr:  **'Leden'**
  String get clubDetailMemberTitle => _t(LocalizationKeys.clubDetailMemberTitle);

  /// Translations:
  ///
  /// nl:  **'Administrators'**
  ///
  /// en:  **'Admins'**
  ///
  /// fr:  **'Administrators'**
  String get clubDetailAdminTitle => _t(LocalizationKeys.clubDetailAdminTitle);

  /// Translations:
  ///
  /// nl:  **'Activiteiten'**
  ///
  /// en:  **'Activities'**
  ///
  /// fr:  **'Activiteiten'**
  String get clubDetailActivityTitle => _t(LocalizationKeys.clubDetailActivityTitle);

  /// Translations:
  ///
  /// nl:  **'Samenvatting'**
  ///
  /// en:  **''**
  ///
  /// fr:  **'Samenvatting'**
  String get clubDetailSummaryTitle => _t(LocalizationKeys.clubDetailSummaryTitle);

  /// Translations:
  ///
  /// nl:  **'Totale Afstand'**
  ///
  /// en:  **'Total Distance'**
  ///
  /// fr:  **'Totale Afstand'**
  String get clubDetailTotalDistanceTitle => _t(LocalizationKeys.clubDetailTotalDistanceTitle);

  /// Translations:
  ///
  /// nl:  **'Totale Tijd In Beweging'**
  ///
  /// en:  **'Total Moving Time'**
  ///
  /// fr:  **'Totale Tijd In Beweging'**
  String get clubDetailTotalMovingTimeTitle => _t(LocalizationKeys.clubDetailTotalMovingTimeTitle);

  /// Translations:
  ///
  /// nl:  **'Totale Hoogtewinst'**
  ///
  /// en:  **'Total Elevation Gain'**
  ///
  /// fr:  **'Totale Hoogtewinst'**
  String get clubDetailTotalElevationGainTitle => _t(LocalizationKeys.clubDetailTotalElevationGainTitle);

  /// Translations:
  ///
  /// nl:  **'Total Verstreken Tijd'**
  ///
  /// en:  **'Total Elapsed Time'**
  ///
  /// fr:  **'Total Verstreken Tijd'**
  String get clubDetailTotalElapsedTimeTitle => _t(LocalizationKeys.clubDetailTotalElapsedTimeTitle);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);

}
