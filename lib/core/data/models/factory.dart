import 'dart:io';

class Factory {
  const Factory({
    required this.name,
    required this.description,
    this.image,
    this.file,
  });

  final String name;
  final String description;
  final String? image;
  final File? file;

  Map<String, dynamic> toMap() => {
        'name': this.name,
        'description': this.description,
        'file': this.file,
        'image': this.image,
      };
}
