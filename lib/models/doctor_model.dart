class DoctorModel {
//   {
// "id": 1,
// "image": "assets/images/doctor_card_1.png",
// "name": "Dr. Stella Kane",
// "speciality": "Dental",
// "medical_center": "Columbia Asia Hospital",
// "rating": 5
// }
  final int id;
  final String image;
  final String name;
  final String speciality;
  final String medicalCenter;
  final int rating;

  DoctorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.speciality,
    required this.medicalCenter,
    required this.rating,
  });

  DoctorModel copyWith({
    int? id,
    String? image,
    String? name,
    String? speciality,
    String? medicalCenter,
    int? rating,
  }) =>
      DoctorModel(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        speciality: speciality ?? this.speciality,
        medicalCenter: medicalCenter ?? this.medicalCenter,
        rating: rating ?? this.rating,
      );

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        image: json["image"] ?? "",
        name: json["name"] ?? "Not found",
        speciality: json["speciality"] ?? "Not found",
        medicalCenter: json["medical_center"] ?? "Not found",
        rating: json["rating"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "speciality": speciality,
        "medical_center": medicalCenter,
        "rating": rating,
      };
}
