// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsProConfig {
  List<int> featuredCategories;
  String homeMainTabName;
  String privacyPolicyUrl;
  String termsAndServicesUrl;
  String aboutPageUrl;
  String contactEmail;
  String facebookUrl;
  String twitterUrl;
  String telegramUrl;
  String youtubeUrl;
  String ownerName;
  String ownerEmail;
  String ownerPhone;
  String ownerAddress;
  String appDescription;
  String appShareLink;
  String appstoreAppID;
  NewsProConfig({
    required this.featuredCategories,
    required this.homeMainTabName,
    required this.privacyPolicyUrl,
    required this.termsAndServicesUrl,
    required this.aboutPageUrl,
    required this.contactEmail,
    required this.facebookUrl,
    required this.twitterUrl,
    required this.telegramUrl,
    required this.youtubeUrl,
    required this.ownerName,
    required this.ownerEmail,
    required this.ownerPhone,
    required this.ownerAddress,
    required this.appDescription,
    required this.appShareLink,
    required this.appstoreAppID,
  });

  factory NewsProConfig.fromMap(Map<String, dynamic> map) {
    return NewsProConfig(
      featuredCategories: List<int>.from((map['featured_categories'])),
      homeMainTabName: map['trending_tab_name'] ?? '',
      privacyPolicyUrl: map['privacy_policy_url'] ?? '',
      termsAndServicesUrl: map['terms_and_services_url'] ?? '',
      contactEmail: map['contact_email'] ?? '',
      facebookUrl: map['facebook_url'] ?? '',
      twitterUrl: map['twitter_url'] ?? '',
      telegramUrl: map['telegram_url'] ?? '',
      youtubeUrl: map['youtube_url'] ?? '',
      aboutPageUrl: map['about_page_url'] ?? '',
      ownerName: map['owner_name'] ?? '',
      ownerEmail: map['owner_email'] ?? '',
      ownerPhone: map['owner_phone'] ?? '',
      ownerAddress: map['owner_address'] ?? '',
      appDescription: map['app_description'] ?? '',
      appShareLink: map['app_download_link'] ?? '',
      appstoreAppID: map['app_store_app_id'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NewsProConfig(featuredCategories: $featuredCategories, homeMainTabName: $homeMainTabName, privacyPolicyUrl: $privacyPolicyUrl, termsAndServicesUrl: $termsAndServicesUrl, aboutPageUrl: $aboutPageUrl, contactEmail: $contactEmail, facebookUrl: $facebookUrl, twitterUrl: $twitterUrl, telegramUrl: $telegramUrl, youtubeUrl: $youtubeUrl, ownerName: $ownerName, ownerEmail: $ownerEmail, ownerPhone: $ownerPhone, ownerAddress: $ownerAddress, appDescription: $appDescription, appShareLink: $appShareLink, appstoreAppID: $appstoreAppID)';
  }
}
