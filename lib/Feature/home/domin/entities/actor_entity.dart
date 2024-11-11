import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final String? biography;
  final String? address;
  final String? birthday;


  const ActorEntity( 
      {this.address, required this.id,
      required this.name,this.birthday,
      required this.profilePath,
      required this.biography,
});
      
        @override
        // TODO: implement props
        List<Object?> get props => [id,name,profilePath,biography,address];
}
