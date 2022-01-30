// To parse this JSON data, do
//
    // final vadiateSettingRequestModel = vadiateSettingRequestModelFromJson(jsonString);

import 'dart:convert';

VadiateSettingRequestModel vadiateSettingRequestModelFromJson(String? str) => VadiateSettingRequestModel.fromJson(json.decode(str!));

String? vadiateSettingRequestModelToJson(VadiateSettingRequestModel data) => json.encode(data.toJson());

class VadiateSettingRequestModel {
    VadiateSettingRequestModel({
        this.meta,
        this.data,
    });

    Meta? meta;
    List<Datum>? data;

    factory VadiateSettingRequestModel.fromJson(Map<String?, dynamic> json) => VadiateSettingRequestModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "meta": meta == null ? null : meta!.toJson(),
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.email,
        this.gender,
        this.status,
    });

    int? id;
    String? name;
    String? email;
    Gender? gender;
    Status? status;

    factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
        status: json["status"] == null ? null : statusValues.map[json["status"]],
    );

    Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "status": status == null ? null : statusValues.reverse[status],
    };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

enum Status { ACTIVE, INACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE,
    "inactive": Status.INACTIVE
});

class Meta {
    Meta({
        this.pagination,
    });

    Pagination? pagination;

    factory Meta.fromJson(Map<String?, dynamic> json) => Meta(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String?, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination!.toJson(),
    };
}

class Pagination {
    Pagination({
        this.total,
        this.pages,
        this.page,
        this.limit,
        this.links,
    });

    int? total;
    int? pages;
    int? page;
    int? limit;
    Links? links;

    factory Pagination.fromJson(Map<String?, dynamic> json) => Pagination(
        total: json["total"] == null ? null : json["total"],
        pages: json["pages"] == null ? null : json["pages"],
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );

    Map<String?, dynamic> toJson() => {
        "total": total == null ? null : total,
        "pages": pages == null ? null : pages,
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "links": links == null ? null : links!.toJson(),
    };
}

class Links {
    Links({
        this.previous,
        this.current,
        this.next,
    });

    dynamic previous;
    String? current;
    String? next;

    factory Links.fromJson(Map<String?, dynamic> json) => Links(
        previous: json["previous"],
        current: json["current"] == null ? null : json["current"],
        next: json["next"] == null ? null : json["next"],
    );

    Map<String?, dynamic> toJson() => {
        "previous": previous,
        "current": current == null ? null : current,
        "next": next == null ? null : next,
    };
}

class EnumValues<T> {
    Map<String?, T> map;
    late Map<T, String?> reverseMap;

    EnumValues(this.map);

    Map<T, String?> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
