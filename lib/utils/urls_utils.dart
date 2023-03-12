class SeeriUrls {
  SeeriUrls._();

  static String noImageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png';

  static String getImagePath({ required String imagePath }) {
    return 'https://image.tmdb.org/t/p/w500/$imagePath';
  }
}