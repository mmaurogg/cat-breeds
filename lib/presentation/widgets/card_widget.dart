import 'package:catbreeds/presentation/widgets/container_image.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/domain/entities/cat_breed_entity.dart';

class CustomCardView extends StatelessWidget {
  final GestureTapCallback? onTap;

  final CatBreedModel catType;
  CustomCardView({super.key, required this.catType, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Raza: " + catType.name!), Text('Más...')],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: ContainerImage(imageUrl: catType.image?.url ?? ''),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Origen: " + catType.origin!),
                  Text("Inteligencia: " + catType.intelligence!.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
