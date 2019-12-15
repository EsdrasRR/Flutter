import "dart:async";

void main() {
  
  List convidados = ["Ez", "Lucian", "Ashe", "Brand"];
  
  final controller = StreamController();
  
  controller.stream.where((data){
    return convidados.contains(data);
  }
  ).listen((data){
    print(data);
  });
    
  controller.sink.add("Ez");
  controller.sink.add("Braum");
  controller.sink.add("Cassiopeia");
  controller.sink.add("Draven");
  
  controller.close();
}
