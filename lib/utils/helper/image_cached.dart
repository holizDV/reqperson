class ImageCached {
  ImageCached._();
  static ImageCached get instance => ImageCached._();

  String getKeyName({String? imageUrl}) {
    var getOriginalUrlImage = imageUrl?.split('?');
    var getImageName = getOriginalUrlImage?.first.split('/');
    return getImageName?.last ?? '';
  }
}
