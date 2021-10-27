class Noticia{
  final String titulo;
  final String introducao;

  const Noticia({
    required this.titulo,
    required this.introducao
  });

  //TODO: adicionar o endereço da imagem na classe Noticia.

  factory Noticia.fromJson  (Map<String, dynamic> item)
  {
    return Noticia(
      titulo: item['titulo'] as String,
      introducao: item['introducao'] as String,
    );
  }
}