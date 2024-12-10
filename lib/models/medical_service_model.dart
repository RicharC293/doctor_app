// {id: 1, icon: assets/svg/diagnostic.svg, name: Diagnostic, color: 7166F9}

class MedicalServiceModel {
    final int id;
    final String icon;
    final String name;
    final String color;

    MedicalServiceModel({
        required this.id,
        required this.icon,
        required this.name,
        required this.color,
    });

    MedicalServiceModel copyWith({
        int? id,
        String? icon,
        String? name,
        String? color,
    }) => 
        MedicalServiceModel(
            id: id ?? this.id,
            icon: icon ?? this.icon,
            name: name ?? this.name,
            color: color ?? this.color,
        );

    factory MedicalServiceModel.fromJson(Map<String, dynamic> json) => MedicalServiceModel(
        id: json["id"],
        icon: json["icon"] ?? "",
        name: json["name"] ?? "Not found",
        color: json["color"] ?? "ffffff",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "color": color,
    };
}
