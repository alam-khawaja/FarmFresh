import 'package:farm_your_food/app/models/store_model.dart';
import 'package:farm_your_food/global/constants/color_constants.dart';
import 'package:farm_your_food/global/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BrowseStoreViewTile extends StatelessWidget {
  const BrowseStoreViewTile({
    super.key,
    required this.store,
  });
  final StoreModel store;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    store.storeImage!,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.name ?? '',
                    style: AppTextStyles.bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    store.description ?? '',
                    style: AppTextStyles.normal,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Add to cart logic here
              },
              style: TextButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shadowColor: Colors.white,
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
