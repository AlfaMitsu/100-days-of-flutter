import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/models/job_model.dart';

class ItemsJobs extends StatefulWidget {
  final Job job;
  final bool themeDark;

  const ItemsJobs({
    super.key,
    required this.job,
    required this.themeDark,
  });

  @override
  State<ItemsJobs> createState() => _ItemsJobsState();
}

class _ItemsJobsState extends State<ItemsJobs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        bottom: 20,
        top: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.themeDark ? kSecondaryColor : kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.job.urlLogo,
                        width: 60,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          widget.job.isFavorite = !widget.job.isFavorite;
                        },
                      );
                    },
                    child: Icon(
                      widget.job.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.themeDark ? kWhiteColor : kGreyColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.job.name,
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          widget.themeDark ? kSecondaryTextColor : kGreyColor,
                    ),
                  ),
                  Text(
                    widget.job.role,
                    style: widget.themeDark
                        ? kJobRoleTextStyle
                        : kJobRole2TextStyle,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).highlightColor,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.job.location,
                        style: TextStyle(
                          fontSize: 15,
                          color: widget.themeDark
                              ? kSecondaryTextColor
                              : kGreyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
