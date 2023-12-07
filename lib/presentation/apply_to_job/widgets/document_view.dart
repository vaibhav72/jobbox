import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../data/models/document_model.dart';
import '../../../utils/helpers.dart';
import '../../../utils/meta_colors.dart';
import '../controller.dart';

/// This is the DocumentUploadview class
/// It handles the first step of the job application process
/// It is called from the [ApplyToJobView] class
/// It is used to upload documents
/// It uses the [ApplyToJobController] class
class DocumentUploadview extends GetView<ApplyToJobController> {
  const DocumentUploadview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.endApplication();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.endApplication();
            },
            child: const Icon(
              Icons.close,
              color: MetaColors.textColor,
              size: 40,
            ),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Apply To ${controller.job.value?.companyName ?? ''}",
                    style: GoogleFonts.autourOne(
                        fontSize: 25, color: MetaColors.textColor)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Uploading of Documents",
                  style: TextStyle(color: Get.theme.primaryColor, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.25,
                    backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
                    color: Get.theme.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Resume",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: MetaColors.textColor)),
                                  Text(
                                      "Remember to include your most updated resume",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              MetaColors.secondaryTextColor)),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.pickResume();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                                color: MetaColors.textColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: controller.resume
                              .map((e) => DocTile(
                                    data: e!,
                                    onTap: () {
                                      controller.jobController
                                          .selectedResume(e);
                                    },
                                    selected: controller.jobController
                                            .selectedResume.value ==
                                        e,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Cover Letter",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: MetaColors.textColor)),
                                  Text("Stand out with your cover letter",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              MetaColors.secondaryTextColor)),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.pickCoverLetter();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                                color: MetaColors.textColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: controller.coverLetter
                              .map((e) => DocTile(
                                    data: e!,
                                    onTap: () {
                                      controller.jobController
                                          .selectCoverLetter(e);
                                    },
                                    selected: controller.jobController
                                            .selectedCoverLetter.value ==
                                        e,
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  title: "Proceed",
                  onTap: () {
                    controller.saveDocumentsAndProceed();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DocTile extends StatelessWidget {
  DocTile({
    super.key,
    required this.data,
    this.selected = false,
    this.onTap,
  });
  DocumentModel data;
  bool selected;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: selected
                ? BoxDecoration(
                    border: Border.all(color: Get.theme.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Get.theme.primaryColor)
                : BoxDecoration(
                    border: Border.all(color: Get.theme.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Get.theme.primaryColor.withOpacity(0.1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.doc_fill,
                    color: selected ? Colors.white : Get.theme.primaryColor,
                    size: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.path.split("/").last,
                            style: TextStyle(
                                fontSize: 17,
                                color: selected
                                    ? Colors.white
                                    : Get.theme.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateFormat('dd/MM/yy').format(
                              DateTime.now(),
                            ),
                            style: TextStyle(
                              fontSize: 13,
                              color: selected
                                  ? Colors.white
                                  : Get.theme.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
