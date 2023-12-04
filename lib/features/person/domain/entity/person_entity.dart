class PersonEntity {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataEntity>? data;
  final SupportEntity? support;

  PersonEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });
}

class DataEntity {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  DataEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });
}

class SupportEntity {
  final String? url;
  final String? text;

  SupportEntity({
    this.url,
    this.text,
  });
}
