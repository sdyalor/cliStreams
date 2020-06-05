// import 'package:cli/cli.dart' as cli;
import 'dart:async';
void main(List<String> arguments) {
  final tunnel = StreamController();
  tunnel.sink.add('mouse');

  checker(tunnel, 'mouse2');
  checker(tunnel, 'Dog');


  tunnel.stream.listen(
    (name) => print(name),
    onError: (error) => print('Error: $error'),
    onDone: () => print('The tunnel is closed'),
  );
  tunnel.close();
}

void checker(StreamController controller, String name){
  
  if(RegExp(r'^Dog$').hasMatch(name)){
    controller.sink.addError('$name is not a mouse');
  } else {
    controller.sink.add(name);
  }
  // if(name == 'Dog'){
    // controller.sink.addError('$name is not a mouse');
  // }
}