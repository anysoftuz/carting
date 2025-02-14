import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';
import 'localizations_kk.dart';
import 'localizations_ru.dart';
import 'localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @auth.
  ///
  /// In en, this message translates to:
  /// **'Auth'**
  String get auth;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @notIdentified.
  ///
  /// In en, this message translates to:
  /// **'Not identified'**
  String get notIdentified;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @identifiedUser.
  ///
  /// In en, this message translates to:
  /// **'Identified user'**
  String get identifiedUser;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @lent.
  ///
  /// In en, this message translates to:
  /// **'Lent'**
  String get lent;

  /// No description provided for @phoneNumer.
  ///
  /// In en, this message translates to:
  /// **'Phone numer'**
  String get phoneNumer;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth date'**
  String get birthDate;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @lenguage.
  ///
  /// In en, this message translates to:
  /// **'Lenguage'**
  String get lenguage;

  /// No description provided for @changePhone.
  ///
  /// In en, this message translates to:
  /// **'Change Phone'**
  String get changePhone;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInformation;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @enterRegisteredNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered number to access your profile!'**
  String get enterRegisteredNumber;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @infoNotFound.
  ///
  /// In en, this message translates to:
  /// **'Information not found'**
  String get infoNotFound;

  /// No description provided for @haveRegisteredBefore.
  ///
  /// In en, this message translates to:
  /// **'Have you registered before? '**
  String get haveRegisteredBefore;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCode;

  /// No description provided for @verificationCodeSentToPhone.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to '**
  String get verificationCodeSentToPhone;

  /// No description provided for @verificationCodeSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to '**
  String get verificationCodeSentToEmail;

  /// No description provided for @didNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the code?'**
  String get didNotReceiveCode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @legalEntityInfo.
  ///
  /// In en, this message translates to:
  /// **'Legal entity information'**
  String get legalEntityInfo;

  /// No description provided for @individualInfo.
  ///
  /// In en, this message translates to:
  /// **'Individual information'**
  String get individualInfo;

  /// No description provided for @agreeToTerms.
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms of use'**
  String get agreeToTerms;

  /// No description provided for @fillInTheInformation.
  ///
  /// In en, this message translates to:
  /// **'Fill in the information'**
  String get fillInTheInformation;

  /// No description provided for @enterSTIR.
  ///
  /// In en, this message translates to:
  /// **'Enter STIR'**
  String get enterSTIR;

  /// No description provided for @enterCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Enter company name'**
  String get enterCompanyName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @enterYourSurname.
  ///
  /// In en, this message translates to:
  /// **'Enter your surname'**
  String get enterYourSurname;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterPhoneNumber;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterVerificationCode;

  /// No description provided for @enterPhoneNumberToRegister.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to register!'**
  String get enterPhoneNumberToRegister;

  /// No description provided for @chooseYourIdentity.
  ///
  /// In en, this message translates to:
  /// **'Choose your identity!'**
  String get chooseYourIdentity;

  /// No description provided for @whoAreYouOnPlatform.
  ///
  /// In en, this message translates to:
  /// **'Who are you on the platform?'**
  String get whoAreYouOnPlatform;

  /// No description provided for @legalEntity.
  ///
  /// In en, this message translates to:
  /// **'Legal Entity'**
  String get legalEntity;

  /// No description provided for @individual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get individual;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @goToMain.
  ///
  /// In en, this message translates to:
  /// **'Go to main'**
  String get goToMain;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get successful;

  /// No description provided for @rateTheApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get rateTheApp;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @photofact.
  ///
  /// In en, this message translates to:
  /// **'Photofact'**
  String get photofact;

  /// No description provided for @deletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete photo'**
  String get deletePhoto;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'days left'**
  String get daysLeft;

  /// No description provided for @allQuestions.
  ///
  /// In en, this message translates to:
  /// **'All questions'**
  String get allQuestions;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @passingScore.
  ///
  /// In en, this message translates to:
  /// **'Passing score'**
  String get passingScore;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get week;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @moon.
  ///
  /// In en, this message translates to:
  /// **'moon'**
  String get moon;

  /// No description provided for @tests.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get tests;

  /// No description provided for @goToIdentification.
  ///
  /// In en, this message translates to:
  /// **'Go to identification'**
  String get goToIdentification;

  /// No description provided for @scanToLogin.
  ///
  /// In en, this message translates to:
  /// **'Scan to login'**
  String get scanToLogin;

  /// No description provided for @doYouWantToGoOut.
  ///
  /// In en, this message translates to:
  /// **'Do you want to go out?'**
  String get doYouWantToGoOut;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @frequentlyAskedQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get frequentlyAskedQuestions;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'Qayerdan'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'Qayerga'**
  String get to;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Xush kelibsiz'**
  String get welcome;

  /// No description provided for @transportServices.
  ///
  /// In en, this message translates to:
  /// **'Barcha transport xizmatlari bitta ilovada tez, qulay, arzon!'**
  String get transportServices;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @whatHappened.
  ///
  /// In en, this message translates to:
  /// **'What happened'**
  String get whatHappened;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @transport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transport;

  /// No description provided for @cargoTransport.
  ///
  /// In en, this message translates to:
  /// **'Cargo Transport'**
  String get cargoTransport;

  /// No description provided for @cancelAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the announcement?'**
  String get cancelAnnouncement;

  /// No description provided for @deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @loadWeight.
  ///
  /// In en, this message translates to:
  /// **'Load Weight'**
  String get loadWeight;

  /// No description provided for @passengerCount.
  ///
  /// In en, this message translates to:
  /// **'Passenger Count'**
  String get passengerCount;

  /// No description provided for @transportCount.
  ///
  /// In en, this message translates to:
  /// **'Transport Count'**
  String get transportCount;

  /// No description provided for @departureDate.
  ///
  /// In en, this message translates to:
  /// **'Departure Date'**
  String get departureDate;

  /// No description provided for @additionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInfo;

  /// No description provided for @cargoType.
  ///
  /// In en, this message translates to:
  /// **'Cargo Type'**
  String get cargoType;

  /// No description provided for @cargoImage.
  ///
  /// In en, this message translates to:
  /// **'Cargo Image'**
  String get cargoImage;

  /// No description provided for @cargoLoadingService.
  ///
  /// In en, this message translates to:
  /// **'Cargo Loading Service'**
  String get cargoLoadingService;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @transportType.
  ///
  /// In en, this message translates to:
  /// **'Transport Type'**
  String get transportType;

  /// No description provided for @yourCargoIsOnTheWay.
  ///
  /// In en, this message translates to:
  /// **'Your cargo is already on the way!'**
  String get yourCargoIsOnTheWay;

  /// No description provided for @driverDeliveredCargo.
  ///
  /// In en, this message translates to:
  /// **'The driver delivered your cargo to the destination. Do you confirm?'**
  String get driverDeliveredCargo;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @markAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get markAsRead;

  /// No description provided for @multipleBoxCapacity.
  ///
  /// In en, this message translates to:
  /// **'Multiple Box Capacity'**
  String get multipleBoxCapacity;

  /// No description provided for @washingMachineEtc.
  ///
  /// In en, this message translates to:
  /// **'Washing Machine, etc.'**
  String get washingMachineEtc;

  /// No description provided for @homeAppliances.
  ///
  /// In en, this message translates to:
  /// **'Home Appliances and Equipment'**
  String get homeAppliances;

  /// No description provided for @largeQuantityGoods.
  ///
  /// In en, this message translates to:
  /// **'Large Quantity Goods'**
  String get largeQuantityGoods;

  /// No description provided for @aboutOrder.
  ///
  /// In en, this message translates to:
  /// **'About Order'**
  String get aboutOrder;

  /// No description provided for @aboutCargo.
  ///
  /// In en, this message translates to:
  /// **'About Cargo'**
  String get aboutCargo;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @cargoVolume.
  ///
  /// In en, this message translates to:
  /// **'Cargo Volume'**
  String get cargoVolume;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @width.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

  /// No description provided for @length.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get length;

  /// No description provided for @cargoImages.
  ///
  /// In en, this message translates to:
  /// **'Cargo Images'**
  String get cargoImages;

  /// No description provided for @truckType.
  ///
  /// In en, this message translates to:
  /// **'Truck Type'**
  String get truckType;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @liveTracking.
  ///
  /// In en, this message translates to:
  /// **'Live Tracking'**
  String get liveTracking;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @orderReceived.
  ///
  /// In en, this message translates to:
  /// **'You have received the order!'**
  String get orderReceived;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @alternativeOffer.
  ///
  /// In en, this message translates to:
  /// **'Alternative Offer'**
  String get alternativeOffer;

  /// No description provided for @carBrokeDown.
  ///
  /// In en, this message translates to:
  /// **'Car broke down.'**
  String get carBrokeDown;

  /// No description provided for @ranOutOfFuel.
  ///
  /// In en, this message translates to:
  /// **'Ran out of fuel.'**
  String get ranOutOfFuel;

  /// No description provided for @cargoIssue.
  ///
  /// In en, this message translates to:
  /// **'There is an issue with the cargo.'**
  String get cargoIssue;

  /// No description provided for @trafficAccident.
  ///
  /// In en, this message translates to:
  /// **'There was a traffic accident.'**
  String get trafficAccident;

  /// No description provided for @couldNotFindKitchen.
  ///
  /// In en, this message translates to:
  /// **'Could not find the kitchen.'**
  String get couldNotFindKitchen;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @cancellationReason.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Reason'**
  String get cancellationReason;

  /// No description provided for @writeCancellationReason.
  ///
  /// In en, this message translates to:
  /// **'Write the reason for cancellation'**
  String get writeCancellationReason;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @tashkentToAndijan.
  ///
  /// In en, this message translates to:
  /// **'Tashkent → Andijan'**
  String get tashkentToAndijan;

  /// No description provided for @furniture.
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furniture;

  /// No description provided for @dimensions.
  ///
  /// In en, this message translates to:
  /// **'2 х 3 х 2 m²'**
  String get dimensions;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @physical.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get physical;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @stir.
  ///
  /// In en, this message translates to:
  /// **'STIR'**
  String get stir;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @callCenterNumber.
  ///
  /// In en, this message translates to:
  /// **'Call Center Number'**
  String get callCenterNumber;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// No description provided for @yourSurname.
  ///
  /// In en, this message translates to:
  /// **'Your Surname'**
  String get yourSurname;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @telegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get telegram;

  /// No description provided for @supportCenter.
  ///
  /// In en, this message translates to:
  /// **'Support Center'**
  String get supportCenter;

  /// No description provided for @describeProblem.
  ///
  /// In en, this message translates to:
  /// **'Describe the problem'**
  String get describeProblem;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @canICancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Can I cancel the order?'**
  String get canICancelOrder;

  /// No description provided for @howToAcceptOrder.
  ///
  /// In en, this message translates to:
  /// **'How to accept an order?'**
  String get howToAcceptOrder;

  /// No description provided for @whatCanIDo.
  ///
  /// In en, this message translates to:
  /// **'What can I do?'**
  String get whatCanIDo;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faq;

  /// No description provided for @yesYouCan.
  ///
  /// In en, this message translates to:
  /// **'Yes, you can. You will be notified when new clients arrive.'**
  String get yesYouCan;

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Number'**
  String get changeNumber;

  /// No description provided for @enterNewPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your new phone number!'**
  String get enterNewPhoneNumber;

  /// No description provided for @verificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to '**
  String get verificationCodeSent;

  /// No description provided for @referalCode.
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get referalCode;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @createOrder.
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get createOrder;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @paymentInfo.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get paymentInfo;

  /// No description provided for @cargo.
  ///
  /// In en, this message translates to:
  /// **'Cargo'**
  String get cargo;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @nameAndSurname.
  ///
  /// In en, this message translates to:
  /// **'Name and Surname'**
  String get nameAndSurname;

  /// No description provided for @recipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get recipient;

  /// No description provided for @howManyLoaders.
  ///
  /// In en, this message translates to:
  /// **'How Many Loaders'**
  String get howManyLoaders;

  /// No description provided for @loadingService.
  ///
  /// In en, this message translates to:
  /// **'Loading Service'**
  String get loadingService;

  /// No description provided for @notActive.
  ///
  /// In en, this message translates to:
  /// **'Not Active'**
  String get notActive;

  /// No description provided for @paymentType.
  ///
  /// In en, this message translates to:
  /// **'Payment Type'**
  String get paymentType;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @peregonService.
  ///
  /// In en, this message translates to:
  /// **'Peregon Service'**
  String get peregonService;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Cargo Shipping'**
  String get shipping;

  /// No description provided for @fuelDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fuel Delivery'**
  String get fuelDelivery;

  /// No description provided for @passengerTransport.
  ///
  /// In en, this message translates to:
  /// **'Passenger Transport'**
  String get passengerTransport;

  /// No description provided for @carRental.
  ///
  /// In en, this message translates to:
  /// **'Car Rental'**
  String get carRental;

  /// No description provided for @specialTechServices.
  ///
  /// In en, this message translates to:
  /// **'Special Technical Services'**
  String get specialTechServices;

  /// No description provided for @autoRepair.
  ///
  /// In en, this message translates to:
  /// **'Auto Repair'**
  String get autoRepair;

  /// No description provided for @transportTransfer.
  ///
  /// In en, this message translates to:
  /// **'Transport Transfer'**
  String get transportTransfer;

  /// No description provided for @warehouseStorage.
  ///
  /// In en, this message translates to:
  /// **'Warehouse Storage'**
  String get warehouseStorage;

  /// No description provided for @searchTransport.
  ///
  /// In en, this message translates to:
  /// **'Search for the necessary transport'**
  String get searchTransport;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @announcements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcements;

  /// No description provided for @searchAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Search for the necessary announcement'**
  String get searchAnnouncement;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @myServices.
  ///
  /// In en, this message translates to:
  /// **'My Services'**
  String get myServices;

  /// No description provided for @transportAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Transport Announcements'**
  String get transportAnnouncements;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @leaveOrderComment.
  ///
  /// In en, this message translates to:
  /// **'Leave a comment about the order!'**
  String get leaveOrderComment;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @enterPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter price'**
  String get enterPrice;

  /// No description provided for @queueRegistration.
  ///
  /// In en, this message translates to:
  /// **'Queue Registration'**
  String get queueRegistration;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @contactViaTelegram.
  ///
  /// In en, this message translates to:
  /// **'Contact via Telegram'**
  String get contactViaTelegram;

  /// No description provided for @referralProgram.
  ///
  /// In en, this message translates to:
  /// **'Referral Program'**
  String get referralProgram;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @invitedUsers.
  ///
  /// In en, this message translates to:
  /// **'Invited Users'**
  String get invitedUsers;

  /// No description provided for @totalProfit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get totalProfit;

  /// No description provided for @earnedProfit.
  ///
  /// In en, this message translates to:
  /// **'Earned Profit'**
  String get earnedProfit;

  /// No description provided for @withdrawnProfit.
  ///
  /// In en, this message translates to:
  /// **'Withdrawn Profit'**
  String get withdrawnProfit;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kk', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kk': return AppLocalizationsKk();
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
