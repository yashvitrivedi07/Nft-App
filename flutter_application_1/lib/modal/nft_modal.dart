class NftModal {
  String? accessionYear,
      primaryImage,
      primaryImageSmall,
      department,
      title,
      objectName;

  NftModal(
      {this.accessionYear,
      this.department,
      this.objectName,
      this.primaryImage,
      this.primaryImageSmall,
      this.title});

  factory NftModal.toModal(Map m) {
    return NftModal(
      accessionYear: m['accessionYear'],
      department: m['department'],
      objectName: m['objectName'],
      primaryImage: (m['primaryImage']),
      primaryImageSmall: m['primaryImageSmall'],
      title: m['title'],
    );
  }
}
