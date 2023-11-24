class Location {
  final int id;
  final String propertyLastName;
  final String propertyFirstName;
  final String propertyLocation;
  final String monthlyRent;
  final String description;
  final String mainImage;
  final String ownerPhone;
  final String status;
  final int rating;
  final int generalRating;
  final int teamRating;
  final int userId;
  final int cityId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String mainImageUrl;
  final List<GalleryImage> gallery;
  final List<MainFeature> mainFeatures;
  final List<SecondaryFeature> secondaryFeatures;

  Location({
    required this.id,
    required this.propertyLastName,
    required this.propertyFirstName,
    required this.propertyLocation,
    required this.monthlyRent,
    required this.description,
    required this.mainImage,
    required this.ownerPhone,
    required this.status,
    required this.rating,
    required this.generalRating,
    required this.teamRating,
    required this.userId,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
    required this.mainImageUrl,
    required this.gallery,
    required this.mainFeatures,
    required this.secondaryFeatures,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'], // Convert JSON 'id' string to int
        propertyLastName: json['property_last_name'] as String,
        propertyFirstName: json['property_first_name'] as String,
        propertyLocation: json['property_location'] as String,
        monthlyRent: json['monthly_rent'] as String,
        description: json['description'] as String,
        mainImage: json['main_image'] as String,
        ownerPhone: json['owner_phone'] as String,
        status: json['status'] as String,
        rating: json['rating'], // Convert JSON 'rating' string to double
        generalRating: json[
            'general_rating'], // Convert JSON 'general_rating' string to double
        teamRating:
            json['team_rating'], // Convert JSON 'team_rating' string to double
        userId: json['user_id'], // Convert JSON 'user_id' string to int
        cityId: json['city_id'], // Convert JSON 'city_id' string to int
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        mainImageUrl: json['main_image_url'] as String,
        gallery: List<GalleryImage>.from(json['gallery']
            ?.map((imageJson) => GalleryImage.fromJson(imageJson))),
        mainFeatures: List<MainFeature>.from(json['main_features']
            ?.map((featureJson) => MainFeature.fromJson(featureJson))),
        secondaryFeatures: List<SecondaryFeature>.from(
            json['secondary_features']
                ?.map((featureJson) => SecondaryFeature.fromJson(featureJson))),
      );

  @override
  String toString() {
    return 'Location(id: $id, propertyLastName: $propertyLastName, propertyFirstName: $propertyFirstName, propertyLocation: $propertyLocation, monthlyRent: $monthlyRent, description: $description, mainImage: $mainImage, ownerPhone: $ownerPhone, status: $status, rating: $rating, generalRating: $generalRating, teamRating: $teamRating, userId: $userId, cityId: $cityId, createdAt: $createdAt, updatedAt: $updatedAt, mainImageUrl: $mainImageUrl, gallery: $gallery, mainFeatures: $mainFeatures, secondaryFeatures: $secondaryFeatures)';
  }
}

class GalleryImage {
  final int id;
  final String image;
  final int propertyId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;

  GalleryImage({
    required this.id,
    required this.image,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory GalleryImage.fromJson(Map<String, dynamic> json) => GalleryImage(
        id: json['id'] as int,
        image: json['image'] as String,
        propertyId: json['property_id'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        imageUrl: json['image_url'] as String,
      );

  @override
  String toString() {
    return 'GalleryImage(id: $id, image: $image, propertyId: $propertyId, createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl)';
  }
}

class MainFeature {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  MainFeature({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory MainFeature.fromJson(Map<String, dynamic> json) => MainFeature(
        id: json['id'] as int,
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        pivot: Pivot.fromJson(json['pivot']),
      );

  @override
  String toString() {
    return 'MainFeature(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }
}

class Pivot {
  final int? propertyId;
  final int? mainFeatureId;

  Pivot({
    required this.propertyId,
    required this.mainFeatureId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        propertyId: json['property_id'] as int?,
        mainFeatureId: json['main_feature_id'] as int?,
      );

  @override
  String toString() {
    return 'Pivot(propertyId: $propertyId, mainFeatureId: $mainFeatureId)';
  }
}

class SecondaryFeature {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  SecondaryFeature({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory SecondaryFeature.fromJson(Map<String, dynamic> json) =>
      SecondaryFeature(
        id: json['id'] as int,
        name: json['name'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        pivot: Pivot.fromJson(json['pivot']),
      );

  @override
  String toString() {
    return 'SecondaryFeature(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, pivot: $pivot)';
  }
}
