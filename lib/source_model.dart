class Source {
    Source({
      this.id,
      this.name,
    }); 

    String? id;
    String? name;

    factory Source.fromJson(Map<String, dynamic> json){
      return Source(id: json['id'], name: json['name']);
    }

}