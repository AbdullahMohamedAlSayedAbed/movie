import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_styles.dart';

class AddressSection extends StatelessWidget {
  final String? address;

  const AddressSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: AppStyles.styles23W700,
          ),
          const SizedBox(height: 8),
          Text(
              address == null || address!.isEmpty
                  ? 'Address not available.'
                  : address!,
              style: AppStyles.styles18W500.copyWith(color: Colors.white70)),
        ],
      ),
    );
  }
}
