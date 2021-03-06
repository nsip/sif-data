

/*    
	Simple Code changes for SQL Schema
		Making the schema SQL standard to allow MySQL and Postgrest DB Creates
		Scott Penrose <scottp@dd.com.au> September 2014 http://scott.dd.com.au/


      Common Education Data Standards (CEDS)
      Version 4
      Normalized Data Schema (NDS)
      
      This script creates the tables, constraints, and relationships defined in 
      version 4 of the CEDS NDS.  The script was generated from a model database 
      hosted on a Microsoft SQL Server 2008 R2 platform.  
      
      Questions on this script can be sent to ceds@ed.gov
      
      More information on the data model is available at the CEDS website:  
      http://ceds.ed.gov
      
      WARNING: This script creates a database named CEDS-NDS-V4 on the default 
      file location for the database.
      
*/      


GO
/****** Object:  Default [DF__PersonPho__Prima__50E5F592]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonTelephone] ADD  CONSTRAINT [DF__PersonPho__Prima__50E5F592]  DEFAULT ((0)) FOR [PrimaryTelephoneNumberIndicator]
GO
/****** Object:  ForeignKey [FK_Achievement_CompetencySet]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_CompetencySet] FOREIGN KEY([CompetencySetId])
REFERENCES [dbo].[CompetencySet] ([CompetencySetId])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_CompetencySet]
GO
/****** Object:  ForeignKey [FK_Achievement_Person]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_Person]
GO
/****** Object:  ForeignKey [FK_AchievementEvidence_Achievement]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AchievementEvidence]  WITH CHECK ADD  CONSTRAINT [FK_AchievementEvidence_Achievement] FOREIGN KEY([AchievementId])
REFERENCES [dbo].[Achievement] ([AchievementId])
GO
ALTER TABLE [dbo].[AchievementEvidence] CHECK CONSTRAINT [FK_AchievementEvidence_Achievement]
GO
/****** Object:  ForeignKey [FK_AchievementEvidence_AssessmentSubtestResult]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AchievementEvidence]  WITH CHECK ADD  CONSTRAINT [FK_AchievementEvidence_AssessmentSubtestResult] FOREIGN KEY([AssessmentSubtestResultId])
REFERENCES [dbo].[AssessmentResult] ([AssessmentResultId])
GO
ALTER TABLE [dbo].[AchievementEvidence] CHECK CONSTRAINT [FK_AchievementEvidence_AssessmentSubtestResult]
GO
/****** Object:  ForeignKey [FK_ActivityRecognition_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[ActivityRecognition]  WITH CHECK ADD  CONSTRAINT [FK_ActivityRecognition_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ActivityRecognition] CHECK CONSTRAINT [FK_ActivityRecognition_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_ActivityRecognition_RefActivityRecognitionType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[ActivityRecognition]  WITH CHECK ADD  CONSTRAINT [FK_ActivityRecognition_RefActivityRecognitionType] FOREIGN KEY([RefActivityRecognitionTypeId])
REFERENCES [dbo].[RefActivityRecognitionType] ([RefActivityRecognitionTypeId])
GO
ALTER TABLE [dbo].[ActivityRecognition] CHECK CONSTRAINT [FK_ActivityRecognition_RefActivityRecognitionType]
GO
/****** Object:  ForeignKey [FK_AeCourse_RefCareerCluster]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeCourse]  WITH CHECK ADD  CONSTRAINT [FK_AeCourse_RefCareerCluster] FOREIGN KEY([RefCareerClusterId])
REFERENCES [dbo].[RefCareerCluster] ([RefCareerClusterId])
GO
ALTER TABLE [dbo].[AeCourse] CHECK CONSTRAINT [FK_AeCourse_RefCareerCluster]
GO
/****** Object:  ForeignKey [FK_AeProvider_Organization]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeProvider]  WITH CHECK ADD  CONSTRAINT [FK_AeProvider_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AeProvider] CHECK CONSTRAINT [FK_AeProvider_Organization]
GO
/****** Object:  ForeignKey [FK_AeProvider_RefLevelOfInstitution]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeProvider]  WITH CHECK ADD  CONSTRAINT [FK_AeProvider_RefLevelOfInstitution] FOREIGN KEY([RefLevelOfInstitutionId])
REFERENCES [dbo].[RefLevelOfInstitution] ([RefLevelOfInstitutionId])
GO
ALTER TABLE [dbo].[AeProvider] CHECK CONSTRAINT [FK_AeProvider_RefLevelOfInstitution]
GO
/****** Object:  ForeignKey [FK_AeStaff_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AeStaff_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[AeStaff] CHECK CONSTRAINT [FK_AeStaff_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_AeStaff_RefAeCertificationType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AeStaff_RefAeCertificationType] FOREIGN KEY([RefAeCertificationTypeId])
REFERENCES [dbo].[RefAeCertificationType] ([RefAeCertificationTypeId])
GO
ALTER TABLE [dbo].[AeStaff] CHECK CONSTRAINT [FK_AeStaff_RefAeCertificationType]
GO
/****** Object:  ForeignKey [FK_AeStaff_RefAeStaffClassification]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AeStaff_RefAeStaffClassification] FOREIGN KEY([RefAeStaffClassificationId])
REFERENCES [dbo].[RefAeStaffClassification] ([RefAeStaffClassificationId])
GO
ALTER TABLE [dbo].[AeStaff] CHECK CONSTRAINT [FK_AeStaff_RefAeStaffClassification]
GO
/****** Object:  ForeignKey [FK_AeStaff_RefAeStaffEmploymentStatus]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AeStaff_RefAeStaffEmploymentStatus] FOREIGN KEY([RefAeStaffEmploymentStatusId])
REFERENCES [dbo].[RefAeStaffEmploymentStatus] ([RefAeStaffEmploymentStatusId])
GO
ALTER TABLE [dbo].[AeStaff] CHECK CONSTRAINT [FK_AeStaff_RefAeStaffEmploymentStatus]
GO
/****** Object:  ForeignKey [FK_AeStudentAcademicRecord_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentAcademicRecord_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[AeStudentAcademicRecord] CHECK CONSTRAINT [FK_AeStudentAcademicRecord_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_AeStudentAcademicRecord_RefHighSchoolDiplomaType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentAcademicRecord_RefHighSchoolDiplomaType] FOREIGN KEY([RefHighSchoolDiplomaTypeId])
REFERENCES [dbo].[RefHighSchoolDiplomaType] ([RefHighSchoolDiplomaTypeId])
GO
ALTER TABLE [dbo].[AeStudentAcademicRecord] CHECK CONSTRAINT [FK_AeStudentAcademicRecord_RefHighSchoolDiplomaType]
GO
/****** Object:  ForeignKey [FK_AeStudentAcademicRecord_RefProfTechnicalCredentialType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentAcademicRecord_RefProfTechnicalCredentialType] FOREIGN KEY([RefProfessionalTechnicalCredentialTypeId])
REFERENCES [dbo].[RefProfessionalTechnicalCredentialType] ([RefProfessionalTechnicalCredentialTypeId])
GO
ALTER TABLE [dbo].[AeStudentAcademicRecord] CHECK CONSTRAINT [FK_AeStudentAcademicRecord_RefProfTechnicalCredentialType]
GO
/****** Object:  ForeignKey [FK_AeStudentEmployment_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentEmployment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[AeStudentEmployment] CHECK CONSTRAINT [FK_AeStudentEmployment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_AeStudentEmployment_RefEmployedAfterExit]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentEmployment_RefEmployedAfterExit] FOREIGN KEY([RefEmployedAfterExitId])
REFERENCES [dbo].[RefEmployedAfterExit] ([RefEmployedAfterExitId])
GO
ALTER TABLE [dbo].[AeStudentEmployment] CHECK CONSTRAINT [FK_AeStudentEmployment_RefEmployedAfterExit]
GO
/****** Object:  ForeignKey [FK_AeStudentEmployment_RefEmployedWhileEnrolled]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AeStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_AeStudentEmployment_RefEmployedWhileEnrolled] FOREIGN KEY([RefEmployedWhileEnrolledId])
REFERENCES [dbo].[RefEmployedWhileEnrolled] ([RefEmployedWhileEnrolledId])
GO
ALTER TABLE [dbo].[AeStudentEmployment] CHECK CONSTRAINT [FK_AeStudentEmployment_RefEmployedWhileEnrolled]
GO
/****** Object:  ForeignKey [FK_ApipInteraction_AssessmentItemApip]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[ApipInteraction]  WITH CHECK ADD  CONSTRAINT [FK_ApipInteraction_AssessmentItemApip] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItemApip] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[ApipInteraction] CHECK CONSTRAINT [FK_ApipInteraction_AssessmentItemApip]
GO
/****** Object:  ForeignKey [FK_ApipInteraction_RefAPIPInteractionType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[ApipInteraction]  WITH CHECK ADD  CONSTRAINT [FK_ApipInteraction_RefAPIPInteractionType] FOREIGN KEY([RefApipInteractionTypeId])
REFERENCES [dbo].[RefApipInteractionType] ([RefAPIPInteractionTypeId])
GO
ALTER TABLE [dbo].[ApipInteraction] CHECK CONSTRAINT [FK_ApipInteraction_RefAPIPInteractionType]
GO
/****** Object:  ForeignKey [FK_Assessment_AssessmentFamily]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_AssessmentFamily] FOREIGN KEY([AssessmentFamilyId])
REFERENCES [dbo].[AssessmentFamily] ([AssessmentFamilyId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_AssessmentFamily]
GO
/****** Object:  ForeignKey [FK_Assessment_RefAssessmentPurpose]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_RefAssessmentPurpose] FOREIGN KEY([RefAssessmentPurposeId])
REFERENCES [dbo].[RefAssessmentPurpose] ([RefAssessmentPurposeId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_RefAssessmentPurpose]
GO
/****** Object:  ForeignKey [FK_Assessment_RefAssessmentType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_RefAssessmentType] FOREIGN KEY([RefAssessmentTypeId])
REFERENCES [dbo].[RefAssessmentType] ([RefAssessmentTypeId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_RefAssessmentType]
GO
/****** Object:  ForeignKey [FK_Assessment_RefAssessmentTypeChildrenWithDisabilities]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_RefAssessmentTypeChildrenWithDisabilities] FOREIGN KEY([RefAssessmentTypeChildrenWithDisabilitiesId])
REFERENCES [dbo].[RefAssessmentTypeChildrenWithDisabilities] ([RefAssessmentTypeChildrenWithDisabilitiesId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_RefAssessmentTypeChildrenWithDisabilities]
GO
/****** Object:  ForeignKey [FK_Assessment_RefRefAcademicSubject]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_RefRefAcademicSubject] FOREIGN KEY([RefAcademicSubjectId])
REFERENCES [dbo].[RefAcademicSubject] ([RefAcademicSubjectId])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_RefRefAcademicSubject]
GO
/****** Object:  ForeignKey [FK_Assessment_AssessmentAdministration_Assessment]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment_AssessmentAdministration]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_AssessmentAdministration_Assessment] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessment] ([AssessmentId])
GO
ALTER TABLE [dbo].[Assessment_AssessmentAdministration] CHECK CONSTRAINT [FK_Assessment_AssessmentAdministration_Assessment]
GO
/****** Object:  ForeignKey [FK_Assessment_AssessmentAdministration_AssessmentAdministration]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[Assessment_AssessmentAdministration]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_AssessmentAdministration_AssessmentAdministration] FOREIGN KEY([AssessmentAdministrationId])
REFERENCES [dbo].[AssessmentAdministration] ([AssessmentAdministrationId])
GO
ALTER TABLE [dbo].[Assessment_AssessmentAdministration] CHECK CONSTRAINT [FK_Assessment_AssessmentAdministration_AssessmentAdministration]
GO
/****** Object:  ForeignKey [FK_AssessmentAdministration_RefAssessmentReportingMethod]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAdministration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAdministration_RefAssessmentReportingMethod] FOREIGN KEY([RefAssessmentReportingMethodId])
REFERENCES [dbo].[RefAssessmentReportingMethod] ([RefAssessmentReportingMethodId])
GO
ALTER TABLE [dbo].[AssessmentAdministration] CHECK CONSTRAINT [FK_AssessmentAdministration_RefAssessmentReportingMethod]
GO
/****** Object:  ForeignKey [FK_AssessmentAdministration_Organization_AssessmentAdmin]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAdministration_Organization]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAdministration_Organization_AssessmentAdmin] FOREIGN KEY([AssessmentAdministrationId])
REFERENCES [dbo].[AssessmentAdministration] ([AssessmentAdministrationId])
GO
ALTER TABLE [dbo].[AssessmentAdministration_Organization] CHECK CONSTRAINT [FK_AssessmentAdministration_Organization_AssessmentAdmin]
GO
/****** Object:  ForeignKey [FK_AssessmentAdministration_Organization_Organization]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAdministration_Organization]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAdministration_Organization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentAdministration_Organization] CHECK CONSTRAINT [FK_AssessmentAdministration_Organization_Organization]
GO
/****** Object:  ForeignKey [FK_AssessmentAsset_LearningResource]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAsset_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentAsset_LearningResource]
GO
/****** Object:  ForeignKey [FK_AssessmentAsset_RefAssessAssetIDType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAsset_RefAssessAssetIDType] FOREIGN KEY([RefAssesmentAssestIdentifierType])
REFERENCES [dbo].[RefAssessmentAssetIdentifierType] ([RefAssessmentAssetIdentifierTypeId])
GO
ALTER TABLE [dbo].[AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentAsset_RefAssessAssetIDType]
GO
/****** Object:  ForeignKey [FK_AssessmentAsset_RefAssessmentAssetType]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAsset_RefAssessmentAssetType] FOREIGN KEY([RefAssessmentAssetTypeId])
REFERENCES [dbo].[RefAssessmentAssetType] ([RefAssessmentAssetTypeId])
GO
ALTER TABLE [dbo].[AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentAsset_RefAssessmentAssetType]
GO
/****** Object:  ForeignKey [FK_AssessmentAsset_RefLanguage]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentAsset_RefLanguage] FOREIGN KEY([ReAssessmentfLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentAsset_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_Assessment]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_Assessment] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessment] ([AssessmentId])
GO
ALTER TABLE [dbo].[AssessmentForm] CHECK CONSTRAINT [FK_AssessmentForm_Assessment]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_LearningResource]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[AssessmentForm] CHECK CONSTRAINT [FK_AssessmentForm_LearningResource]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_RefLanguage]    Script Date: 01/24/2014 13:47:57 ******/
ALTER TABLE [dbo].[AssessmentForm]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_RefLanguage] FOREIGN KEY([RefAssessmentLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentForm] CHECK CONSTRAINT [FK_AssessmentForm_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_AssessmentAsset_AssessmentAsset]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentForm_AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_AssessmentAsset_AssessmentAsset] FOREIGN KEY([AssessmentAssetId])
REFERENCES [dbo].[AssessmentAsset] ([AssessmentAssetId])
GO
ALTER TABLE [dbo].[AssessmentForm_AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentForm_AssessmentAsset_AssessmentAsset]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_AssessmentAsset_AssessmentForm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentForm_AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_AssessmentAsset_AssessmentForm] FOREIGN KEY([AssessmentFormId])
REFERENCES [dbo].[AssessmentForm] ([AssessmentFormId])
GO
ALTER TABLE [dbo].[AssessmentForm_AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentForm_AssessmentAsset_AssessmentForm]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_AssessmentFormSection_AssessmentForm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentForm_AssessmentFormSection]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_AssessmentFormSection_AssessmentForm] FOREIGN KEY([AssessmentFormId])
REFERENCES [dbo].[AssessmentForm] ([AssessmentFormId])
GO
ALTER TABLE [dbo].[AssessmentForm_AssessmentFormSection] CHECK CONSTRAINT [FK_AssessmentForm_AssessmentFormSection_AssessmentForm]
GO
/****** Object:  ForeignKey [FK_AssessmentForm_AssessmentFormSection_FormSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentForm_AssessmentFormSection]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentForm_AssessmentFormSection_FormSection] FOREIGN KEY([AssessmentFormSectionId])
REFERENCES [dbo].[AssessmentFormSection] ([AssessmentFormSectionId])
GO
ALTER TABLE [dbo].[AssessmentForm_AssessmentFormSection] CHECK CONSTRAINT [FK_AssessmentForm_AssessmentFormSection_FormSection]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[AssessmentFormSection] CHECK CONSTRAINT [FK_AssessmentFormSection_LearningResource]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_RefAssessmentFormSectionIDType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_RefAssessmentFormSectionIDType] FOREIGN KEY([RefAssessmentFormSectionIdentificationSystemId])
REFERENCES [dbo].[RefAssessmentFormSectionIdentificationSystem] ([RefAssessmentFormSectionIdentificationSystemId])
GO
ALTER TABLE [dbo].[AssessmentFormSection] CHECK CONSTRAINT [FK_AssessmentFormSection_RefAssessmentFormSectionIDType]
GO
/****** Object:  ForeignKey [FK_FormSection_FormSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection]  WITH CHECK ADD  CONSTRAINT [FK_FormSection_FormSection] FOREIGN KEY([ChildOf_FormSectionId])
REFERENCES [dbo].[AssessmentFormSection] ([AssessmentFormSectionId])
GO
ALTER TABLE [dbo].[AssessmentFormSection] CHECK CONSTRAINT [FK_FormSection_FormSection]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_AssessmentAsset_AssessmentAsset]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_AssessmentAsset_AssessmentAsset] FOREIGN KEY([AssessmentAssetId])
REFERENCES [dbo].[AssessmentAsset] ([AssessmentAssetId])
GO
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentFormSection_AssessmentAsset_AssessmentAsset]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_AssessmentAsset_AssessmentFormSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentAsset]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_AssessmentAsset_AssessmentFormSection] FOREIGN KEY([AssessmentFormSectionId])
REFERENCES [dbo].[AssessmentFormSection] ([AssessmentFormSectionId])
GO
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentAsset] CHECK CONSTRAINT [FK_AssessmentFormSection_AssessmentAsset_AssessmentFormSection]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_AssessmentItem_AssessmentItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_AssessmentItem_AssessmentItem] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentItem] CHECK CONSTRAINT [FK_AssessmentFormSection_AssessmentItem_AssessmentItem]
GO
/****** Object:  ForeignKey [FK_AssessmentFormSection_AssessmentItem_FormSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentFormSection_AssessmentItem_FormSection] FOREIGN KEY([AssessmentFormSectionId])
REFERENCES [dbo].[AssessmentFormSection] ([AssessmentFormSectionId])
GO
ALTER TABLE [dbo].[AssessmentFormSection_AssessmentItem] CHECK CONSTRAINT [FK_AssessmentFormSection_AssessmentItem_FormSection]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_LearningResource]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_RefAssessmentItemType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_RefAssessmentItemType] FOREIGN KEY([RefAssessmentItemTypeId])
REFERENCES [dbo].[RefAssessmentItemType] ([RefAssessmentItemTypeId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_RefAssessmentItemType]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_RefNAEPAspectsOfReading]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_RefNAEPAspectsOfReading] FOREIGN KEY([RefNaepAspectsOfReadingId])
REFERENCES [dbo].[RefNaepAspectsOfReading] ([RefNaepAspectsOfReadingId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_RefNAEPAspectsOfReading]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_RefNAEPMathComplexityLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_RefNAEPMathComplexityLevel] FOREIGN KEY([RefNaepMathComplexityLevelId])
REFERENCES [dbo].[RefNaepMathComplexityLevel] ([RefNaepMathComplexityLevelId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_RefNAEPMathComplexityLevel]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_RefTextComplexitySystem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_RefTextComplexitySystem] FOREIGN KEY([RefTextComplexitySystemId])
REFERENCES [dbo].[RefTextComplexitySystem] ([RefTextComplexitySystemId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_RefTextComplexitySystem]
GO
/****** Object:  ForeignKey [FK_AssessmentItem_Rubric]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItem_Rubric] FOREIGN KEY([RubricId])
REFERENCES [dbo].[Rubric] ([RubricId])
GO
ALTER TABLE [dbo].[AssessmentItem] CHECK CONSTRAINT [FK_AssessmentItem_Rubric]
GO
/****** Object:  ForeignKey [FK_AssessmentItemBody_AssessmentItem1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemApip]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemBody_AssessmentItem1] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemApip] CHECK CONSTRAINT [FK_AssessmentItemBody_AssessmentItem1]
GO
/****** Object:  ForeignKey [FK_AssessmentItemApipDescription_AssessmentItemApip]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemApipDescription]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemApipDescription_AssessmentItemApip] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItemApip] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemApipDescription] CHECK CONSTRAINT [FK_AssessmentItemApipDescription_AssessmentItemApip]
GO
/****** Object:  ForeignKey [FK_AssessmentItemApipDescription_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemApipDescription]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemApipDescription_RefLanguage] FOREIGN KEY([RefKeywordTranslationLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentItemApipDescription] CHECK CONSTRAINT [FK_AssessmentItemApipDescription_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessmentItemCharacteristic_RefAssessItemCharType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemCharacteristic_RefAssessItemCharType] FOREIGN KEY([RefAssessmentItemCharacteristicTypeId])
REFERENCES [dbo].[RefAssessmentItemCharacteristicType] ([RefAssessmentItemCharacteristicTypeId])
GO
ALTER TABLE [dbo].[AssessmentItemCharacteristic] CHECK CONSTRAINT [FK_AssessmentItemCharacteristic_RefAssessItemCharType]
GO
/****** Object:  ForeignKey [FK_ItemCharacteristic_Item]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_ItemCharacteristic_Item] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemCharacteristic] CHECK CONSTRAINT [FK_ItemCharacteristic_Item]
GO
/****** Object:  ForeignKey [FK_AssessmentItemPossibleResponse_AssessmentItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemPossibleResponse]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemPossibleResponse_AssessmentItem] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemPossibleResponse] CHECK CONSTRAINT [FK_AssessmentItemPossibleResponse_AssessmentItem]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponse_AssessmentItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponse]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponse_AssessmentItem] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemResponse] CHECK CONSTRAINT [FK_AssessmentItemResponse_AssessmentItem]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponse_AssessmentParticipantSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponse]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponse_AssessmentParticipantSession] FOREIGN KEY([AssessmentParticipantSessionId])
REFERENCES [dbo].[AssessmentParticipantSession] ([AssessmentParticipantSessionId])
GO
ALTER TABLE [dbo].[AssessmentItemResponse] CHECK CONSTRAINT [FK_AssessmentItemResponse_AssessmentParticipantSession]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponse_RefAssessItemResponseStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponse]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponse_RefAssessItemResponseStatus] FOREIGN KEY([RefAssessItemResponseStatusId])
REFERENCES [dbo].[RefAssessmentItemResponseStatus] ([RefAssessmentItemResponseStatusId])
GO
ALTER TABLE [dbo].[AssessmentItemResponse] CHECK CONSTRAINT [FK_AssessmentItemResponse_RefAssessItemResponseStatus]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponse_RefProficiencyStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponse]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponse_RefProficiencyStatus] FOREIGN KEY([RefProficiencyStatusId])
REFERENCES [dbo].[RefProficiencyStatus] ([RefProficiencyStatusId])
GO
ALTER TABLE [dbo].[AssessmentItemResponse] CHECK CONSTRAINT [FK_AssessmentItemResponse_RefProficiencyStatus]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponseTheory_AssessmentItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponseTheory]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponseTheory_AssessmentItem] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentItemResponseTheory] CHECK CONSTRAINT [FK_AssessmentItemResponseTheory_AssessmentItem]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponseTheory_RefIRTDifficultyCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponseTheory]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponseTheory_RefIRTDifficultyCategory] FOREIGN KEY([RefItemResponsseTheoryDifficultyCategoryId])
REFERENCES [dbo].[RefItemResponsseTheoryDifficultyCategory] ([RefItemResponsseTheoryDifficultyCategoryId])
GO
ALTER TABLE [dbo].[AssessmentItemResponseTheory] CHECK CONSTRAINT [FK_AssessmentItemResponseTheory_RefIRTDifficultyCategory]
GO
/****** Object:  ForeignKey [FK_AssessmentItemResponseTheory_RefIRTKappaAlgorithm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemResponseTheory]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemResponseTheory_RefIRTKappaAlgorithm] FOREIGN KEY([RefItemResponseTheoryKappaAlgorithmId])
REFERENCES [dbo].[RefItemResponseTheoryKappaAlgorithm] ([RefItemResponseTheoryKappaAlgorithmId])
GO
ALTER TABLE [dbo].[AssessmentItemResponseTheory] CHECK CONSTRAINT [FK_AssessmentItemResponseTheory_RefIRTKappaAlgorithm]
GO
/****** Object:  ForeignKey [FK_AssessItemRubricCriterionResult_AssessItemResponse]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemRubricCriterionResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessItemRubricCriterionResult_AssessItemResponse] FOREIGN KEY([AssessmentItemResponseId])
REFERENCES [dbo].[AssessmentItemResponse] ([AssessmentItemResponseId])
GO
ALTER TABLE [dbo].[AssessmentItemRubricCriterionResult] CHECK CONSTRAINT [FK_AssessItemRubricCriterionResult_AssessItemResponse]
GO
/****** Object:  ForeignKey [FK_AssessItemRubricCriterionResult_RubricCriterionLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentItemRubricCriterionResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessItemRubricCriterionResult_RubricCriterionLevel] FOREIGN KEY([RubricCriterionLevelId])
REFERENCES [dbo].[RubricCriterionLevel] ([RubricCriterionLevelId])
GO
ALTER TABLE [dbo].[AssessmentItemRubricCriterionResult] CHECK CONSTRAINT [FK_AssessItemRubricCriterionResult_RubricCriterionLevel]
GO
/****** Object:  ForeignKey [FK_AssessmentLanguage_Assessment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentLanguage_Assessment] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessment] ([AssessmentId])
GO
ALTER TABLE [dbo].[AssessmentLanguage] CHECK CONSTRAINT [FK_AssessmentLanguage_Assessment]
GO
/****** Object:  ForeignKey [FK_AssessmentLanguage_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentLanguage_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentLanguage] CHECK CONSTRAINT [FK_AssessmentLanguage_RefLanguage]
GO
/****** Object:  ForeignKey [FK_Assessment_LevelsForWhichDesigned_Assessment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentLevelsForWhichDesigned]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_LevelsForWhichDesigned_Assessment] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessment] ([AssessmentId])
GO
ALTER TABLE [dbo].[AssessmentLevelsForWhichDesigned] CHECK CONSTRAINT [FK_Assessment_LevelsForWhichDesigned_Assessment]
GO
/****** Object:  ForeignKey [FK_Assessment_LevelsForWhichDesigned_RefGrade]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentLevelsForWhichDesigned]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_LevelsForWhichDesigned_RefGrade] FOREIGN KEY([RefGradeLevelId])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[AssessmentLevelsForWhichDesigned] CHECK CONSTRAINT [FK_Assessment_LevelsForWhichDesigned_RefGrade]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedApipContent_RefAssessmentNeedSigningType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedApipContent_RefAssessmentNeedSigningType] FOREIGN KEY([RefAssessmentNeedSigningTypeId])
REFERENCES [dbo].[RefAssessmentNeedSigningType] ([RefAssessmentNeedSigningTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessmentNeedApipContent_RefAssessmentNeedSigningType]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedApipContent_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedApipContent_RefLanguage] FOREIGN KEY([ItemTranslationDisplayLanguageTypeId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessmentNeedApipContent_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedApipContent_RefLanguage1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedApipContent_RefLanguage1] FOREIGN KEY([KeywordTranslationLanguageTypeId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessmentNeedApipContent_RefLanguage1]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipContent_AssessmentPersonalNeedsProfileContent]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipContent_AssessmentPersonalNeedsProfileContent] FOREIGN KEY([AssessmentPersonalNeedsProfileContentId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileContent] ([AssessmentPersonalNeedsProfileContentId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessNeedApipContent_AssessmentPersonalNeedsProfileContent]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipContent_RefAssessmentNeedAlternativeRepresent]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedAlternativeRepresent] FOREIGN KEY([RefAssessmentNeedAlternativeRepresentationTypeId])
REFERENCES [dbo].[RefAssessmentNeedAlternativeRepresentationType] ([RefAssessmentNeedAlternativeRepresentationTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedAlternativeRepresent]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipContent_RefAssessmentNeedSpokenSourcePref]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedSpokenSourcePref] FOREIGN KEY([RefAssessmentNeedSpokenSourcePreferenceTypeId])
REFERENCES [dbo].[RefAssessmentNeedSpokenSourcePreferenceType] ([RefAssessmentNeedSpokenSourcePreferenceTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedSpokenSourcePref]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipContent_RefAssessmentNeedUserSpokenPreference]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedUserSpokenPreference] FOREIGN KEY([RefAssessmentNeedUserSpokenPreferenceTypeId])
REFERENCES [dbo].[RefAssessmentNeedUserSpokenPreferenceType] ([RefAssessmentNeedUserSpokenPreferenceTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipContent] CHECK CONSTRAINT [FK_AssessNeedApipContent_RefAssessmentNeedUserSpokenPreference]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipControl_AssessmentPersonalNeedsProfileControl]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipControl]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipControl_AssessmentPersonalNeedsProfileControl] FOREIGN KEY([AssessmentPersonalNeedsProfileControlId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileControl] ([AssessmentPersonalNeedsProfileControlId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipControl] CHECK CONSTRAINT [FK_AssessNeedApipControl_AssessmentPersonalNeedsProfileControl]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipControl_RefAssessmentNeedIncreasedWhitespacing]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipControl]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipControl_RefAssessmentNeedIncreasedWhitespacing] FOREIGN KEY([RefAssessmentNeedIncreasedWhitespacingTypeId])
REFERENCES [dbo].[RefAssessmentNeedIncreasedWhitespacingType] ([RefAssessmentNeedIncreasedWhitespacingTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipControl] CHECK CONSTRAINT [FK_AssessNeedApipControl_RefAssessmentNeedIncreasedWhitespacing]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedApipDisplay_RefAssessmentNeedMaskingType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipDisplay]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedApipDisplay_RefAssessmentNeedMaskingType] FOREIGN KEY([RefAssessmentNeedMaskingTypeId])
REFERENCES [dbo].[RefAssessmentNeedMaskingType] ([RefAssessmentNeedMaskingTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipDisplay] CHECK CONSTRAINT [FK_AssessmentNeedApipDisplay_RefAssessmentNeedMaskingType]
GO
/****** Object:  ForeignKey [FK_AssessNeedApipDisplay_AssessmentPersonalNeedsProfileDisplay]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedApipDisplay]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedApipDisplay_AssessmentPersonalNeedsProfileDisplay] FOREIGN KEY([AssessmentPersonalNeedsProfileDisplayId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileDisplay] ([AssessmentPersonalNeedsProfileDisplayId])
GO
ALTER TABLE [dbo].[AssessmentNeedApipDisplay] CHECK CONSTRAINT [FK_AssessNeedApipDisplay_AssessmentPersonalNeedsProfileDisplay]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_AssessmentNeedBrailleGradeTypeId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_AssessmentNeedBrailleGradeTypeId] FOREIGN KEY([RefAssessmentNeedBrailleGradeTypeId])
REFERENCES [dbo].[RefAssessmentNeedBrailleGradeType] ([RefAssessmentNeedBrailleGradeTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_AssessmentNeedBrailleGradeTypeId]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_AssessmentPersonalNeedsProfileDisplay]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_AssessmentPersonalNeedsProfileDisplay] FOREIGN KEY([AssessmentPersonalNeedsProfileDisplayId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileDisplay] ([AssessmentPersonalNeedsProfileDisplayId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_AssessmentPersonalNeedsProfileDisplay]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleMarkType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleMarkType] FOREIGN KEY([RefAssessmentNeedBrailleMarkTypeId])
REFERENCES [dbo].[RefAssessmentNeedBrailleMarkType] ([RefAssessmentNeedBrailleMarkTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleMarkType]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleStatusCellType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleStatusCellType] FOREIGN KEY([RefAssessmentNeedBrailleStatusCellTypeId])
REFERENCES [dbo].[RefAssessmentNeedBrailleStatusCellType] ([RefAssessmentNeedBrailleStatusCellTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedBrailleStatusCellType]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_RefAssessmentNeedNumberOfBrailleDots]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedNumberOfBrailleDots] FOREIGN KEY([RefAssessmentNeedNumberOfBrailleDotsId])
REFERENCES [dbo].[RefAssessmentNeedNumberOfBrailleDots] ([RefAssessmentNeedNumberOfBrailleDotsId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedNumberOfBrailleDots]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedBraille_RefAssessmentNeedUsageType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedBraille]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedUsageType] FOREIGN KEY([RefAssessmentNeedUsageTypeId])
REFERENCES [dbo].[RefAssessmentNeedUsageType] ([RefAssessmentNeedUsageTypeId])
GO
ALTER TABLE [dbo].[AssessmentNeedBraille] CHECK CONSTRAINT [FK_AssessmentNeedBraille_RefAssessmentNeedUsageType]
GO
/****** Object:  ForeignKey [FK_AssessNeedScreenEnhancement_APNProfileScreenEnhancement]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedScreenEnhancement]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedScreenEnhancement_APNProfileScreenEnhancement] FOREIGN KEY([AssessmentPersonalNeedsProfileScreenEnhancementId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileScreenEnhancement] ([AssessmentPersonalNeedsProfileScreenEnhancementId])
GO
ALTER TABLE [dbo].[AssessmentNeedScreenEnhancement] CHECK CONSTRAINT [FK_AssessNeedScreenEnhancement_APNProfileScreenEnhancement]
GO
/****** Object:  ForeignKey [FK_AssessNeedScreenEnhancement_AssessPersonalNeedProfileDisplay]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentNeedScreenEnhancement]  WITH CHECK ADD  CONSTRAINT [FK_AssessNeedScreenEnhancement_AssessPersonalNeedProfileDisplay] FOREIGN KEY([AssessmentPersonalNeedsProfileDisplayId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileDisplay] ([AssessmentPersonalNeedsProfileDisplayId])
GO
ALTER TABLE [dbo].[AssessmentNeedScreenEnhancement] CHECK CONSTRAINT [FK_AssessNeedScreenEnhancement_AssessPersonalNeedProfileDisplay]
GO
/****** Object:  ForeignKey [FK_AssessmentParticipantSession_AssessmentFormSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentParticipantSession_AssessmentFormSection] FOREIGN KEY([AssessmentFormSectionId])
REFERENCES [dbo].[AssessmentFormSection] ([AssessmentFormSectionId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessmentParticipantSession_AssessmentFormSection]
GO
/****** Object:  ForeignKey [FK_AssessmentParticipantSession_AssessmentRegistration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentParticipantSession_AssessmentRegistration] FOREIGN KEY([AssessmentRegistrationId])
REFERENCES [dbo].[AssessmentRegistration] ([AssessmentRegistrationId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessmentParticipantSession_AssessmentRegistration]
GO
/****** Object:  ForeignKey [FK_AssessmentParticipantSession_AssessmentSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentParticipantSession_AssessmentSession] FOREIGN KEY([AssessmentSessionId])
REFERENCES [dbo].[AssessmentSession] ([AssessmentSessionId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessmentParticipantSession_AssessmentSession]
GO
/****** Object:  ForeignKey [FK_AssessmentParticipantSession_Location]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentParticipantSession_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessmentParticipantSession_Location]
GO
/****** Object:  ForeignKey [FK_AssessmentParticipantSession_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentParticipantSession_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessmentParticipantSession_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessParticipantSession_RefAssessmentParticipantSessionPlat]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessParticipantSession_RefAssessmentParticipantSessionPlat] FOREIGN KEY([RefAssessmentPlatformTypeId])
REFERENCES [dbo].[RefAssessmentPlatformType] ([RefAssessmentPlatformTypeId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessParticipantSession_RefAssessmentParticipantSessionPlat]
GO
/****** Object:  ForeignKey [FK_AssessParticipantSession_RefAssessmentSessionSpecialCircumst]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessParticipantSession_RefAssessmentSessionSpecialCircumst] FOREIGN KEY([RefAssessmentSessionSpecialCircumstanceTypeId])
REFERENCES [dbo].[RefAssessmentSessionSpecialCircumstanceType] ([RefAssessmentSessionSpecialCircumstanceTypeId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession] CHECK CONSTRAINT [FK_AssessParticipantSession_RefAssessmentSessionSpecialCircumst]
GO
/****** Object:  ForeignKey [FK_AssessParticipantSession_Accomodation_RefAssessmentAccommod]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessParticipantSession_Accomodation_RefAssessmentAccommod] FOREIGN KEY([RefAssessmentAccommodationTypeId])
REFERENCES [dbo].[RefAssessmentAccommodationType] ([RefAssessmentAccommodationTypeId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation] CHECK CONSTRAINT [FK_AssessParticipantSession_Accomodation_RefAssessmentAccommod]
GO
/****** Object:  ForeignKey [FK_AssessParticSession_Accomodation_AssessParticipantSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessParticSession_Accomodation_AssessParticipantSession] FOREIGN KEY([AssessmentParticipantSessionId])
REFERENCES [dbo].[AssessmentParticipantSession] ([AssessmentParticipantSessionId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation] CHECK CONSTRAINT [FK_AssessParticSession_Accomodation_AssessParticipantSession]
GO
/****** Object:  ForeignKey [FK_AssessPartSession_Accommodation _RefAssessmentAccommodationCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessPartSession_Accommodation _RefAssessmentAccommodationCategory] FOREIGN KEY([RefAssessmentAccommodationCategoryId])
REFERENCES [dbo].[RefAssessmentAccommodationCategory] ([RefAssessmentAccommodationCategoryId])
GO
ALTER TABLE [dbo].[AssessmentParticipantSession_Accommodation] CHECK CONSTRAINT [FK_AssessPartSession_Accommodation _RefAssessmentAccommodationCategory]
GO
/****** Object:  ForeignKey [FK_PerformanceLevel_FormSubTest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPerformanceLevel]  WITH CHECK ADD  CONSTRAINT [FK_PerformanceLevel_FormSubTest] FOREIGN KEY([AssessmentFormSubtestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentPerformanceLevel] CHECK CONSTRAINT [FK_PerformanceLevel_FormSubTest]
GO
/****** Object:  ForeignKey [FK_ANPContentLanguageLearner_AssessmentNeedsProfileContent]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedLanguageLearner]  WITH CHECK ADD  CONSTRAINT [FK_ANPContentLanguageLearner_AssessmentNeedsProfileContent] FOREIGN KEY([AssessmentNeedsProfileContentId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileContent] ([AssessmentPersonalNeedsProfileContentId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedLanguageLearner] CHECK CONSTRAINT [FK_ANPContentLanguageLearner_AssessmentNeedsProfileContent]
GO
/****** Object:  ForeignKey [FK_ANPContentLanguageLearner_RefAssessNeedsProfileContentLang]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedLanguageLearner]  WITH CHECK ADD  CONSTRAINT [FK_ANPContentLanguageLearner_RefAssessNeedsProfileContentLang] FOREIGN KEY([RefAssessmentNeedsProfileContentLanguageLearnerTypeId])
REFERENCES [dbo].[RefAssessmentNeedLanguageLearnerType] ([RefAssessmentNeedLanguageLearnerTypeId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedLanguageLearner] CHECK CONSTRAINT [FK_ANPContentLanguageLearner_RefAssessNeedsProfileContentLang]
GO
/****** Object:  ForeignKey [FK_APNScreenReader_AssessmentPersonalNeedsProfileDisplay]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedScreenReader]  WITH CHECK ADD  CONSTRAINT [FK_APNScreenReader_AssessmentPersonalNeedsProfileDisplay] FOREIGN KEY([AssessmentPersonalNeedsProfileDisplayId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfileDisplay] ([AssessmentPersonalNeedsProfileDisplayId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedScreenReader] CHECK CONSTRAINT [FK_APNScreenReader_AssessmentPersonalNeedsProfileDisplay]
GO
/****** Object:  ForeignKey [FK_AssessmentPersonalNeedScreenReader_RefAssessmentNeedUsage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedScreenReader]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentPersonalNeedScreenReader_RefAssessmentNeedUsage] FOREIGN KEY([RefAssessmentNeedUsageTypeId])
REFERENCES [dbo].[RefAssessmentNeedUsageType] ([RefAssessmentNeedUsageTypeId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedScreenReader] CHECK CONSTRAINT [FK_AssessmentPersonalNeedScreenReader_RefAssessmentNeedUsage]
GO
/****** Object:  ForeignKey [FK_ApnProfileContent_RefAssessmentNeedSupportTool]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent]  WITH CHECK ADD  CONSTRAINT [FK_ApnProfileContent_RefAssessmentNeedSupportTool] FOREIGN KEY([RefAssessmentNeedSupportToolId])
REFERENCES [dbo].[RefAssessmentNeedSupportTool] ([RefAssessmentNeedSupportToolId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent] CHECK CONSTRAINT [FK_ApnProfileContent_RefAssessmentNeedSupportTool]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedsProfileContent_AssessmentNeedsProfile]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedsProfileContent_AssessmentNeedsProfile] FOREIGN KEY([AssessmentPersonalNeedsProfileId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfile] ([AssessmentPersonalNeedsProfileId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent] CHECK CONSTRAINT [FK_AssessmentNeedsProfileContent_AssessmentNeedsProfile]
GO
/****** Object:  ForeignKey [FK_AssessmentPersonalNeedsProfileContent_RefAssessmentNeedHazrd]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentPersonalNeedsProfileContent_RefAssessmentNeedHazrd] FOREIGN KEY([RefAssessmentNeedHazardTypeId])
REFERENCES [dbo].[RefAssessmentNeedHazardType] ([RefAssessmentNeedHazardTypeId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent] CHECK CONSTRAINT [FK_AssessmentPersonalNeedsProfileContent_RefAssessmentNeedHazrd]
GO
/****** Object:  ForeignKey [FK_AssessmentPersonalNeedsProfileContent_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentPersonalNeedsProfileContent_RefLanguage] FOREIGN KEY([RefKeywordTranslationsLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileContent] CHECK CONSTRAINT [FK_AssessmentPersonalNeedsProfileContent_RefLanguage]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedsProfileControl_AssessmentNeedsProfile]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileControl]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedsProfileControl_AssessmentNeedsProfile] FOREIGN KEY([AssessmentPersonalNeedsProfileId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfile] ([AssessmentPersonalNeedsProfileId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileControl] CHECK CONSTRAINT [FK_AssessmentNeedsProfileControl_AssessmentNeedsProfile]
GO
/****** Object:  ForeignKey [FK_AssessmentNeedsProfileDisplay_AssessmentNeedsProfile]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileDisplay]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentNeedsProfileDisplay_AssessmentNeedsProfile] FOREIGN KEY([AssessmentPersonalNeedsProfileId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfile] ([AssessmentPersonalNeedsProfileId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileDisplay] CHECK CONSTRAINT [FK_AssessmentNeedsProfileDisplay_AssessmentNeedsProfile]
GO
/****** Object:  ForeignKey [FK_AnpScreenEnhancement_AssessmentNeedsProfile]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileScreenEnhancement]  WITH CHECK ADD  CONSTRAINT [FK_AnpScreenEnhancement_AssessmentNeedsProfile] FOREIGN KEY([AssessmentPersonalNeedsProfileId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfile] ([AssessmentPersonalNeedsProfileId])
GO
ALTER TABLE [dbo].[AssessmentPersonalNeedsProfileScreenEnhancement] CHECK CONSTRAINT [FK_AnpScreenEnhancement_AssessmentNeedsProfile]
GO
/****** Object:  ForeignKey [FK_AssessmentRegirstration_RefAssessmentForm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegirstration_RefAssessmentForm] FOREIGN KEY([AssessmentFormId])
REFERENCES [dbo].[AssessmentForm] ([AssessmentFormId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegirstration_RefAssessmentForm]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_AssessmentAdministration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_AssessmentAdministration] FOREIGN KEY([AssessmentAdministrationId])
REFERENCES [dbo].[AssessmentAdministration] ([AssessmentAdministrationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_AssessmentAdministration]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_CourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_CourseSection] FOREIGN KEY([CourseSectionOrganizationId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_CourseSection]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_Organization]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_Person] FOREIGN KEY([AssignedByPersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_Person]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_Person2]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_Person2] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_Person2]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentGradeLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentGradeLevel] FOREIGN KEY([RefGradeLevelWhenAssessedId])
REFERENCES [dbo].[RefAssessmentGradeLevel] ([RefAssessmentGradeLevel])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentGradeLevel]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentGradeLevel1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentGradeLevel1] FOREIGN KEY([RefGradeLevelToBeAssessedId])
REFERENCES [dbo].[RefAssessmentGradeLevel] ([RefAssessmentGradeLevel])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentGradeLevel1]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentParticipationIndicator]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentParticipationIndicator] FOREIGN KEY([RefAssessmentParticipationIndicatorId])
REFERENCES [dbo].[RefAssessmentParticipationIndicator] ([RefAssessmentParticipationIndicatorId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentParticipationIndicator]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentPurpose]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentPurpose] FOREIGN KEY([RefAssessmentPurposeId])
REFERENCES [dbo].[RefAssessmentPurpose] ([RefAssessmentPurposeId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentPurpose]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentReasonNotCompleting]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentReasonNotCompleting] FOREIGN KEY([RefAssessmentReasonNotCompletingId])
REFERENCES [dbo].[RefAssessmentReasonNotCompleting] ([RefAssessmentReasonNotCompletingId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentReasonNotCompleting]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefAssessmentReasonNotTested]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefAssessmentReasonNotTested] FOREIGN KEY([RefAssessmentReasonNotTestedId])
REFERENCES [dbo].[RefAssessmentReasonNotTested] ([RefAssessmentReasonNotTestedId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefAssessmentReasonNotTested]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefOrganization1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefOrganization1] FOREIGN KEY([SchoolOrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefOrganization1]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefOrganization2]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefOrganization2] FOREIGN KEY([LeaOrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration] CHECK CONSTRAINT [FK_AssessmentRegistration_RefOrganization2]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_RefRefAssessmentAccommodation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_RefRefAssessmentAccommodation] FOREIGN KEY([RefAssessmentAccommodationTypeId])
REFERENCES [dbo].[RefAssessmentAccommodationType] ([RefAssessmentAccommodationTypeId])
GO
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation] CHECK CONSTRAINT [FK_AssessmentRegistration_RefRefAssessmentAccommodation]
GO
/****** Object:  ForeignKey [FK_AssessmentRegistration_Registration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentRegistration_Registration] FOREIGN KEY([AssessmentRegistrationId])
REFERENCES [dbo].[AssessmentRegistration] ([AssessmentRegistrationId])
GO
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation] CHECK CONSTRAINT [FK_AssessmentRegistration_Registration]
GO
/****** Object:  ForeignKey [FK_AssessReg_Accommodation _RefAssessmentAccommodationCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_AssessReg_Accommodation _RefAssessmentAccommodationCategory] FOREIGN KEY([RefAssessmentAccommodationCategoryId])
REFERENCES [dbo].[RefAssessmentAccommodationCategory] ([RefAssessmentAccommodationCategoryId])
GO
ALTER TABLE [dbo].[AssessmentRegistration_Accommodation] CHECK CONSTRAINT [FK_AssessReg_Accommodation _RefAssessmentAccommodationCategory]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_AssessmentRegistration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_AssessmentRegistration] FOREIGN KEY([AssessmentRegistrationId])
REFERENCES [dbo].[AssessmentRegistration] ([AssessmentRegistrationId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_AssessmentRegistration]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_FormSubTest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_FormSubTest] FOREIGN KEY([AssessmentFormSubtestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_FormSubTest]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_RefAssessmentPretestOutcome]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_RefAssessmentPretestOutcome] FOREIGN KEY([RefAssessmentPretestOutcomeId])
REFERENCES [dbo].[RefAssessmentPretestOutcome] ([RefAssessmentPretestOutcomeId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_RefAssessmentPretestOutcome]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_RefELOutcomeMeasurement]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_RefELOutcomeMeasurement] FOREIGN KEY([RefELOutcomeMeasurementLevelId])
REFERENCES [dbo].[RefELOutcomeMeasurementLevel] ([RefELOutcomeMeasurementLevelId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_RefELOutcomeMeasurement]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_RefOutcomeTimePoint]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_RefOutcomeTimePoint] FOREIGN KEY([RefOutcomeTimePointId])
REFERENCES [dbo].[RefOutcomeTimePoint] ([RefOutcomeTimePointId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_RefOutcomeTimePoint]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_RefScoreMetricType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_RefScoreMetricType] FOREIGN KEY([RefScoreMetricTypeId])
REFERENCES [dbo].[RefScoreMetricType] ([RefScoreMetricTypeId])
GO
ALTER TABLE [dbo].[AssessmentResult] CHECK CONSTRAINT [FK_AssessmentResult_RefScoreMetricType]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_PerformanceLevel_AssessmentPerformanceLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult_PerformanceLevel]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_PerformanceLevel_AssessmentPerformanceLevel] FOREIGN KEY([AssessmentPerformanceLevelId])
REFERENCES [dbo].[AssessmentPerformanceLevel] ([AssessmentPerformanceLevelId])
GO
ALTER TABLE [dbo].[AssessmentResult_PerformanceLevel] CHECK CONSTRAINT [FK_AssessmentResult_PerformanceLevel_AssessmentPerformanceLevel]
GO
/****** Object:  ForeignKey [FK_AssessmentResult_PerformanceLevel_AssessmentResult]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentResult_PerformanceLevel]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResult_PerformanceLevel_AssessmentResult] FOREIGN KEY([AssessmentResultId])
REFERENCES [dbo].[AssessmentResult] ([AssessmentResultId])
GO
ALTER TABLE [dbo].[AssessmentResult_PerformanceLevel] CHECK CONSTRAINT [FK_AssessmentResult_PerformanceLevel_AssessmentResult]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_AssessmentAdministration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_AssessmentAdministration] FOREIGN KEY([AssessmentAdministrationId])
REFERENCES [dbo].[AssessmentAdministration] ([AssessmentAdministrationId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_AssessmentAdministration]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_Organization] FOREIGN KEY([Lea_OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_Organization]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_Organization1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_Organization1] FOREIGN KEY([School_OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_Organization1]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_Organization2]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_Organization2] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_Organization2]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_RefAssessmentSessionSpecialCircumstance]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_RefAssessmentSessionSpecialCircumstance] FOREIGN KEY([RefAssessmentSessionSpecialCircumstanceTypeId])
REFERENCES [dbo].[RefAssessmentSessionSpecialCircumstanceType] ([RefAssessmentSessionSpecialCircumstanceTypeId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_RefAssessmentSessionSpecialCircumstance]
GO
/****** Object:  ForeignKey [FK_AssessmentSession_RefAssessmentSessionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSession]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSession_RefAssessmentSessionType] FOREIGN KEY([RefAssessmentSessionTypeId])
REFERENCES [dbo].[RefAssessmentSessionType] ([RefAssessmentSessionTypeId])
GO
ALTER TABLE [dbo].[AssessmentSession] CHECK CONSTRAINT [FK_AssessmentSession_RefAssessmentSessionType]
GO
/****** Object:  ForeignKey [FK_AssessmentSessionStaffRole_AssessmentParticipantSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSessionStaffRole]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSessionStaffRole_AssessmentParticipantSession] FOREIGN KEY([AssessmentParticipantSessionId])
REFERENCES [dbo].[AssessmentParticipantSession] ([AssessmentParticipantSessionId])
GO
ALTER TABLE [dbo].[AssessmentSessionStaffRole] CHECK CONSTRAINT [FK_AssessmentSessionStaffRole_AssessmentParticipantSession]
GO
/****** Object:  ForeignKey [FK_AssessmentSessionStaffRole_AssessmentSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSessionStaffRole]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSessionStaffRole_AssessmentSession] FOREIGN KEY([AssessmentSessionId])
REFERENCES [dbo].[AssessmentSession] ([AssessmentSessionId])
GO
ALTER TABLE [dbo].[AssessmentSessionStaffRole] CHECK CONSTRAINT [FK_AssessmentSessionStaffRole_AssessmentSession]
GO
/****** Object:  ForeignKey [FK_AssessmentSessionStaffRole_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSessionStaffRole]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSessionStaffRole_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[AssessmentSessionStaffRole] CHECK CONSTRAINT [FK_AssessmentSessionStaffRole_Person]
GO
/****** Object:  ForeignKey [FK_AssessmentSessionStaffRole_RefAssessmentSessionStaffRoleType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSessionStaffRole]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSessionStaffRole_RefAssessmentSessionStaffRoleType] FOREIGN KEY([RefAssessmentSessionStaffRoleTypeId])
REFERENCES [dbo].[RefAssessmentSessionStaffRoleType] ([RefAssessmentSessionStaffRoleTypeId])
GO
ALTER TABLE [dbo].[AssessmentSessionStaffRole] CHECK CONSTRAINT [FK_AssessmentSessionStaffRole_RefAssessmentSessionStaffRoleType]
GO
/****** Object:  ForeignKey [FK_AssessmentSubTest_AssessmentForm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubTest_AssessmentForm] FOREIGN KEY([AssessmentFormId])
REFERENCES [dbo].[AssessmentForm] ([AssessmentFormId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_AssessmentSubTest_AssessmentForm]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtest_RefAssessmentPurpose]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtest_RefAssessmentPurpose] FOREIGN KEY([RefAssessmentPurposeId])
REFERENCES [dbo].[RefAssessmentPurpose] ([RefAssessmentPurposeId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_AssessmentSubtest_RefAssessmentPurpose]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtest_RefAssessSubtestIdentifierType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtest_RefAssessSubtestIdentifierType] FOREIGN KEY([RefAssessmentSubtestIdentifierTypeId])
REFERENCES [dbo].[RefAssessmentSubtestIdentifierType] ([RefAssessmentSubtestIdentifierTypeId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_AssessmentSubtest_RefAssessSubtestIdentifierType]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtest_RefContentStandardType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtest_RefContentStandardType] FOREIGN KEY([RefContentStandardTypeId])
REFERENCES [dbo].[RefContentStandardType] ([RefContentStandardTypeId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_AssessmentSubtest_RefContentStandardType]
GO
/****** Object:  ForeignKey [FK_FormSubTest_FormSubTest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_FormSubTest_FormSubTest] FOREIGN KEY([ChildOf_AssessmentFormSubTestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_FormSubTest_FormSubTest]
GO
/****** Object:  ForeignKey [FK_FormSubTest_RefAcademicSubject]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest]  WITH CHECK ADD  CONSTRAINT [FK_FormSubTest_RefAcademicSubject] FOREIGN KEY([RefAcademicSubjectId])
REFERENCES [dbo].[RefAcademicSubject] ([RefAcademicSubjectId])
GO
ALTER TABLE [dbo].[AssessmentSubtest] CHECK CONSTRAINT [FK_FormSubTest_RefAcademicSubject]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtestAI_AssessmentItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest_AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtestAI_AssessmentItem] FOREIGN KEY([AssessmentItemId])
REFERENCES [dbo].[AssessmentItem] ([AssessmentItemId])
GO
ALTER TABLE [dbo].[AssessmentSubtest_AssessmentItem] CHECK CONSTRAINT [FK_AssessmentSubtestAI_AssessmentItem]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtestItems_AssessmentSubTest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest_AssessmentItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtestItems_AssessmentSubTest] FOREIGN KEY([AssessmentSubtestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentSubtest_AssessmentItem] CHECK CONSTRAINT [FK_AssessmentSubtestItems_AssessmentSubTest]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtestLearningStandardItem_AssessmentSubtest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest_LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtestLearningStandardItem_AssessmentSubtest] FOREIGN KEY([AssessmentSubtestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentSubtest_LearningStandardItem] CHECK CONSTRAINT [FK_AssessmentSubtestLearningStandardItem_AssessmentSubtest]
GO
/****** Object:  ForeignKey [FK_AssessmentSubTestLearningStandardItem_LearningStandardItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtest_LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubTestLearningStandardItem_LearningStandardItem] FOREIGN KEY([LearningStandardItemId])
REFERENCES [dbo].[LearningStandardItem] ([LearningStandardItemId])
GO
ALTER TABLE [dbo].[AssessmentSubtest_LearningStandardItem] CHECK CONSTRAINT [FK_AssessmentSubTestLearningStandardItem_LearningStandardItem]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtestLevelsForWhichDesigned_AssessmentSubtest]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtestLevelsForWhichDesigned]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtestLevelsForWhichDesigned_AssessmentSubtest] FOREIGN KEY([AssessmentSubTestId])
REFERENCES [dbo].[AssessmentSubtest] ([AssessmentSubtestId])
GO
ALTER TABLE [dbo].[AssessmentSubtestLevelsForWhichDesigned] CHECK CONSTRAINT [FK_AssessmentSubtestLevelsForWhichDesigned_AssessmentSubtest]
GO
/****** Object:  ForeignKey [FK_AssessmentSubtestLevelsForWhichDesigned_RefGrade]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[AssessmentSubtestLevelsForWhichDesigned]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSubtestLevelsForWhichDesigned_RefGrade] FOREIGN KEY([RefGradeId])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[AssessmentSubtestLevelsForWhichDesigned] CHECK CONSTRAINT [FK_AssessmentSubtestLevelsForWhichDesigned_RefGrade]
GO
/****** Object:  ForeignKey [FK_Authentication_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Authentication]  WITH CHECK ADD  CONSTRAINT [FK_Authentication_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[Authentication] CHECK CONSTRAINT [FK_Authentication_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_Authorization_Application]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Authorization]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([AplicationId])
GO
ALTER TABLE [dbo].[Authorization] CHECK CONSTRAINT [FK_Authorization_Application]
GO
/****** Object:  ForeignKey [FK_Authorization_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Authorization]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[Authorization] CHECK CONSTRAINT [FK_Authorization_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_Classroom_Location]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Classroom]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Classroom] CHECK CONSTRAINT [FK_Classroom_Location]
GO
/****** Object:  ForeignKey [FK_CompetencyItem_CompetencySet_CompetencySet]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CompetencyItem_CompetencySet]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyItem_CompetencySet_CompetencySet] FOREIGN KEY([CompetencySetId])
REFERENCES [dbo].[CompetencySet] ([CompetencySetId])
GO
ALTER TABLE [dbo].[CompetencyItem_CompetencySet] CHECK CONSTRAINT [FK_CompetencyItem_CompetencySet_CompetencySet]
GO
/****** Object:  ForeignKey [FK_CompetencyItem_CompetencySet_LearningStandardItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CompetencyItem_CompetencySet]  WITH CHECK ADD  CONSTRAINT [FK_CompetencyItem_CompetencySet_LearningStandardItem] FOREIGN KEY([LearningStandardItemId])
REFERENCES [dbo].[LearningStandardItem] ([LearningStandardItemId])
GO
ALTER TABLE [dbo].[CompetencyItem_CompetencySet] CHECK CONSTRAINT [FK_CompetencyItem_CompetencySet_LearningStandardItem]
GO
/****** Object:  ForeignKey [FK_CompetencySet_LearningStandardItemSet]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CompetencySet]  WITH CHECK ADD  CONSTRAINT [FK_CompetencySet_LearningStandardItemSet] FOREIGN KEY([ChildOf_CompetencySet])
REFERENCES [dbo].[CompetencySet] ([CompetencySetId])
GO
ALTER TABLE [dbo].[CompetencySet] CHECK CONSTRAINT [FK_CompetencySet_LearningStandardItemSet]
GO
/****** Object:  ForeignKey [FK_CoreKnowledgeArea_ProfessionalDevelopmentActivity]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CoreKnowledgeArea]  WITH CHECK ADD  CONSTRAINT [FK_CoreKnowledgeArea_ProfessionalDevelopmentActivity] FOREIGN KEY([ProfessionalDevelopmentActivityId])
REFERENCES [dbo].[StaffProfessionalDevelopmentActivity] ([StaffProfessionalDevelopmentActivityId])
GO
ALTER TABLE [dbo].[CoreKnowledgeArea] CHECK CONSTRAINT [FK_CoreKnowledgeArea_ProfessionalDevelopmentActivity]
GO
/****** Object:  ForeignKey [FK_CoreKnowledgeArea_RefCoreKnowledgeArea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CoreKnowledgeArea]  WITH CHECK ADD  CONSTRAINT [FK_CoreKnowledgeArea_RefCoreKnowledgeArea] FOREIGN KEY([RefCoreKnowledgeAreaId])
REFERENCES [dbo].[RefCoreKnowledgeArea] ([RefCoreKnowledgeAreaId])
GO
ALTER TABLE [dbo].[CoreKnowledgeArea] CHECK CONSTRAINT [FK_CoreKnowledgeArea_RefCoreKnowledgeArea]
GO
/****** Object:  ForeignKey [FK_Course_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Organization]
GO
/****** Object:  ForeignKey [FK_Course_RefCourseApplicableEducationLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_RefCourseApplicableEducationLevel] FOREIGN KEY([RefCourseApplicableEducationLevelId])
REFERENCES [dbo].[RefCourseApplicableEducationLevel] ([RefCourseApplicableEducationLevelId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_RefCourseApplicableEducationLevel]
GO
/****** Object:  ForeignKey [FK_Course_RefCourseCreditUnit]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_RefCourseCreditUnit] FOREIGN KEY([RefCourseCreditUnitId])
REFERENCES [dbo].[RefCourseCreditUnit] ([RefCourseCreditUnitId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_RefCourseCreditUnit]
GO
/****** Object:  ForeignKey [FK_Course_RefCourseLevelCharacteristic]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_RefCourseLevelCharacteristic] FOREIGN KEY([RefCourseLevelCharacteristicsId])
REFERENCES [dbo].[RefCourseLevelCharacteristic] ([RefCourseLevelCharacteristicId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_RefCourseLevelCharacteristic]
GO
/****** Object:  ForeignKey [FK_Course_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_RefLanguage] FOREIGN KEY([RefInstructionLanguage])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_RefLanguage]
GO
/****** Object:  ForeignKey [FK_CourseSection_Course]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([OrganizationId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_Course]
GO
/****** Object:  ForeignKey [FK_CourseSection_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_Organization]
GO
/****** Object:  ForeignKey [FK_CourseSection_OrganizationCalendarSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_OrganizationCalendarSession] FOREIGN KEY([OrganizationCalendarSessionId])
REFERENCES [dbo].[OrganizationCalendarSession] ([OrganizationCalendarSessionId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_OrganizationCalendarSession]
GO
/****** Object:  ForeignKey [FK_CourseSection_RefAdvancedPlacementCourseCodeId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_RefAdvancedPlacementCourseCodeId] FOREIGN KEY([RefAdvancedPlacementCourseCodeId])
REFERENCES [dbo].[RefAdvancedPlacementCourseCode] ([RefAdvancedPlacementCourseCodeId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_RefAdvancedPlacementCourseCodeId]
GO
/****** Object:  ForeignKey [FK_CourseSection_RefCourseSectionDeliveryMode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_RefCourseSectionDeliveryMode] FOREIGN KEY([RefCourseSectionDeliveryModeId])
REFERENCES [dbo].[RefCourseSectionDeliveryMode] ([RefCourseSectionDeliveryModeId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_RefCourseSectionDeliveryMode]
GO
/****** Object:  ForeignKey [FK_CourseSection_RefCourseSectionSingleSexClassStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_RefCourseSectionSingleSexClassStatus] FOREIGN KEY([RefSingleSexClassStatusId])
REFERENCES [dbo].[RefSingleSexClassStatus] ([RefSingleSexClassStatusId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_RefCourseSectionSingleSexClassStatus]
GO
/****** Object:  ForeignKey [FK_CourseSection_RefCreditTypeEarned]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_RefCreditTypeEarned] FOREIGN KEY([RefCreditTypeEarnedId])
REFERENCES [dbo].[RefCreditTypeEarned] ([RefCreditTypeEarnedId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_RefCreditTypeEarned]
GO
/****** Object:  ForeignKey [FK_CourseSection_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSection]  WITH CHECK ADD  CONSTRAINT [FK_CourseSection_RefLanguage] FOREIGN KEY([RefInstructionLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[CourseSection] CHECK CONSTRAINT [FK_CourseSection_RefLanguage]
GO
/****** Object:  ForeignKey [FK_CourseSectionAssessmentReporting_CourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionAssessmentReporting]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionAssessmentReporting_CourseSection] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[CourseSectionAssessmentReporting] CHECK CONSTRAINT [FK_CourseSectionAssessmentReporting_CourseSection]
GO
/****** Object:  ForeignKey [FK_CourseSectionAssessmentReporting_RefCSAssessmentReportMethod]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionAssessmentReporting]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionAssessmentReporting_RefCSAssessmentReportMethod] FOREIGN KEY([RefCourseSectionAssessmentReportingMethodId])
REFERENCES [dbo].[RefCourseSectionAssessmentReportingMethod] ([RefCourseSectionAssessmentReportingMethodId])
GO
ALTER TABLE [dbo].[CourseSectionAssessmentReporting] CHECK CONSTRAINT [FK_CourseSectionAssessmentReporting_RefCSAssessmentReportMethod]
GO
/****** Object:  ForeignKey [FK_CourseSectionLocation_Classroom]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionLocation]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionLocation_Classroom] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Classroom] ([LocationId])
GO
ALTER TABLE [dbo].[CourseSectionLocation] CHECK CONSTRAINT [FK_CourseSectionLocation_Classroom]
GO
/****** Object:  ForeignKey [FK_CourseSectionLocation_CourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionLocation]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionLocation_CourseSection] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[CourseSectionLocation] CHECK CONSTRAINT [FK_CourseSectionLocation_CourseSection]
GO
/****** Object:  ForeignKey [FK_CourseSectionLocation_RefInstructionLocationType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionLocation]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionLocation_RefInstructionLocationType] FOREIGN KEY([RefInstuctionLocationTypeId])
REFERENCES [dbo].[RefInstructionLocationType] ([RefInstuctionLocationTypeId])
GO
ALTER TABLE [dbo].[CourseSectionLocation] CHECK CONSTRAINT [FK_CourseSectionLocation_RefInstructionLocationType]
GO
/****** Object:  ForeignKey [FK_CourseSectionSchedule_CourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CourseSectionSchedule]  WITH CHECK ADD  CONSTRAINT [FK_CourseSectionSchedule_CourseSection] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[CourseSectionSchedule] CHECK CONSTRAINT [FK_CourseSectionSchedule_CourseSection]
GO
/****** Object:  ForeignKey [FK_CteCourse_Course]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_Course] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Course] ([OrganizationId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_Course]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefAdditionalCreditType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefAdditionalCreditType] FOREIGN KEY([RefAdditionalCreditTypeId])
REFERENCES [dbo].[RefAdditionalCreditType] ([RefAdditionalCreditTypeId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefAdditionalCreditType]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefCareerCluster]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefCareerCluster] FOREIGN KEY([RefCareerClusterId])
REFERENCES [dbo].[RefCareerCluster] ([RefCareerClusterId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefCareerCluster]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefCourseGpaApplicability]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefCourseGpaApplicability] FOREIGN KEY([RefCourseGpaApplicabilityId])
REFERENCES [dbo].[RefCourseGpaApplicability] ([RefCourseGPAApplicabilityId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefCourseGpaApplicability]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefCreditTypeEarned]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefCreditTypeEarned] FOREIGN KEY([RefCreditTypeEarnedId])
REFERENCES [dbo].[RefCreditTypeEarned] ([RefCreditTypeEarnedId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefCreditTypeEarned]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefCurriculumFrameworkType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefCurriculumFrameworkType] FOREIGN KEY([RefCurriculumFrameworkTypeId])
REFERENCES [dbo].[RefCurriculumFrameworkType] ([RefCurriculumFrameworkTypeId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefCurriculumFrameworkType]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefSCEDCourseLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefSCEDCourseLevel] FOREIGN KEY([RefSCEDCourseLevelId])
REFERENCES [dbo].[RefSCEDCourseLevel] ([RefSCEDCourseLevelId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefSCEDCourseLevel]
GO
/****** Object:  ForeignKey [FK_CteCourse_RefSCEDCourseSubjectArea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteCourse]  WITH CHECK ADD  CONSTRAINT [FK_CteCourse_RefSCEDCourseSubjectArea] FOREIGN KEY([RefSCEDCourseSubjectAreaId])
REFERENCES [dbo].[RefSCEDCourseSubjectArea] ([RefSCEDCourseSubjectAreaId])
GO
ALTER TABLE [dbo].[CteCourse] CHECK CONSTRAINT [FK_CteCourse_RefSCEDCourseSubjectArea]
GO
/****** Object:  ForeignKey [FK_CteStudentAcademicRecord_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_CteStudentAcademicRecord_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[CteStudentAcademicRecord] CHECK CONSTRAINT [FK_CteStudentAcademicRecord_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_CteStudentAcademicRecord_RefProfessionalTechnicalCredential]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[CteStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_CteStudentAcademicRecord_RefProfessionalTechnicalCredential] FOREIGN KEY([RefProfessionalTechnicalCredentialTypeId])
REFERENCES [dbo].[RefProfessionalTechnicalCredentialType] ([RefProfessionalTechnicalCredentialTypeId])
GO
ALTER TABLE [dbo].[CteStudentAcademicRecord] CHECK CONSTRAINT [FK_CteStudentAcademicRecord_RefProfessionalTechnicalCredential]
GO
/****** Object:  ForeignKey [FK_DisciplineMethodFirearm_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[DisciplineMethodFirearm]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineMethodFirearm_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[DisciplineMethodFirearm] CHECK CONSTRAINT [FK_DisciplineMethodFirearm_K12School]
GO
/****** Object:  ForeignKey [FK_DisciplineMethodFirearm_RefDisciplineMethodFirearms]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[DisciplineMethodFirearm]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineMethodFirearm_RefDisciplineMethodFirearms] FOREIGN KEY([RefDisciplineMethodFirearmsId])
REFERENCES [dbo].[RefDisciplineMethodFirearms] ([RefDisciplineMethodFirearmsId])
GO
ALTER TABLE [dbo].[DisciplineMethodFirearm] CHECK CONSTRAINT [FK_DisciplineMethodFirearm_RefDisciplineMethodFirearms]
GO
/****** Object:  ForeignKey [FK_DisciplineMethodOfCWD_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[DisciplineMethodOfCwd]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineMethodOfCWD_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[DisciplineMethodOfCwd] CHECK CONSTRAINT [FK_DisciplineMethodOfCWD_K12School]
GO
/****** Object:  ForeignKey [FK_DisciplineMethodOfCWD_RefDisciplineMethodOfCWD]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[DisciplineMethodOfCwd]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineMethodOfCWD_RefDisciplineMethodOfCWD] FOREIGN KEY([RefDisciplineMethodOfCwdId])
REFERENCES [dbo].[RefDisciplineMethodOfCwd] ([RefDisciplineMethodOfCwdId])
GO
ALTER TABLE [dbo].[DisciplineMethodOfCwd] CHECK CONSTRAINT [FK_DisciplineMethodOfCWD_RefDisciplineMethodOfCWD]
GO
/****** Object:  ForeignKey [FK_EarlyChildhoodCredential_PersonCredential]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[EarlyChildhoodCredential]  WITH CHECK ADD  CONSTRAINT [FK_EarlyChildhoodCredential_PersonCredential] FOREIGN KEY([PersonCredentialId])
REFERENCES [dbo].[PersonCredential] ([PersonCredentialId])
GO
ALTER TABLE [dbo].[EarlyChildhoodCredential] CHECK CONSTRAINT [FK_EarlyChildhoodCredential_PersonCredential]
GO
/****** Object:  ForeignKey [FK_EarlyChildhoodCredential_RefEarlyChildhoodCredential]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[EarlyChildhoodCredential]  WITH CHECK ADD  CONSTRAINT [FK_EarlyChildhoodCredential_RefEarlyChildhoodCredential] FOREIGN KEY([RefEarlyChildhoodCredentialId])
REFERENCES [dbo].[RefEarlyChildhoodCredential] ([RefEarlyChildhoodCredentialId])
GO
ALTER TABLE [dbo].[EarlyChildhoodCredential] CHECK CONSTRAINT [FK_EarlyChildhoodCredential_RefEarlyChildhoodCredential]
GO
/****** Object:  ForeignKey [FK_EarlyChildhoodProgramTypeOffered_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[EarlyChildhoodProgramTypeOffered]  WITH CHECK ADD  CONSTRAINT [FK_EarlyChildhoodProgramTypeOffered_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[EarlyChildhoodProgramTypeOffered] CHECK CONSTRAINT [FK_EarlyChildhoodProgramTypeOffered_Organization]
GO
/****** Object:  ForeignKey [FK_ECProgramTypeOffered_RefEarlyChildhoodProgramType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[EarlyChildhoodProgramTypeOffered]  WITH CHECK ADD  CONSTRAINT [FK_ECProgramTypeOffered_RefEarlyChildhoodProgramType] FOREIGN KEY([RefEarlyChildhoodProgramTypeId])
REFERENCES [dbo].[RefEarlyChildhoodProgramType] ([RefEarlyChildhoodProgramTypeId])
GO
ALTER TABLE [dbo].[EarlyChildhoodProgramTypeOffered] CHECK CONSTRAINT [FK_ECProgramTypeOffered_RefEarlyChildhoodProgramType]
GO
/****** Object:  ForeignKey [FK_ELChildDemographic_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildDemographic]  WITH CHECK ADD  CONSTRAINT [FK_ELChildDemographic_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[ELChildDemographic] CHECK CONSTRAINT [FK_ELChildDemographic_Person]
GO
/****** Object:  ForeignKey [FK_ELChildIDEA_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildIDEA]  WITH CHECK ADD  CONSTRAINT [FK_ELChildIDEA_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[ELChildIDEA] CHECK CONSTRAINT [FK_ELChildIDEA_Person]
GO
/****** Object:  ForeignKey [FK_ELChildIDEA_RefIDEAIEPStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildIDEA]  WITH CHECK ADD  CONSTRAINT [FK_ELChildIDEA_RefIDEAIEPStatus] FOREIGN KEY([RefIDEAIEPStatusId])
REFERENCES [dbo].[RefIDEAIEPStatus] ([RefIDEAIEPStatusId])
GO
ALTER TABLE [dbo].[ELChildIDEA] CHECK CONSTRAINT [FK_ELChildIDEA_RefIDEAIEPStatus]
GO
/****** Object:  ForeignKey [FK_ELChildIDEA_RefReasonDelayTransitionConf]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildIDEA]  WITH CHECK ADD  CONSTRAINT [FK_ELChildIDEA_RefReasonDelayTransitionConf] FOREIGN KEY([RefReasonDelayTransitionConfId])
REFERENCES [dbo].[RefReasonDelayTransitionConf] ([RefReasonDelayTransitionConfId])
GO
ALTER TABLE [dbo].[ELChildIDEA] CHECK CONSTRAINT [FK_ELChildIDEA_RefReasonDelayTransitionConf]
GO
/****** Object:  ForeignKey [FK_ELChildOutcomeSummary_COSRatingA]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildOutcomeSummary]  WITH CHECK ADD  CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingA] FOREIGN KEY([COSRatingAId])
REFERENCES [dbo].[RefChildOutcomesSummaryRating] ([RefChildOutcomesSummaryRatingId])
GO
ALTER TABLE [dbo].[ELChildOutcomeSummary] CHECK CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingA]
GO
/****** Object:  ForeignKey [FK_ELChildOutcomeSummary_COSRatingB]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildOutcomeSummary]  WITH CHECK ADD  CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingB] FOREIGN KEY([COSRatingBId])
REFERENCES [dbo].[RefChildOutcomesSummaryRating] ([RefChildOutcomesSummaryRatingId])
GO
ALTER TABLE [dbo].[ELChildOutcomeSummary] CHECK CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingB]
GO
/****** Object:  ForeignKey [FK_ELChildOutcomeSummary_COSRatingC]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildOutcomeSummary]  WITH CHECK ADD  CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingC] FOREIGN KEY([COSRatingCId])
REFERENCES [dbo].[RefChildOutcomesSummaryRating] ([RefChildOutcomesSummaryRatingId])
GO
ALTER TABLE [dbo].[ELChildOutcomeSummary] CHECK CONSTRAINT [FK_ELChildOutcomeSummary_COSRatingC]
GO
/****** Object:  ForeignKey [FK_ELChildOutcomeSummary_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildOutcomeSummary]  WITH CHECK ADD  CONSTRAINT [FK_ELChildOutcomeSummary_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[ELChildOutcomeSummary] CHECK CONSTRAINT [FK_ELChildOutcomeSummary_Person]
GO
/****** Object:  ForeignKey [FK_ELChildProgramEligibility_OrgPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELChildProgramEligibility]  WITH CHECK ADD  CONSTRAINT [FK_ELChildProgramEligibility_OrgPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ELChildProgramEligibility] CHECK CONSTRAINT [FK_ELChildProgramEligibility_OrgPersonRole]
GO
/****** Object:  ForeignKey [FK_ELClassSection_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSection]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSection_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELClassSection] CHECK CONSTRAINT [FK_ELClassSection_Organization]
GO
/****** Object:  ForeignKey [FK_ELClassSection_RefEnvironmentSetting]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSection]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSection_RefEnvironmentSetting] FOREIGN KEY([RefEnvironmentSettingId])
REFERENCES [dbo].[RefEnvironmentSetting] ([RefEnvironmentSettingId])
GO
ALTER TABLE [dbo].[ELClassSection] CHECK CONSTRAINT [FK_ELClassSection_RefEnvironmentSetting]
GO
/****** Object:  ForeignKey [FK_ELClassSection_RefServiceOption]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSection]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSection_RefServiceOption] FOREIGN KEY([RefServiceOptionId])
REFERENCES [dbo].[RefServiceOption] ([RefServiceOptionId])
GO
ALTER TABLE [dbo].[ELClassSection] CHECK CONSTRAINT [FK_ELClassSection_RefServiceOption]
GO
/****** Object:  ForeignKey [FK_ELClassSectionService_ELClassGroupCurriculumType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSectionService]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSectionService_ELClassGroupCurriculumType] FOREIGN KEY([RefELClassGroupCurriculumTypeId])
REFERENCES [dbo].[RefELClassGroupCurriculumType] ([RefELClassGroupCurriculumTypeId])
GO
ALTER TABLE [dbo].[ELClassSectionService] CHECK CONSTRAINT [FK_ELClassSectionService_ELClassGroupCurriculumType]
GO
/****** Object:  ForeignKey [FK_ELClassSectionService_ELClassSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSectionService]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSectionService_ELClassSection] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[ELClassSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELClassSectionService] CHECK CONSTRAINT [FK_ELClassSectionService_ELClassSection]
GO
/****** Object:  ForeignKey [FK_ELClassSectionService_RefECEnrollmentServiceType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSectionService]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSectionService_RefECEnrollmentServiceType] FOREIGN KEY([RefEarlyChildhoodEnrollmentServiceTypeId])
REFERENCES [dbo].[RefEarlyChildhoodEnrollmentServiceType] ([RefEarlyChildhoodEnrollmentServiceTypeId])
GO
ALTER TABLE [dbo].[ELClassSectionService] CHECK CONSTRAINT [FK_ELClassSectionService_RefECEnrollmentServiceType]
GO
/****** Object:  ForeignKey [FK_ELClassSectionService_RefELGroupSizeStandardMet]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSectionService]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSectionService_RefELGroupSizeStandardMet] FOREIGN KEY([RefELGroupSizeStandardMetId])
REFERENCES [dbo].[RefELGroupSizeStandardMet] ([RefELGroupSizeStandardMetId])
GO
ALTER TABLE [dbo].[ELClassSectionService] CHECK CONSTRAINT [FK_ELClassSectionService_RefELGroupSizeStandardMet]
GO
/****** Object:  ForeignKey [FK_ELClassSectionService_RefFrequencyOfServiceId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELClassSectionService]  WITH CHECK ADD  CONSTRAINT [FK_ELClassSectionService_RefFrequencyOfServiceId] FOREIGN KEY([RefFrequencyOfServiceId])
REFERENCES [dbo].[RefFrequencyOfService] ([RefFrequencyOfServiceId])
GO
ALTER TABLE [dbo].[ELClassSectionService] CHECK CONSTRAINT [FK_ELClassSectionService_RefFrequencyOfServiceId]
GO
/****** Object:  ForeignKey [FK_EcProgramEnrollment_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_EcProgramEnrollment_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_EcProgramEnrollment_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_ElEnrollment_ELClassSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ElEnrollment_ELClassSection] FOREIGN KEY([ELClassSectionId])
REFERENCES [dbo].[ELClassSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ElEnrollment_ELClassSection]
GO
/****** Object:  ForeignKey [FK_ElEnrollment_RefELExperience]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ElEnrollment_RefELExperience] FOREIGN KEY([RefELExperienceId])
REFERENCES [dbo].[RefELExperience] ([RefELExperienceId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ElEnrollment_RefELExperience]
GO
/****** Object:  ForeignKey [FK_ELEnrollment_RefELFederalFundingType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ELEnrollment_RefELFederalFundingType] FOREIGN KEY([RefELFederalFundingTypeId])
REFERENCES [dbo].[RefELFederalFundingType] ([RefELFederalFundingTypeId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ELEnrollment_RefELFederalFundingType]
GO
/****** Object:  ForeignKey [FK_ElEnrollment_RefELServiceType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ElEnrollment_RefELServiceType] FOREIGN KEY([RefELServiceType])
REFERENCES [dbo].[RefELServiceType] ([RefELServiceType])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ElEnrollment_RefELServiceType]
GO
/****** Object:  ForeignKey [FK_ElEnrollment_RefFoodServiceParticipation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ElEnrollment_RefFoodServiceParticipation] FOREIGN KEY([RefFoodServiceParticipationId])
REFERENCES [dbo].[RefFoodServiceParticipation] ([RefFoodServiceParticipationId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ElEnrollment_RefFoodServiceParticipation]
GO
/****** Object:  ForeignKey [FK_ElEnrollment_RefIDEAEnvironmentEL]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ElEnrollment_RefIDEAEnvironmentEL] FOREIGN KEY([RefIDEAEnvironmentELId])
REFERENCES [dbo].[RefIDEAEnvironmentEL] ([RefIDEAEnvironmentELId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ElEnrollment_RefIDEAEnvironmentEL]
GO
/****** Object:  ForeignKey [FK_ELEnrollment_RefServiceOption]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_ELEnrollment_RefServiceOption] FOREIGN KEY([RefServiceOptionId])
REFERENCES [dbo].[RefServiceOption] ([RefServiceOptionId])
GO
ALTER TABLE [dbo].[ELEnrollment] CHECK CONSTRAINT [FK_ELEnrollment_RefServiceOption]
GO
/****** Object:  ForeignKey [FK_ELEnrolmentOtherFunding_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELEnrolmentOtherFunding]  WITH CHECK ADD  CONSTRAINT [FK_ELEnrolmentOtherFunding_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[ELEnrolmentOtherFunding] CHECK CONSTRAINT [FK_ELEnrolmentOtherFunding_Person]
GO
/****** Object:  ForeignKey [FK_ELFacilityLicensing_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELFacilityLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELFacilityLicensing_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELFacilityLicensing] CHECK CONSTRAINT [FK_ELFacilityLicensing_Organization]
GO
/****** Object:  ForeignKey [FK_ELFacilityLicensing_RefELFacilityLicensingStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELFacilityLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELFacilityLicensing_RefELFacilityLicensingStatus] FOREIGN KEY([RefELFacilityLicensingStatusId])
REFERENCES [dbo].[RefELFacilityLicensingStatus] ([RefELFacilityLicensingStatusId])
GO
ALTER TABLE [dbo].[ELFacilityLicensing] CHECK CONSTRAINT [FK_ELFacilityLicensing_RefELFacilityLicensingStatus]
GO
/****** Object:  ForeignKey [FK_ELFacilityLicensing_RefLicenseExempt]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELFacilityLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELFacilityLicensing_RefLicenseExempt] FOREIGN KEY([RefLicenseExemptId])
REFERENCES [dbo].[RefLicenseExempt] ([RefLicenseExemptId])
GO
ALTER TABLE [dbo].[ELFacilityLicensing] CHECK CONSTRAINT [FK_ELFacilityLicensing_RefLicenseExempt]
GO
/****** Object:  ForeignKey [FK_ELOrganizationAvailability_Organization1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationAvailability]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationAvailability_Organization1] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELOrganizationAvailability] CHECK CONSTRAINT [FK_ELOrganizationAvailability_Organization1]
GO
/****** Object:  ForeignKey [FK_ELOrganizationAvailability_RefEnvironmentSetting]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationAvailability]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationAvailability_RefEnvironmentSetting] FOREIGN KEY([RefEnvironmentSettingId])
REFERENCES [dbo].[RefEnvironmentSetting] ([RefEnvironmentSettingId])
GO
ALTER TABLE [dbo].[ELOrganizationAvailability] CHECK CONSTRAINT [FK_ELOrganizationAvailability_RefEnvironmentSetting]
GO
/****** Object:  ForeignKey [FK_ELOrganizationAvailability_RefPopulationServed]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationAvailability]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationAvailability_RefPopulationServed] FOREIGN KEY([RefPopulationServedId])
REFERENCES [dbo].[RefPopulationServed] ([RefPopulationServedId])
GO
ALTER TABLE [dbo].[ELOrganizationAvailability] CHECK CONSTRAINT [FK_ELOrganizationAvailability_RefPopulationServed]
GO
/****** Object:  ForeignKey [FK_ELOrganizationAvailability_RefServiceOption]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationAvailability]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationAvailability_RefServiceOption] FOREIGN KEY([RefServiceOptionId])
REFERENCES [dbo].[RefServiceOption] ([RefServiceOptionId])
GO
ALTER TABLE [dbo].[ELOrganizationAvailability] CHECK CONSTRAINT [FK_ELOrganizationAvailability_RefServiceOption]
GO
/****** Object:  ForeignKey [FK_ELOrganizationMonitoring_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationMonitoring]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationMonitoring_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELOrganizationMonitoring] CHECK CONSTRAINT [FK_ELOrganizationMonitoring_Organization]
GO
/****** Object:  ForeignKey [FK_ELOrganizationMonitoring_RefOrganizationMonitoringNotifications]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationMonitoring]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationMonitoring_RefOrganizationMonitoringNotifications] FOREIGN KEY([RefOrganizationMonitoringNotificationsId])
REFERENCES [dbo].[RefOrganizationMonitoringNotifications] ([RefOrganizationMonitoringNotificationsId])
GO
ALTER TABLE [dbo].[ELOrganizationMonitoring] CHECK CONSTRAINT [FK_ELOrganizationMonitoring_RefOrganizationMonitoringNotifications]
GO
/****** Object:  ForeignKey [FK_ELOrganizationMonitoring_RefPurposeOfMonitoringVisit]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELOrganizationMonitoring]  WITH CHECK ADD  CONSTRAINT [FK_ELOrganizationMonitoring_RefPurposeOfMonitoringVisit] FOREIGN KEY([RefPurposeOfMonitoringVisitId])
REFERENCES [dbo].[RefPurposeOfMonitoringVisit] ([RefPurposeOfMonitoringVisitId])
GO
ALTER TABLE [dbo].[ELOrganizationMonitoring] CHECK CONSTRAINT [FK_ELOrganizationMonitoring_RefPurposeOfMonitoringVisit]
GO
/****** Object:  ForeignKey [FK_ELProgramLicensing_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELProgramLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELProgramLicensing_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELProgramLicensing] CHECK CONSTRAINT [FK_ELProgramLicensing_Organization]
GO
/****** Object:  ForeignKey [FK_ELProgramLicensing_RefELProgramLicenseStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELProgramLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELProgramLicensing_RefELProgramLicenseStatus] FOREIGN KEY([RefELProgamLicenseStatusId])
REFERENCES [dbo].[RefELProgramLicenseStatus] ([RefELProgramLicenseStatusId])
GO
ALTER TABLE [dbo].[ELProgramLicensing] CHECK CONSTRAINT [FK_ELProgramLicensing_RefELProgramLicenseStatus]
GO
/****** Object:  ForeignKey [FK_ELProgramLicensing_RefLicenseExempt]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELProgramLicensing]  WITH CHECK ADD  CONSTRAINT [FK_ELProgramLicensing_RefLicenseExempt] FOREIGN KEY([RefLicenseExemptId])
REFERENCES [dbo].[RefLicenseExempt] ([RefLicenseExemptId])
GO
ALTER TABLE [dbo].[ELProgramLicensing] CHECK CONSTRAINT [FK_ELProgramLicensing_RefLicenseExempt]
GO
/****** Object:  ForeignKey [FK_ELQualityInitiative_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELQualityInitiative]  WITH CHECK ADD  CONSTRAINT [FK_ELQualityInitiative_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELQualityInitiative] CHECK CONSTRAINT [FK_ELQualityInitiative_Organization]
GO
/****** Object:  ForeignKey [FK_ELQualityRatingImprovement_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELQualityRatingImprovement]  WITH CHECK ADD  CONSTRAINT [FK_ELQualityRatingImprovement_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ELQualityRatingImprovement] CHECK CONSTRAINT [FK_ELQualityRatingImprovement_Organization]
GO
/****** Object:  ForeignKey [FK_ELQualityRatingImprovement_RefQRISParticipation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELQualityRatingImprovement]  WITH CHECK ADD  CONSTRAINT [FK_ELQualityRatingImprovement_RefQRISParticipation] FOREIGN KEY([RefQrisParticipationId])
REFERENCES [dbo].[RefQrisParticipation] ([RefQrisParticipationId])
GO
ALTER TABLE [dbo].[ELQualityRatingImprovement] CHECK CONSTRAINT [FK_ELQualityRatingImprovement_RefQRISParticipation]
GO
/****** Object:  ForeignKey [FK_ELStaff_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaff]  WITH CHECK ADD  CONSTRAINT [FK_ELStaff_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ELStaff] CHECK CONSTRAINT [FK_ELStaff_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_ELStaff_RefChildDevAssociateType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaff]  WITH CHECK ADD  CONSTRAINT [FK_ELStaff_RefChildDevAssociateType] FOREIGN KEY([RefChildDevelopmentAssociateTypeId])
REFERENCES [dbo].[RefChildDevelopmentAssociateType] ([RefChildDevelopmentAssociateTypeId])
GO
ALTER TABLE [dbo].[ELStaff] CHECK CONSTRAINT [FK_ELStaff_RefChildDevAssociateType]
GO
/****** Object:  ForeignKey [FK_ELStaff_RefEduStaffClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaff]  WITH CHECK ADD  CONSTRAINT [FK_ELStaff_RefEduStaffClassification] FOREIGN KEY([RefEducationStaffClassificationId])
REFERENCES [dbo].[RefEducationStaffClassification] ([RefEducationStaffClassificationId])
GO
ALTER TABLE [dbo].[ELStaff] CHECK CONSTRAINT [FK_ELStaff_RefEduStaffClassification]
GO
/****** Object:  ForeignKey [FK_ELStaffAssignment_OrgPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffAssignment_OrgPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ELStaffAssignment] CHECK CONSTRAINT [FK_ELStaffAssignment_OrgPersonRole]
GO
/****** Object:  ForeignKey [FK_ELStaff_RefELLevelOfSpecialization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEducation]  WITH CHECK ADD  CONSTRAINT [FK_ELStaff_RefELLevelOfSpecialization] FOREIGN KEY([RefELLevelOfSpecializationId])
REFERENCES [dbo].[RefELLevelOfSpecialization] ([RefELLevelOfSpecializationId])
GO
ALTER TABLE [dbo].[ELStaffEducation] CHECK CONSTRAINT [FK_ELStaff_RefELLevelOfSpecialization]
GO
/****** Object:  ForeignKey [FK_ELStaffEducation_ELStaff]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEducation]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEducation_ELStaff] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[ELStaff] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ELStaffEducation] CHECK CONSTRAINT [FK_ELStaffEducation_ELStaff]
GO
/****** Object:  ForeignKey [FK_ELStaffEducation_RefELPDTopicArea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEducation]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEducation_RefELPDTopicArea] FOREIGN KEY([RefELProfessionalDevelopmentTopicAreaId])
REFERENCES [dbo].[RefELProfessionalDevelopmentTopicArea] ([RefELProfessionalDevelopmentTopicAreaId])
GO
ALTER TABLE [dbo].[ELStaffEducation] CHECK CONSTRAINT [FK_ELStaffEducation_RefELPDTopicArea]
GO
/****** Object:  ForeignKey [FK_ELStaffEmployment_RefEduStaffClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEmployment_RefEduStaffClassification] FOREIGN KEY([RefEducationStaffClassificationId])
REFERENCES [dbo].[RefEducationStaffClassification] ([RefEducationStaffClassificationId])
GO
ALTER TABLE [dbo].[ELStaffEmployment] CHECK CONSTRAINT [FK_ELStaffEmployment_RefEduStaffClassification]
GO
/****** Object:  ForeignKey [FK_ELStaffEmployment_RefEmploymentStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEmployment_RefEmploymentStatus] FOREIGN KEY([RefEmploymentStatusId])
REFERENCES [dbo].[RefEmploymentStatus] ([RefEmploymentStatusId])
GO
ALTER TABLE [dbo].[ELStaffEmployment] CHECK CONSTRAINT [FK_ELStaffEmployment_RefEmploymentStatus]
GO
/****** Object:  ForeignKey [FK_ELStaffEmployment_RefWageCollectionMethod]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEmployment_RefWageCollectionMethod] FOREIGN KEY([RefWageCollectionMethodId])
REFERENCES [dbo].[RefWageCollectionMethod] ([RefWageCollectionMethodId])
GO
ALTER TABLE [dbo].[ELStaffEmployment] CHECK CONSTRAINT [FK_ELStaffEmployment_RefWageCollectionMethod]
GO
/****** Object:  ForeignKey [FK_ELStaffEmployment_RefWageVerification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEmployment_RefWageVerification] FOREIGN KEY([RefWageVerificationId])
REFERENCES [dbo].[RefWageVerification] ([RefWageVerificationId])
GO
ALTER TABLE [dbo].[ELStaffEmployment] CHECK CONSTRAINT [FK_ELStaffEmployment_RefWageVerification]
GO
/****** Object:  ForeignKey [FK_ELStaffEmployment_StaffEmployment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[ELStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_ELStaffEmployment_StaffEmployment] FOREIGN KEY([StaffEmploymentId])
REFERENCES [dbo].[StaffEmployment] ([StaffEmploymentId])
GO
ALTER TABLE [dbo].[ELStaffEmployment] CHECK CONSTRAINT [FK_ELStaffEmployment_StaffEmployment]
GO
/****** Object:  ForeignKey [FK_Facility_Location]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_Location]
GO
/****** Object:  ForeignKey [FK_Facility_RefBuildingUseType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_RefBuildingUseType] FOREIGN KEY([RefBuildingUseTypeId])
REFERENCES [dbo].[RefBuildingUseType] ([RefBuildingUseTypeId])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_RefBuildingUseType]
GO
/****** Object:  ForeignKey [FK_Facility_RefSpaceUseType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_RefSpaceUseType] FOREIGN KEY([RefSpaceUseTypeId])
REFERENCES [dbo].[RefSpaceUseType] ([RefSpaceUseTypeId])
GO
ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_RefSpaceUseType]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialAccountCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialAccountCategory] FOREIGN KEY([RefFinancialAccountCategoryId])
REFERENCES [dbo].[RefFinancialAccountCategory] ([RefFinancialAccountCategoryId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialAccountCategory]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialAccountFundClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialAccountFundClassification] FOREIGN KEY([RefFinancialAccountFundClassificationId])
REFERENCES [dbo].[RefFinancialAccountFundClassification] ([RefFinancialAccountFundClassificationId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialAccountFundClassification]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialAccountProgramCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialAccountProgramCode] FOREIGN KEY([RefFinancialAccountProgramCodeId])
REFERENCES [dbo].[RefFinancialAccountProgramCode] ([RefFinancialAccountProgramCodeId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialAccountProgramCode]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialBalanceSheetAccountCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialBalanceSheetAccountCode] FOREIGN KEY([RefFinancialBalanceSheetAccountCodeId])
REFERENCES [dbo].[RefFinancialBalanceSheetAccountCode] ([RefFinancialBalanceSheetAccountCodeId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialBalanceSheetAccountCode]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialExpenditureFunctionCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialExpenditureFunctionCode] FOREIGN KEY([RefFinancialExpenditureFunctionCodeId])
REFERENCES [dbo].[RefFinancialExpenditureFunctionCode] ([RefFinancialExpenditureFunctionCodeId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialExpenditureFunctionCode]
GO
/****** Object:  ForeignKey [FK_FinancialAccount_RefFinancialExpenditureObjectCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAccount]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAccount_RefFinancialExpenditureObjectCode] FOREIGN KEY([RefFinancialExpenditureObjectCodeId])
REFERENCES [dbo].[RefFinancialExpenditureObjectCode] ([RefFinancialExpenditureObjectCodeId])
GO
ALTER TABLE [dbo].[FinancialAccount] CHECK CONSTRAINT [FK_FinancialAccount_RefFinancialExpenditureObjectCode]
GO
/****** Object:  ForeignKey [FK_FinancialAidApplication_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAidApplication]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAidApplication_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[FinancialAidApplication] CHECK CONSTRAINT [FK_FinancialAidApplication_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_FinancialAidApplication_RefFinancialAidApplType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAidApplication]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAidApplication_RefFinancialAidApplType] FOREIGN KEY([RefFinancialAidApplicationTypeId])
REFERENCES [dbo].[RefFinancialAidApplicationType] ([RefFinancialAidApplicationTypeId])
GO
ALTER TABLE [dbo].[FinancialAidApplication] CHECK CONSTRAINT [FK_FinancialAidApplication_RefFinancialAidApplType]
GO
/****** Object:  ForeignKey [FK_FinancialAidAward_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAidAward]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAidAward_OrganizationPersonRole] FOREIGN KEY([OrganzationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[FinancialAidAward] CHECK CONSTRAINT [FK_FinancialAidAward_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_FinancialAidAward_RefFinancialAidAwardStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAidAward]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAidAward_RefFinancialAidAwardStatus] FOREIGN KEY([RefFinancialAidStatusId])
REFERENCES [dbo].[RefFinancialAidAwardStatus] ([RefFinancialAidStatusId])
GO
ALTER TABLE [dbo].[FinancialAidAward] CHECK CONSTRAINT [FK_FinancialAidAward_RefFinancialAidAwardStatus]
GO
/****** Object:  ForeignKey [FK_FinancialAidAward_RefFinancialAidAwardType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[FinancialAidAward]  WITH CHECK ADD  CONSTRAINT [FK_FinancialAidAward_RefFinancialAidAwardType] FOREIGN KEY([RefFinancialAidAwardTypeId])
REFERENCES [dbo].[RefFinancialAidAwardType] ([RefFinancialAidAwardTypeId])
GO
ALTER TABLE [dbo].[FinancialAidAward] CHECK CONSTRAINT [FK_FinancialAidAward_RefFinancialAidAwardType]
GO
/****** Object:  ForeignKey [FK_IDEADisciplineMethodFirearm_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IDEADisciplineMethodFirearm]  WITH CHECK ADD  CONSTRAINT [FK_IDEADisciplineMethodFirearm_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[IDEADisciplineMethodFirearm] CHECK CONSTRAINT [FK_IDEADisciplineMethodFirearm_K12School]
GO
/****** Object:  ForeignKey [FK_IDEADisciplineMethodFirearm_RefIDEADisciplineMethodFirearm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IDEADisciplineMethodFirearm]  WITH CHECK ADD  CONSTRAINT [FK_IDEADisciplineMethodFirearm_RefIDEADisciplineMethodFirearm] FOREIGN KEY([RefIDEADisciplineMethodFirearmId])
REFERENCES [dbo].[RefIDEADisciplineMethodFirearm] ([RefIDEADisciplineMethodFirearmId])
GO
ALTER TABLE [dbo].[IDEADisciplineMethodFirearm] CHECK CONSTRAINT [FK_IDEADisciplineMethodFirearm_RefIDEADisciplineMethodFirearm]
GO
/****** Object:  ForeignKey [FK_Incident_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_Incident_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Person] FOREIGN KEY([IncidentReporterId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Person]
GO
/****** Object:  ForeignKey [FK_Incident_RefFirearmType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefFirearmType] FOREIGN KEY([RefFirearmTypeId])
REFERENCES [dbo].[RefFirearmType] ([RefFirearmTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefFirearmType]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentInjuryType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentInjuryType] FOREIGN KEY([RefIncidentInjuryTypeId])
REFERENCES [dbo].[RefIncidentInjuryType] ([RefIncidentInjuryTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentInjuryType]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentLocation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentLocation] FOREIGN KEY([RefIncidentLocationId])
REFERENCES [dbo].[RefIncidentLocation] ([RefIncidentLocationId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentLocation]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentMultipleOffenseType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentMultipleOffenseType] FOREIGN KEY([RefIncidentMultipleOffenseTypeId])
REFERENCES [dbo].[RefIncidentMultipleOffenseType] ([RefIncidentMultipleOffenseTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentMultipleOffenseType]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentPerpetratorInjuryType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentPerpetratorInjuryType] FOREIGN KEY([RefIncidentPerpetratorInjuryTypeId])
REFERENCES [dbo].[RefIncidentPerpetratorInjuryType] ([RefIncidentPerpetratorInjuryTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentPerpetratorInjuryType]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentReporterType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentReporterType] FOREIGN KEY([RefIncidentReporterTypeId])
REFERENCES [dbo].[RefIncidentReporterType] ([RefIncidentReporterTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentReporterType]
GO
/****** Object:  ForeignKey [FK_Incident_RefIncidentTimeDescriptionCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefIncidentTimeDescriptionCode] FOREIGN KEY([RefIncidentTimeDesciptionCodeId])
REFERENCES [dbo].[RefIncidentTimeDescriptionCode] ([RefIncidentTimeDesciptionCodeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefIncidentTimeDescriptionCode]
GO
/****** Object:  ForeignKey [FK_Incident_RefRefIncidentBehavior]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefRefIncidentBehavior] FOREIGN KEY([RefIncidentBehaviorId])
REFERENCES [dbo].[RefIncidentBehavior] ([RefIncidentBehaviorId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefRefIncidentBehavior]
GO
/****** Object:  ForeignKey [FK_Incident_RefRefIncidentBehaviorSecondary]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefRefIncidentBehaviorSecondary] FOREIGN KEY([RefIncidentBehaviorSecondaryId])
REFERENCES [dbo].[RefIncidentBehaviorSecondary] ([RefIncidentBehaviorSecondaryId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefRefIncidentBehaviorSecondary]
GO
/****** Object:  ForeignKey [FK_Incident_RefWeaponType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_RefWeaponType] FOREIGN KEY([RefWeaponTypeId])
REFERENCES [dbo].[RefWeaponType] ([RefWeaponTypeId])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_RefWeaponType]
GO
/****** Object:  ForeignKey [FK_IncidentPerson_Incident]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IncidentPerson]  WITH CHECK ADD  CONSTRAINT [FK_IncidentPerson_Incident] FOREIGN KEY([IncidentId])
REFERENCES [dbo].[Incident] ([IncidentId])
GO
ALTER TABLE [dbo].[IncidentPerson] CHECK CONSTRAINT [FK_IncidentPerson_Incident]
GO
/****** Object:  ForeignKey [FK_IncidentPerson_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IncidentPerson]  WITH CHECK ADD  CONSTRAINT [FK_IncidentPerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[IncidentPerson] CHECK CONSTRAINT [FK_IncidentPerson_Person]
GO
/****** Object:  ForeignKey [FK_IncidentPerson_RefIncidentPersonRoleType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IncidentPerson]  WITH CHECK ADD  CONSTRAINT [FK_IncidentPerson_RefIncidentPersonRoleType] FOREIGN KEY([RefIncidentPersonRoleTypeId])
REFERENCES [dbo].[RefIncidentPersonRoleType] ([RefIncidentPersonRoleTypeId])
GO
ALTER TABLE [dbo].[IncidentPerson] CHECK CONSTRAINT [FK_IncidentPerson_RefIncidentPersonRoleType]
GO
/****** Object:  ForeignKey [FK_IncidentPerson_RefIncidentPersonType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IncidentPerson]  WITH CHECK ADD  CONSTRAINT [FK_IncidentPerson_RefIncidentPersonType] FOREIGN KEY([RefIncidentPersonTypeId])
REFERENCES [dbo].[RefIncidentPersonType] ([RefIncidentPersonTypeId])
GO
ALTER TABLE [dbo].[IncidentPerson] CHECK CONSTRAINT [FK_IncidentPerson_RefIncidentPersonType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_RefIndividualizedProgramType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_RefIndividualizedProgramType] FOREIGN KEY([RefIndividualizedProgramTypeId])
REFERENCES [dbo].[RefIndividualizedProgramType] ([RefIndividualizedProgramTypeId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_RefIndividualizedProgramType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_RefIndivProgramDateType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramDateType] FOREIGN KEY([RefIndividualizedProgramDateType])
REFERENCES [dbo].[RefIndividualizedProgramDateType] ([RefIndividualizedProgramDateTypeId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramDateType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_RefIndivProgramLocation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramLocation] FOREIGN KEY([RefIndividualizedProgramLocationId])
REFERENCES [dbo].[RefIndividualizedProgramLocation] ([RefIndividualizedProgramLocationId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramLocation]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_RefIndivProgramTransitionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramTransitionType] FOREIGN KEY([RefIndividualizedProgramTransitionTypeId])
REFERENCES [dbo].[RefIndividualizedProgramTransitionType] ([RefIndividualizedProgramTransitionTypeId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_RefIndivProgramTransitionType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgram_RefStudentSupportServiceType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgram]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgram_RefStudentSupportServiceType] FOREIGN KEY([RefStudentSupportServiceTypeId])
REFERENCES [dbo].[RefStudentSupportServiceType] ([RefStudentSupportServiceTypeId])
GO
ALTER TABLE [dbo].[IndividualizedProgram] CHECK CONSTRAINT [FK_IndividualizedProgram_RefStudentSupportServiceType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgramService_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgramService]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgramService_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[IndividualizedProgramService] CHECK CONSTRAINT [FK_IndividualizedProgramService_Person]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgramService_RefIndividualizedProgramPlannedServiceType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgramService]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgramService_RefIndividualizedProgramPlannedServiceType] FOREIGN KEY([RefIndividualizedProgramPlannedServiceTypeId])
REFERENCES [dbo].[RefIndividualizedProgramPlannedServiceType] ([RefIndividualizedProgramPlannedServiceTypeId])
GO
ALTER TABLE [dbo].[IndividualizedProgramService] CHECK CONSTRAINT [FK_IndividualizedProgramService_RefIndividualizedProgramPlannedServiceType]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgramService_RefMethodOfServiceDelivery]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgramService]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgramService_RefMethodOfServiceDelivery] FOREIGN KEY([RefMethodOfServiceDeliveryId])
REFERENCES [dbo].[RefMethodOfServiceDelivery] ([RefMethodOfServiceDeliveryId])
GO
ALTER TABLE [dbo].[IndividualizedProgramService] CHECK CONSTRAINT [FK_IndividualizedProgramService_RefMethodOfServiceDelivery]
GO
/****** Object:  ForeignKey [FK_IndividualizedProgramService_RefServiceFrequency]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[IndividualizedProgramService]  WITH CHECK ADD  CONSTRAINT [FK_IndividualizedProgramService_RefServiceFrequency] FOREIGN KEY([RefServiceFrequencyId])
REFERENCES [dbo].[RefServiceFrequency] ([RefServiceFrequencyId])
GO
ALTER TABLE [dbo].[IndividualizedProgramService] CHECK CONSTRAINT [FK_IndividualizedProgramService_RefServiceFrequency]
GO
/****** Object:  ForeignKey [FK_K12Course_Course]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_Course] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Course] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_Course]
GO
/****** Object:  ForeignKey [FK_K12Course_RefAdditionalCreditType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefAdditionalCreditType] FOREIGN KEY([RefAdditionalCreditTypeId])
REFERENCES [dbo].[RefAdditionalCreditType] ([RefAdditionalCreditTypeId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefAdditionalCreditType]
GO
/****** Object:  ForeignKey [FK_K12Course_RefBlendedLearningModel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefBlendedLearningModel] FOREIGN KEY([RefBlendedLearningModelTypeId])
REFERENCES [dbo].[RefBlendedLearningModelType] ([RefBlendedLearningModelTypeId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefBlendedLearningModel]
GO
/****** Object:  ForeignKey [FK_K12Course_RefCareerCluster]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefCareerCluster] FOREIGN KEY([RefCareerClusterId])
REFERENCES [dbo].[RefCareerCluster] ([RefCareerClusterId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefCareerCluster]
GO
/****** Object:  ForeignKey [FK_K12Course_RefCourseGPAApplicability]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefCourseGPAApplicability] FOREIGN KEY([RefCourseGpaApplicabilityId])
REFERENCES [dbo].[RefCourseGpaApplicability] ([RefCourseGPAApplicabilityId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefCourseGPAApplicability]
GO
/****** Object:  ForeignKey [FK_K12Course_RefCourseInteractionMode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefCourseInteractionMode] FOREIGN KEY([RefCourseInteractionModeId])
REFERENCES [dbo].[RefCourseInteractionMode] ([RefCourseInteractionModeId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefCourseInteractionMode]
GO
/****** Object:  ForeignKey [FK_K12Course_RefCreditTypeEarned]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefCreditTypeEarned] FOREIGN KEY([RefCreditTypeEarnedId])
REFERENCES [dbo].[RefCreditTypeEarned] ([RefCreditTypeEarnedId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefCreditTypeEarned]
GO
/****** Object:  ForeignKey [FK_K12Course_RefCurriculumFrameworkType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefCurriculumFrameworkType] FOREIGN KEY([RefCurriculumFrameworkTypeId])
REFERENCES [dbo].[RefCurriculumFrameworkType] ([RefCurriculumFrameworkTypeId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefCurriculumFrameworkType]
GO
/****** Object:  ForeignKey [FK_K12Course_RefK12EndOfCourseRequirement]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefK12EndOfCourseRequirement] FOREIGN KEY([RefK12EndOfCourseRequirementId])
REFERENCES [dbo].[RefK12EndOfCourseRequirement] ([RefK12EndOfCourseRequirementId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefK12EndOfCourseRequirement]
GO
/****** Object:  ForeignKey [FK_K12Course_RefSCEDCourseLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefSCEDCourseLevel] FOREIGN KEY([RefSCEDCourseLevelId])
REFERENCES [dbo].[RefSCEDCourseLevel] ([RefSCEDCourseLevelId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefSCEDCourseLevel]
GO
/****** Object:  ForeignKey [FK_K12Course_RefSCEDCourseSubjectArea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefSCEDCourseSubjectArea] FOREIGN KEY([RefSCEDCourseSubjectAreaId])
REFERENCES [dbo].[RefSCEDCourseSubjectArea] ([RefSCEDCourseSubjectAreaId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefSCEDCourseSubjectArea]
GO
/****** Object:  ForeignKey [FK_K12Course_RefWorkbasedLearningOpportunityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Course]  WITH CHECK ADD  CONSTRAINT [FK_K12Course_RefWorkbasedLearningOpportunityType] FOREIGN KEY([RefWorkbasedLearningOpportunityTypeId])
REFERENCES [dbo].[RefWorkbasedLearningOpportunityType] ([RefWorkbasedLearningOpportunityTypeId])
GO
ALTER TABLE [dbo].[K12Course] CHECK CONSTRAINT [FK_K12Course_RefWorkbasedLearningOpportunityType]
GO
/****** Object:  ForeignKey [FK_K12Lea_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Lea]  WITH CHECK ADD  CONSTRAINT [FK_K12Lea_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12Lea] CHECK CONSTRAINT [FK_K12Lea_Organization]
GO
/****** Object:  ForeignKey [FK_K12Lea_RefLEAImprovementStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Lea]  WITH CHECK ADD  CONSTRAINT [FK_K12Lea_RefLEAImprovementStatus] FOREIGN KEY([RefLEAImprovementStatusId])
REFERENCES [dbo].[RefLeaImprovementStatus] ([RefLeaImprovementStatusId])
GO
ALTER TABLE [dbo].[K12Lea] CHECK CONSTRAINT [FK_K12Lea_RefLEAImprovementStatus]
GO
/****** Object:  ForeignKey [FK_K12Lea_RefLeaType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Lea]  WITH CHECK ADD  CONSTRAINT [FK_K12Lea_RefLeaType] FOREIGN KEY([RefLeaTypeId])
REFERENCES [dbo].[RefLeaType] ([RefLeaTypeId])
GO
ALTER TABLE [dbo].[K12Lea] CHECK CONSTRAINT [FK_K12Lea_RefLeaType]
GO
/****** Object:  ForeignKey [FK_K12Lea_RefPublicSchoolChoiceStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Lea]  WITH CHECK ADD  CONSTRAINT [FK_K12Lea_RefPublicSchoolChoiceStatus] FOREIGN KEY([RefPublicSchoolChoiceStatusId])
REFERENCES [dbo].[RefPublicSchoolChoiceStatus] ([RefPublicSchoolChoiceStatusId])
GO
ALTER TABLE [dbo].[K12Lea] CHECK CONSTRAINT [FK_K12Lea_RefPublicSchoolChoiceStatus]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalFunds_K12Lea1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalFunds_K12Lea1] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaFederalFunds] CHECK CONSTRAINT [FK_K12LEAFederalFunds_K12Lea1]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalFunds_REAPAlternativeFundingStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalFunds_REAPAlternativeFundingStatus] FOREIGN KEY([RefReapAlternativeFundingStatusId])
REFERENCES [dbo].[RefReapAlternativeFundingStatus] ([RefReapAlternativeFundingStatusId])
GO
ALTER TABLE [dbo].[K12LeaFederalFunds] CHECK CONSTRAINT [FK_K12LEAFederalFunds_REAPAlternativeFundingStatus]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalFunds_RefLEAFundsTransferType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalFunds_RefLEAFundsTransferType] FOREIGN KEY([RefLeaFundsTransferTypeId])
REFERENCES [dbo].[RefLeaFundsTransferType] ([RefLeaFundsTransferTypeId])
GO
ALTER TABLE [dbo].[K12LeaFederalFunds] CHECK CONSTRAINT [FK_K12LEAFederalFunds_RefLEAFundsTransferType]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalFunds_RefRLISProgramUse]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalFunds_RefRLISProgramUse] FOREIGN KEY([RefRlisProgramUseId])
REFERENCES [dbo].[RefRlisProgramUse] ([RefRlisProgramUseId])
GO
ALTER TABLE [dbo].[K12LeaFederalFunds] CHECK CONSTRAINT [FK_K12LEAFederalFunds_RefRLISProgramUse]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalFunds_RefFederalFundingAllocation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalFunds_RefFederalFundingAllocation] FOREIGN KEY([RefFederalProgramFundingAllocationTypeId])
REFERENCES [dbo].[RefFederalProgramFundingAllocationType] ([RefFederalProgramFundingAllocationTypeId])
GO
ALTER TABLE [dbo].[K12LeaFederalFunds] CHECK CONSTRAINT [FK_OrganizationFederalFunds_RefFederalFundingAllocation]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalReporting_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalReporting]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalReporting_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaFederalReporting] CHECK CONSTRAINT [FK_K12LEAFederalReporting_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalReporting_RefBarrierToEducatingHomeless]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalReporting]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalReporting_RefBarrierToEducatingHomeless] FOREIGN KEY([RefBarrierToEducatingHomelessId])
REFERENCES [dbo].[RefBarrierToEducatingHomeless] ([RefBarrierToEducatingHomelessId])
GO
ALTER TABLE [dbo].[K12LeaFederalReporting] CHECK CONSTRAINT [FK_K12LEAFederalReporting_RefBarrierToEducatingHomeless]
GO
/****** Object:  ForeignKey [FK_K12LEAFederalReporting_RefIntegratedTechnologyStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaFederalReporting]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAFederalReporting_RefIntegratedTechnologyStatus] FOREIGN KEY([RefIntegratedTechnologyStatusId])
REFERENCES [dbo].[RefIntegratedTechnologyStatus] ([RefIntegratedTechnologyStatusId])
GO
ALTER TABLE [dbo].[K12LeaFederalReporting] CHECK CONSTRAINT [FK_K12LEAFederalReporting_RefIntegratedTechnologyStatus]
GO
/****** Object:  ForeignKey [FK_K12LeaPreKEligibility_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaPreKEligibility]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaPreKEligibility_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaPreKEligibility] CHECK CONSTRAINT [FK_K12LeaPreKEligibility_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LeaPreKEligibility_RefPrekindergartenEligibility]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaPreKEligibility]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaPreKEligibility_RefPrekindergartenEligibility] FOREIGN KEY([RefPrekindergartenEligibilityId])
REFERENCES [dbo].[RefPrekindergartenEligibility] ([RefPrekindergartenEligibilityId])
GO
ALTER TABLE [dbo].[K12LeaPreKEligibility] CHECK CONSTRAINT [FK_K12LeaPreKEligibility_RefPrekindergartenEligibility]
GO
/****** Object:  ForeignKey [FK_K12LEAPreKEligibleAgesIDEA_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaPreKEligibleAgesIDEA]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAPreKEligibleAgesIDEA_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaPreKEligibleAgesIDEA] CHECK CONSTRAINT [FK_K12LEAPreKEligibleAgesIDEA_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LEAPreKEligibleAgesIDEA_RefPreKEligibleAgesNonIDEA]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaPreKEligibleAgesIDEA]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAPreKEligibleAgesIDEA_RefPreKEligibleAgesNonIDEA] FOREIGN KEY([RefPreKEligibleAgesNonIDEAId])
REFERENCES [dbo].[RefPreKEligibleAgesNonIDEA] ([RefPreKEligibleAgesNonIDEAId])
GO
ALTER TABLE [dbo].[K12LeaPreKEligibleAgesIDEA] CHECK CONSTRAINT [FK_K12LEAPreKEligibleAgesIDEA_RefPreKEligibleAgesNonIDEA]
GO
/****** Object:  ForeignKey [FK_K12LeaSafeDrugFree_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaSafeDrugFree]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaSafeDrugFree_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaSafeDrugFree] CHECK CONSTRAINT [FK_K12LeaSafeDrugFree_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LEATitleIIIProfessionalDev_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaTitleIIIProfessionalDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_K12LEATitleIIIProfessionalDev_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaTitleIIIProfessionalDevelopment] CHECK CONSTRAINT [FK_K12LEATitleIIIProfessionalDev_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LEATitleIIIProfessionalDev_TitleIIIProfessionalDevType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaTitleIIIProfessionalDevelopment]  WITH CHECK ADD  CONSTRAINT [FK_K12LEATitleIIIProfessionalDev_TitleIIIProfessionalDevType] FOREIGN KEY([RefTitleIIIProfessionalDevelopmentTypeId])
REFERENCES [dbo].[RefTitleIIIProfessionalDevelopmentType] ([RefTitleIIIProfessionalDevelopmentTypeId])
GO
ALTER TABLE [dbo].[K12LeaTitleIIIProfessionalDevelopment] CHECK CONSTRAINT [FK_K12LEATitleIIIProfessionalDev_TitleIIIProfessionalDevType]
GO
/****** Object:  ForeignKey [FK_K12LEATitleISupportService_K12Lea]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaTitleISupportService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEATitleISupportService_K12Lea] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Lea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12LeaTitleISupportService] CHECK CONSTRAINT [FK_K12LEATitleISupportService_K12Lea]
GO
/****** Object:  ForeignKey [FK_K12LEATitleISupportService_RefK12LEATitleISupportService]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12LeaTitleISupportService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEATitleISupportService_RefK12LEATitleISupportService] FOREIGN KEY([RefK12LeaTitleISupportServiceId])
REFERENCES [dbo].[RefK12LeaTitleISupportService] ([RefK12LEATitleISupportServiceId])
GO
ALTER TABLE [dbo].[K12LeaTitleISupportService] CHECK CONSTRAINT [FK_K12LEATitleISupportService_RefK12LEATitleISupportService]
GO
/****** Object:  ForeignKey [FK_K12OrgStudentResponsibility_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12OrganizationStudentResponsibility]  WITH CHECK ADD  CONSTRAINT [FK_K12OrgStudentResponsibility_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12OrganizationStudentResponsibility] CHECK CONSTRAINT [FK_K12OrgStudentResponsibility_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12OrgStudentResponsibility_RefK12ResponsibilityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12OrganizationStudentResponsibility]  WITH CHECK ADD  CONSTRAINT [FK_K12OrgStudentResponsibility_RefK12ResponsibilityType] FOREIGN KEY([RefK12ResponsibilityTypeId])
REFERENCES [dbo].[RefK12ResponsibilityType] ([RefK12ResponsibilityTypeId])
GO
ALTER TABLE [dbo].[K12OrganizationStudentResponsibility] CHECK CONSTRAINT [FK_K12OrgStudentResponsibility_RefK12ResponsibilityType]
GO
/****** Object:  ForeignKey [FK_K12LeaProgramOrService_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaProgramOrService_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LeaProgramOrService_Organization]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefMEPProjectType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefMEPProjectType] FOREIGN KEY([RefMepProjectTypeId])
REFERENCES [dbo].[RefMepProjectType] ([RefMepProjectTypeId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefMEPProjectType]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefMEPSessionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefMEPSessionType] FOREIGN KEY([RefMepSessionTypeId])
REFERENCES [dbo].[RefMepSessionType] ([RefMepSessionTypeId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefMEPSessionType]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefProgramDayLength]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefProgramDayLength] FOREIGN KEY([RefPrekindergartenDailyLengthId])
REFERENCES [dbo].[RefProgramDayLength] ([RefProgramDayLengthId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefProgramDayLength]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefProgramDayLength1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefProgramDayLength1] FOREIGN KEY([RefKindergartenDailyLengthId])
REFERENCES [dbo].[RefProgramDayLength] ([RefProgramDayLengthId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefProgramDayLength1]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefProgramGiftedEligibility]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefProgramGiftedEligibility] FOREIGN KEY([RefProgramGiftedEligibilityId])
REFERENCES [dbo].[RefProgramGiftedEligibility] ([RefProgramGiftedEligibilityId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefProgramGiftedEligibility]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefTitleIInstructServices]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefTitleIInstructServices] FOREIGN KEY([RefTitleIInstructionalServicesId])
REFERENCES [dbo].[RefTitleIInstructionalServices] ([RefTitleIInstructionalServicesId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefTitleIInstructServices]
GO
/****** Object:  ForeignKey [FK_K12LEAProgramOrService_RefTitleIProgramType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12ProgramOrService]  WITH CHECK ADD  CONSTRAINT [FK_K12LEAProgramOrService_RefTitleIProgramType] FOREIGN KEY([RefTitleIProgramTypeId])
REFERENCES [dbo].[RefTitleIProgramType] ([RefTitleIProgramTypeId])
GO
ALTER TABLE [dbo].[K12ProgramOrService] CHECK CONSTRAINT [FK_K12LEAProgramOrService_RefTitleIProgramType]
GO
/****** Object:  ForeignKey [FK_K12School_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_Organization]
GO
/****** Object:  ForeignKey [FK_K12School_RefAdminFundingControl]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefAdminFundingControl] FOREIGN KEY([RefAdministrativeFundingControlId])
REFERENCES [dbo].[RefAdministrativeFundingControl] ([RefAdministrativeFundingControlId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefAdminFundingControl]
GO
/****** Object:  ForeignKey [FK_K12School_RefCharterSchoolApprovalAgencyTypeId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefCharterSchoolApprovalAgencyTypeId] FOREIGN KEY([RefCharterSchoolApprovalAgencyTypeId])
REFERENCES [dbo].[RefCharterSchoolApprovalAgencyType] ([RefCharterSchoolApprovalAgencyTypeId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefCharterSchoolApprovalAgencyTypeId]
GO
/****** Object:  ForeignKey [FK_K12School_RefCharterSchoolType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefCharterSchoolType] FOREIGN KEY([RefCharterSchoolTypeId])
REFERENCES [dbo].[RefCharterSchoolType] ([RefCharterSchoolTypeId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefCharterSchoolType]
GO
/****** Object:  ForeignKey [FK_K12School_RefIncreasedLearningTimeType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefIncreasedLearningTimeType] FOREIGN KEY([RefIncreasedLearningTimeTypeId])
REFERENCES [dbo].[RefIncreasedLearningTimeType] ([RefIncreasedLearningTimeTypeId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefIncreasedLearningTimeType]
GO
/****** Object:  ForeignKey [FK_K12School_RefSchoolLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefSchoolLevel] FOREIGN KEY([RefSchoolLevelId])
REFERENCES [dbo].[RefSchoolLevel] ([RefSchoolLevelId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefSchoolLevel]
GO
/****** Object:  ForeignKey [FK_K12School_RefSchoolType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefSchoolType] FOREIGN KEY([RefSchoolTypeId])
REFERENCES [dbo].[RefSchoolType] ([RefSchoolTypeId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefSchoolType]
GO
/****** Object:  ForeignKey [FK_K12School_RefStatePovertyDesignation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12School]  WITH CHECK ADD  CONSTRAINT [FK_K12School_RefStatePovertyDesignation] FOREIGN KEY([RefStatePovertyDesignationId])
REFERENCES [dbo].[RefStatePovertyDesignation] ([RefStatePovertyDesignationId])
GO
ALTER TABLE [dbo].[K12School] CHECK CONSTRAINT [FK_K12School_RefStatePovertyDesignation]
GO
/****** Object:  ForeignKey [FK_K12SchoolCorrectiveAction_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolCorrectiveAction]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolCorrectiveAction_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SchoolCorrectiveAction] CHECK CONSTRAINT [FK_K12SchoolCorrectiveAction_K12School]
GO
/****** Object:  ForeignKey [FK_K12SchoolCorrectiveAction_RefCorrectiveActionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolCorrectiveAction]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolCorrectiveAction_RefCorrectiveActionType] FOREIGN KEY([RefCorrectiveActionTypeId])
REFERENCES [dbo].[RefCorrectiveActionType] ([RefCorrectiveActionId])
GO
ALTER TABLE [dbo].[K12SchoolCorrectiveAction] CHECK CONSTRAINT [FK_K12SchoolCorrectiveAction_RefCorrectiveActionType]
GO
/****** Object:  ForeignKey [FK_K12SchoolGradeOffered_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolGradeOffered]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolGradeOffered_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SchoolGradeOffered] CHECK CONSTRAINT [FK_K12SchoolGradeOffered_K12School]
GO
/****** Object:  ForeignKey [FK_K12SchoolGradeOffered_RefGradeLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolGradeOffered]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolGradeOffered_RefGradeLevel] FOREIGN KEY([RefGradeLevelId])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[K12SchoolGradeOffered] CHECK CONSTRAINT [FK_K12SchoolGradeOffered_RefGradeLevel]
GO
/****** Object:  ForeignKey [FK_K12SchoolImprovement_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolImprovement]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolImprovement_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SchoolImprovement] CHECK CONSTRAINT [FK_K12SchoolImprovement_K12School]
GO
/****** Object:  ForeignKey [FK_K12SchoolImprovement_RefSchoolImprovementFunds]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolImprovement]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolImprovement_RefSchoolImprovementFunds] FOREIGN KEY([RefSchoolImprovementFundsId])
REFERENCES [dbo].[RefSchoolImprovementFunds] ([RefSchoolImprovementFundsId])
GO
ALTER TABLE [dbo].[K12SchoolImprovement] CHECK CONSTRAINT [FK_K12SchoolImprovement_RefSchoolImprovementFunds]
GO
/****** Object:  ForeignKey [FK_K12SchoolImprovement_RefSchoolImprovementStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolImprovement]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolImprovement_RefSchoolImprovementStatus] FOREIGN KEY([RefSchoolImprovementStatusId])
REFERENCES [dbo].[RefSchoolImprovementStatus] ([RefSchoolImprovementStatusId])
GO
ALTER TABLE [dbo].[K12SchoolImprovement] CHECK CONSTRAINT [FK_K12SchoolImprovement_RefSchoolImprovementStatus]
GO
/****** Object:  ForeignKey [FK_K12SchoolImprovement_RefSIGInterventionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolImprovement]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolImprovement_RefSIGInterventionType] FOREIGN KEY([RefSigInterventionTypeId])
REFERENCES [dbo].[RefSigInterventionType] ([RefSigInterventionTypeId])
GO
ALTER TABLE [dbo].[K12SchoolImprovement] CHECK CONSTRAINT [FK_K12SchoolImprovement_RefSIGInterventionType]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_K12School]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_K12School] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12School] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_K12School]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_RefAlternativeSchoolFocus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_RefAlternativeSchoolFocus] FOREIGN KEY([RefAlternativeSchoolFocusId])
REFERENCES [dbo].[RefAlternativeSchoolFocus] ([RefAlternativeSchoolFocusId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_RefAlternativeSchoolFocus]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_RefInternetAccess]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_RefInternetAccess] FOREIGN KEY([RefInternetAccessId])
REFERENCES [dbo].[RefInternetAccess] ([RefInternetAccessId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_RefInternetAccess]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_RefMagnetSpecialProgram]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_RefMagnetSpecialProgram] FOREIGN KEY([RefMagnetSpecialProgramId])
REFERENCES [dbo].[RefMagnetSpecialProgram] ([RefMagnetSpecialProgramId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_RefMagnetSpecialProgram]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_RefRestructuringAction]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_RefRestructuringAction] FOREIGN KEY([RefRestructuringActionId])
REFERENCES [dbo].[RefRestructuringAction] ([RefRestructuringActionId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_RefRestructuringAction]
GO
/****** Object:  ForeignKey [FK_K12SchoolStatus_RefTitle1SchoolStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_K12SchoolStatus_RefTitle1SchoolStatus] FOREIGN KEY([RefTitleISchoolStatusId])
REFERENCES [dbo].[RefTitleISchoolStatus] ([RefTitle1SchoolStatusId])
GO
ALTER TABLE [dbo].[K12SchoolStatus] CHECK CONSTRAINT [FK_K12SchoolStatus_RefTitle1SchoolStatus]
GO
/****** Object:  ForeignKey [FK_K12Sea_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Sea]  WITH CHECK ADD  CONSTRAINT [FK_K12Sea_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12Sea] CHECK CONSTRAINT [FK_K12Sea_Organization]
GO
/****** Object:  ForeignKey [FK_K12SEA_RefStateANSICode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12Sea]  WITH CHECK ADD  CONSTRAINT [FK_K12SEA_RefStateANSICode] FOREIGN KEY([RefStateANSICode])
REFERENCES [dbo].[RefStateANSICode] ([RefStateANSICode])
GO
ALTER TABLE [dbo].[K12Sea] CHECK CONSTRAINT [FK_K12SEA_RefStateANSICode]
GO
/****** Object:  ForeignKey [FK_K12SEAAlternateFundUse_K12SEAFederalFunds]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SeaAlternateFundUse]  WITH CHECK ADD  CONSTRAINT [FK_K12SEAAlternateFundUse_K12SEAFederalFunds] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12SeaFederalFunds] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SeaAlternateFundUse] CHECK CONSTRAINT [FK_K12SEAAlternateFundUse_K12SEAFederalFunds]
GO
/****** Object:  ForeignKey [FK_K12SEAAlternateFundUse_RefAlternateFundUses]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SeaAlternateFundUse]  WITH CHECK ADD  CONSTRAINT [FK_K12SEAAlternateFundUse_RefAlternateFundUses] FOREIGN KEY([RefAlternateFundUsesId])
REFERENCES [dbo].[RefAlternateFundUses] ([RefAlternateFundUsesId])
GO
ALTER TABLE [dbo].[K12SeaAlternateFundUse] CHECK CONSTRAINT [FK_K12SEAAlternateFundUse_RefAlternateFundUses]
GO
/****** Object:  ForeignKey [FK_K12SEAFederalFundAllocation_K12SEA]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SeaFederalFundAllocation]  WITH CHECK ADD  CONSTRAINT [FK_K12SEAFederalFundAllocation_K12SEA] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Sea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SeaFederalFundAllocation] CHECK CONSTRAINT [FK_K12SEAFederalFundAllocation_K12SEA]
GO
/****** Object:  ForeignKey [FK_K12SEAFederalFundAllocation_RefFederalFundingAllocation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SeaFederalFundAllocation]  WITH CHECK ADD  CONSTRAINT [FK_K12SEAFederalFundAllocation_RefFederalFundingAllocation] FOREIGN KEY([RefFederalProgramFundingAllocationTypeId])
REFERENCES [dbo].[RefFederalProgramFundingAllocationType] ([RefFederalProgramFundingAllocationTypeId])
GO
ALTER TABLE [dbo].[K12SeaFederalFundAllocation] CHECK CONSTRAINT [FK_K12SEAFederalFundAllocation_RefFederalFundingAllocation]
GO
/****** Object:  ForeignKey [FK_K12SEAFederalFunds_K12SEA]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12SeaFederalFunds]  WITH CHECK ADD  CONSTRAINT [FK_K12SEAFederalFunds_K12SEA] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[K12Sea] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12SeaFederalFunds] CHECK CONSTRAINT [FK_K12SEAFederalFunds_K12SEA]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefClassroomPositionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefClassroomPositionType] FOREIGN KEY([RefClassroomPositionTypeId])
REFERENCES [dbo].[RefClassroomPositionType] ([RefClassroomPositionTypeId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefClassroomPositionType]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefEducationStaffClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefEducationStaffClassification] FOREIGN KEY([RefEducationStaffClassificationId])
REFERENCES [dbo].[RefEducationStaffClassification] ([RefEducationStaffClassificationId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefEducationStaffClassification]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefMepStaffCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefMepStaffCategory] FOREIGN KEY([RefMepStaffCategoryId])
REFERENCES [dbo].[RefMepStaffCategory] ([RefMepStaffCategoryId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefMepStaffCategory]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefProfessionalEducationJobClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefProfessionalEducationJobClassification] FOREIGN KEY([RefProfessionalEducationJobClassificationId])
REFERENCES [dbo].[RefProfessionalEducationJobClassification] ([RefProfessionalEducationJobClassificationId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefProfessionalEducationJobClassification]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefSpecialEducationAgeGroupTaught]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefSpecialEducationAgeGroupTaught] FOREIGN KEY([RefSpecialEducationAgeGroupTaughtId])
REFERENCES [dbo].[RefSpecialEducationAgeGroupTaught] ([RefSpecialEducationAgeGroupTaughtId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefSpecialEducationAgeGroupTaught]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefSpecialEducationStaffCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefSpecialEducationStaffCategory] FOREIGN KEY([RefSpecialEducationStaffCategoryId])
REFERENCES [dbo].[RefSpecialEducationStaffCategory] ([RefSpecialEducationStaffCategoryId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefSpecialEducationStaffCategory]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefTeachingAssignmentRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefTeachingAssignmentRole] FOREIGN KEY([RefTeachingAssignmentRoleId])
REFERENCES [dbo].[RefTeachingAssignmentRole] ([RefTeachingAssignmentRoleId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefTeachingAssignmentRole]
GO
/****** Object:  ForeignKey [FK_K12StaffAssignment_RefTitleIProgramStaffCategory]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffAssignment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffAssignment_RefTitleIProgramStaffCategory] FOREIGN KEY([RefTitleIProgramStaffCategoryId])
REFERENCES [dbo].[RefTitleIProgramStaffCategory] ([RefTitleIProgramStaffCategoryId])
GO
ALTER TABLE [dbo].[K12StaffAssignment] CHECK CONSTRAINT [FK_K12StaffAssignment_RefTitleIProgramStaffCategory]
GO
/****** Object:  ForeignKey [FK_K12StaffEmployment_RefEduStaffClassification]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffEmployment_RefEduStaffClassification] FOREIGN KEY([RefEducationStaffClassificationId])
REFERENCES [dbo].[RefEducationStaffClassification] ([RefEducationStaffClassificationId])
GO
ALTER TABLE [dbo].[K12StaffEmployment] CHECK CONSTRAINT [FK_K12StaffEmployment_RefEduStaffClassification]
GO
/****** Object:  ForeignKey [FK_K12StaffEmployment_RefEmploymentStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffEmployment_RefEmploymentStatus] FOREIGN KEY([RefEmploymentStatusId])
REFERENCES [dbo].[RefEmploymentStatus] ([RefEmploymentStatusId])
GO
ALTER TABLE [dbo].[K12StaffEmployment] CHECK CONSTRAINT [FK_K12StaffEmployment_RefEmploymentStatus]
GO
/****** Object:  ForeignKey [FK_K12StaffEmployment_StaffEmployment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StaffEmployment_StaffEmployment] FOREIGN KEY([StaffEmploymentId])
REFERENCES [dbo].[StaffEmployment] ([StaffEmploymentId])
GO
ALTER TABLE [dbo].[K12StaffEmployment] CHECK CONSTRAINT [FK_K12StaffEmployment_StaffEmployment]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicHonor_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicHonor]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicHonor_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentAcademicHonor] CHECK CONSTRAINT [FK_K12StudentAcademicHonor_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicHonor_RefAcademicHonorType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicHonor]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicHonor_RefAcademicHonorType] FOREIGN KEY([RefAcademicHonorTypeId])
REFERENCES [dbo].[RefAcademicHonorType] ([RefAcademicHonorTypeId])
GO
ALTER TABLE [dbo].[K12StudentAcademicHonor] CHECK CONSTRAINT [FK_K12StudentAcademicHonor_RefAcademicHonorType]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefGpaWeightedIndicator]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefGpaWeightedIndicator] FOREIGN KEY([RefGpaWeightedIndicatorId])
REFERENCES [dbo].[RefGpaWeightedIndicator] ([RefGpaWeightedIndicatorId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefGpaWeightedIndicator]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefHighSchoolDiplomaType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefHighSchoolDiplomaType] FOREIGN KEY([RefHighSchoolDiplomaTypeId])
REFERENCES [dbo].[RefHighSchoolDiplomaType] ([RefHighSchoolDiplomaTypeId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefHighSchoolDiplomaType]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefHSDiplomaDistinctionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefHSDiplomaDistinctionType] FOREIGN KEY([RefHighSchoolDiplomaDistinctionTypeId])
REFERENCES [dbo].[RefHighSchoolDiplomaDistinctionType] ([RefHighSchoolDiplomaDistinctionTypeId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefHSDiplomaDistinctionType]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefPreAndPostTestIndicator]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefPreAndPostTestIndicator] FOREIGN KEY([RefPreAndPostTestIndicatorId])
REFERENCES [dbo].[RefPreAndPostTestIndicator] ([RefPreAndPostTestIndicatorId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefPreAndPostTestIndicator]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefProfessionalTechnicalCredential]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefProfessionalTechnicalCredential] FOREIGN KEY([RefProfessionalTechnicalCredentialTypeId])
REFERENCES [dbo].[RefProfessionalTechnicalCredentialType] ([RefProfessionalTechnicalCredentialTypeId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefProfessionalTechnicalCredential]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefProgressLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefProgressLevel] FOREIGN KEY([RefProgressLevelId])
REFERENCES [dbo].[RefProgressLevel] ([RefProgressLevelId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefProgressLevel]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefPSEnrollmentAction]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefPSEnrollmentAction] FOREIGN KEY([RefPsEnrollmentActionId])
REFERENCES [dbo].[RefPsEnrollmentAction] ([RefPsEnrollmentActionId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefPSEnrollmentAction]
GO
/****** Object:  ForeignKey [FK_K12StudentAcademicRecord_RefTechnologyLiteracyStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentAcademicRecord_RefTechnologyLiteracyStatus] FOREIGN KEY([RefTechnologyLiteracyStatusId])
REFERENCES [dbo].[RefTechnologyLiteracyStatus] ([RefTechnologyLiteracyStatusId])
GO
ALTER TABLE [dbo].[K12StudentAcademicRecord] CHECK CONSTRAINT [FK_K12StudentAcademicRecord_RefTechnologyLiteracyStatus]
GO
/****** Object:  ForeignKey [FK_K12StudentCohort_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCohort]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCohort_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentCohort] CHECK CONSTRAINT [FK_K12StudentCohort_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection _RefCourseGpaApplicability]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection _RefCourseGpaApplicability] FOREIGN KEY([RefCourseGpaApplicabilityId])
REFERENCES [dbo].[RefCourseGpaApplicability] ([RefCourseGPAApplicabilityId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection _RefCourseGpaApplicability]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefAdditionalCreditType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefAdditionalCreditType] FOREIGN KEY([RefAdditionalCreditTypeId])
REFERENCES [dbo].[RefAdditionalCreditType] ([RefAdditionalCreditTypeId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefAdditionalCreditType]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefCourseRepeatCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefCourseRepeatCode] FOREIGN KEY([RefCourseRepeatCodeId])
REFERENCES [dbo].[RefCourseRepeatCode] ([RefCourseRepeatCodeId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefCourseRepeatCode]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefCourseSectionEnrollmentStatusType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionEnrollmentStatusType] FOREIGN KEY([RefCourseSectionEnrollmentStatusTypeId])
REFERENCES [dbo].[RefCourseSectionEnrollmentStatusType] ([RefCourseSectionEnrollmentStatusTypeId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionEnrollmentStatusType]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefCourseSectionEntryType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionEntryType] FOREIGN KEY([RefCourseSectionEntryTypeId])
REFERENCES [dbo].[RefCourseSectionEntryType] ([RefCourseSectionEntryTypeId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionEntryType]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefCourseSectionExitType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionExitType] FOREIGN KEY([RefCourseSectionExitTypeId])
REFERENCES [dbo].[RefCourseSectionExitType] ([RefCourseSectionExitTypeId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefCourseSectionExitType]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefCreditTypeEarned]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefCreditTypeEarned] FOREIGN KEY([RefCreditTypeEarnedId])
REFERENCES [dbo].[RefCreditTypeEarned] ([RefCreditTypeEarnedId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefCreditTypeEarned]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefExitOrWithdrawalStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefExitOrWithdrawalStatus] FOREIGN KEY([RefExitOrWithdrawalStatusId])
REFERENCES [dbo].[RefExitOrWithdrawalStatus] ([RefExitOrWithdrawalStatusId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefExitOrWithdrawalStatus]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefGradeLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefGradeLevel] FOREIGN KEY([RefGradeLevelWhenCourseTakenId])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefGradeLevel]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefPreAndPostTestIndicator]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefPreAndPostTestIndicator] FOREIGN KEY([RefPreAndPostTestIndicatorId])
REFERENCES [dbo].[RefPreAndPostTestIndicator] ([RefPreAndPostTestIndicatorId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefPreAndPostTestIndicator]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSection_RefProgressLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSection]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSection_RefProgressLevel] FOREIGN KEY([RefProgressLevelId])
REFERENCES [dbo].[RefProgressLevel] ([RefProgressLevelId])
GO
ALTER TABLE [dbo].[K12StudentCourseSection] CHECK CONSTRAINT [FK_K12StudentCourseSection_RefProgressLevel]
GO
/****** Object:  ForeignKey [FK_K12StudentCourseSectionMark_K12StudentCourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentCourseSectionMark]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentCourseSectionMark_K12StudentCourseSection] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[K12StudentCourseSection] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentCourseSectionMark] CHECK CONSTRAINT [FK_K12StudentCourseSectionMark_K12StudentCourseSection]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_K12Incident]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_K12Incident] FOREIGN KEY([IncidentId])
REFERENCES [dbo].[Incident] ([IncidentId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_K12Incident]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_RefDisciplinaryActionTaken]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_RefDisciplinaryActionTaken] FOREIGN KEY([RefDisciplinaryActionTakenId])
REFERENCES [dbo].[RefDisciplinaryActionTaken] ([RefDisciplinaryActionTakenId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_RefDisciplinaryActionTaken]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_RefDisciplineLengthDifference]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_RefDisciplineLengthDifference] FOREIGN KEY([RefDisciplineLengthDifferenceReasonId])
REFERENCES [dbo].[RefDisciplineLengthDifferenceReason] ([RefDisciplineLengthDifferenceReasonId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_RefDisciplineLengthDifference]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_RefDisciplineReason1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_RefDisciplineReason1] FOREIGN KEY([RefDisciplineReasonId])
REFERENCES [dbo].[RefDisciplineReason] ([RefDisciplineReasonId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_RefDisciplineReason1]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_RefIDEAInterimRemovalId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_RefIDEAInterimRemovalId] FOREIGN KEY([RefIdeaInterimRemovalId])
REFERENCES [dbo].[RefIDEAInterimRemoval] ([RefIDEAInterimRemovalId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_RefIDEAInterimRemovalId]
GO
/****** Object:  ForeignKey [FK_K12StudentDiscipline_RefIDESInterimRemovalReason]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentDiscipline]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentDiscipline_RefIDESInterimRemovalReason] FOREIGN KEY([RefIdeaInterimRemovalReasonId])
REFERENCES [dbo].[RefIDEAInterimRemovalReason] ([RefIDEAInterimRemovalReasonId])
GO
ALTER TABLE [dbo].[K12StudentDiscipline] CHECK CONSTRAINT [FK_K12StudentDiscipline_RefIDESInterimRemovalReason]
GO
/****** Object:  ForeignKey [FK_K12StudentEmployment_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEmployment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentEmployment] CHECK CONSTRAINT [FK_K12StudentEmployment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12StudentEmployment_RefEmployedAfterExit]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEmployment_RefEmployedAfterExit] FOREIGN KEY([RefEmployedAfterExitId])
REFERENCES [dbo].[RefEmployedAfterExit] ([RefEmployedAfterExitId])
GO
ALTER TABLE [dbo].[K12StudentEmployment] CHECK CONSTRAINT [FK_K12StudentEmployment_RefEmployedAfterExit]
GO
/****** Object:  ForeignKey [FK_K12StudentEmployment_RefEmployedWhileEnrolled]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEmployment_RefEmployedWhileEnrolled] FOREIGN KEY([RefEmployedWhileEnrolledId])
REFERENCES [dbo].[RefEmployedWhileEnrolled] ([RefEmployedWhileEnrolledId])
GO
ALTER TABLE [dbo].[K12StudentEmployment] CHECK CONSTRAINT [FK_K12StudentEmployment_RefEmployedWhileEnrolled]
GO
/****** Object:  ForeignKey [FK_K12EnrollmentMember_OrganizationPerson]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12EnrollmentMember_OrganizationPerson] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12EnrollmentMember_OrganizationPerson]
GO
/****** Object:  ForeignKey [FK_K12EnrollmentMember_RefGrade]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12EnrollmentMember_RefGrade] FOREIGN KEY([RefEntryGradeLevelId])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12EnrollmentMember_RefGrade]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefEndOfTermStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefEndOfTermStatus] FOREIGN KEY([RefEndOfTermStatusId])
REFERENCES [dbo].[RefEndOfTermStatus] ([RefEndOfTermStatusId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefEndOfTermStatus]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefEnrollmentStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefEnrollmentStatus] FOREIGN KEY([RefEnrollmentStatusId])
REFERENCES [dbo].[RefEnrollmentStatus] ([RefEnrollmentStatusId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefEnrollmentStatus]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefEntryType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefEntryType] FOREIGN KEY([RefEntryType])
REFERENCES [dbo].[RefEntryType] ([RefEntryTypeId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefEntryType]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefExitOrWithdrawalStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefExitOrWithdrawalStatus] FOREIGN KEY([RefExitOrWithdrawalStatusId])
REFERENCES [dbo].[RefExitOrWithdrawalStatus] ([RefExitOrWithdrawalStatusId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefExitOrWithdrawalStatus]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefExitOrWithdrawalType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefExitOrWithdrawalType] FOREIGN KEY([RefExitOrWithdrawalTypeId])
REFERENCES [dbo].[RefExitOrWithdrawalType] ([RefExitOrWithdrawalTypeId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefExitOrWithdrawalType]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefFoodServiceEligibility]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefFoodServiceEligibility] FOREIGN KEY([RefFoodServiceEligibilityId])
REFERENCES [dbo].[RefFoodServiceEligibility] ([RefFoodServiceEligibilityId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefFoodServiceEligibility]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefGradeLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefGradeLevel] FOREIGN KEY([RefExitGradeLevel])
REFERENCES [dbo].[RefGradeLevel] ([RefGradeLevelId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefGradeLevel]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefNonPromotionReason]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefNonPromotionReason] FOREIGN KEY([RefNonPromotionReasonId])
REFERENCES [dbo].[RefNonPromotionReason] ([RefNonPromotionReasonId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefNonPromotionReason]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefPromotionReason]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefPromotionReason] FOREIGN KEY([RefPromotionReasonId])
REFERENCES [dbo].[RefPromotionReason] ([RefPromotionReasonId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefPromotionReason]
GO
/****** Object:  ForeignKey [FK_K12StudentEnrollment_RefPublicSchoolResidence]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentEnrollment_RefPublicSchoolResidence] FOREIGN KEY([RefPublicSchoolResidence])
REFERENCES [dbo].[RefPublicSchoolResidence] ([RefPublicSchoolResidenceId])
GO
ALTER TABLE [dbo].[K12StudentEnrollment] CHECK CONSTRAINT [FK_K12StudentEnrollment_RefPublicSchoolResidence]
GO
/****** Object:  ForeignKey [FK_K12StudentLiteracyAssessment_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentLiteracyAssessment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentLiteracyAssessment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentLiteracyAssessment] CHECK CONSTRAINT [FK_K12StudentLiteracyAssessment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12StudentLiteracyAssessment_RefLiteracyAssessment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentLiteracyAssessment]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentLiteracyAssessment_RefLiteracyAssessment] FOREIGN KEY([RefLiteracyAssessmentId])
REFERENCES [dbo].[RefLiteracyAssessment] ([RefLiteracyAssessmentId])
GO
ALTER TABLE [dbo].[K12StudentLiteracyAssessment] CHECK CONSTRAINT [FK_K12StudentLiteracyAssessment_RefLiteracyAssessment]
GO
/****** Object:  ForeignKey [FK_K12StudentSession_OrganizationCalendarSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentSession]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentSession_OrganizationCalendarSession] FOREIGN KEY([OrganizationCalendarSessionId])
REFERENCES [dbo].[OrganizationCalendarSession] ([OrganizationCalendarSessionId])
GO
ALTER TABLE [dbo].[K12StudentSession] CHECK CONSTRAINT [FK_K12StudentSession_OrganizationCalendarSession]
GO
/****** Object:  ForeignKey [FK_K12StudentSession_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12StudentSession]  WITH CHECK ADD  CONSTRAINT [FK_K12StudentSession_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[K12StudentSession] CHECK CONSTRAINT [FK_K12StudentSession_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_K12LeaTitleIIILangInstruction_RefTitleIIILangInstructionPrgm]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12TitleIIILanguageInstruction]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaTitleIIILangInstruction_RefTitleIIILangInstructionPrgm] FOREIGN KEY([RefTitleIIILanguageInstructionProgramTypeId])
REFERENCES [dbo].[RefTitleIIILanguageInstructionProgramType] ([RefTitleIIILanguageInstructionProgramTypeId])
GO
ALTER TABLE [dbo].[K12TitleIIILanguageInstruction] CHECK CONSTRAINT [FK_K12LeaTitleIIILangInstruction_RefTitleIIILangInstructionPrgm]
GO
/****** Object:  ForeignKey [FK_K12LeaTitleIIILanguageInstruction_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[K12TitleIIILanguageInstruction]  WITH CHECK ADD  CONSTRAINT [FK_K12LeaTitleIIILanguageInstruction_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[K12TitleIIILanguageInstruction] CHECK CONSTRAINT [FK_K12LeaTitleIIILanguageInstruction_Organization]
GO
/****** Object:  ForeignKey [FK_AssessmentItemLearnerAction_AssessmentItemResponse]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerAction]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentItemLearnerAction_AssessmentItemResponse] FOREIGN KEY([AssessmentItemResponseId])
REFERENCES [dbo].[AssessmentItemResponse] ([AssessmentItemResponseId])
GO
ALTER TABLE [dbo].[LearnerAction] CHECK CONSTRAINT [FK_AssessmentItemLearnerAction_AssessmentItemResponse]
GO
/****** Object:  ForeignKey [FK_LearnerAction_RefLearnerActionType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerAction]  WITH CHECK ADD  CONSTRAINT [FK_LearnerAction_RefLearnerActionType] FOREIGN KEY([RefLearnerActionTypeId])
REFERENCES [dbo].[RefLearnerActionType] ([RefLearnerActionTypeId])
GO
ALTER TABLE [dbo].[LearnerAction] CHECK CONSTRAINT [FK_LearnerAction_RefLearnerActionType]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_AssessmentRegistration]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_AssessmentRegistration] FOREIGN KEY([AssessmentRegistrationId])
REFERENCES [dbo].[AssessmentRegistration] ([AssessmentRegistrationId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_AssessmentRegistration]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_CourseSection]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_CourseSection] FOREIGN KEY([CourseSectionId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_CourseSection]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_Organization] FOREIGN KEY([SchoolOrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_Organization]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_Organization1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_Organization1] FOREIGN KEY([LeaOrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_Organization1]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_OrganizationCalendarSession]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_OrganizationCalendarSession] FOREIGN KEY([OrganizationCalendarSessionId])
REFERENCES [dbo].[OrganizationCalendarSession] ([OrganizationCalendarSessionId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_OrganizationCalendarSession]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_Person]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_Person1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_Person1] FOREIGN KEY([AssignedByPersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_Person1]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_RefLearnerActivityMaximumTimeAllowedUnits]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_RefLearnerActivityMaximumTimeAllowedUnits] FOREIGN KEY([RefLearnerActivityMaximumTimeAllowedUnitsId])
REFERENCES [dbo].[RefLearnerActivityMaximumTimeAllowedUnits] ([RefLearnerActivityMaximumTimeAllowedUnitsId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_RefLearnerActivityMaximumTimeAllowedUnits]
GO
/****** Object:  ForeignKey [FK_LearnerActivity_RefLearnerActivityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity]  WITH CHECK ADD  CONSTRAINT [FK_LearnerActivity_RefLearnerActivityType] FOREIGN KEY([RefLearnerActivityTypeId])
REFERENCES [dbo].[RefLearnerActivityType] ([RefLearnerActivityTypeId])
GO
ALTER TABLE [dbo].[LearnerActivity] CHECK CONSTRAINT [FK_LearnerActivity_RefLearnerActivityType]
GO
/****** Object:  ForeignKey [FK_LearnerAssignment_LearningResource_LearnerAssignment]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity_LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearnerAssignment_LearningResource_LearnerAssignment] FOREIGN KEY([LearnerActivityId])
REFERENCES [dbo].[LearnerActivity] ([LearnerActivitytId])
GO
ALTER TABLE [dbo].[LearnerActivity_LearningResource] CHECK CONSTRAINT [FK_LearnerAssignment_LearningResource_LearnerAssignment]
GO
/****** Object:  ForeignKey [FK_LearnerAssignment_LearningResource_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearnerActivity_LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearnerAssignment_LearningResource_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearnerActivity_LearningResource] CHECK CONSTRAINT [FK_LearnerAssignment_LearningResource_LearningResource]
GO
/****** Object:  ForeignKey [FK_LearningGoal_CompetencySet]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningGoal]  WITH CHECK ADD  CONSTRAINT [FK_LearningGoal_CompetencySet] FOREIGN KEY([CompetencySetId])
REFERENCES [dbo].[CompetencySet] ([CompetencySetId])
GO
ALTER TABLE [dbo].[LearningGoal] CHECK CONSTRAINT [FK_LearningGoal_CompetencySet]
GO
/****** Object:  ForeignKey [FK_LearningGoal_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningGoal]  WITH CHECK ADD  CONSTRAINT [FK_LearningGoal_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LearningGoal] CHECK CONSTRAINT [FK_LearningGoal_Person]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLanguage]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceAccessAPIType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceAccessAPIType] FOREIGN KEY([RefLearningResourceAccessAPITypeId])
REFERENCES [dbo].[RefLearningResourceAccessAPIType] ([RefLearningResourceAccessAPITypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceAccessAPIType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceAccessHazardType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceAccessHazardType] FOREIGN KEY([RefLearningResourceAccessHazardTypeId])
REFERENCES [dbo].[RefLearningResourceAccessHazardType] ([RefLearningResourceAccessHazardTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceAccessHazardType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceAccessModeType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceAccessModeType] FOREIGN KEY([RefLearningResourceAccessModeTypeId])
REFERENCES [dbo].[RefLearningResourceAccessModeType] ([RefLearningResourceAccessModeTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceAccessModeType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceBookFormatTypeId]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceBookFormatTypeId] FOREIGN KEY([RefLearningResourceBookFormatTypeId])
REFERENCES [dbo].[RefLearningResourceBookFormatType] ([RefLearningResourceBookFormatTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceBookFormatTypeId]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceControlFlexibilityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceControlFlexibilityType] FOREIGN KEY([RefLearningResourceControlFlexibilityTypeId])
REFERENCES [dbo].[RefLearningResourceControlFlexibilityType] ([RefLearningResourceControlFlexibilityTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceControlFlexibilityType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceDigitalMediaSubType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceDigitalMediaSubType] FOREIGN KEY([RefLearningResourceDigitalMediaSubTypeId])
REFERENCES [dbo].[RefLearningResourceDigitalMediaSubType] ([RefLearningResourceDigitalMediaSubTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceDigitalMediaSubType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLearningResourceDigitalMediaType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLearningResourceDigitalMediaType] FOREIGN KEY([RefLearningResourceDigitalMediaTypeId])
REFERENCES [dbo].[RefLearningResourceDigitalMediaType] ([RefLearningResourceDigitalMediaTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLearningResourceDigitalMediaType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLREducationalUse]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLREducationalUse] FOREIGN KEY([RefLearningResourceEducationalUseId])
REFERENCES [dbo].[RefLearningResourceEducationalUse] ([RefLearningResourceEducationalUseId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLREducationalUse]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLRIntendedEndUserRole]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLRIntendedEndUserRole] FOREIGN KEY([RefLearningResourceIntendedEndUserRoleId])
REFERENCES [dbo].[RefLearningResourceIntendedEndUserRole] ([RefLearningResourceIntendedEndUserRoleId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLRIntendedEndUserRole]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLRInteractivityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLRInteractivityType] FOREIGN KEY([RefLearningResourceInteractivityTypeId])
REFERENCES [dbo].[RefLearningResourceInteractivityType] ([RefLearningResouirceInteractivityTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLRInteractivityType]
GO
/****** Object:  ForeignKey [FK_LearningResource_RefLRType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResource]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_RefLRType] FOREIGN KEY([RefLearningResourceTypeId])
REFERENCES [dbo].[RefLearningResourceType] ([RefLearningResourceTypeId])
GO
ALTER TABLE [dbo].[LearningResource] CHECK CONSTRAINT [FK_LearningResource_RefLRType]
GO
/****** Object:  ForeignKey [FK_LearningResourceAdaptation_LR]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourceAdaptation]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourceAdaptation_LR] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearningResourceAdaptation] CHECK CONSTRAINT [FK_LearningResourceAdaptation_LR]
GO
/****** Object:  ForeignKey [FK_LearningResource_GradeLevel_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourceEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_LearningResource_GradeLevel_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearningResourceEducationLevel] CHECK CONSTRAINT [FK_LearningResource_GradeLevel_LearningResource]
GO
/****** Object:  ForeignKey [FK_LearningResourceEducationLevel_RefEducationLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourceEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourceEducationLevel_RefEducationLevel] FOREIGN KEY([RefEducationLevelId])
REFERENCES [dbo].[RefEducationLevel] ([RefEducationLevelId])
GO
ALTER TABLE [dbo].[LearningResourceEducationLevel] CHECK CONSTRAINT [FK_LearningResourceEducationLevel_RefEducationLevel]
GO
/****** Object:  ForeignKey [FK_LearningResourceMediaFeature_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourceMediaFeature]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourceMediaFeature_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearningResourceMediaFeature] CHECK CONSTRAINT [FK_LearningResourceMediaFeature_LearningResource]
GO
/****** Object:  ForeignKey [FK_LearningResourceMediaFeature_RefLearningResourceMediaFeatureType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourceMediaFeature]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourceMediaFeature_RefLearningResourceMediaFeatureType] FOREIGN KEY([RefLearningResourceMediaFeatureTypeId])
REFERENCES [dbo].[RefLearningResourceMediaFeatureType] ([RefLearningResourceMediaFeatureTypeId])
GO
ALTER TABLE [dbo].[LearningResourceMediaFeature] CHECK CONSTRAINT [FK_LearningResourceMediaFeature_RefLearningResourceMediaFeatureType]
GO
/****** Object:  ForeignKey [FK_LearningResourcePeerRating_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourcePeerRating]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourcePeerRating_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearningResourcePeerRating] CHECK CONSTRAINT [FK_LearningResourcePeerRating_LearningResource]
GO
/****** Object:  ForeignKey [FK_LearningResourcePeerRating_PeerRatingSystem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourcePeerRating]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourcePeerRating_PeerRatingSystem] FOREIGN KEY([PeerRatingSystemId])
REFERENCES [dbo].[PeerRatingSystem] ([PeerRatingSystemId])
GO
ALTER TABLE [dbo].[LearningResourcePeerRating] CHECK CONSTRAINT [FK_LearningResourcePeerRating_PeerRatingSystem]
GO
/****** Object:  ForeignKey [FK_LearningResourcePeerRating_Person]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourcePeerRating]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourcePeerRating_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[LearningResourcePeerRating] CHECK CONSTRAINT [FK_LearningResourcePeerRating_Person]
GO
/****** Object:  ForeignKey [FK_LearningResourcePhysicalMedia_LearningResource]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourcePhysicalMedia]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourcePhysicalMedia_LearningResource] FOREIGN KEY([LearningResourceId])
REFERENCES [dbo].[LearningResource] ([LearningResourceId])
GO
ALTER TABLE [dbo].[LearningResourcePhysicalMedia] CHECK CONSTRAINT [FK_LearningResourcePhysicalMedia_LearningResource]
GO
/****** Object:  ForeignKey [FK_LearningResourcePhysicalMedia_RefLearningResourcePhysicalMediaType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningResourcePhysicalMedia]  WITH CHECK ADD  CONSTRAINT [FK_LearningResourcePhysicalMedia_RefLearningResourcePhysicalMediaType] FOREIGN KEY([RefLearningResourcePhysicalMediaTypeId])
REFERENCES [dbo].[RefLearningResourcePhysicalMediaType] ([RefLearningResourcePhysicalMediaTypeId])
GO
ALTER TABLE [dbo].[LearningResourcePhysicalMedia] CHECK CONSTRAINT [FK_LearningResourcePhysicalMedia_RefLearningResourcePhysicalMediaType]
GO
/****** Object:  ForeignKey [FK_LearningStandardDocument_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardDocument]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardDocument_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[LearningStandardDocument] CHECK CONSTRAINT [FK_LearningStandardDocument_RefLanguage]
GO
/****** Object:  ForeignKey [FK_LearningStandardDocument_RefLSDocumentPublicationStatus]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardDocument]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardDocument_RefLSDocumentPublicationStatus] FOREIGN KEY([RefLearningStandardDocumentPublicationStatusId])
REFERENCES [dbo].[RefLearningStandardDocumentPublicationStatus] ([RefLearningStandardDocumentPublicationStatusId])
GO
ALTER TABLE [dbo].[LearningStandardDocument] CHECK CONSTRAINT [FK_LearningStandardDocument_RefLSDocumentPublicationStatus]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_LearningStandardDocument]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_LearningStandardDocument] FOREIGN KEY([LearningStandardDocumentId])
REFERENCES [dbo].[LearningStandardDocument] ([LearningStandardDocumentId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_LearningStandardDocument]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_LearningStandardItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_LearningStandardItem] FOREIGN KEY([ChildOf_LearningStandardItem])
REFERENCES [dbo].[LearningStandardItem] ([LearningStandardItemId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_LearningStandardItem]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_RefBloomsTaxonomyDomain]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_RefBloomsTaxonomyDomain] FOREIGN KEY([RefBloomsTaxonomyDomainId])
REFERENCES [dbo].[RefBloomsTaxonomyDomain] ([RefBloomsTaxonomyDomainId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_RefBloomsTaxonomyDomain]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_RefLanguage]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_RefLanguage]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_RefLearningStandardItemNodeAccessibilityProfile]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_RefLearningStandardItemNodeAccessibilityProfile] FOREIGN KEY([RefLearningStandardItemNodeAccessibilityProfileId])
REFERENCES [dbo].[RefLearningStandardItemNodeAccessibilityProfile] ([RefLearningStandardItemNodeAccessibilityProfileId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_RefLearningStandardItemNodeAccessibilityProfile]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_RefLearningStandardItemTestabilityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_RefLearningStandardItemTestabilityType] FOREIGN KEY([RefLearningStandardItemTestabilityTypeId])
REFERENCES [dbo].[RefLearningStandardItemTestabilityType] ([RefLearningStandardItemTestabilityTypeId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_RefLearningStandardItemTestabilityType]
GO
/****** Object:  ForeignKey [FK_LearningStandardItem_RefMultipleIntelligenceType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItem]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItem_RefMultipleIntelligenceType] FOREIGN KEY([RefMultipleIntelligenceTypeId])
REFERENCES [dbo].[RefMultipleIntelligenceType] ([RefMultipleIntelligenceTypeId])
GO
ALTER TABLE [dbo].[LearningStandardItem] CHECK CONSTRAINT [FK_LearningStandardItem_RefMultipleIntelligenceType]
GO
/****** Object:  ForeignKey [FK_LearningStandardItemAssociation_LearningStandardItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItemAssociation]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItemAssociation_LearningStandardItem] FOREIGN KEY([LearningStandardItemId])
REFERENCES [dbo].[LearningStandardItem] ([LearningStandardItemId])
GO
ALTER TABLE [dbo].[LearningStandardItemAssociation] CHECK CONSTRAINT [FK_LearningStandardItemAssociation_LearningStandardItem]
GO
/****** Object:  ForeignKey [FK_LearningStandardItemAssociation_RefAssociatedEntityType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItemAssociation]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItemAssociation_RefAssociatedEntityType] FOREIGN KEY([RefEntityTypeId])
REFERENCES [dbo].[RefEntityType] ([RefEntityTypeId])
GO
ALTER TABLE [dbo].[LearningStandardItemAssociation] CHECK CONSTRAINT [FK_LearningStandardItemAssociation_RefAssociatedEntityType]
GO
/****** Object:  ForeignKey [FK_LSItemAssociation_RefLearningStandardItemAssociation]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItemAssociation]  WITH CHECK ADD  CONSTRAINT [FK_LSItemAssociation_RefLearningStandardItemAssociation] FOREIGN KEY([RefLearningStandardItemAssociationTypeId])
REFERENCES [dbo].[RefLearningStandardItemAssociationType] ([RefLearningStandardItemAssociationTypeId])
GO
ALTER TABLE [dbo].[LearningStandardItemAssociation] CHECK CONSTRAINT [FK_LSItemAssociation_RefLearningStandardItemAssociation]
GO
/****** Object:  ForeignKey [FK_LearningStandardItemEduLevel_RefEducationLevel]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItemEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItemEduLevel_RefEducationLevel] FOREIGN KEY([RefEducationLevelId])
REFERENCES [dbo].[RefEducationLevel] ([RefEducationLevelId])
GO
ALTER TABLE [dbo].[LearningStandardItemEducationLevel] CHECK CONSTRAINT [FK_LearningStandardItemEduLevel_RefEducationLevel]
GO
/****** Object:  ForeignKey [FK_LearningStandardItemGradeLevels_LearningStandardItem]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LearningStandardItemEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_LearningStandardItemGradeLevels_LearningStandardItem] FOREIGN KEY([LearningStandardsItemId])
REFERENCES [dbo].[LearningStandardItem] ([LearningStandardItemId])
GO
ALTER TABLE [dbo].[LearningStandardItemEducationLevel] CHECK CONSTRAINT [FK_LearningStandardItemGradeLevels_LearningStandardItem]
GO
/****** Object:  ForeignKey [FK_LocationAddress_Location]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_Location]
GO
/****** Object:  ForeignKey [FK_LocationAddress_RefCountry]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_RefCountry] FOREIGN KEY([RefCountryId])
REFERENCES [dbo].[RefCountry] ([RefCountryId])
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_RefCountry]
GO
/****** Object:  ForeignKey [FK_LocationAddress_RefCounty]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_RefCounty] FOREIGN KEY([RefCountyId])
REFERENCES [dbo].[RefCounty] ([RefCountyId])
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_RefCounty]
GO
/****** Object:  ForeignKey [FK_LocationAddress_RefERSRuralUrbanContinuumCode]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_RefERSRuralUrbanContinuumCode] FOREIGN KEY([RefERSRuralUrbanContinuumCodeId])
REFERENCES [dbo].[RefERSRuralUrbanContinuumCode] ([RefERSRuralUrbanContinuumCodeId])
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_RefERSRuralUrbanContinuumCode]
GO
/****** Object:  ForeignKey [FK_LocationAddress_RefState]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[LocationAddress]  WITH CHECK ADD  CONSTRAINT [FK_LocationAddress_RefState] FOREIGN KEY([RefStateId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[LocationAddress] CHECK CONSTRAINT [FK_LocationAddress_RefState]
GO
/****** Object:  ForeignKey [FK_Organization_RefOrganizationType]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_RefOrganizationType] FOREIGN KEY([RefOrganizationTypeId])
REFERENCES [dbo].[RefOrganizationType] ([RefOrganizationTypeId])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_RefOrganizationType]
GO
/****** Object:  ForeignKey [FK_OrganizationAccreditation_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[OrganizationAccreditation]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAccreditation_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationAccreditation] CHECK CONSTRAINT [FK_OrganizationAccreditation_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationAccreditation_RefAccreditationAgency]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[OrganizationAccreditation]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAccreditation_RefAccreditationAgency] FOREIGN KEY([RefAccreditationAgencyId])
REFERENCES [dbo].[RefAccreditationAgency] ([RefAccreditationAgencyId])
GO
ALTER TABLE [dbo].[OrganizationAccreditation] CHECK CONSTRAINT [FK_OrganizationAccreditation_RefAccreditationAgency]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendar_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[OrganizationCalendar]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendar_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationCalendar] CHECK CONSTRAINT [FK_OrganizationCalendar_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarCrisis_Organization]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[OrganizationCalendarCrisis]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarCrisis_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationCalendarCrisis] CHECK CONSTRAINT [FK_OrganizationCalendarCrisis_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarDay_OrganizationCalendar1]    Script Date: 01/24/2014 13:47:58 ******/
ALTER TABLE [dbo].[OrganizationCalendarDay]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarDay_OrganizationCalendar1] FOREIGN KEY([OrganizationCalendarId])
REFERENCES [dbo].[OrganizationCalendar] ([OrganizationCalendarId])
GO
ALTER TABLE [dbo].[OrganizationCalendarDay] CHECK CONSTRAINT [FK_OrganizationCalendarDay_OrganizationCalendar1]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarEvent_OrganizationCalendar]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationCalendarEvent]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarEvent_OrganizationCalendar] FOREIGN KEY([OrganizationCalendarId])
REFERENCES [dbo].[OrganizationCalendar] ([OrganizationCalendarId])
GO
ALTER TABLE [dbo].[OrganizationCalendarEvent] CHECK CONSTRAINT [FK_OrganizationCalendarEvent_OrganizationCalendar]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarEvent_RefCalendarEventType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationCalendarEvent]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarEvent_RefCalendarEventType] FOREIGN KEY([RefCalendarEventType])
REFERENCES [dbo].[RefCalendarEventType] ([RefCalendarEventTypeId])
GO
ALTER TABLE [dbo].[OrganizationCalendarEvent] CHECK CONSTRAINT [FK_OrganizationCalendarEvent_RefCalendarEventType]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarSession_OrganizationCalendar]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationCalendarSession]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarSession_OrganizationCalendar] FOREIGN KEY([OrganizationCalendarId])
REFERENCES [dbo].[OrganizationCalendar] ([OrganizationCalendarId])
GO
ALTER TABLE [dbo].[OrganizationCalendarSession] CHECK CONSTRAINT [FK_OrganizationCalendarSession_OrganizationCalendar]
GO
/****** Object:  ForeignKey [FK_OrganizationCalendarSession_RefSessionType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationCalendarSession]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationCalendarSession_RefSessionType] FOREIGN KEY([RefSessionTypeId])
REFERENCES [dbo].[RefSessionType] ([RefSessionTypeId])
GO
ALTER TABLE [dbo].[OrganizationCalendarSession] CHECK CONSTRAINT [FK_OrganizationCalendarSession_RefSessionType]
GO
/****** Object:  ForeignKey [FK_Organization_Email_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationEmail]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Email_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationEmail] CHECK CONSTRAINT [FK_Organization_Email_Organization]
GO
/****** Object:  ForeignKey [FK_Organization_Email_RefEmailType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationEmail]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Email_RefEmailType] FOREIGN KEY([RefEmailTypeId])
REFERENCES [dbo].[RefEmailType] ([RefEmailTypeId])
GO
ALTER TABLE [dbo].[OrganizationEmail] CHECK CONSTRAINT [FK_Organization_Email_RefEmailType]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents] FOREIGN KEY([AmaoAypProgressAttainmentLepStudents])
REFERENCES [dbo].[RefAmaoAttainmentStatus] ([RefAmaoAttainmentStatusId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents1]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents1] FOREIGN KEY([AmaoProficiencyAttainmentLepStudents])
REFERENCES [dbo].[RefAmaoAttainmentStatus] ([RefAmaoAttainmentStatusId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents1]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents2]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents2] FOREIGN KEY([AmaoProgressAttainmentLepStudents])
REFERENCES [dbo].[RefAmaoAttainmentStatus] ([RefAmaoAttainmentStatusId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefAMAOAttainmentLEPStudents2]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefCTEGraduationRateInclusion]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefCTEGraduationRateInclusion] FOREIGN KEY([RefCteGraduationRateInclusionId])
REFERENCES [dbo].[RefCteGraduationRateInclusion] ([RefCteGraduationRateInclusionId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefCTEGraduationRateInclusion]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefElementaryMiddleAdditional]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefElementaryMiddleAdditional] FOREIGN KEY([RefElementaryMiddleAdditionalId])
REFERENCES [dbo].[RefElementaryMiddleAdditional] ([RefElementaryMiddleAdditionalId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefElementaryMiddleAdditional]
GO
/****** Object:  ForeignKey [FK_OrganizationFedAccountability_RefHSGraduationRateIndicator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFedAccountability_RefHSGraduationRateIndicator] FOREIGN KEY([RefHighSchoolGraduationRateIndicator])
REFERENCES [dbo].[RefHighSchoolGraduationRateIndicator] ([RefHSGraduationRateIndicatorId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFedAccountability_RefHSGraduationRateIndicator]
GO
/****** Object:  ForeignKey [FK_OrganizationFederaAccountability_RefAypStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederaAccountability_RefAypStatus] FOREIGN KEY([RefAypStatusId])
REFERENCES [dbo].[RefAypStatus] ([RefAypStatusId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederaAccountability_RefAypStatus]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefGunFreeSchoolsActStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefGunFreeSchoolsActStatus] FOREIGN KEY([RefGunFreeSchoolsActStatusReportingId])
REFERENCES [dbo].[RefGunFreeSchoolsActReportingStatus] ([RefGunFreeSchoolsActStatusReportingId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefGunFreeSchoolsActStatus]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefParticipationStatusAyp2]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefParticipationStatusAyp2] FOREIGN KEY([RefParticipationStatusMathId])
REFERENCES [dbo].[RefParticipationStatusAyp] ([RefParticipationStatusAypId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefParticipationStatusAyp2]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefParticipationStatusAyp3]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefParticipationStatusAyp3] FOREIGN KEY([RefParticipationStatusRlaId])
REFERENCES [dbo].[RefParticipationStatusAyp] ([RefParticipationStatusAypId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefParticipationStatusAyp3]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP] FOREIGN KEY([RefProficiencyTargetStatusMathId])
REFERENCES [dbo].[RefProficiencyTargetAyp] ([RefProficiencyTargetAypId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP1]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP1] FOREIGN KEY([RefProficiencyTargetStatusRLAId])
REFERENCES [dbo].[RefProficiencyTargetAyp] ([RefProficiencyTargetAypId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefProficiencyTargetAYP1]
GO
/****** Object:  ForeignKey [FK_OrganizationFederalAccountability_RefReconstitutedStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFederalAccountability]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFederalAccountability_RefReconstitutedStatus] FOREIGN KEY([RefReconstitutedStatusId])
REFERENCES [dbo].[RefReconstitutedStatus] ([RefReconstitutedStatusId])
GO
ALTER TABLE [dbo].[OrganizationFederalAccountability] CHECK CONSTRAINT [FK_OrganizationFederalAccountability_RefReconstitutedStatus]
GO
/****** Object:  ForeignKey [FK_OrganizationFinancial_FinancialAccount]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFinancial]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFinancial_FinancialAccount] FOREIGN KEY([FinancialAccountId])
REFERENCES [dbo].[FinancialAccount] ([FinancialAccountId])
GO
ALTER TABLE [dbo].[OrganizationFinancial] CHECK CONSTRAINT [FK_OrganizationFinancial_FinancialAccount]
GO
/****** Object:  ForeignKey [FK_OrganizationFinancial_OrgCalendarSession]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationFinancial]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationFinancial_OrgCalendarSession] FOREIGN KEY([OrganizationCalendarSessionId])
REFERENCES [dbo].[OrganizationCalendarSession] ([OrganizationCalendarSessionId])
GO
ALTER TABLE [dbo].[OrganizationFinancial] CHECK CONSTRAINT [FK_OrganizationFinancial_OrgCalendarSession]
GO
/****** Object:  ForeignKey [FK_OrganizationIdentifier_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationIdentifier_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationIdentifier] CHECK CONSTRAINT [FK_OrganizationIdentifier_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationIdentifier_RefIdentifierOrganization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationIdentifier_RefIdentifierOrganization] FOREIGN KEY([RefOrganizationIdentificationSystemId])
REFERENCES [dbo].[RefOrganizationIdentificationSystem] ([RefOrganizationIdentificationSystemId])
GO
ALTER TABLE [dbo].[OrganizationIdentifier] CHECK CONSTRAINT [FK_OrganizationIdentifier_RefIdentifierOrganization]
GO
/****** Object:  ForeignKey [FK_OrganizationIndicator_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationIndicator]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationIndicator_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationIndicator] CHECK CONSTRAINT [FK_OrganizationIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationIndicator_RefOrganizationIndicator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationIndicator]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationIndicator_RefOrganizationIndicator] FOREIGN KEY([RefOrganizationIndicatorId])
REFERENCES [dbo].[RefOrganizationIndicator] ([RefOrganizationIndicatorId])
GO
ALTER TABLE [dbo].[OrganizationIndicator] CHECK CONSTRAINT [FK_OrganizationIndicator_RefOrganizationIndicator]
GO
/****** Object:  ForeignKey [FK_OrganizationLocation_Location]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationLocation]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLocation_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[OrganizationLocation] CHECK CONSTRAINT [FK_OrganizationLocation_Location]
GO
/****** Object:  ForeignKey [FK_OrganizationLocation_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationLocation]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLocation_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationLocation] CHECK CONSTRAINT [FK_OrganizationLocation_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationLocation_RefOrganizationLocationType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationLocation]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLocation_RefOrganizationLocationType] FOREIGN KEY([RefOrganizationLocationTypeId])
REFERENCES [dbo].[RefOrganizationLocationType] ([RefOrganizationLocationTypeId])
GO
ALTER TABLE [dbo].[OrganizationLocation] CHECK CONSTRAINT [FK_OrganizationLocation_RefOrganizationLocationType]
GO
/****** Object:  ForeignKey [FK_OrganizationOperationalStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationOperationalStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationOperationalStatus_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationOperationalStatus] CHECK CONSTRAINT [FK_OrganizationOperationalStatus_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationOperationalStatus_RefOperationalStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationOperationalStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationOperationalStatus_RefOperationalStatus] FOREIGN KEY([RefOperationalStatusId])
REFERENCES [dbo].[RefOperationalStatus] ([RefOperationalStatusId])
GO
ALTER TABLE [dbo].[OrganizationOperationalStatus] CHECK CONSTRAINT [FK_OrganizationOperationalStatus_RefOperationalStatus]
GO
/****** Object:  ForeignKey [FK_OrganizationPersonRole_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationPersonRole]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersonRole_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationPersonRole] CHECK CONSTRAINT [FK_OrganizationPersonRole_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationPersonRole_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationPersonRole]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersonRole_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[OrganizationPersonRole] CHECK CONSTRAINT [FK_OrganizationPersonRole_Person]
GO
/****** Object:  ForeignKey [FK_OrgranizationPersonRole_Role]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationPersonRole]  WITH CHECK ADD  CONSTRAINT [FK_OrgranizationPersonRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[OrganizationPersonRole] CHECK CONSTRAINT [FK_OrgranizationPersonRole_Role]
GO
/****** Object:  ForeignKey [FK_OrganizationPolicy_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationPolicy]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPolicy_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationPolicy] CHECK CONSTRAINT [FK_OrganizationPolicy_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationProgramType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationProgramType]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationProgramType_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationProgramType] CHECK CONSTRAINT [FK_OrganizationProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationProgramType_RefProgramType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationProgramType]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationProgramType_RefProgramType] FOREIGN KEY([RefProgramTypeId])
REFERENCES [dbo].[RefProgramType] ([RefProgramTypeId])
GO
ALTER TABLE [dbo].[OrganizationProgramType] CHECK CONSTRAINT [FK_OrganizationProgramType_RefProgramType]
GO
/****** Object:  ForeignKey [FK_OrganizatinoRelationship_Organization_Parent]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationRelationship]  WITH CHECK ADD  CONSTRAINT [FK_OrganizatinoRelationship_Organization_Parent] FOREIGN KEY([Parent_OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationRelationship] CHECK CONSTRAINT [FK_OrganizatinoRelationship_Organization_Parent]
GO
/****** Object:  ForeignKey [FK_OrganizationRelationship_Organization_Child]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationRelationship]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationRelationship_Organization_Child] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationRelationship] CHECK CONSTRAINT [FK_OrganizationRelationship_Organization_Child]
GO
/****** Object:  ForeignKey [FK_OrganizationRelationship_RefOrganizationRelationshipType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationRelationship]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationRelationship_RefOrganizationRelationshipType] FOREIGN KEY([RefOrganizationRelationshipId])
REFERENCES [dbo].[RefOrganizationRelationship] ([RefOrganizationRelationshipId])
GO
ALTER TABLE [dbo].[OrganizationRelationship] CHECK CONSTRAINT [FK_OrganizationRelationship_RefOrganizationRelationshipType]
GO
/****** Object:  ForeignKey [FK_OrganizationTechnicalAssistance_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTechnicalAssistance_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationTechnicalAssistance] CHECK CONSTRAINT [FK_OrganizationTechnicalAssistance_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceDeliveryType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceDeliveryType] FOREIGN KEY([RefTechnicalAssistanceDeliveryTypeId])
REFERENCES [dbo].[RefTechnicalAssistanceDeliveryType] ([RefTechnicalAssistanceDeliveryTypeId])
GO
ALTER TABLE [dbo].[OrganizationTechnicalAssistance] CHECK CONSTRAINT [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceDeliveryType]
GO
/****** Object:  ForeignKey [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceType] FOREIGN KEY([RefTechnicalAssistanceTypeId])
REFERENCES [dbo].[RefTechnicalAssistanceType] ([RefTechnicalAssistanceTypeId])
GO
ALTER TABLE [dbo].[OrganizationTechnicalAssistance] CHECK CONSTRAINT [FK_OrganizationTechnicalAssistance_RefTechnicalAssistanceType]
GO
/****** Object:  ForeignKey [FK_LocationPhone_RefInstitutionTelephoneType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationTelephone]  WITH CHECK ADD  CONSTRAINT [FK_LocationPhone_RefInstitutionTelephoneType] FOREIGN KEY([RefInstitutionTelephoneTypeId])
REFERENCES [dbo].[RefInstitutionTelephoneType] ([RefInstitutionTelephoneTypeId])
GO
ALTER TABLE [dbo].[OrganizationTelephone] CHECK CONSTRAINT [FK_LocationPhone_RefInstitutionTelephoneType]
GO
/****** Object:  ForeignKey [FK_OrganizationTelephone_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationTelephone]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelephone_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationTelephone] CHECK CONSTRAINT [FK_OrganizationTelephone_Organization]
GO
/****** Object:  ForeignKey [FK_OrganizationWebsite_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[OrganizationWebsite]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationWebsite_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationWebsite] CHECK CONSTRAINT [FK_OrganizationWebsite_Organization]
GO
/****** Object:  ForeignKey [FK_PDActivityEducationLevel_PDActivity]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PDActivityEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_PDActivityEducationLevel_PDActivity] FOREIGN KEY([ProfessionalDevelopmentActivityId])
REFERENCES [dbo].[ProfessionalDevelopmentActivity] ([ProfessionalDevelopmentActivityId])
GO
ALTER TABLE [dbo].[PDActivityEducationLevel] CHECK CONSTRAINT [FK_PDActivityEducationLevel_PDActivity]
GO
/****** Object:  ForeignKey [FK_Person_RefHighestEducationLevelCompleted]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefHighestEducationLevelCompleted] FOREIGN KEY([RefHighestEducationLevelCompletedId])
REFERENCES [dbo].[RefHighestEducationLevelCompleted] ([RefHighestEducationLevelCompletedId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefHighestEducationLevelCompleted]
GO
/****** Object:  ForeignKey [FK_Person_RefPersonalInformationVerification]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefPersonalInformationVerification] FOREIGN KEY([RefPersonalInformationVerificationId])
REFERENCES [dbo].[RefPersonalInformationVerification] ([RefPersonalInformationVerificationId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefPersonalInformationVerification]
GO
/****** Object:  ForeignKey [FK_Person_RefProofOfResidencyType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefProofOfResidencyType] FOREIGN KEY([RefProofOfResidencyTypeId])
REFERENCES [dbo].[RefProofOfResidencyType] ([RefProofOfResidencyTypeId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefProofOfResidencyType]
GO
/****** Object:  ForeignKey [FK_Person_RefSex]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefSex] FOREIGN KEY([RefSexId])
REFERENCES [dbo].[RefSex] ([RefSexId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefSex]
GO
/****** Object:  ForeignKey [FK_Person_RefState]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefState] FOREIGN KEY([RefStateOfResidenceId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefState]
GO
/****** Object:  ForeignKey [FK_Person_RefUSCitizenshipStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefUSCitizenshipStatus] FOREIGN KEY([RefUSCitizenshipStatusId])
REFERENCES [dbo].[RefUSCitizenshipStatus] ([RefUSCitizenshipStatusId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefUSCitizenshipStatus]
GO
/****** Object:  ForeignKey [FK_Person_RefVisaType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RefVisaType] FOREIGN KEY([RefVisaTypeId])
REFERENCES [dbo].[RefVisaType] ([RefVisaTypeId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RefVisaType]
GO
/****** Object:  ForeignKey [FK_Person_AssessmentPersonalNeedsProfile_AssessmentPersonalNeedsProfile]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person_AssessmentPersonalNeedsProfile]  WITH CHECK ADD  CONSTRAINT [FK_Person_AssessmentPersonalNeedsProfile_AssessmentPersonalNeedsProfile] FOREIGN KEY([AssessmentPersonalNeedsProfileId])
REFERENCES [dbo].[AssessmentPersonalNeedsProfile] ([AssessmentPersonalNeedsProfileId])
GO
ALTER TABLE [dbo].[Person_AssessmentPersonalNeedsProfile] CHECK CONSTRAINT [FK_Person_AssessmentPersonalNeedsProfile_AssessmentPersonalNeedsProfile]
GO
/****** Object:  ForeignKey [FK_Person_AssessmentPersonalNeedsProfile_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[Person_AssessmentPersonalNeedsProfile]  WITH CHECK ADD  CONSTRAINT [FK_Person_AssessmentPersonalNeedsProfile_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Person_AssessmentPersonalNeedsProfile] CHECK CONSTRAINT [FK_Person_AssessmentPersonalNeedsProfile_Person]
GO
/****** Object:  ForeignKey [FK_PersonAddress_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
/****** Object:  ForeignKey [FK_PersonAddress_RefCountry]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_RefCountry] FOREIGN KEY([RefCountryId])
REFERENCES [dbo].[RefCountry] ([RefCountryId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_RefCountry]
GO
/****** Object:  ForeignKey [FK_PersonAddress_RefCounty]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_RefCounty] FOREIGN KEY([RefCountyId])
REFERENCES [dbo].[RefCounty] ([RefCountyId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_RefCounty]
GO
/****** Object:  ForeignKey [FK_PersonAddress_RefPersonalInformationVerification]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_RefPersonalInformationVerification] FOREIGN KEY([RefPersonalInformationVerificationId])
REFERENCES [dbo].[RefPersonalInformationVerification] ([RefPersonalInformationVerificationId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_RefPersonalInformationVerification]
GO
/****** Object:  ForeignKey [FK_PersonAddress_RefPersonLocationType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_RefPersonLocationType] FOREIGN KEY([RefPersonLocationTypeId])
REFERENCES [dbo].[RefPersonLocationType] ([RefPersonLocationTypeId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_RefPersonLocationType]
GO
/****** Object:  ForeignKey [FK_PersonAddress_RefState]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_RefState] FOREIGN KEY([RefStateId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FK_PersonAddress_RefState]
GO
/****** Object:  ForeignKey [FK_PersonAllergy_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAllergy]  WITH CHECK ADD  CONSTRAINT [FK_PersonAllergy_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonAllergy] CHECK CONSTRAINT [FK_PersonAllergy_Person]
GO
/****** Object:  ForeignKey [FK_PersonAllergy_RefAllergySeverity]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAllergy]  WITH CHECK ADD  CONSTRAINT [FK_PersonAllergy_RefAllergySeverity] FOREIGN KEY([RefAllergySeverityId])
REFERENCES [dbo].[RefAllergySeverity] ([RefAllergySeverityId])
GO
ALTER TABLE [dbo].[PersonAllergy] CHECK CONSTRAINT [FK_PersonAllergy_RefAllergySeverity]
GO
/****** Object:  ForeignKey [FK_PersonAllergy_RefAllergyTypeId]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonAllergy]  WITH CHECK ADD  CONSTRAINT [FK_PersonAllergy_RefAllergyTypeId] FOREIGN KEY([RefAllergyTypeId])
REFERENCES [dbo].[RefAllergyType] ([RefAllergyTypeId])
GO
ALTER TABLE [dbo].[PersonAllergy] CHECK CONSTRAINT [FK_PersonAllergy_RefAllergyTypeId]
GO
/****** Object:  ForeignKey [FK_PersonBirthplace_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonBirthplace]  WITH CHECK ADD  CONSTRAINT [FK_PersonBirthplace_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonBirthplace] CHECK CONSTRAINT [FK_PersonBirthplace_Person]
GO
/****** Object:  ForeignKey [FK_PersonBirthplace_RefCountry]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonBirthplace]  WITH CHECK ADD  CONSTRAINT [FK_PersonBirthplace_RefCountry] FOREIGN KEY([RefCountryId])
REFERENCES [dbo].[RefCountry] ([RefCountryId])
GO
ALTER TABLE [dbo].[PersonBirthplace] CHECK CONSTRAINT [FK_PersonBirthplace_RefCountry]
GO
/****** Object:  ForeignKey [FK_PersonBirthplace_RefState]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonBirthplace]  WITH CHECK ADD  CONSTRAINT [FK_PersonBirthplace_RefState] FOREIGN KEY([RefStateId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[PersonBirthplace] CHECK CONSTRAINT [FK_PersonBirthplace_RefState]
GO
/****** Object:  ForeignKey [FK_PersonCareerEducationPlan_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonCareerEducationPlan]  WITH CHECK ADD  CONSTRAINT [FK_PersonCareerEducationPlan_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonCareerEducationPlan] CHECK CONSTRAINT [FK_PersonCareerEducationPlan_Person]
GO
/****** Object:  ForeignKey [FK_PersonCareerEducationPlan_RefCareerEduPlanType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonCareerEducationPlan]  WITH CHECK ADD  CONSTRAINT [FK_PersonCareerEducationPlan_RefCareerEduPlanType] FOREIGN KEY([RefCareerEducationPlanTypeId])
REFERENCES [dbo].[RefCareerEducationPlanType] ([RefCareerEducationPlanTypeId])
GO
ALTER TABLE [dbo].[PersonCareerEducationPlan] CHECK CONSTRAINT [FK_PersonCareerEducationPlan_RefCareerEduPlanType]
GO
/****** Object:  ForeignKey [FK_PersonCredential_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonCredential]  WITH CHECK ADD  CONSTRAINT [FK_PersonCredential_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonCredential] CHECK CONSTRAINT [FK_PersonCredential_Person]
GO
/****** Object:  ForeignKey [FK_PersonCredential_RefCredentialType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonCredential]  WITH CHECK ADD  CONSTRAINT [FK_PersonCredential_RefCredentialType] FOREIGN KEY([RefCredentialTypeId])
REFERENCES [dbo].[RefCredentialType] ([RefCredentialTypeId])
GO
ALTER TABLE [dbo].[PersonCredential] CHECK CONSTRAINT [FK_PersonCredential_RefCredentialType]
GO
/****** Object:  ForeignKey [FK_PersonCredential_RefState]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonCredential]  WITH CHECK ADD  CONSTRAINT [FK_PersonCredential_RefState] FOREIGN KEY([RefIssuingStateId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[PersonCredential] CHECK CONSTRAINT [FK_PersonCredential_RefState]
GO
/****** Object:  ForeignKey [FK_PersonDegreeOrCertificate_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDegreeOrCertificate]  WITH CHECK ADD  CONSTRAINT [FK_PersonDegreeOrCertificate_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonDegreeOrCertificate] CHECK CONSTRAINT [FK_PersonDegreeOrCertificate_Person]
GO
/****** Object:  ForeignKey [FK_PersonDegreeOrCertificate_RefDegree]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDegreeOrCertificate]  WITH CHECK ADD  CONSTRAINT [FK_PersonDegreeOrCertificate_RefDegree] FOREIGN KEY([RefDegreeOrCertificateTypeId])
REFERENCES [dbo].[RefDegreeOrCertificateType] ([RefDegreeOrCertificateTypeId])
GO
ALTER TABLE [dbo].[PersonDegreeOrCertificate] CHECK CONSTRAINT [FK_PersonDegreeOrCertificate_RefDegree]
GO
/****** Object:  ForeignKey [FK_PersonDegreeOrCertificate_RefHigherEdInstitutionAccredStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDegreeOrCertificate]  WITH CHECK ADD  CONSTRAINT [FK_PersonDegreeOrCertificate_RefHigherEdInstitutionAccredStatus] FOREIGN KEY([RefHigherEducationInstitutionAccreditationStatusId])
REFERENCES [dbo].[RefHigherEducationInstitutionAccreditationStatus] ([RefHigherEducationInstitutionAccreditationStatusId])
GO
ALTER TABLE [dbo].[PersonDegreeOrCertificate] CHECK CONSTRAINT [FK_PersonDegreeOrCertificate_RefHigherEdInstitutionAccredStatus]
GO
/****** Object:  ForeignKey [FK_DemographicRace_RefRace]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDemographicRace]  WITH CHECK ADD  CONSTRAINT [FK_DemographicRace_RefRace] FOREIGN KEY([RefRaceId])
REFERENCES [dbo].[RefRace] ([RefRaceId])
GO
ALTER TABLE [dbo].[PersonDemographicRace] CHECK CONSTRAINT [FK_DemographicRace_RefRace]
GO
/****** Object:  ForeignKey [FK_PersonDemographicRace_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDemographicRace]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographicRace_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonDemographicRace] CHECK CONSTRAINT [FK_PersonDemographicRace_Person]
GO
/****** Object:  ForeignKey [FK_PersonDisability_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_Person]
GO
/****** Object:  ForeignKey [FK_PersonDisability_RefAccommodationsNeededType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_RefAccommodationsNeededType] FOREIGN KEY([RefAccommodationsNeededTypeId])
REFERENCES [dbo].[RefAccommodationsNeededType] ([RefAccommodationsNeededTypeId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_RefAccommodationsNeededType]
GO
/****** Object:  ForeignKey [FK_PersonDisability_RefDisabilityConditionStatusCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_RefDisabilityConditionStatusCode] FOREIGN KEY([RefDisabilityConditionStatusCodeId])
REFERENCES [dbo].[RefDisabilityConditionStatusCode] ([RefDisabilityConditionStatusCodeId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_RefDisabilityConditionStatusCode]
GO
/****** Object:  ForeignKey [FK_PersonDisability_RefDisabilityConditionType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_RefDisabilityConditionType] FOREIGN KEY([RefDisabilityConditionTypeId])
REFERENCES [dbo].[RefDisabilityConditionType] ([RefDisabilityConditionTypeId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_RefDisabilityConditionType]
GO
/****** Object:  ForeignKey [FK_PersonDisability_RefDisabilityDeterminationSourceType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_RefDisabilityDeterminationSourceType] FOREIGN KEY([RefDisabilityDeterminationSourceTypeId])
REFERENCES [dbo].[RefDisabilityDeterminationSourceType] ([RefDisabilityDeterminationSourceTypeId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_RefDisabilityDeterminationSourceType]
GO
/****** Object:  ForeignKey [FK_PersonDisability_RefDisabilityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonDisability]  WITH CHECK ADD  CONSTRAINT [FK_PersonDisability_RefDisabilityType] FOREIGN KEY([PrimaryDisabilityTypeId])
REFERENCES [dbo].[RefDisabilityType] ([RefDisabilityTypeId])
GO
ALTER TABLE [dbo].[PersonDisability] CHECK CONSTRAINT [FK_PersonDisability_RefDisabilityType]
GO
/****** Object:  ForeignKey [FK_Person_Email_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonEmailAddress]  WITH CHECK ADD  CONSTRAINT [FK_Person_Email_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonEmailAddress] CHECK CONSTRAINT [FK_Person_Email_Person]
GO
/****** Object:  ForeignKey [FK_PersonEmailAddress_RefEmailType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonEmailAddress]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmailAddress_RefEmailType] FOREIGN KEY([RefEmailTypeId])
REFERENCES [dbo].[RefEmailType] ([RefEmailTypeId])
GO
ALTER TABLE [dbo].[PersonEmailAddress] CHECK CONSTRAINT [FK_PersonEmailAddress_RefEmailType]
GO
/****** Object:  ForeignKey [FK_PersonFamily_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_Person]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefCommunicationMethod]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefCommunicationMethod] FOREIGN KEY([RefCommunicationMethodId])
REFERENCES [dbo].[RefCommunicationMethod] ([RefCommunicationMethodId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefCommunicationMethod]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefELProgramEligibility]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefELProgramEligibility] FOREIGN KEY([RefELProgramEligibilityId])
REFERENCES [dbo].[RefELProgramEligibility] ([RefELProgramEligibilityId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefELProgramEligibility]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefFamilyIncomeSource]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefFamilyIncomeSource] FOREIGN KEY([RefFamilyIncomeSourceId])
REFERENCES [dbo].[RefFamilyIncomeSource] ([RefFamilyIncomeSourceId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefFamilyIncomeSource]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefHighestEducationLevelCompleted]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefHighestEducationLevelCompleted] FOREIGN KEY([RefHighestEducationLevelCompletedId])
REFERENCES [dbo].[RefHighestEducationLevelCompleted] ([RefHighestEducationLevelCompletedId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefHighestEducationLevelCompleted]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefIncomeCalculation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefIncomeCalculation] FOREIGN KEY([RefIncomeCalculationMethodId])
REFERENCES [dbo].[RefIncomeCalculationMethod] ([RefIncomeCalculationMethodId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefIncomeCalculation]
GO
/****** Object:  ForeignKey [FK_PersonFamily_RefProofOfResidencyType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonFamily]  WITH CHECK ADD  CONSTRAINT [FK_PersonFamily_RefProofOfResidencyType] FOREIGN KEY([RefProofOfResidencyTypeId])
REFERENCES [dbo].[RefProofOfResidencyType] ([RefProofOfResidencyTypeId])
GO
ALTER TABLE [dbo].[PersonFamily] CHECK CONSTRAINT [FK_PersonFamily_RefProofOfResidencyType]
GO
/****** Object:  ForeignKey [FK_PersonHealth_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_Person]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefDentalInsuraceCoverageType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefDentalInsuraceCoverageType] FOREIGN KEY([RefDentalInsuranceCoverageTypeId])
REFERENCES [dbo].[RefDentalInsuranceCoverageType] ([RefDentalInsuranceCoverageTypeId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefDentalInsuraceCoverageType]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefDentalScreeningStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefDentalScreeningStatus] FOREIGN KEY([RefDentalScreeningStatusId])
REFERENCES [dbo].[RefDentalScreeningStatus] ([RefDentalScreeningStatusId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefDentalScreeningStatus]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefHealthInsuranceCoverage]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefHealthInsuranceCoverage] FOREIGN KEY([RefHealthInsuranceCoverageId])
REFERENCES [dbo].[RefHealthInsuranceCoverage] ([RefHealthInsuranceCoverageId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefHealthInsuranceCoverage]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefHearingScreeningStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefHearingScreeningStatus] FOREIGN KEY([RefHearingScreeningStatusId])
REFERENCES [dbo].[RefHearingScreeningStatus] ([RefHearingScreeningStatusId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefHearingScreeningStatus]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefMedicalAlertIndicator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefMedicalAlertIndicator] FOREIGN KEY([RefMedicalAlertIndicatorId])
REFERENCES [dbo].[RefMedicalAlertIndicator] ([RefMedicalAlertIndicatorId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefMedicalAlertIndicator]
GO
/****** Object:  ForeignKey [FK_PersonHealth_RefVisionScreeningStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealth_RefVisionScreeningStatus] FOREIGN KEY([RefVisionScreeningStatusId])
REFERENCES [dbo].[RefVisionScreeningStatus] ([RefVisionScreeningStatusId])
GO
ALTER TABLE [dbo].[PersonHealth] CHECK CONSTRAINT [FK_PersonHealth_RefVisionScreeningStatus]
GO
/****** Object:  ForeignKey [FK_PersonHealthBirth_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHealthBirth]  WITH CHECK ADD  CONSTRAINT [FK_PersonHealthBirth_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonHealthBirth] CHECK CONSTRAINT [FK_PersonHealthBirth_Person]
GO
/****** Object:  ForeignKey [FK_HomelessPrimaryNighttimeResidence_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHomelessness]  WITH CHECK ADD  CONSTRAINT [FK_HomelessPrimaryNighttimeResidence_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonHomelessness] CHECK CONSTRAINT [FK_HomelessPrimaryNighttimeResidence_Person]
GO
/****** Object:  ForeignKey [FK_HomelessPrimaryNighttimeResidence_RefHomelessNighttimeResid]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonHomelessness]  WITH CHECK ADD  CONSTRAINT [FK_HomelessPrimaryNighttimeResidence_RefHomelessNighttimeResid] FOREIGN KEY([RefHomelessNighttimeResidenceId])
REFERENCES [dbo].[RefHomelessNighttimeResidence] ([RefHomelessNighttimeResidenceId])
GO
ALTER TABLE [dbo].[PersonHomelessness] CHECK CONSTRAINT [FK_HomelessPrimaryNighttimeResidence_RefHomelessNighttimeResid]
GO
/****** Object:  ForeignKey [FK_PersonIdentifier_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdentifier_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonIdentifier] CHECK CONSTRAINT [FK_PersonIdentifier_Person]
GO
/****** Object:  ForeignKey [FK_PersonIdentifier_RefIdentifierPerson]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdentifier_RefIdentifierPerson] FOREIGN KEY([RefPersonIdentificationSystemId])
REFERENCES [dbo].[RefPersonIdentificationSystem] ([RefPersonIdentificationSystemId])
GO
ALTER TABLE [dbo].[PersonIdentifier] CHECK CONSTRAINT [FK_PersonIdentifier_RefIdentifierPerson]
GO
/****** Object:  ForeignKey [FK_PersonIdentifier_RefPersonInfoVerification]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonIdentifier]  WITH CHECK ADD  CONSTRAINT [FK_PersonIdentifier_RefPersonInfoVerification] FOREIGN KEY([RefPersonalInformationVerificationId])
REFERENCES [dbo].[RefPersonalInformationVerification] ([RefPersonalInformationVerificationId])
GO
ALTER TABLE [dbo].[PersonIdentifier] CHECK CONSTRAINT [FK_PersonIdentifier_RefPersonInfoVerification]
GO
/****** Object:  ForeignKey [FK_PersonImmunization_Person1]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonImmunization]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunization_Person1] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonImmunization] CHECK CONSTRAINT [FK_PersonImmunization_Person1]
GO
/****** Object:  ForeignKey [FK_PersonImmunization_RefImmunization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonImmunization]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunization_RefImmunization] FOREIGN KEY([RefImmunizationTypeId])
REFERENCES [dbo].[RefImmunizationType] ([RefImmunizationTypeId])
GO
ALTER TABLE [dbo].[PersonImmunization] CHECK CONSTRAINT [FK_PersonImmunization_RefImmunization]
GO
/****** Object:  ForeignKey [FK_PersonLanguage_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonLanguage]  WITH CHECK ADD  CONSTRAINT [FK_PersonLanguage_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonLanguage] CHECK CONSTRAINT [FK_PersonLanguage_Person]
GO
/****** Object:  ForeignKey [FK_PersonLanguage_RefLanguage]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonLanguage]  WITH CHECK ADD  CONSTRAINT [FK_PersonLanguage_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[PersonLanguage] CHECK CONSTRAINT [FK_PersonLanguage_RefLanguage]
GO
/****** Object:  ForeignKey [FK_PersonLanguage_RefLanguageUseType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonLanguage]  WITH CHECK ADD  CONSTRAINT [FK_PersonLanguage_RefLanguageUseType] FOREIGN KEY([RefLanguageUseTypeId])
REFERENCES [dbo].[RefLanguageUseType] ([RefLanguageUseTypeId])
GO
ALTER TABLE [dbo].[PersonLanguage] CHECK CONSTRAINT [FK_PersonLanguage_RefLanguageUseType]
GO
/****** Object:  ForeignKey [FK_PersonOtherName__RefOtherNameType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonOtherName]  WITH CHECK ADD  CONSTRAINT [FK_PersonOtherName__RefOtherNameType] FOREIGN KEY([RefOtherNameTypeId])
REFERENCES [dbo].[RefOtherNameType] ([RefOtherNameTypeId])
GO
ALTER TABLE [dbo].[PersonOtherName] CHECK CONSTRAINT [FK_PersonOtherName__RefOtherNameType]
GO
/****** Object:  ForeignKey [FK_PersonOtherName_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonOtherName]  WITH CHECK ADD  CONSTRAINT [FK_PersonOtherName_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonOtherName] CHECK CONSTRAINT [FK_PersonOtherName_Person]
GO
/****** Object:  ForeignKey [FK_PersonProgramParticipation_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_PersonProgramParticipation_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PersonProgramParticipation] CHECK CONSTRAINT [FK_PersonProgramParticipation_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PersonProgramParticipation_RefParticipationType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_PersonProgramParticipation_RefParticipationType] FOREIGN KEY([RefParticipationTypeId])
REFERENCES [dbo].[RefParticipationType] ([RefParticipationTypeId])
GO
ALTER TABLE [dbo].[PersonProgramParticipation] CHECK CONSTRAINT [FK_PersonProgramParticipation_RefParticipationType]
GO
/****** Object:  ForeignKey [FK_PersonProgramParticipation_RefProgramExitReason]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_PersonProgramParticipation_RefProgramExitReason] FOREIGN KEY([RefProgramExitReasonId])
REFERENCES [dbo].[RefProgramExitReason] ([RefProgramExitReasonId])
GO
ALTER TABLE [dbo].[PersonProgramParticipation] CHECK CONSTRAINT [FK_PersonProgramParticipation_RefProgramExitReason]
GO
/****** Object:  ForeignKey [FK_PersonReferral_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonReferral]  WITH CHECK ADD  CONSTRAINT [FK_PersonReferral_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonReferral] CHECK CONSTRAINT [FK_PersonReferral_Person]
GO
/****** Object:  ForeignKey [FK_PersonReferral_RefReferralOutcome]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonReferral]  WITH CHECK ADD  CONSTRAINT [FK_PersonReferral_RefReferralOutcome] FOREIGN KEY([RefReferralOutcomeId])
REFERENCES [dbo].[RefReferralOutcome] ([RefReferralOutcomeId])
GO
ALTER TABLE [dbo].[PersonReferral] CHECK CONSTRAINT [FK_PersonReferral_RefReferralOutcome]
GO
/****** Object:  ForeignKey [FK_PersonRelationship_Person_Primary]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationship_Person_Primary] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonRelationship] CHECK CONSTRAINT [FK_PersonRelationship_Person_Primary]
GO
/****** Object:  ForeignKey [FK_PersonRelationship_Person_Secondary]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationship_Person_Secondary] FOREIGN KEY([RelatedPersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonRelationship] CHECK CONSTRAINT [FK_PersonRelationship_Person_Secondary]
GO
/****** Object:  ForeignKey [FK_PersonRelationship_RefRelationship]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationship_RefRelationship] FOREIGN KEY([RefPersonRelationshipId])
REFERENCES [dbo].[RefPersonRelationship] ([RefPersonRelationshipId])
GO
ALTER TABLE [dbo].[PersonRelationship] CHECK CONSTRAINT [FK_PersonRelationship_RefRelationship]
GO
/****** Object:  ForeignKey [FK_PersonStatus_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonStatus]  WITH CHECK ADD  CONSTRAINT [FK_PersonStatus_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonStatus] CHECK CONSTRAINT [FK_PersonStatus_Person]
GO
/****** Object:  ForeignKey [FK_PersonStatus_RefPersonStatusType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonStatus]  WITH CHECK ADD  CONSTRAINT [FK_PersonStatus_RefPersonStatusType] FOREIGN KEY([RefPersonStatusTypeId])
REFERENCES [dbo].[RefPersonStatusType] ([RefPersonStatusTypeId])
GO
ALTER TABLE [dbo].[PersonStatus] CHECK CONSTRAINT [FK_PersonStatus_RefPersonStatusType]
GO
/****** Object:  ForeignKey [FK_PersonPhone_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonTelephone]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonTelephone] CHECK CONSTRAINT [FK_PersonPhone_Person]
GO
/****** Object:  ForeignKey [FK_PersonPhone_RefPersonTelephoneType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PersonTelephone]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_RefPersonTelephoneType] FOREIGN KEY([RefPersonTelephoneNumberTypeId])
REFERENCES [dbo].[RefPersonTelephoneNumberType] ([RefPersonTelephoneNumberTypeId])
GO
ALTER TABLE [dbo].[PersonTelephone] CHECK CONSTRAINT [FK_PersonPhone_RefPersonTelephoneType]
GO
/****** Object:  ForeignKey [FK_PDSession_Course]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([OrganizationId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDSession_Course]
GO
/****** Object:  ForeignKey [FK_PDSession_PDRequirement]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_PDRequirement] FOREIGN KEY([ProfessionalDevelopmentRequirementId])
REFERENCES [dbo].[ProfessionalDevelopmentRequirement] ([ProfessionalDevelopmentRequirementId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDSession_PDRequirement]
GO
/****** Object:  ForeignKey [FK_PDSession_RefCourseCreditUnit]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_RefCourseCreditUnit] FOREIGN KEY([RefCourseCreditUnitId])
REFERENCES [dbo].[RefCourseCreditUnit] ([RefCourseCreditUnitId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDSession_RefCourseCreditUnit]
GO
/****** Object:  ForeignKey [FK_PDSession_RefProfDevFinancialSupport]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_RefProfDevFinancialSupport] FOREIGN KEY([RefProfessionalDevelopmentFinancialSupportId])
REFERENCES [dbo].[RefProfessionalDevelopmentFinancialSupport] ([RefProfessionalDevelopmentFinancialSupportId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDSession_RefProfDevFinancialSupport]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentActivity_RefPDActivityApprovedFor]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityApprovedFor] FOREIGN KEY([RefPDActivityApprovedForId])
REFERENCES [dbo].[RefPDActivityApprovedFor] ([RefPDActivityApprovedForId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityApprovedFor]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentActivity_RefPDActivityCreditType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityCreditType] FOREIGN KEY([RefPDActivityCreditTypeId])
REFERENCES [dbo].[RefPDActivityCreditType] ([RefPDActivityCreditTypeId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityCreditType]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentActivity_RefPDActivityLevel]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityLevel] FOREIGN KEY([RefPDActivityLevelId])
REFERENCES [dbo].[RefPDActivityLevel] ([RefPDActivityLevelId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityLevel]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentActivity_RefPDActivityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityType] FOREIGN KEY([RefPDActivityTypeId])
REFERENCES [dbo].[RefPDActivityType] ([RefPDActivityTypeId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDActivityType]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentActivity_RefPDAudienceType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDAudienceType] FOREIGN KEY([RefPDAudienceTypeId])
REFERENCES [dbo].[RefPDAudienceType] ([RefPDAudienceTypeId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_ProfessionalDevelopmentActivity_RefPDAudienceType]
GO
/****** Object:  ForeignKey [FK_ProfessionalDevelopmentRequirement_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentRequirement]  WITH CHECK ADD  CONSTRAINT [FK_ProfessionalDevelopmentRequirement_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentRequirement] CHECK CONSTRAINT [FK_ProfessionalDevelopmentRequirement_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PDSession_PDActivity]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSession]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_PDActivity] FOREIGN KEY([ProfessionalDevelopmentActivityId])
REFERENCES [dbo].[ProfessionalDevelopmentActivity] ([ProfessionalDevelopmentActivityId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSession] CHECK CONSTRAINT [FK_PDSession_PDActivity]
GO
/****** Object:  ForeignKey [FK_PDSession_RefLanguage]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSession]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_RefLanguage] FOREIGN KEY([RefLanguageId])
REFERENCES [dbo].[RefLanguage] ([RefLanguageId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSession] CHECK CONSTRAINT [FK_PDSession_RefLanguage]
GO
/****** Object:  ForeignKey [FK_PDSession_RefPDInstructionalDeliveryMode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSession]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_RefPDInstructionalDeliveryMode] FOREIGN KEY([RefPDInstructionalDeliveryModeId])
REFERENCES [dbo].[RefPDInstructionalDeliveryMode] ([RefPDInstructionalDeliveryModeId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSession] CHECK CONSTRAINT [FK_PDSession_RefPDInstructionalDeliveryMode]
GO
/****** Object:  ForeignKey [FK_PDSession_RefPDSessionStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSession]  WITH CHECK ADD  CONSTRAINT [FK_PDSession_RefPDSessionStatus] FOREIGN KEY([RefPDSessionStatusId])
REFERENCES [dbo].[RefPDSessionStatus] ([RefPDSessionStatusId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSession] CHECK CONSTRAINT [FK_PDSession_RefPDSessionStatus]
GO
/****** Object:  ForeignKey [FK_PDSessionInstructor_OrgPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSessionInstructor]  WITH CHECK ADD  CONSTRAINT [FK_PDSessionInstructor_OrgPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSessionInstructor] CHECK CONSTRAINT [FK_PDSessionInstructor_OrgPersonRole]
GO
/****** Object:  ForeignKey [FK_PDSessionInstructor_PDSession]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProfessionalDevelopmentSessionInstructor]  WITH CHECK ADD  CONSTRAINT [FK_PDSessionInstructor_PDSession] FOREIGN KEY([ProfessionalDevelopmentSessionId])
REFERENCES [dbo].[ProfessionalDevelopmentSession] ([ProfessionalDevelopmentSessionId])
GO
ALTER TABLE [dbo].[ProfessionalDevelopmentSessionInstructor] CHECK CONSTRAINT [FK_PDSessionInstructor_PDSession]
GO
/****** Object:  ForeignKey [FK_ProgramParticipation_RefAeSpecialProgramType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipation_RefAeSpecialProgramType] FOREIGN KEY([RefAeSpecialProgramTypeId])
REFERENCES [dbo].[RefAeSpecialProgramType] ([RefAeSpecialProgramTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipation_RefAeSpecialProgramType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefAeFunctioningLevelAtIntake]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefAeFunctioningLevelAtIntake] FOREIGN KEY([RefAeFunctioningLevelAtIntakeId])
REFERENCES [dbo].[RefAeFunctioningLevelAtIntake] ([RefAeFunctioningLevelAtIntakeId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefAeFunctioningLevelAtIntake]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefAeFunctioningLevelAtPosttest]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefAeFunctioningLevelAtPosttest] FOREIGN KEY([RefAeFunctioningLevelAtPosttestId])
REFERENCES [dbo].[RefAeFunctioningLevelAtPosttest] ([RefAeFunctioningLevelAtPosttestId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefAeFunctioningLevelAtPosttest]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefAeInstructionalProgramType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefAeInstructionalProgramType] FOREIGN KEY([RefAeInstructionalProgramTypeId])
REFERENCES [dbo].[RefAeInstructionalProgramType] ([RefAeInstructionalProgramTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefAeInstructionalProgramType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefAePostsecondaryTransitionAction]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefAePostsecondaryTransitionAction] FOREIGN KEY([RefAePostsecondaryTransitionActionId])
REFERENCES [dbo].[RefAePostsecondaryTransitionAction] ([RefAePostsecondaryTransitionActionId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefAePostsecondaryTransitionAction]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefCorrectionalEducationFacilityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefCorrectionalEducationFacilityType] FOREIGN KEY([RefCorrectionalEducationFacilityTypeId])
REFERENCES [dbo].[RefCorrectionalEducationFacilityType] ([RefCorrectionalEducationFacilityTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefCorrectionalEducationFacilityType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefGoalsForAttendingAdultEducation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefGoalsForAttendingAdultEducation] FOREIGN KEY([RefGoalsForAttendingAdultEducationId])
REFERENCES [dbo].[RefGoalsForAttendingAdultEducation] ([RefGoalsForAttendingAdultEducationId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefGoalsForAttendingAdultEducation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationAE_RefWorkbasedLearningOpportunityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationAE]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationAE_RefWorkbasedLearningOpportunityType] FOREIGN KEY([RefWorkbasedLearningOpportunityTypeId])
REFERENCES [dbo].[RefWorkbasedLearningOpportunityType] ([RefWorkbasedLearningOpportunityTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationAE] CHECK CONSTRAINT [FK_ProgramParticipationAE_RefWorkbasedLearningOpportunityType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationCte_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationCte]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationCte_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationCte] CHECK CONSTRAINT [FK_ProgramParticipationCte_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationCte_RefNonTraditionalGenderStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationCte]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationCte_RefNonTraditionalGenderStatus] FOREIGN KEY([RefNonTraditionalGenderStatusId])
REFERENCES [dbo].[RefNonTraditionalGenderStatus] ([RefNonTraditionalGenderStatusId])
GO
ALTER TABLE [dbo].[ProgramParticipationCte] CHECK CONSTRAINT [FK_ProgramParticipationCte_RefNonTraditionalGenderStatus]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationCte_RefWorkbasedLearningOpportunityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationCte]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationCte_RefWorkbasedLearningOpportunityType] FOREIGN KEY([RefWorkbasedLearningOpportunityTypeId])
REFERENCES [dbo].[RefWorkbasedLearningOpportunityType] ([RefWorkbasedLearningOpportunityTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationCte] CHECK CONSTRAINT [FK_ProgramParticipationCte_RefWorkbasedLearningOpportunityType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationFoodSrvc_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationFoodService]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationFoodSrvc_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationFoodService] CHECK CONSTRAINT [FK_ProgramParticipationFoodSrvc_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationFoodSrvc_RefSchoolFoodServiceProgram]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationFoodService]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationFoodSrvc_RefSchoolFoodServiceProgram] FOREIGN KEY([RefSchoolFoodServiceProgramId])
REFERENCES [dbo].[RefSchoolFoodServiceProgram] ([RefSchoolFoodServiceProgramId])
GO
ALTER TABLE [dbo].[ProgramParticipationFoodService] CHECK CONSTRAINT [FK_ProgramParticipationFoodSrvc_RefSchoolFoodServiceProgram]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_Organization] FOREIGN KEY([DesignatedGraduationSchoolId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_Organization]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefContinuationOfServices]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefContinuationOfServices] FOREIGN KEY([RefContinuationOfServicesReasonId])
REFERENCES [dbo].[RefContinuationOfServices] ([RefContinuationOfServicesReasonId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefContinuationOfServices]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefCountry]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefCountry] FOREIGN KEY([RefQualifyingMoveFromCountryId])
REFERENCES [dbo].[RefCountry] ([RefCountryId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefCountry]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefMEPEnrollmentType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPEnrollmentType] FOREIGN KEY([RefMepEnrollmentTypeId])
REFERENCES [dbo].[RefMepEnrollmentType] ([RefMepEnrollmentTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPEnrollmentType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefMEPProjectBased]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPProjectBased] FOREIGN KEY([RefMepProjectBasedId])
REFERENCES [dbo].[RefMepProjectBased] ([RefMepProjectBasedId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPProjectBased]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefMEPServiceType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPServiceType] FOREIGN KEY([RefMepServiceTypeId])
REFERENCES [dbo].[RefMepServiceType] ([RefMepServiceTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefMEPServiceType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationMigrant_RefState]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationMigrant]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationMigrant_RefState] FOREIGN KEY([RefQualifyingMoveFromStateId])
REFERENCES [dbo].[RefState] ([RefStateId])
GO
ALTER TABLE [dbo].[ProgramParticipationMigrant] CHECK CONSTRAINT [FK_ProgramParticipationMigrant_RefState]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationNeglected_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationNeglected]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationNeglected_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationNeglected] CHECK CONSTRAINT [FK_ProgramParticipationNeglected_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationNeglected_RefNeglectedProgramType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationNeglected]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationNeglected_RefNeglectedProgramType] FOREIGN KEY([RefNeglectedProgramTypeId])
REFERENCES [dbo].[RefNeglectedProgramType] ([RefNeglectedProgramTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationNeglected] CHECK CONSTRAINT [FK_ProgramParticipationNeglected_RefNeglectedProgramType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentForEC]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentForEC] FOREIGN KEY([RefIDEAEducationalEnvironmentECId])
REFERENCES [dbo].[RefIDEAEducationalEnvironmentEC] ([RefIDEAEducationalEnvironmentECId])
GO
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation] CHECK CONSTRAINT [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentForEC]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentSchoolAge]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentSchoolAge] FOREIGN KEY([RefIDEAEdEnvironmentSchoolAgeId])
REFERENCES [dbo].[RefIDEAEducationalEnvironmentSchoolAge] ([RefIDESEducationalEnvironmentSchoolAge])
GO
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation] CHECK CONSTRAINT [FK_ProgramParticipationSpecialEd_RefIDEAEdEnvironmentSchoolAge]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationSpecialEd_RefSpecialEducationExitReason]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationSpecialEd_RefSpecialEducationExitReason] FOREIGN KEY([RefSpecialEducationExitReasonId])
REFERENCES [dbo].[RefSpecialEducationExitReason] ([RefSpecialEducationExitReasonId])
GO
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation] CHECK CONSTRAINT [FK_ProgramParticipationSpecialEd_RefSpecialEducationExitReason]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationSpecialEducation_PersonProgramParticipat]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationSpecialEducation_PersonProgramParticipat] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationSpecialEducation] CHECK CONSTRAINT [FK_ProgramParticipationSpecialEducation_PersonProgramParticipat]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_RefCritTeachShortageCandidate]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefCritTeachShortageCandidate] FOREIGN KEY([RefCriticalTeacherShortageCandidateId])
REFERENCES [dbo].[RefCriticalTeacherShortageCandidate] ([RefCriticalTeacherShortageCandidateId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefCritTeachShortageCandidate]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_RefTeacherPrepCompleterStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeacherPrepCompleterStatus] FOREIGN KEY([RefTeacherPrepCompleterStatusId])
REFERENCES [dbo].[RefTeacherPrepCompleterStatus] ([RefTeacherPrepCompleterStatusId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeacherPrepCompleterStatus]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_RefTeacherPrepEnrollStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeacherPrepEnrollStatus] FOREIGN KEY([RefTeacherPrepEnrollmentStatusId])
REFERENCES [dbo].[RefTeacherPrepEnrollmentStatus] ([RefTeacherPrepEnrollmentStatusId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeacherPrepEnrollStatus]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialBasis]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialBasis] FOREIGN KEY([RefTeachingCredentialBasisId])
REFERENCES [dbo].[RefTeachingCredentialBasis] ([RefTeachingCredentialBasisId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialBasis]
GO
/****** Object:  ForeignKey [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialType] FOREIGN KEY([RefTeachingCredentialTypeId])
REFERENCES [dbo].[RefTeachingCredentialType] ([RefTeachingCredentialTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_PrgmParticipationTeacherPrep_RefTeachingCredentialType]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTeacherPrep_RefAltRouteToCertificationOrLicensure]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTeacherPrep_RefAltRouteToCertificationOrLicensure] FOREIGN KEY([RefAltRouteToCertificationOrLicensureId])
REFERENCES [dbo].[RefAltRouteToCertificationOrLicensure] ([RefAltRouteToCertificationOrLicensureId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_ProgramParticipationTeacherPrep_RefAltRouteToCertificationOrLicensure]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTeacherPrep_RefSupervisedClinicalExper]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTeacherPrep_RefSupervisedClinicalExper] FOREIGN KEY([RefSupervisedClinicalExperienceId])
REFERENCES [dbo].[RefSupervisedClinicalExperience] ([RefSupervisedClinicalExperienceId])
GO
ALTER TABLE [dbo].[ProgramParticipationTeacherPrep] CHECK CONSTRAINT [FK_ProgramParticipationTeacherPrep_RefSupervisedClinicalExper]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTitleI_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTitleI]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTitleI_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationTitleI] CHECK CONSTRAINT [FK_ProgramParticipationTitleI_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTitleI_RefTitleIIndicator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTitleI]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTitleI_RefTitleIIndicator] FOREIGN KEY([RefTitleIIndicatorId])
REFERENCES [dbo].[RefTitleIIndicator] ([RefTitleIIndicatorId])
GO
ALTER TABLE [dbo].[ProgramParticipationTitleI] CHECK CONSTRAINT [FK_ProgramParticipationTitleI_RefTitleIIndicator]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTitleIII_PersonProgramParticipation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTitleIII_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep] CHECK CONSTRAINT [FK_ProgramParticipationTitleIII_PersonProgramParticipation]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTitleIIILep_RefTitleIIIAccountability]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTitleIIILep_RefTitleIIIAccountability] FOREIGN KEY([RefTitleIIIAccountabilityId])
REFERENCES [dbo].[RefTitleIIIAccountability] ([RefTitleIIIAccountabilityId])
GO
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep] CHECK CONSTRAINT [FK_ProgramParticipationTitleIIILep_RefTitleIIIAccountability]
GO
/****** Object:  ForeignKey [FK_ProgramParticipationTitleIIILEP_RefTitleIIILangInstrPrgm]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipationTitleIIILEP_RefTitleIIILangInstrPrgm] FOREIGN KEY([RefTitleIIILanguageInstructionProgramTypeId])
REFERENCES [dbo].[RefTitleIIILanguageInstructionProgramType] ([RefTitleIIILanguageInstructionProgramTypeId])
GO
ALTER TABLE [dbo].[ProgramParticipationTitleIIILep] CHECK CONSTRAINT [FK_ProgramParticipationTitleIIILEP_RefTitleIIILangInstrPrgm]
GO
/****** Object:  ForeignKey [FK_PsCourse_Course]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsCourse]  WITH CHECK ADD  CONSTRAINT [FK_PsCourse_Course] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Course] ([OrganizationId])
GO
ALTER TABLE [dbo].[PsCourse] CHECK CONSTRAINT [FK_PsCourse_Course]
GO
/****** Object:  ForeignKey [FK_PsCourse_RefCourseCreditBasisType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsCourse]  WITH CHECK ADD  CONSTRAINT [FK_PsCourse_RefCourseCreditBasisType] FOREIGN KEY([RefCourseCreditBasisTypeId])
REFERENCES [dbo].[RefCourseCreditBasisType] ([RefCourseCreditBasisTypeId])
GO
ALTER TABLE [dbo].[PsCourse] CHECK CONSTRAINT [FK_PsCourse_RefCourseCreditBasisType]
GO
/****** Object:  ForeignKey [FK_PsCourse_RefCourseCreditLevelType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsCourse]  WITH CHECK ADD  CONSTRAINT [FK_PsCourse_RefCourseCreditLevelType] FOREIGN KEY([RefCourseCreditLevelTypeId])
REFERENCES [dbo].[RefCourseCreditLevelType] ([RefCourseCreditLevelTypeId])
GO
ALTER TABLE [dbo].[PsCourse] CHECK CONSTRAINT [FK_PsCourse_RefCourseCreditLevelType]
GO
/****** Object:  ForeignKey [FK_PsCourse_RefNCESCollegeCourseMapCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsCourse]  WITH CHECK ADD  CONSTRAINT [FK_PsCourse_RefNCESCollegeCourseMapCode] FOREIGN KEY([RefNCESCollegeCourseMapCodeId])
REFERENCES [dbo].[RefNCESCollegeCourseMapCode] ([RefNCESCollegeCourseMapCodeId])
GO
ALTER TABLE [dbo].[PsCourse] CHECK CONSTRAINT [FK_PsCourse_RefNCESCollegeCourseMapCode]
GO
/****** Object:  ForeignKey [FK_PsInstitution_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_Organization]
GO
/****** Object:  ForeignKey [FK_PsInstitution_RefClassification]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_RefClassification] FOREIGN KEY([RefCarnegieBasicClassificationId])
REFERENCES [dbo].[RefCarnegieBasicClassification] ([RefCarnegieBasicClassificationId])
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_RefClassification]
GO
/****** Object:  ForeignKey [FK_PsInstitution_RefControlOfInstitution]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_RefControlOfInstitution] FOREIGN KEY([RefControlOfInstitutionId])
REFERENCES [dbo].[RefControlOfInstitution] ([RefControlOfInstitutionId])
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_RefControlOfInstitution]
GO
/****** Object:  ForeignKey [FK_PsInstitution_RefLevelOfInstitution]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_RefLevelOfInstitution] FOREIGN KEY([RefLevelOfInstitutionId])
REFERENCES [dbo].[RefLevelOfInstitution] ([RefLevelOfInstitutionId])
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_RefLevelOfInstitution]
GO
/****** Object:  ForeignKey [FK_PsInstitution_RefPredominantCalendarSystem]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_RefPredominantCalendarSystem] FOREIGN KEY([RefPredominantCalendarSystemId])
REFERENCES [dbo].[RefPredominantCalendarSystem] ([RefPredominantCalendarSystemId])
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_RefPredominantCalendarSystem]
GO
/****** Object:  ForeignKey [FK_PsInstitution_RefTenureSystem]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsInstitution]  WITH CHECK ADD  CONSTRAINT [FK_PsInstitution_RefTenureSystem] FOREIGN KEY([RefTenureSystemId])
REFERENCES [dbo].[RefTenureSystem] ([RefTenureSystemId])
GO
ALTER TABLE [dbo].[PsInstitution] CHECK CONSTRAINT [FK_PsInstitution_RefTenureSystem]
GO
/****** Object:  ForeignKey [FK_PSPriceOfAttendance_PsInstitution]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsPriceOfAttendance]  WITH CHECK ADD  CONSTRAINT [FK_PSPriceOfAttendance_PsInstitution] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[PsInstitution] ([OrganizationId])
GO
ALTER TABLE [dbo].[PsPriceOfAttendance] CHECK CONSTRAINT [FK_PSPriceOfAttendance_PsInstitution]
GO
/****** Object:  ForeignKey [FK_PSPriceOfAttendance_RefTuitionUnit]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsPriceOfAttendance]  WITH CHECK ADD  CONSTRAINT [FK_PSPriceOfAttendance_RefTuitionUnit] FOREIGN KEY([RefTuitionUnitId])
REFERENCES [dbo].[RefTuitionUnit] ([RefTuitionUnitId])
GO
ALTER TABLE [dbo].[PsPriceOfAttendance] CHECK CONSTRAINT [FK_PSPriceOfAttendance_RefTuitionUnit]
GO
/****** Object:  ForeignKey [FK_PsProgram_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsProgram_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[PsProgram] CHECK CONSTRAINT [FK_PsProgram_Organization]
GO
/****** Object:  ForeignKey [FK_PsProgram_RefCipCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsProgram_RefCipCode] FOREIGN KEY([RefCipCodeId])
REFERENCES [dbo].[RefCipCode] ([RefCipCodeId])
GO
ALTER TABLE [dbo].[PsProgram] CHECK CONSTRAINT [FK_PsProgram_RefCipCode]
GO
/****** Object:  ForeignKey [FK_PsProgram_RefCipVersion]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsProgram_RefCipVersion] FOREIGN KEY([RefCipVersionId])
REFERENCES [dbo].[RefCipVersion] ([RefCipVersionId])
GO
ALTER TABLE [dbo].[PsProgram] CHECK CONSTRAINT [FK_PsProgram_RefCipVersion]
GO
/****** Object:  ForeignKey [FK_PsProgram_RefProgramLengthHoursType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsProgram_RefProgramLengthHoursType] FOREIGN KEY([RefProgramLengthHoursTypeId])
REFERENCES [dbo].[RefProgramLengthHoursType] ([RefProgramLengthHoursTypeId])
GO
ALTER TABLE [dbo].[PsProgram] CHECK CONSTRAINT [FK_PsProgram_RefProgramLengthHoursType]
GO
/****** Object:  ForeignKey [FK_PsProgram_RefTimeForCompletionUnits]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsProgram_RefTimeForCompletionUnits] FOREIGN KEY([RefTimeForCompletionUnitsId])
REFERENCES [dbo].[RefTimeForCompletionUnits] ([RefTimeForCompletionUnitsId])
GO
ALTER TABLE [dbo].[PsProgram] CHECK CONSTRAINT [FK_PsProgram_RefTimeForCompletionUnits]
GO
/****** Object:  ForeignKey [FK_PsSection _RefCourseGpaApplicability]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection _RefCourseGpaApplicability] FOREIGN KEY([RefCourseGpaApplicabilityId])
REFERENCES [dbo].[RefCourseGpaApplicability] ([RefCourseGPAApplicabilityId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection _RefCourseGpaApplicability]
GO
/****** Object:  ForeignKey [FK_PsSection _RefCourseHonorsType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection _RefCourseHonorsType] FOREIGN KEY([RefCourseHonorsTypeId])
REFERENCES [dbo].[RefCourseHonorsType] ([RefCourseHonorsTypeId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection _RefCourseHonorsType]
GO
/****** Object:  ForeignKey [FK_PsSection _RefCourseInstructionMethod]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection _RefCourseInstructionMethod] FOREIGN KEY([RefCourseInstructionMethodId])
REFERENCES [dbo].[RefCourseInstructionMethod] ([RefCourseInstructionMethodId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection _RefCourseInstructionMethod]
GO
/****** Object:  ForeignKey [FK_PsSection _RefCourseLevelType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection _RefCourseLevelType] FOREIGN KEY([RefCourseLevelTypeId])
REFERENCES [dbo].[RefCourseLevelType] ([RefCourseLevelTypeId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection _RefCourseLevelType]
GO
/****** Object:  ForeignKey [FK_PsSection_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[CourseSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection_Organization]
GO
/****** Object:  ForeignKey [FK_PsSection_RefCipCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSection]  WITH CHECK ADD  CONSTRAINT [FK_PsSection_RefCipCode] FOREIGN KEY([RefCipCodeId])
REFERENCES [dbo].[RefCipCode] ([RefCipCodeId])
GO
ALTER TABLE [dbo].[PsSection] CHECK CONSTRAINT [FK_PsSection_RefCipCode]
GO
/****** Object:  ForeignKey [FK_PsSectionLocation_PsSection]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSectionLocation]  WITH CHECK ADD  CONSTRAINT [FK_PsSectionLocation_PsSection] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[PsSection] ([OrganizationId])
GO
ALTER TABLE [dbo].[PsSectionLocation] CHECK CONSTRAINT [FK_PsSectionLocation_PsSection]
GO
/****** Object:  ForeignKey [FK_PsSectionLocation_RefCourseInstructionSiteType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsSectionLocation]  WITH CHECK ADD  CONSTRAINT [FK_PsSectionLocation_RefCourseInstructionSiteType] FOREIGN KEY([RefCourseInstructionSiteTypeId])
REFERENCES [dbo].[RefCourseInstructionSiteType] ([RefCourseInstructionSiteTypeId])
GO
ALTER TABLE [dbo].[PsSectionLocation] CHECK CONSTRAINT [FK_PsSectionLocation_RefCourseInstructionSiteType]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_InstructionCreditType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_InstructionCreditType] FOREIGN KEY([RefInstructionCreditTypeId])
REFERENCES [dbo].[RefInstructionCreditType] ([RefInstructionCreditTypeId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_InstructionCreditType]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefAcademicRank]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefAcademicRank] FOREIGN KEY([RefAcademicRankId])
REFERENCES [dbo].[RefAcademicRank] ([RefAcademicRankId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefAcademicRank]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefEmploymentContractType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefEmploymentContractType] FOREIGN KEY([RefEmploymentContractTypeId])
REFERENCES [dbo].[RefEmploymentContractType] ([RefEmploymentContractTypeId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefEmploymentContractType]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefFullTimeStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefFullTimeStatus] FOREIGN KEY([RefFullTimeStatusId])
REFERENCES [dbo].[RefFullTimeStatus] ([RefFullTimeStatusId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefFullTimeStatus]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefGraduateAssistIpedsCategory]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefGraduateAssistIpedsCategory] FOREIGN KEY([RefGraduateAssistantIpedsCategoryId])
REFERENCES [dbo].[RefGraduateAssistantIpedsCategory] ([RefGraduateAssistantIpedsCategoryId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefGraduateAssistIpedsCategory]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefInstructStaffContractLength]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefInstructStaffContractLength] FOREIGN KEY([RefInstructionalStaffContractLengthId])
REFERENCES [dbo].[RefInstructionalStaffContractLength] ([RefInstructionalStaffContractLengthId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefInstructStaffContractLength]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefInstructStaffFacultyTenure]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefInstructStaffFacultyTenure] FOREIGN KEY([RefInstructionalStaffFacultyTenureId])
REFERENCES [dbo].[RefInstructionalStaffFacultyTenure] ([RefInstructionalStaffFacultyTenureId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefInstructStaffFacultyTenure]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_RefIPEDSOccupationalCategory]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_RefIPEDSOccupationalCategory] FOREIGN KEY([RefIpedsOccupationalCategoryId])
REFERENCES [dbo].[RefIpedsOccupationalCategory] ([RefIpedsOccupationalCategoryId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_RefIPEDSOccupationalCategory]
GO
/****** Object:  ForeignKey [FK_PsStaffEmployment_StaffEmployment]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStaffEmployment_StaffEmployment] FOREIGN KEY([StaffEmploymentId])
REFERENCES [dbo].[StaffEmployment] ([StaffEmploymentId])
GO
ALTER TABLE [dbo].[PsStaffEmployment] CHECK CONSTRAINT [FK_PsStaffEmployment_StaffEmployment]
GO
/****** Object:  ForeignKey [FK_PsAcademicAward_RefAcademicAwardLevel]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicAward]  WITH CHECK ADD  CONSTRAINT [FK_PsAcademicAward_RefAcademicAwardLevel] FOREIGN KEY([RefAcademicAwardLevelId])
REFERENCES [dbo].[RefAcademicAwardLevel] ([RefAcademicAwardLevelId])
GO
ALTER TABLE [dbo].[PsStudentAcademicAward] CHECK CONSTRAINT [FK_PsAcademicAward_RefAcademicAwardLevel]
GO
/****** Object:  ForeignKey [FK_PsStudentAcademicAward_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicAward]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentAcademicAward_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentAcademicAward] CHECK CONSTRAINT [FK_PsStudentAcademicAward_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentAcademicRecord_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentAcademicRecord_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentAcademicRecord] CHECK CONSTRAINT [FK_PsStudentAcademicRecord_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentAcademicRecord_RefAcademicTermDesignator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentAcademicRecord_RefAcademicTermDesignator] FOREIGN KEY([RefAcademicTermDesignatorId])
REFERENCES [dbo].[RefAcademicTermDesignator] ([RefAcademicTermDesignatorId])
GO
ALTER TABLE [dbo].[PsStudentAcademicRecord] CHECK CONSTRAINT [FK_PsStudentAcademicRecord_RefAcademicTermDesignator]
GO
/****** Object:  ForeignKey [FK_PsStudentAcademicRecord_RefCreditHours]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentAcademicRecord_RefCreditHours] FOREIGN KEY([RefCreditHoursAppliedOtherProgramId])
REFERENCES [dbo].[RefCreditHoursAppliedOtherProgram] ([RefCreditHoursAppliedOtherProgramId])
GO
ALTER TABLE [dbo].[PsStudentAcademicRecord] CHECK CONSTRAINT [FK_PsStudentAcademicRecord_RefCreditHours]
GO
/****** Object:  ForeignKey [FK_PsStudentAcademicRecord_RefProfTechCredentialType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAcademicRecord]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentAcademicRecord_RefProfTechCredentialType] FOREIGN KEY([RefProfessionalTechCredentialTypeId])
REFERENCES [dbo].[RefProfessionalTechnicalCredentialType] ([RefProfessionalTechnicalCredentialTypeId])
GO
ALTER TABLE [dbo].[PsStudentAcademicRecord] CHECK CONSTRAINT [FK_PsStudentAcademicRecord_RefProfTechCredentialType]
GO
/****** Object:  ForeignKey [FK_PsAdmissionTest_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAdmissionTest]  WITH CHECK ADD  CONSTRAINT [FK_PsAdmissionTest_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentAdmissionTest] CHECK CONSTRAINT [FK_PsAdmissionTest_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsAdmissionTest_RefStandardizedAdmissionTest]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentAdmissionTest]  WITH CHECK ADD  CONSTRAINT [FK_PsAdmissionTest_RefStandardizedAdmissionTest] FOREIGN KEY([RefStandardizedAdmissionTestId])
REFERENCES [dbo].[RefStandardizedAdmissionTest] ([RefStandardizedAdmissionTestId])
GO
ALTER TABLE [dbo].[PsStudentAdmissionTest] CHECK CONSTRAINT [FK_PsAdmissionTest_RefStandardizedAdmissionTest]
GO
/****** Object:  ForeignKey [FK_PsStudentApplication_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentApplication]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentApplication_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentApplication] CHECK CONSTRAINT [FK_PsStudentApplication_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentApplication_RefAdmittedStudent]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentApplication]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentApplication_RefAdmittedStudent] FOREIGN KEY([RefAdmittedStudentId])
REFERENCES [dbo].[RefAdmittedStudent] ([RefAdmittedStudentId])
GO
ALTER TABLE [dbo].[PsStudentApplication] CHECK CONSTRAINT [FK_PsStudentApplication_RefAdmittedStudent]
GO
/****** Object:  ForeignKey [FK_PsStudentApplication_RefGpaWeightedIndicator]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentApplication]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentApplication_RefGpaWeightedIndicator] FOREIGN KEY([RefGpaWeightedIndicatorId])
REFERENCES [dbo].[RefGpaWeightedIndicator] ([RefGpaWeightedIndicatorId])
GO
ALTER TABLE [dbo].[PsStudentApplication] CHECK CONSTRAINT [FK_PsStudentApplication_RefGpaWeightedIndicator]
GO
/****** Object:  ForeignKey [FK_PsStudentApplication_RefGradePointAverageDomain]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentApplication]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentApplication_RefGradePointAverageDomain] FOREIGN KEY([RefGradePointAverageDomainId])
REFERENCES [dbo].[RefGradePointAverageDomain] ([RefGradePointAverageDomainId])
GO
ALTER TABLE [dbo].[PsStudentApplication] CHECK CONSTRAINT [FK_PsStudentApplication_RefGradePointAverageDomain]
GO
/****** Object:  ForeignKey [FK_PsStudentCohort_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentCohort]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentCohort_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentCohort] CHECK CONSTRAINT [FK_PsStudentCohort_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentCourseSectionMark_StudentSection]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentCourseSectionMark]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentCourseSectionMark_StudentSection] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PsStudentSection] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentCourseSectionMark] CHECK CONSTRAINT [FK_PsStudentCourseSectionMark_StudentSection]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefCampusResidencyType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefCampusResidencyType] FOREIGN KEY([RefCampusResidencyTypeId])
REFERENCES [dbo].[RefCampusResidencyType] ([RefCampusResidencyTypeId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefCampusResidencyType]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefCohortExclusion]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefCohortExclusion] FOREIGN KEY([RefCohortExclusionId])
REFERENCES [dbo].[RefCohortExclusion] ([RefCohortExclusionId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefCohortExclusion]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefDependencyStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefDependencyStatus] FOREIGN KEY([RefDependencyStatusId])
REFERENCES [dbo].[RefDependencyStatus] ([RefDependencyStatusId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefDependencyStatus]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefHighestEducationLevel]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefHighestEducationLevel] FOREIGN KEY([RefPaternalEducationLevelId])
REFERENCES [dbo].[RefHighestEducationLevelCompleted] ([RefHighestEducationLevelCompletedId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefHighestEducationLevel]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefHighestEducationLevel1]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefHighestEducationLevel1] FOREIGN KEY([RefMaternalEducationLevelId])
REFERENCES [dbo].[RefHighestEducationLevelCompleted] ([RefHighestEducationLevelCompletedId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefHighestEducationLevel1]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefPostsecondaryLEPType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefPostsecondaryLEPType] FOREIGN KEY([RefPsLepTypeId])
REFERENCES [dbo].[RefPsLepType] ([RefPsLepTypeId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefPostsecondaryLEPType]
GO
/****** Object:  ForeignKey [FK_PsStudentDemographic_RefTuitionResidencyType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentDemographic]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentDemographic_RefTuitionResidencyType] FOREIGN KEY([RefTuitionResidencyTypeId])
REFERENCES [dbo].[RefTuitionResidencyType] ([RefTuitionResidencyTypeId])
GO
ALTER TABLE [dbo].[PsStudentDemographic] CHECK CONSTRAINT [FK_PsStudentDemographic_RefTuitionResidencyType]
GO
/****** Object:  ForeignKey [FK_PsStudentEmployment_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEmployment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentEmployment] CHECK CONSTRAINT [FK_PsStudentEmployment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentEmployment_RefEmployedAfterExit]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEmployment_RefEmployedAfterExit] FOREIGN KEY([RefEmployedAfterExitId])
REFERENCES [dbo].[RefEmployedAfterExit] ([RefEmployedAfterExitId])
GO
ALTER TABLE [dbo].[PsStudentEmployment] CHECK CONSTRAINT [FK_PsStudentEmployment_RefEmployedAfterExit]
GO
/****** Object:  ForeignKey [FK_PsStudentEmployment_RefEmployedWhileEnrolled]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEmployment_RefEmployedWhileEnrolled] FOREIGN KEY([RefEmployedWhileEnrolledId])
REFERENCES [dbo].[RefEmployedWhileEnrolled] ([RefEmployedWhileEnrolledId])
GO
ALTER TABLE [dbo].[PsStudentEmployment] CHECK CONSTRAINT [FK_PsStudentEmployment_RefEmployedWhileEnrolled]
GO
/****** Object:  ForeignKey [FK_PsStudentEmployment_RefEmploymentStatusWhileEnrolled]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEmployment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEmployment_RefEmploymentStatusWhileEnrolled] FOREIGN KEY([RefEmploymentStatusWhileEnrolledId])
REFERENCES [dbo].[RefEmploymentStatusWhileEnrolled] ([RefEmploymentStatusWhileEnrolledId])
GO
ALTER TABLE [dbo].[PsStudentEmployment] CHECK CONSTRAINT [FK_PsStudentEmployment_RefEmploymentStatusWhileEnrolled]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefDistanceEducationCourseEnr]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefDistanceEducationCourseEnr] FOREIGN KEY([RefDistanceEducationCourseEnollmentId])
REFERENCES [dbo].[RefDistanceEducationCourseEnrollment] ([RefDistanceEducationCourseEnrollmentId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefDistanceEducationCourseEnr]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefDoctoralExamsRequiredCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefDoctoralExamsRequiredCode] FOREIGN KEY([RefDoctoralExamsRequiredCodeId])
REFERENCES [dbo].[RefDoctoralExamsRequiredCode] ([RefDoctoralExamsRequiredCodeId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefDoctoralExamsRequiredCode]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefGraduateOrDoctoralExamResultsStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefGraduateOrDoctoralExamResultsStatus] FOREIGN KEY([RefGraduateOrDoctoralExamResultsStatusId])
REFERENCES [dbo].[RefGraduateOrDoctoralExamResultsStatus] ([RefGraduateOrDoctoralExamResultsStatusId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefGraduateOrDoctoralExamResultsStatus]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefInstructionalActivityHours]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefInstructionalActivityHours] FOREIGN KEY([RefInstructionalActivityHoursId])
REFERENCES [dbo].[RefInstructionalActivityHours] ([RefInstructionalActivityHoursId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefInstructionalActivityHours]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefPsEnrollmentAwardType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentAwardType] FOREIGN KEY([RefPsEnrollmentAwardTypeId])
REFERENCES [dbo].[RefPsEnrollmentAwardType] ([RefPsEnrollmentAwardTypeId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentAwardType]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefPsEnrollmentStatus]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentStatus] FOREIGN KEY([RefPsEnrollmentStatusId])
REFERENCES [dbo].[RefPsEnrollmentStatus] ([RefPsEnrollmentStatusId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentStatus]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefPsEnrollmentType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentType] FOREIGN KEY([RefPsEnrollmentTypeId])
REFERENCES [dbo].[RefPsEnrollmentType] ([RefPsEnrollmentTypeId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefPsEnrollmentType]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefPsStudentLevel]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefPsStudentLevel] FOREIGN KEY([RefPsStudentLevelId])
REFERENCES [dbo].[RefPsStudentLevel] ([RefPsStudentLevelId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefPsStudentLevel]
GO
/****** Object:  ForeignKey [FK_PsStudentEnrollment_RefTransferReady]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentEnrollment_RefTransferReady] FOREIGN KEY([RefTransferReadyId])
REFERENCES [dbo].[RefTransferReady] ([RefTransferReadyId])
GO
ALTER TABLE [dbo].[PsStudentEnrollment] CHECK CONSTRAINT [FK_PsStudentEnrollment_RefTransferReady]
GO
/****** Object:  ForeignKey [FK_PsStudentFinancialAid_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentFinancialAid]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentFinancialAid_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentFinancialAid] CHECK CONSTRAINT [FK_PsStudentFinancialAid_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentFinancialAid_RefNeedDeterminationMethod]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentFinancialAid]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentFinancialAid_RefNeedDeterminationMethod] FOREIGN KEY([RefNeedDeterminationMethodId])
REFERENCES [dbo].[RefNeedDeterminationMethod] ([RefNeedDeterminationMethodId])
GO
ALTER TABLE [dbo].[PsStudentFinancialAid] CHECK CONSTRAINT [FK_PsStudentFinancialAid_RefNeedDeterminationMethod]
GO
/****** Object:  ForeignKey [FK_PSStudentEnrollmentCIP_RefCipUse]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PSStudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_PSStudentEnrollmentCIP_RefCipUse] FOREIGN KEY([RefCipUseId])
REFERENCES [dbo].[RefCipUse] ([RefCipUseId])
GO
ALTER TABLE [dbo].[PSStudentProgram] CHECK CONSTRAINT [FK_PSStudentEnrollmentCIP_RefCipUse]
GO
/****** Object:  ForeignKey [FK_PSStudentProgram_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PSStudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_PSStudentProgram_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PSStudentProgram] CHECK CONSTRAINT [FK_PSStudentProgram_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PSStudentProgram_PsProgram]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PSStudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_PSStudentProgram_PsProgram] FOREIGN KEY([PsProgramId])
REFERENCES [dbo].[PsProgram] ([PsProgramId])
GO
ALTER TABLE [dbo].[PSStudentProgram] CHECK CONSTRAINT [FK_PSStudentProgram_PsProgram]
GO
/****** Object:  ForeignKey [FK_PsStudentProgram_RefWorkbasedLearningOpportunityType]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PSStudentProgram]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentProgram_RefWorkbasedLearningOpportunityType] FOREIGN KEY([RefWorkbasedLearningOpportunityTypeId])
REFERENCES [dbo].[RefWorkbasedLearningOpportunityType] ([RefWorkbasedLearningOpportunityTypeId])
GO
ALTER TABLE [dbo].[PSStudentProgram] CHECK CONSTRAINT [FK_PsStudentProgram_RefWorkbasedLearningOpportunityType]
GO
/****** Object:  ForeignKey [FK_PsStudentSection_OrganizationPersonRole]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentSection]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentSection_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[PsStudentSection] CHECK CONSTRAINT [FK_PsStudentSection_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_PsStudentSection_RefCourseAcademicGradeStatusCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentSection]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentSection_RefCourseAcademicGradeStatusCode] FOREIGN KEY([RefCourseAcademicGradeStatusCodeId])
REFERENCES [dbo].[RefCourseAcademicGradeStatusCode] ([RefCourseAcademicGradeStatusCodeId])
GO
ALTER TABLE [dbo].[PsStudentSection] CHECK CONSTRAINT [FK_PsStudentSection_RefCourseAcademicGradeStatusCode]
GO
/****** Object:  ForeignKey [FK_PsStudentSection_RefCourseRepeatCode]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[PsStudentSection]  WITH CHECK ADD  CONSTRAINT [FK_PsStudentSection_RefCourseRepeatCode] FOREIGN KEY([RefCourseRepeatCodeId])
REFERENCES [dbo].[RefCourseRepeatCode] ([RefCourseRepeatCodeId])
GO
ALTER TABLE [dbo].[PsStudentSection] CHECK CONSTRAINT [FK_PsStudentSection_RefCourseRepeatCode]
GO
/****** Object:  ForeignKey [FK_QuarterlyEmploymentRecord_Person]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[QuarterlyEmploymentRecord]  WITH CHECK ADD  CONSTRAINT [FK_QuarterlyEmploymentRecord_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[QuarterlyEmploymentRecord] CHECK CONSTRAINT [FK_QuarterlyEmploymentRecord_Person]
GO
/****** Object:  ForeignKey [FK_QuarterlyEmploymentRecord_RefEmployedPriorToEnrollment]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[QuarterlyEmploymentRecord]  WITH CHECK ADD  CONSTRAINT [FK_QuarterlyEmploymentRecord_RefEmployedPriorToEnrollment] FOREIGN KEY([RefEmployedPriorToEnrollmentId])
REFERENCES [dbo].[RefEmployedPriorToEnrollment] ([RefEmployedPriorToEnrollmentId])
GO
ALTER TABLE [dbo].[QuarterlyEmploymentRecord] CHECK CONSTRAINT [FK_QuarterlyEmploymentRecord_RefEmployedPriorToEnrollment]
GO
/****** Object:  ForeignKey [FK_QuarterlyEmploymentRecord_RefEmploymentLocation]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[QuarterlyEmploymentRecord]  WITH CHECK ADD  CONSTRAINT [FK_QuarterlyEmploymentRecord_RefEmploymentLocation] FOREIGN KEY([RefEmploymentLocationId])
REFERENCES [dbo].[RefEmploymentLocation] ([RefEmploymentLocationId])
GO
ALTER TABLE [dbo].[QuarterlyEmploymentRecord] CHECK CONSTRAINT [FK_QuarterlyEmploymentRecord_RefEmploymentLocation]
GO
/****** Object:  ForeignKey [FK_QuarterlyEmploymentRecord_RefERAdministrativeDataSource]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[QuarterlyEmploymentRecord]  WITH CHECK ADD  CONSTRAINT [FK_QuarterlyEmploymentRecord_RefERAdministrativeDataSource] FOREIGN KEY([RefERAdministrativeDataSourceId])
REFERENCES [dbo].[RefERAdministrativeDataSource] ([RefERAdministrativeDataSourceId])
GO
ALTER TABLE [dbo].[QuarterlyEmploymentRecord] CHECK CONSTRAINT [FK_QuarterlyEmploymentRecord_RefERAdministrativeDataSource]
GO
/****** Object:  ForeignKey [FK_RefAbsentAttendanceCategory_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAbsentAttendanceCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefAbsentAttendanceCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAbsentAttendanceCategory] CHECK CONSTRAINT [FK_RefAbsentAttendanceCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefAcademicAwardLevel_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAcademicAwardLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefAcademicAwardLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAcademicAwardLevel] CHECK CONSTRAINT [FK_RefAcademicAwardLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefAcademicHonorType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAcademicHonorType]  WITH CHECK ADD  CONSTRAINT [FK_RefAcademicHonorType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAcademicHonorType] CHECK CONSTRAINT [FK_RefAcademicHonorType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAcademicRank_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAcademicRank]  WITH CHECK ADD  CONSTRAINT [FK_RefAcademicRank_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAcademicRank] CHECK CONSTRAINT [FK_RefAcademicRank_Organization]
GO
/****** Object:  ForeignKey [FK_RefAcademicSubject_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAcademicSubject]  WITH CHECK ADD  CONSTRAINT [FK_RefAcademicSubject_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAcademicSubject] CHECK CONSTRAINT [FK_RefAcademicSubject_Organization]
GO
/****** Object:  ForeignKey [FK_RefAcademicTermDesignator_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAcademicTermDesignator]  WITH CHECK ADD  CONSTRAINT [FK_RefAcademicTermDesignator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAcademicTermDesignator] CHECK CONSTRAINT [FK_RefAcademicTermDesignator_Organization]
GO
/****** Object:  ForeignKey [FK_RefAccommodationsNeededType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAccommodationsNeededType]  WITH CHECK ADD  CONSTRAINT [FK_RefAccommodationsNeededType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAccommodationsNeededType] CHECK CONSTRAINT [FK_RefAccommodationsNeededType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAccreditationAgency_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAccreditationAgency]  WITH CHECK ADD  CONSTRAINT [FK_RefAccreditationAgency_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAccreditationAgency] CHECK CONSTRAINT [FK_RefAccreditationAgency_Organization]
GO
/****** Object:  ForeignKey [FK_RefActivityRecognitionType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefActivityRecognitionType]  WITH CHECK ADD  CONSTRAINT [FK_RefActivityRecognitionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefActivityRecognitionType] CHECK CONSTRAINT [FK_RefActivityRecognitionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAdditionalCreditType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAdditionalCreditType]  WITH CHECK ADD  CONSTRAINT [FK_RefAdditionalCreditType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAdditionalCreditType] CHECK CONSTRAINT [FK_RefAdditionalCreditType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAddressType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAddressType]  WITH CHECK ADD  CONSTRAINT [FK_RefAddressType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAddressType] CHECK CONSTRAINT [FK_RefAddressType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAdminFundingControl_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAdministrativeFundingControl]  WITH CHECK ADD  CONSTRAINT [FK_RefAdminFundingControl_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAdministrativeFundingControl] CHECK CONSTRAINT [FK_RefAdminFundingControl_Organization]
GO
/****** Object:  ForeignKey [FK_RefAdmittedStudent_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAdmittedStudent]  WITH CHECK ADD  CONSTRAINT [FK_RefAdmittedStudent_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAdmittedStudent] CHECK CONSTRAINT [FK_RefAdmittedStudent_Organization]
GO
/****** Object:  ForeignKey [FK_RefAdvancedPlacementCourseCode_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAdvancedPlacementCourseCode]  WITH CHECK ADD  CONSTRAINT [FK_RefAdvancedPlacementCourseCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAdvancedPlacementCourseCode] CHECK CONSTRAINT [FK_RefAdvancedPlacementCourseCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefAECertificationType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeCertificationType]  WITH CHECK ADD  CONSTRAINT [FK_RefAECertificationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeCertificationType] CHECK CONSTRAINT [FK_RefAECertificationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAEFunctioningLevelAtIntake_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeFunctioningLevelAtIntake]  WITH CHECK ADD  CONSTRAINT [FK_RefAEFunctioningLevelAtIntake_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeFunctioningLevelAtIntake] CHECK CONSTRAINT [FK_RefAEFunctioningLevelAtIntake_Organization]
GO
/****** Object:  ForeignKey [FK_RefAEFunctioningLevelAtPosttest_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeFunctioningLevelAtPosttest]  WITH CHECK ADD  CONSTRAINT [FK_RefAEFunctioningLevelAtPosttest_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeFunctioningLevelAtPosttest] CHECK CONSTRAINT [FK_RefAEFunctioningLevelAtPosttest_Organization]
GO
/****** Object:  ForeignKey [FK_RefAEInstructionalProgramType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeInstructionalProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefAEInstructionalProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeInstructionalProgramType] CHECK CONSTRAINT [FK_RefAEInstructionalProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAEPostsecondaryTransitionAction_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAePostsecondaryTransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_RefAEPostsecondaryTransitionAction_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAePostsecondaryTransitionAction] CHECK CONSTRAINT [FK_RefAEPostsecondaryTransitionAction_Organization]
GO
/****** Object:  ForeignKey [FK_RefAeSpecialProgramType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeSpecialProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefAeSpecialProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeSpecialProgramType] CHECK CONSTRAINT [FK_RefAeSpecialProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAEStaffClassification_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeStaffClassification]  WITH CHECK ADD  CONSTRAINT [FK_RefAEStaffClassification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeStaffClassification] CHECK CONSTRAINT [FK_RefAEStaffClassification_Organization]
GO
/****** Object:  ForeignKey [FK_RefAeStaffEmploymentStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAeStaffEmploymentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefAeStaffEmploymentStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAeStaffEmploymentStatus] CHECK CONSTRAINT [FK_RefAeStaffEmploymentStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAllergySeverity_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAllergySeverity]  WITH CHECK ADD  CONSTRAINT [FK_RefAllergySeverity_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAllergySeverity] CHECK CONSTRAINT [FK_RefAllergySeverity_Organization]
GO
/****** Object:  ForeignKey [FK_RefAllergyType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAllergyType]  WITH CHECK ADD  CONSTRAINT [FK_RefAllergyType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAllergyType] CHECK CONSTRAINT [FK_RefAllergyType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAlternateFundUses_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAlternateFundUses]  WITH CHECK ADD  CONSTRAINT [FK_RefAlternateFundUses_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAlternateFundUses] CHECK CONSTRAINT [FK_RefAlternateFundUses_Organization]
GO
/****** Object:  ForeignKey [FK_RefAlternativeSchoolFocus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAlternativeSchoolFocus]  WITH CHECK ADD  CONSTRAINT [FK_RefAlternativeSchoolFocus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAlternativeSchoolFocus] CHECK CONSTRAINT [FK_RefAlternativeSchoolFocus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAltRouteToCertificationOrLicensure_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAltRouteToCertificationOrLicensure]  WITH CHECK ADD  CONSTRAINT [FK_RefAltRouteToCertificationOrLicensure_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAltRouteToCertificationOrLicensure] CHECK CONSTRAINT [FK_RefAltRouteToCertificationOrLicensure_Organization]
GO
/****** Object:  ForeignKey [FK_RefAmaoAttainmentStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAmaoAttainmentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefAmaoAttainmentStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAmaoAttainmentStatus] CHECK CONSTRAINT [FK_RefAmaoAttainmentStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAPIPInteractionType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefApipInteractionType]  WITH CHECK ADD  CONSTRAINT [FK_RefAPIPInteractionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefApipInteractionType] CHECK CONSTRAINT [FK_RefAPIPInteractionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentAccommodationType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentAccommodationType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentAccommodationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentAccommodationType] CHECK CONSTRAINT [FK_RefAssessmentAccommodationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentAssetIdentifierType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentAssetIdentifierType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentAssetIdentifierType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentAssetIdentifierType] CHECK CONSTRAINT [FK_RefAssessmentAssetIdentifierType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentAssetType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentAssetType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentAssetType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentAssetType] CHECK CONSTRAINT [FK_RefAssessmentAssetType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentFormSectionIDType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentFormSectionIdentificationSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentFormSectionIDType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentFormSectionIdentificationSystem] CHECK CONSTRAINT [FK_RefAssessmentFormSectionIDType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentGradeLevel_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentGradeLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentGradeLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentGradeLevel] CHECK CONSTRAINT [FK_RefAssessmentGradeLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessItemCharType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentItemCharacteristicType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessItemCharType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentItemCharacteristicType] CHECK CONSTRAINT [FK_RefAssessItemCharType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessItemResponseStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentItemResponseStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessItemResponseStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentItemResponseStatus] CHECK CONSTRAINT [FK_RefAssessItemResponseStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentItemType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentItemType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentItemType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentItemType] CHECK CONSTRAINT [FK_RefAssessmentItemType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedAlternativeRepresentationType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedAlternativeRepresentationType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedAlternativeRepresentationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedAlternativeRepresentationType] CHECK CONSTRAINT [FK_RefAssessmentNeedAlternativeRepresentationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedBrailleGradeTypeId_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedBrailleGradeType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedBrailleGradeTypeId_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedBrailleGradeType] CHECK CONSTRAINT [FK_RefAssessmentNeedBrailleGradeTypeId_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedBrailleMarkType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedBrailleMarkType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedBrailleMarkType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedBrailleMarkType] CHECK CONSTRAINT [FK_RefAssessmentNeedBrailleMarkType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedBrailleStatusCellType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedBrailleStatusCellType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedBrailleStatusCellType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedBrailleStatusCellType] CHECK CONSTRAINT [FK_RefAssessmentNeedBrailleStatusCellType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedHazardType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedHazardType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedHazardType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedHazardType] CHECK CONSTRAINT [FK_RefAssessmentNeedHazardType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedIncreasedWhitespacingType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedIncreasedWhitespacingType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedIncreasedWhitespacingType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedIncreasedWhitespacingType] CHECK CONSTRAINT [FK_RefAssessmentNeedIncreasedWhitespacingType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedLanguageLearnerType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedLanguageLearnerType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedLanguageLearnerType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedLanguageLearnerType] CHECK CONSTRAINT [FK_RefAssessmentNeedLanguageLearnerType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedMaskingType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedMaskingType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedMaskingType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedMaskingType] CHECK CONSTRAINT [FK_RefAssessmentNeedMaskingType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedNumberOfBrailleDots_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedNumberOfBrailleDots]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedNumberOfBrailleDots_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedNumberOfBrailleDots] CHECK CONSTRAINT [FK_RefAssessmentNeedNumberOfBrailleDots_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedSigningType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedSigningType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedSigningType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedSigningType] CHECK CONSTRAINT [FK_RefAssessmentNeedSigningType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedSpokenSourcePreferenceType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedSpokenSourcePreferenceType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedSpokenSourcePreferenceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedSpokenSourcePreferenceType] CHECK CONSTRAINT [FK_RefAssessmentNeedSpokenSourcePreferenceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedSupportTool_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedSupportTool]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedSupportTool_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedSupportTool] CHECK CONSTRAINT [FK_RefAssessmentNeedSupportTool_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedUsageType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedUsageType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedUsageType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedUsageType] CHECK CONSTRAINT [FK_RefAssessmentNeedUsageType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentNeedUserSpokenPreferenceType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentNeedUserSpokenPreferenceType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentNeedUserSpokenPreferenceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentNeedUserSpokenPreferenceType] CHECK CONSTRAINT [FK_RefAssessmentNeedUserSpokenPreferenceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentParticipationIndicator_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentParticipationIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentParticipationIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentParticipationIndicator] CHECK CONSTRAINT [FK_RefAssessmentParticipationIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentPlatformType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentPlatformType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentPlatformType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentPlatformType] CHECK CONSTRAINT [FK_RefAssessmentPlatformType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentSubtestResultPretestOutcome_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentPretestOutcome]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentSubtestResultPretestOutcome_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentPretestOutcome] CHECK CONSTRAINT [FK_RefAssessmentSubtestResultPretestOutcome_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentPurpose_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentPurpose]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentPurpose_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentPurpose] CHECK CONSTRAINT [FK_RefAssessmentPurpose_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentReasonNotCompleting_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentReasonNotCompleting]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentReasonNotCompleting_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentReasonNotCompleting] CHECK CONSTRAINT [FK_RefAssessmentReasonNotCompleting_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentReasonNotTested_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentReasonNotTested]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentReasonNotTested_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentReasonNotTested] CHECK CONSTRAINT [FK_RefAssessmentReasonNotTested_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentReportingMethod_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentReportingMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentReportingMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentReportingMethod] CHECK CONSTRAINT [FK_RefAssessmentReportingMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentSessionSpecialCircumstanceType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentSessionSpecialCircumstanceType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentSessionSpecialCircumstanceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentSessionSpecialCircumstanceType] CHECK CONSTRAINT [FK_RefAssessmentSessionSpecialCircumstanceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentSessionStaffRoleType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentSessionStaffRoleType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentSessionStaffRoleType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentSessionStaffRoleType] CHECK CONSTRAINT [FK_RefAssessmentSessionStaffRoleType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentSessionType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentSessionType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentSessionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentSessionType] CHECK CONSTRAINT [FK_RefAssessmentSessionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessSubtestIDType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentSubtestIdentifierType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessSubtestIDType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentSubtestIdentifierType] CHECK CONSTRAINT [FK_RefAssessSubtestIDType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentType] CHECK CONSTRAINT [FK_RefAssessmentType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssessmentTypeChildrenWithDisabilities_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAssessmentTypeChildrenWithDisabilities]  WITH CHECK ADD  CONSTRAINT [FK_RefAssessmentTypeChildrenWithDisabilities_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAssessmentTypeChildrenWithDisabilities] CHECK CONSTRAINT [FK_RefAssessmentTypeChildrenWithDisabilities_Organization]
GO
/****** Object:  ForeignKey [FK_RefAttendanceEventType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAttendanceEventType]  WITH CHECK ADD  CONSTRAINT [FK_RefAttendanceEventType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAttendanceEventType] CHECK CONSTRAINT [FK_RefAttendanceEventType_Organization]
GO
/****** Object:  ForeignKey [FK_RefAttendanceStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAttendanceStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefAttendanceStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAttendanceStatus] CHECK CONSTRAINT [FK_RefAttendanceStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAYPStatus_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefAypStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefAYPStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefAypStatus] CHECK CONSTRAINT [FK_RefAYPStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefBarrierToEducatingHomeless_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefBarrierToEducatingHomeless]  WITH CHECK ADD  CONSTRAINT [FK_RefBarrierToEducatingHomeless_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefBarrierToEducatingHomeless] CHECK CONSTRAINT [FK_RefBarrierToEducatingHomeless_Organization]
GO
/****** Object:  ForeignKey [FK_RefBlendedLearningModelType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefBlendedLearningModelType]  WITH CHECK ADD  CONSTRAINT [FK_RefBlendedLearningModelType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefBlendedLearningModelType] CHECK CONSTRAINT [FK_RefBlendedLearningModelType_Organization]
GO
/****** Object:  ForeignKey [FK_RefBloomsTaxonomyDomain_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefBloomsTaxonomyDomain]  WITH CHECK ADD  CONSTRAINT [FK_RefBloomsTaxonomyDomain_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefBloomsTaxonomyDomain] CHECK CONSTRAINT [FK_RefBloomsTaxonomyDomain_Organization]
GO
/****** Object:  ForeignKey [FK_RefBuildingUseType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefBuildingUseType]  WITH CHECK ADD  CONSTRAINT [FK_RefBuildingUseType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefBuildingUseType] CHECK CONSTRAINT [FK_RefBuildingUseType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCalendarEventType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCalendarEventType]  WITH CHECK ADD  CONSTRAINT [FK_RefCalendarEventType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCalendarEventType] CHECK CONSTRAINT [FK_RefCalendarEventType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCampusResidencyType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCampusResidencyType]  WITH CHECK ADD  CONSTRAINT [FK_RefCampusResidencyType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCampusResidencyType] CHECK CONSTRAINT [FK_RefCampusResidencyType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCareerCluster_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCareerCluster]  WITH CHECK ADD  CONSTRAINT [FK_RefCareerCluster_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCareerCluster] CHECK CONSTRAINT [FK_RefCareerCluster_Organization]
GO
/****** Object:  ForeignKey [FK_RefCareerEducationPlanType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCareerEducationPlanType]  WITH CHECK ADD  CONSTRAINT [FK_RefCareerEducationPlanType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCareerEducationPlanType] CHECK CONSTRAINT [FK_RefCareerEducationPlanType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCarnegieBasicClassification_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCarnegieBasicClassification]  WITH CHECK ADD  CONSTRAINT [FK_RefCarnegieBasicClassification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCarnegieBasicClassification] CHECK CONSTRAINT [FK_RefCarnegieBasicClassification_Organization]
GO
/****** Object:  ForeignKey [FK_RefCharterSchoolApprovalAgencyType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCharterSchoolApprovalAgencyType]  WITH CHECK ADD  CONSTRAINT [FK_RefCharterSchoolApprovalAgencyType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCharterSchoolApprovalAgencyType] CHECK CONSTRAINT [FK_RefCharterSchoolApprovalAgencyType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCharterSchoolType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCharterSchoolType]  WITH CHECK ADD  CONSTRAINT [FK_RefCharterSchoolType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCharterSchoolType] CHECK CONSTRAINT [FK_RefCharterSchoolType_Organization]
GO
/****** Object:  ForeignKey [FK_RefChildDevAssociateType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefChildDevelopmentAssociateType]  WITH CHECK ADD  CONSTRAINT [FK_RefChildDevAssociateType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefChildDevelopmentAssociateType] CHECK CONSTRAINT [FK_RefChildDevAssociateType_Organization]
GO
/****** Object:  ForeignKey [FK_RefChildOutcomesSummaryRating_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefChildOutcomesSummaryRating]  WITH CHECK ADD  CONSTRAINT [FK_RefChildOutcomesSummaryRating_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefChildOutcomesSummaryRating] CHECK CONSTRAINT [FK_RefChildOutcomesSummaryRating_Organization]
GO
/****** Object:  ForeignKey [FK_RefCipCode_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCipCode]  WITH CHECK ADD  CONSTRAINT [FK_RefCipCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCipCode] CHECK CONSTRAINT [FK_RefCipCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefCipUse_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCipUse]  WITH CHECK ADD  CONSTRAINT [FK_RefCipUse_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCipUse] CHECK CONSTRAINT [FK_RefCipUse_Organization]
GO
/****** Object:  ForeignKey [FK_RefCipVersion_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCipVersion]  WITH CHECK ADD  CONSTRAINT [FK_RefCipVersion_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCipVersion] CHECK CONSTRAINT [FK_RefCipVersion_Organization]
GO
/****** Object:  ForeignKey [FK_RefClassroomPositionType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefClassroomPositionType]  WITH CHECK ADD  CONSTRAINT [FK_RefClassroomPositionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefClassroomPositionType] CHECK CONSTRAINT [FK_RefClassroomPositionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCohortExclusion_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCohortExclusion]  WITH CHECK ADD  CONSTRAINT [FK_RefCohortExclusion_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCohortExclusion] CHECK CONSTRAINT [FK_RefCohortExclusion_Organization]
GO
/****** Object:  ForeignKey [FK_RefCommunicationMethod_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCommunicationMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefCommunicationMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCommunicationMethod] CHECK CONSTRAINT [FK_RefCommunicationMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefContentStandardType_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefContentStandardType]  WITH CHECK ADD  CONSTRAINT [FK_RefContentStandardType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefContentStandardType] CHECK CONSTRAINT [FK_RefContentStandardType_Organization]
GO
/****** Object:  ForeignKey [FK_RefContinuationOfServices_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefContinuationOfServices]  WITH CHECK ADD  CONSTRAINT [FK_RefContinuationOfServices_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefContinuationOfServices] CHECK CONSTRAINT [FK_RefContinuationOfServices_Organization]
GO
/****** Object:  ForeignKey [FK_RefControlOfInstitution_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefControlOfInstitution]  WITH CHECK ADD  CONSTRAINT [FK_RefControlOfInstitution_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefControlOfInstitution] CHECK CONSTRAINT [FK_RefControlOfInstitution_Organization]
GO
/****** Object:  ForeignKey [FK_RefCoreKnowledgeArea_Organization]    Script Date: 01/24/2014 13:47:59 ******/
ALTER TABLE [dbo].[RefCoreKnowledgeArea]  WITH CHECK ADD  CONSTRAINT [FK_RefCoreKnowledgeArea_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCoreKnowledgeArea] CHECK CONSTRAINT [FK_RefCoreKnowledgeArea_Organization]
GO
/****** Object:  ForeignKey [FK_RefCorrectionalEducationFacilityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCorrectionalEducationFacilityType]  WITH CHECK ADD  CONSTRAINT [FK_RefCorrectionalEducationFacilityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCorrectionalEducationFacilityType] CHECK CONSTRAINT [FK_RefCorrectionalEducationFacilityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCorrectiveActionType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCorrectiveActionType]  WITH CHECK ADD  CONSTRAINT [FK_RefCorrectiveActionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCorrectiveActionType] CHECK CONSTRAINT [FK_RefCorrectiveActionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCountry_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCountry]  WITH CHECK ADD  CONSTRAINT [FK_RefCountry_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCountry] CHECK CONSTRAINT [FK_RefCountry_Org]
GO
/****** Object:  ForeignKey [FK_RefCounty_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCounty]  WITH CHECK ADD  CONSTRAINT [FK_RefCounty_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCounty] CHECK CONSTRAINT [FK_RefCounty_Org]
GO
/****** Object:  ForeignKey [FK_RefCourseAcademicGradeStatusCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseAcademicGradeStatusCode]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseAcademicGradeStatusCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseAcademicGradeStatusCode] CHECK CONSTRAINT [FK_RefCourseAcademicGradeStatusCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseApplicableEducationLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseApplicableEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseApplicableEducationLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseApplicableEducationLevel] CHECK CONSTRAINT [FK_RefCourseApplicableEducationLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseCreditBasisType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseCreditBasisType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseCreditBasisType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseCreditBasisType] CHECK CONSTRAINT [FK_RefCourseCreditBasisType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseCreditLevelType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseCreditLevelType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseCreditLevelType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseCreditLevelType] CHECK CONSTRAINT [FK_RefCourseCreditLevelType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseCreditUnit_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseCreditUnit]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseCreditUnit_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseCreditUnit] CHECK CONSTRAINT [FK_RefCourseCreditUnit_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseGpaApplicability_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseGpaApplicability]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseGpaApplicability_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseGpaApplicability] CHECK CONSTRAINT [FK_RefCourseGpaApplicability_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseHonorsType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseHonorsType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseHonorsType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseHonorsType] CHECK CONSTRAINT [FK_RefCourseHonorsType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseInstructionMethod_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseInstructionMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseInstructionMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseInstructionMethod] CHECK CONSTRAINT [FK_RefCourseInstructionMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseInstructionSiteType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseInstructionSiteType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseInstructionSiteType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseInstructionSiteType] CHECK CONSTRAINT [FK_RefCourseInstructionSiteType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseInteractionMode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseInteractionMode]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseInteractionMode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseInteractionMode] CHECK CONSTRAINT [FK_RefCourseInteractionMode_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseLevelCharacteristic_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseLevelCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseLevelCharacteristic_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseLevelCharacteristic] CHECK CONSTRAINT [FK_RefCourseLevelCharacteristic_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseLevelType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseLevelType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseLevelType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseLevelType] CHECK CONSTRAINT [FK_RefCourseLevelType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseRepeatCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseRepeatCode]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseRepeatCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseRepeatCode] CHECK CONSTRAINT [FK_RefCourseRepeatCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseSectionAssessmentReportingMethod_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseSectionAssessmentReportingMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseSectionAssessmentReportingMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseSectionAssessmentReportingMethod] CHECK CONSTRAINT [FK_RefCourseSectionAssessmentReportingMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseSectionDeliveryMode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseSectionDeliveryMode]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseSectionDeliveryMode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseSectionDeliveryMode] CHECK CONSTRAINT [FK_RefCourseSectionDeliveryMode_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseSectionEnrollmentStatusType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseSectionEnrollmentStatusType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseSectionEnrollmentStatusType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseSectionEnrollmentStatusType] CHECK CONSTRAINT [FK_RefCourseSectionEnrollmentStatusType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseSectionEntryType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseSectionEntryType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseSectionEntryType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseSectionEntryType] CHECK CONSTRAINT [FK_RefCourseSectionEntryType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCourseSectionExitType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCourseSectionExitType]  WITH CHECK ADD  CONSTRAINT [FK_RefCourseSectionExitType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCourseSectionExitType] CHECK CONSTRAINT [FK_RefCourseSectionExitType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCredentialType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCredentialType]  WITH CHECK ADD  CONSTRAINT [FK_RefCredentialType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCredentialType] CHECK CONSTRAINT [FK_RefCredentialType_Organization]
GO
/****** Object:  ForeignKey [FK_RefCreditHoursAppliedOtherProgram_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCreditHoursAppliedOtherProgram]  WITH CHECK ADD  CONSTRAINT [FK_RefCreditHoursAppliedOtherProgram_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCreditHoursAppliedOtherProgram] CHECK CONSTRAINT [FK_RefCreditHoursAppliedOtherProgram_Organization]
GO
/****** Object:  ForeignKey [FK_RefCreditTypeEarned_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCreditTypeEarned]  WITH CHECK ADD  CONSTRAINT [FK_RefCreditTypeEarned_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCreditTypeEarned] CHECK CONSTRAINT [FK_RefCreditTypeEarned_Organization]
GO
/****** Object:  ForeignKey [FK_RefCritTeachShortageCandidate_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCriticalTeacherShortageCandidate]  WITH CHECK ADD  CONSTRAINT [FK_RefCritTeachShortageCandidate_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCriticalTeacherShortageCandidate] CHECK CONSTRAINT [FK_RefCritTeachShortageCandidate_Organization]
GO
/****** Object:  ForeignKey [FK_RefCTEGraduationRateInclusion_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCteGraduationRateInclusion]  WITH CHECK ADD  CONSTRAINT [FK_RefCTEGraduationRateInclusion_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCteGraduationRateInclusion] CHECK CONSTRAINT [FK_RefCTEGraduationRateInclusion_Organization]
GO
/****** Object:  ForeignKey [FK_RefCteNonTraditionalGenderStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCteNonTraditionalGenderStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefCteNonTraditionalGenderStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCteNonTraditionalGenderStatus] CHECK CONSTRAINT [FK_RefCteNonTraditionalGenderStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefCurriculumFrameworkType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefCurriculumFrameworkType]  WITH CHECK ADD  CONSTRAINT [FK_RefCurriculumFrameworkType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefCurriculumFrameworkType] CHECK CONSTRAINT [FK_RefCurriculumFrameworkType_Organization]
GO
/****** Object:  ForeignKey [FK_RefDegreeCertificateType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDegreeOrCertificateType]  WITH CHECK ADD  CONSTRAINT [FK_RefDegreeCertificateType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDegreeOrCertificateType] CHECK CONSTRAINT [FK_RefDegreeCertificateType_Organization]
GO
/****** Object:  ForeignKey [FK_RefDentalInsuranceCoverageType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDentalInsuranceCoverageType]  WITH CHECK ADD  CONSTRAINT [FK_RefDentalInsuranceCoverageType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDentalInsuranceCoverageType] CHECK CONSTRAINT [FK_RefDentalInsuranceCoverageType_Organization]
GO
/****** Object:  ForeignKey [FK_RefDental_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDentalScreeningStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefDental_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDentalScreeningStatus] CHECK CONSTRAINT [FK_RefDental_Org]
GO
/****** Object:  ForeignKey [FK_RefDependencyStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDependencyStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefDependencyStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDependencyStatus] CHECK CONSTRAINT [FK_RefDependencyStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisabilityConditionStatusCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisabilityConditionStatusCode]  WITH CHECK ADD  CONSTRAINT [FK_RefDisabilityConditionStatusCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisabilityConditionStatusCode] CHECK CONSTRAINT [FK_RefDisabilityConditionStatusCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisabilityConditionType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisabilityConditionType]  WITH CHECK ADD  CONSTRAINT [FK_RefDisabilityConditionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisabilityConditionType] CHECK CONSTRAINT [FK_RefDisabilityConditionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisabilityDeterminationSourceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisabilityDeterminationSourceType]  WITH CHECK ADD  CONSTRAINT [FK_RefDisabilityDeterminationSourceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisabilityDeterminationSourceType] CHECK CONSTRAINT [FK_RefDisabilityDeterminationSourceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisability_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisabilityType]  WITH CHECK ADD  CONSTRAINT [FK_RefDisability_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisabilityType] CHECK CONSTRAINT [FK_RefDisability_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisciplinaryActionTaken_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisciplinaryActionTaken]  WITH CHECK ADD  CONSTRAINT [FK_RefDisciplinaryActionTaken_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisciplinaryActionTaken] CHECK CONSTRAINT [FK_RefDisciplinaryActionTaken_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisciplineLengthDifference_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisciplineLengthDifferenceReason]  WITH CHECK ADD  CONSTRAINT [FK_RefDisciplineLengthDifference_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisciplineLengthDifferenceReason] CHECK CONSTRAINT [FK_RefDisciplineLengthDifference_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisciplineMethodFirearms_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisciplineMethodFirearms]  WITH CHECK ADD  CONSTRAINT [FK_RefDisciplineMethodFirearms_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisciplineMethodFirearms] CHECK CONSTRAINT [FK_RefDisciplineMethodFirearms_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisciplineMethodOfCWD_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisciplineMethodOfCwd]  WITH CHECK ADD  CONSTRAINT [FK_RefDisciplineMethodOfCWD_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisciplineMethodOfCwd] CHECK CONSTRAINT [FK_RefDisciplineMethodOfCWD_Organization]
GO
/****** Object:  ForeignKey [FK_RefDisciplineReason_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDisciplineReason]  WITH CHECK ADD  CONSTRAINT [FK_RefDisciplineReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDisciplineReason] CHECK CONSTRAINT [FK_RefDisciplineReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefDistanceEducationCourseEnr_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDistanceEducationCourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_RefDistanceEducationCourseEnr_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDistanceEducationCourseEnrollment] CHECK CONSTRAINT [FK_RefDistanceEducationCourseEnr_Organization]
GO
/****** Object:  ForeignKey [FK_RefDoctoralExamsRequiredCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefDoctoralExamsRequiredCode]  WITH CHECK ADD  CONSTRAINT [FK_RefDoctoralExamsRequiredCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefDoctoralExamsRequiredCode] CHECK CONSTRAINT [FK_RefDoctoralExamsRequiredCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefEarlyChildhoodCredential_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEarlyChildhoodCredential]  WITH CHECK ADD  CONSTRAINT [FK_RefEarlyChildhoodCredential_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEarlyChildhoodCredential] CHECK CONSTRAINT [FK_RefEarlyChildhoodCredential_Organization]
GO
/****** Object:  ForeignKey [FK_RefECEnrollmentServiceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEarlyChildhoodEnrollmentServiceType]  WITH CHECK ADD  CONSTRAINT [FK_RefECEnrollmentServiceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEarlyChildhoodEnrollmentServiceType] CHECK CONSTRAINT [FK_RefECEnrollmentServiceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEarlyChildhoodProgramType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEarlyChildhoodProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefEarlyChildhoodProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEarlyChildhoodProgramType] CHECK CONSTRAINT [FK_RefEarlyChildhoodProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEducationLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefEducationLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEducationLevel] CHECK CONSTRAINT [FK_RefEducationLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefEducationLevel_RefEducationLevelType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEducationLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefEducationLevel_RefEducationLevelType] FOREIGN KEY([RefEducationLevelTypeId])
REFERENCES [dbo].[RefEducationLevelType] ([RefEducationLevelTypeId])
GO
ALTER TABLE [dbo].[RefEducationLevel] CHECK CONSTRAINT [FK_RefEducationLevel_RefEducationLevelType]
GO
/****** Object:  ForeignKey [FK_RefEducationLevelType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEducationLevelType]  WITH CHECK ADD  CONSTRAINT [FK_RefEducationLevelType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEducationLevelType] CHECK CONSTRAINT [FK_RefEducationLevelType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEducationStaffClassification_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEducationStaffClassification]  WITH CHECK ADD  CONSTRAINT [FK_RefEducationStaffClassification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEducationStaffClassification] CHECK CONSTRAINT [FK_RefEducationStaffClassification_Organization]
GO
/****** Object:  ForeignKey [FK_RefELClassGroupCurriculumType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELClassGroupCurriculumType]  WITH CHECK ADD  CONSTRAINT [FK_RefELClassGroupCurriculumType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELClassGroupCurriculumType] CHECK CONSTRAINT [FK_RefELClassGroupCurriculumType_Organization]
GO
/****** Object:  ForeignKey [FK_RefElementaryMiddleAdditional_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefElementaryMiddleAdditional]  WITH CHECK ADD  CONSTRAINT [FK_RefElementaryMiddleAdditional_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefElementaryMiddleAdditional] CHECK CONSTRAINT [FK_RefElementaryMiddleAdditional_Organization]
GO
/****** Object:  ForeignKey [FK_RefELExperience_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELExperience]  WITH CHECK ADD  CONSTRAINT [FK_RefELExperience_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELExperience] CHECK CONSTRAINT [FK_RefELExperience_Organization]
GO
/****** Object:  ForeignKey [FK_RefELFacilityLicensingStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELFacilityLicensingStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefELFacilityLicensingStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELFacilityLicensingStatus] CHECK CONSTRAINT [FK_RefELFacilityLicensingStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefELFederalFundingType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELFederalFundingType]  WITH CHECK ADD  CONSTRAINT [FK_RefELFederalFundingType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELFederalFundingType] CHECK CONSTRAINT [FK_RefELFederalFundingType_Organization]
GO
/****** Object:  ForeignKey [FK_RefELGroupSizeStandardMet_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELGroupSizeStandardMet]  WITH CHECK ADD  CONSTRAINT [FK_RefELGroupSizeStandardMet_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELGroupSizeStandardMet] CHECK CONSTRAINT [FK_RefELGroupSizeStandardMet_Organization]
GO
/****** Object:  ForeignKey [FK_RefELLevelOfSpecialization_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELLevelOfSpecialization]  WITH CHECK ADD  CONSTRAINT [FK_RefELLevelOfSpecialization_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELLevelOfSpecialization] CHECK CONSTRAINT [FK_RefELLevelOfSpecialization_Organization]
GO
/****** Object:  ForeignKey [FK_RefELOtherFederalFundingSources_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELOtherFederalFundingSources]  WITH CHECK ADD  CONSTRAINT [FK_RefELOtherFederalFundingSources_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELOtherFederalFundingSources] CHECK CONSTRAINT [FK_RefELOtherFederalFundingSources_Organization]
GO
/****** Object:  ForeignKey [FK_RefELOutcomeMeasurementLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELOutcomeMeasurementLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefELOutcomeMeasurementLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELOutcomeMeasurementLevel] CHECK CONSTRAINT [FK_RefELOutcomeMeasurementLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefELProfessionalDevelopmentTopicArea_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELProfessionalDevelopmentTopicArea]  WITH CHECK ADD  CONSTRAINT [FK_RefELProfessionalDevelopmentTopicArea_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELProfessionalDevelopmentTopicArea] CHECK CONSTRAINT [FK_RefELProfessionalDevelopmentTopicArea_Organization]
GO
/****** Object:  ForeignKey [FK_RefELProgramEligibility_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELProgramEligibility]  WITH CHECK ADD  CONSTRAINT [FK_RefELProgramEligibility_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELProgramEligibility] CHECK CONSTRAINT [FK_RefELProgramEligibility_Organization]
GO
/****** Object:  ForeignKey [FK_RefELProgramEligibilityStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELProgramEligibilityStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefELProgramEligibilityStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELProgramEligibilityStatus] CHECK CONSTRAINT [FK_RefELProgramEligibilityStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefELProgramLicenseStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELProgramLicenseStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefELProgramLicenseStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELProgramLicenseStatus] CHECK CONSTRAINT [FK_RefELProgramLicenseStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefELServiceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefELServiceType]  WITH CHECK ADD  CONSTRAINT [FK_RefELServiceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefELServiceType] CHECK CONSTRAINT [FK_RefELServiceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmailType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmailType]  WITH CHECK ADD  CONSTRAINT [FK_RefEmailType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmailType] CHECK CONSTRAINT [FK_RefEmailType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmployedAfterExit_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmployedAfterExit]  WITH CHECK ADD  CONSTRAINT [FK_RefEmployedAfterExit_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmployedAfterExit] CHECK CONSTRAINT [FK_RefEmployedAfterExit_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmployedPriorToEnrollment_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmployedPriorToEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_RefEmployedPriorToEnrollment_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmployedPriorToEnrollment] CHECK CONSTRAINT [FK_RefEmployedPriorToEnrollment_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmployedWhileEnrolled_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmployedWhileEnrolled]  WITH CHECK ADD  CONSTRAINT [FK_RefEmployedWhileEnrolled_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmployedWhileEnrolled] CHECK CONSTRAINT [FK_RefEmployedWhileEnrolled_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmploymentContractType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmploymentContractType]  WITH CHECK ADD  CONSTRAINT [FK_RefEmploymentContractType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmploymentContractType] CHECK CONSTRAINT [FK_RefEmploymentContractType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmploymentSeparationReason_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmploymentSeparationReason]  WITH CHECK ADD  CONSTRAINT [FK_RefEmploymentSeparationReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmploymentSeparationReason] CHECK CONSTRAINT [FK_RefEmploymentSeparationReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmploymentSeparationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmploymentSeparationType]  WITH CHECK ADD  CONSTRAINT [FK_RefEmploymentSeparationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmploymentSeparationType] CHECK CONSTRAINT [FK_RefEmploymentSeparationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmploymentStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmploymentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefEmploymentStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmploymentStatus] CHECK CONSTRAINT [FK_RefEmploymentStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefEmploymentStatusWhileEnrolled_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEmploymentStatusWhileEnrolled]  WITH CHECK ADD  CONSTRAINT [FK_RefEmploymentStatusWhileEnrolled_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEmploymentStatusWhileEnrolled] CHECK CONSTRAINT [FK_RefEmploymentStatusWhileEnrolled_Organization]
GO
/****** Object:  ForeignKey [FK_RefEndOfTermStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEndOfTermStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefEndOfTermStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEndOfTermStatus] CHECK CONSTRAINT [FK_RefEndOfTermStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefEnrollmentStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEnrollmentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefEnrollmentStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEnrollmentStatus] CHECK CONSTRAINT [FK_RefEnrollmentStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefAssociatedEntityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEntityType]  WITH CHECK ADD  CONSTRAINT [FK_RefAssociatedEntityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEntityType] CHECK CONSTRAINT [FK_RefAssociatedEntityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEntryType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEntryType]  WITH CHECK ADD  CONSTRAINT [FK_RefEntryType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEntryType] CHECK CONSTRAINT [FK_RefEntryType_Organization]
GO
/****** Object:  ForeignKey [FK_RefEnvironmentSetting_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefEnvironmentSetting]  WITH CHECK ADD  CONSTRAINT [FK_RefEnvironmentSetting_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefEnvironmentSetting] CHECK CONSTRAINT [FK_RefEnvironmentSetting_Organization]
GO
/****** Object:  ForeignKey [FK_RefERAdministrativeDataSource_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefERAdministrativeDataSource]  WITH CHECK ADD  CONSTRAINT [FK_RefERAdministrativeDataSource_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefERAdministrativeDataSource] CHECK CONSTRAINT [FK_RefERAdministrativeDataSource_Organization]
GO
/****** Object:  ForeignKey [FK_RefERSRuralUrbanContinuumCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefERSRuralUrbanContinuumCode]  WITH CHECK ADD  CONSTRAINT [FK_RefERSRuralUrbanContinuumCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefERSRuralUrbanContinuumCode] CHECK CONSTRAINT [FK_RefERSRuralUrbanContinuumCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefExitOrWithdrawalStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefExitOrWithdrawalStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefExitOrWithdrawalStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefExitOrWithdrawalStatus] CHECK CONSTRAINT [FK_RefExitOrWithdrawalStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefExitOrWithdrawalType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefExitOrWithdrawalType]  WITH CHECK ADD  CONSTRAINT [FK_RefExitOrWithdrawalType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefExitOrWithdrawalType] CHECK CONSTRAINT [FK_RefExitOrWithdrawalType_Organization]
GO
/****** Object:  ForeignKey [FK_RefFamilyIncomeSource_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFamilyIncomeSource]  WITH CHECK ADD  CONSTRAINT [FK_RefFamilyIncomeSource_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFamilyIncomeSource] CHECK CONSTRAINT [FK_RefFamilyIncomeSource_Org]
GO
/****** Object:  ForeignKey [FK_RefFederalFundingAllocation_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFederalProgramFundingAllocationType]  WITH CHECK ADD  CONSTRAINT [FK_RefFederalFundingAllocation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFederalProgramFundingAllocationType] CHECK CONSTRAINT [FK_RefFederalFundingAllocation_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAccountCategory_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAccountCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAccountCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAccountCategory] CHECK CONSTRAINT [FK_RefFinancialAccountCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAccountFundClassification_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAccountFundClassification]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAccountFundClassification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAccountFundClassification] CHECK CONSTRAINT [FK_RefFinancialAccountFundClassification_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAccountProgramCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAccountProgramCode]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAccountProgramCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAccountProgramCode] CHECK CONSTRAINT [FK_RefFinancialAccountProgramCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAidApplType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAidApplicationType]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAidApplType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAidApplicationType] CHECK CONSTRAINT [FK_RefFinancialAidApplType_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAidAwardStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAidAwardStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAidAwardStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAidAwardStatus] CHECK CONSTRAINT [FK_RefFinancialAidAwardStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialAidAwardType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialAidAwardType]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialAidAwardType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialAidAwardType] CHECK CONSTRAINT [FK_RefFinancialAidAwardType_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialBalanceSheetAccountCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialBalanceSheetAccountCode]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialBalanceSheetAccountCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialBalanceSheetAccountCode] CHECK CONSTRAINT [FK_RefFinancialBalanceSheetAccountCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialExpenditureFunctionCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialExpenditureFunctionCode]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialExpenditureFunctionCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialExpenditureFunctionCode] CHECK CONSTRAINT [FK_RefFinancialExpenditureFunctionCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialExpenditureObjectCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialExpenditureObjectCode]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialExpenditureObjectCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialExpenditureObjectCode] CHECK CONSTRAINT [FK_RefFinancialExpenditureObjectCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefFinancialRevenueAccountCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFinancialRevenueAccountCode]  WITH CHECK ADD  CONSTRAINT [FK_RefFinancialRevenueAccountCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFinancialRevenueAccountCode] CHECK CONSTRAINT [FK_RefFinancialRevenueAccountCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefFirearmType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFirearmType]  WITH CHECK ADD  CONSTRAINT [FK_RefFirearmType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFirearmType] CHECK CONSTRAINT [FK_RefFirearmType_Organization]
GO
/****** Object:  ForeignKey [FK_RefFoodServiceEligibility_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFoodServiceEligibility]  WITH CHECK ADD  CONSTRAINT [FK_RefFoodServiceEligibility_Organization] FOREIGN KEY([RefJurisdiction])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFoodServiceEligibility] CHECK CONSTRAINT [FK_RefFoodServiceEligibility_Organization]
GO
/****** Object:  ForeignKey [FK_RefFoodServiceParticipation_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFoodServiceParticipation]  WITH CHECK ADD  CONSTRAINT [FK_RefFoodServiceParticipation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFoodServiceParticipation] CHECK CONSTRAINT [FK_RefFoodServiceParticipation_Organization]
GO
/****** Object:  ForeignKey [FK_RefFrequencyOfService_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFrequencyOfService]  WITH CHECK ADD  CONSTRAINT [FK_RefFrequencyOfService_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFrequencyOfService] CHECK CONSTRAINT [FK_RefFrequencyOfService_Organization]
GO
/****** Object:  ForeignKey [FK_RefFullTimeStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefFullTimeStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefFullTimeStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefFullTimeStatus] CHECK CONSTRAINT [FK_RefFullTimeStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefGoalsForAttendingAdultEducation_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGoalsForAttendingAdultEducation]  WITH CHECK ADD  CONSTRAINT [FK_RefGoalsForAttendingAdultEducation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGoalsForAttendingAdultEducation] CHECK CONSTRAINT [FK_RefGoalsForAttendingAdultEducation_Organization]
GO
/****** Object:  ForeignKey [FK_RefGpaWeightedIndicator_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGpaWeightedIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefGpaWeightedIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGpaWeightedIndicator] CHECK CONSTRAINT [FK_RefGpaWeightedIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefGradeLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGradeLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefGradeLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGradeLevel] CHECK CONSTRAINT [FK_RefGradeLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefGradeLevel_RefGradeLevelType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGradeLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefGradeLevel_RefGradeLevelType] FOREIGN KEY([RefGradeLevelTypeId])
REFERENCES [dbo].[RefGradeLevelType] ([RefGradeLevelTypeId])
GO
ALTER TABLE [dbo].[RefGradeLevel] CHECK CONSTRAINT [FK_RefGradeLevel_RefGradeLevelType]
GO
/****** Object:  ForeignKey [FK_RefGradeLevelType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGradeLevelType]  WITH CHECK ADD  CONSTRAINT [FK_RefGradeLevelType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGradeLevelType] CHECK CONSTRAINT [FK_RefGradeLevelType_Organization]
GO
/****** Object:  ForeignKey [FK_RefGradePointAverageDomain_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGradePointAverageDomain]  WITH CHECK ADD  CONSTRAINT [FK_RefGradePointAverageDomain_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGradePointAverageDomain] CHECK CONSTRAINT [FK_RefGradePointAverageDomain_Organization]
GO
/****** Object:  ForeignKey [FK_RefGraduateAssistIpedsCategory_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGraduateAssistantIpedsCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefGraduateAssistIpedsCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGraduateAssistantIpedsCategory] CHECK CONSTRAINT [FK_RefGraduateAssistIpedsCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefGraduateOrDoctoralExamResultsStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGraduateOrDoctoralExamResultsStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefGraduateOrDoctoralExamResultsStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGraduateOrDoctoralExamResultsStatus] CHECK CONSTRAINT [FK_RefGraduateOrDoctoralExamResultsStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefGunFreeSchoolsActStatus_Organization1]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefGunFreeSchoolsActReportingStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefGunFreeSchoolsActStatus_Organization1] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefGunFreeSchoolsActReportingStatus] CHECK CONSTRAINT [FK_RefGunFreeSchoolsActStatus_Organization1]
GO
/****** Object:  ForeignKey [FK_RefInsuranceType_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHealthInsuranceCoverage]  WITH CHECK ADD  CONSTRAINT [FK_RefInsuranceType_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHealthInsuranceCoverage] CHECK CONSTRAINT [FK_RefInsuranceType_Org]
GO
/****** Object:  ForeignKey [FK_RefHearingScreeningStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHearingScreeningStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefHearingScreeningStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHearingScreeningStatus] CHECK CONSTRAINT [FK_RefHearingScreeningStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefHigherEdInstitutionAccreditationStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHigherEducationInstitutionAccreditationStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefHigherEdInstitutionAccreditationStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHigherEducationInstitutionAccreditationStatus] CHECK CONSTRAINT [FK_RefHigherEdInstitutionAccreditationStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefHighestEducationLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHighestEducationLevelCompleted]  WITH CHECK ADD  CONSTRAINT [FK_RefHighestEducationLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHighestEducationLevelCompleted] CHECK CONSTRAINT [FK_RefHighestEducationLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefHsDiplomaDistinctionType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHighSchoolDiplomaDistinctionType]  WITH CHECK ADD  CONSTRAINT [FK_RefHsDiplomaDistinctionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHighSchoolDiplomaDistinctionType] CHECK CONSTRAINT [FK_RefHsDiplomaDistinctionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefHighSchoolDiplomaType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHighSchoolDiplomaType]  WITH CHECK ADD  CONSTRAINT [FK_RefHighSchoolDiplomaType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHighSchoolDiplomaType] CHECK CONSTRAINT [FK_RefHighSchoolDiplomaType_Organization]
GO
/****** Object:  ForeignKey [FK_RefHSGraduationRateIndicator_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHighSchoolGraduationRateIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefHSGraduationRateIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHighSchoolGraduationRateIndicator] CHECK CONSTRAINT [FK_RefHSGraduationRateIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefHomelessNighttimeResidence_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefHomelessNighttimeResidence]  WITH CHECK ADD  CONSTRAINT [FK_RefHomelessNighttimeResidence_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefHomelessNighttimeResidence] CHECK CONSTRAINT [FK_RefHomelessNighttimeResidence_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdeaDisciplineMethodFirearm_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEADisciplineMethodFirearm]  WITH CHECK ADD  CONSTRAINT [FK_RefIdeaDisciplineMethodFirearm_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEADisciplineMethodFirearm] CHECK CONSTRAINT [FK_RefIdeaDisciplineMethodFirearm_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdeaEdEnvironmentForEC_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAEducationalEnvironmentEC]  WITH CHECK ADD  CONSTRAINT [FK_RefIdeaEdEnvironmentForEC_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAEducationalEnvironmentEC] CHECK CONSTRAINT [FK_RefIdeaEdEnvironmentForEC_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdeaEdEnvironmentSchoolAge_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAEducationalEnvironmentSchoolAge]  WITH CHECK ADD  CONSTRAINT [FK_RefIdeaEdEnvironmentSchoolAge_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAEducationalEnvironmentSchoolAge] CHECK CONSTRAINT [FK_RefIdeaEdEnvironmentSchoolAge_Organization]
GO
/****** Object:  ForeignKey [FK_RefIDEAEnvironmentEL_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAEnvironmentEL]  WITH CHECK ADD  CONSTRAINT [FK_RefIDEAEnvironmentEL_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAEnvironmentEL] CHECK CONSTRAINT [FK_RefIDEAEnvironmentEL_Organization]
GO
/****** Object:  ForeignKey [FK_RefIDEAIEPStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAIEPStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefIDEAIEPStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAIEPStatus] CHECK CONSTRAINT [FK_RefIDEAIEPStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdeaInterimRemovalId_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAInterimRemoval]  WITH CHECK ADD  CONSTRAINT [FK_RefIdeaInterimRemovalId_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAInterimRemoval] CHECK CONSTRAINT [FK_RefIdeaInterimRemovalId_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdeaInterimRemovalReason_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIDEAInterimRemovalReason]  WITH CHECK ADD  CONSTRAINT [FK_RefIdeaInterimRemovalReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIDEAInterimRemovalReason] CHECK CONSTRAINT [FK_RefIdeaInterimRemovalReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefImmunization_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefImmunizationType]  WITH CHECK ADD  CONSTRAINT [FK_RefImmunization_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefImmunizationType] CHECK CONSTRAINT [FK_RefImmunization_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentBehavior_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentBehavior]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentBehavior_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentBehavior] CHECK CONSTRAINT [FK_RefIncidentBehavior_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentBehaviorSecondary_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentBehaviorSecondary]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentBehaviorSecondary_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentBehaviorSecondary] CHECK CONSTRAINT [FK_RefIncidentBehaviorSecondary_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentInjuryType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentInjuryType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentInjuryType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentInjuryType] CHECK CONSTRAINT [FK_RefIncidentInjuryType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentLocation_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentLocation]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentLocation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentLocation] CHECK CONSTRAINT [FK_RefIncidentLocation_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentMultipleOffenseType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentMultipleOffenseType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentMultipleOffenseType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentMultipleOffenseType] CHECK CONSTRAINT [FK_RefIncidentMultipleOffenseType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentPerpetratorInjuryType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentPerpetratorInjuryType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentPerpetratorInjuryType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentPerpetratorInjuryType] CHECK CONSTRAINT [FK_RefIncidentPerpetratorInjuryType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentPersonRoleType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentPersonRoleType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentPersonRoleType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentPersonRoleType] CHECK CONSTRAINT [FK_RefIncidentPersonRoleType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentPersonType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentPersonType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentPersonType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentPersonType] CHECK CONSTRAINT [FK_RefIncidentPersonType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentReporterType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentReporterType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentReporterType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentReporterType] CHECK CONSTRAINT [FK_RefIncidentReporterType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncidentTimeDescCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncidentTimeDescriptionCode]  WITH CHECK ADD  CONSTRAINT [FK_RefIncidentTimeDescCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncidentTimeDescriptionCode] CHECK CONSTRAINT [FK_RefIncidentTimeDescCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncomeCalculation_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncomeCalculationMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefIncomeCalculation_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncomeCalculationMethod] CHECK CONSTRAINT [FK_RefIncomeCalculation_Org]
GO
/****** Object:  ForeignKey [FK_RefIncomeCalculation_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncomeCalculationMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefIncomeCalculation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncomeCalculationMethod] CHECK CONSTRAINT [FK_RefIncomeCalculation_Organization]
GO
/****** Object:  ForeignKey [FK_RefIncreasedLearningTimeType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIncreasedLearningTimeType]  WITH CHECK ADD  CONSTRAINT [FK_RefIncreasedLearningTimeType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIncreasedLearningTimeType] CHECK CONSTRAINT [FK_RefIncreasedLearningTimeType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIndividualizedProgramDateType_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIndividualizedProgramDateType]  WITH CHECK ADD  CONSTRAINT [FK_RefIndividualizedProgramDateType_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIndividualizedProgramDateType] CHECK CONSTRAINT [FK_RefIndividualizedProgramDateType_Org]
GO
/****** Object:  ForeignKey [FK_RefIndividualizedProgramLocation_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIndividualizedProgramLocation]  WITH CHECK ADD  CONSTRAINT [FK_RefIndividualizedProgramLocation_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIndividualizedProgramLocation] CHECK CONSTRAINT [FK_RefIndividualizedProgramLocation_Org]
GO
/****** Object:  ForeignKey [FK_RefIndividualizedProgramPlannedServiceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIndividualizedProgramPlannedServiceType]  WITH CHECK ADD  CONSTRAINT [FK_RefIndividualizedProgramPlannedServiceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIndividualizedProgramPlannedServiceType] CHECK CONSTRAINT [FK_RefIndividualizedProgramPlannedServiceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIndividualizedProgramTransitionType_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIndividualizedProgramTransitionType]  WITH CHECK ADD  CONSTRAINT [FK_RefIndividualizedProgramTransitionType_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIndividualizedProgramTransitionType] CHECK CONSTRAINT [FK_RefIndividualizedProgramTransitionType_Org]
GO
/****** Object:  ForeignKey [FK_RefIndivProgramType_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIndividualizedProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefIndivProgramType_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIndividualizedProgramType] CHECK CONSTRAINT [FK_RefIndivProgramType_Org]
GO
/****** Object:  ForeignKey [FK_RefInstitutionTelephone_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstitutionTelephoneType]  WITH CHECK ADD  CONSTRAINT [FK_RefInstitutionTelephone_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstitutionTelephoneType] CHECK CONSTRAINT [FK_RefInstitutionTelephone_Org]
GO
/****** Object:  ForeignKey [FK_RefInstructionalActivityHours_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstructionalActivityHours]  WITH CHECK ADD  CONSTRAINT [FK_RefInstructionalActivityHours_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstructionalActivityHours] CHECK CONSTRAINT [FK_RefInstructionalActivityHours_Organization]
GO
/****** Object:  ForeignKey [FK_RefInstructStaffContractLength_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstructionalStaffContractLength]  WITH CHECK ADD  CONSTRAINT [FK_RefInstructStaffContractLength_Organization] FOREIGN KEY([RefJurisdictoinId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstructionalStaffContractLength] CHECK CONSTRAINT [FK_RefInstructStaffContractLength_Organization]
GO
/****** Object:  ForeignKey [FK_RefInstructStaffFacultyTenure_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstructionalStaffFacultyTenure]  WITH CHECK ADD  CONSTRAINT [FK_RefInstructStaffFacultyTenure_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstructionalStaffFacultyTenure] CHECK CONSTRAINT [FK_RefInstructStaffFacultyTenure_Organization]
GO
/****** Object:  ForeignKey [FK_RefInstructionCreditType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstructionCreditType]  WITH CHECK ADD  CONSTRAINT [FK_RefInstructionCreditType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstructionCreditType] CHECK CONSTRAINT [FK_RefInstructionCreditType_Organization]
GO
/****** Object:  ForeignKey [FK_RefInstructionLocationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInstructionLocationType]  WITH CHECK ADD  CONSTRAINT [FK_RefInstructionLocationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInstructionLocationType] CHECK CONSTRAINT [FK_RefInstructionLocationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIntegratedTechnologyStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIntegratedTechnologyStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefIntegratedTechnologyStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIntegratedTechnologyStatus] CHECK CONSTRAINT [FK_RefIntegratedTechnologyStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefInternetAccess_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefInternetAccess]  WITH CHECK ADD  CONSTRAINT [FK_RefInternetAccess_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefInternetAccess] CHECK CONSTRAINT [FK_RefInternetAccess_Organization]
GO
/****** Object:  ForeignKey [FK_RefIpedsOccupationalCategory_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefIpedsOccupationalCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefIpedsOccupationalCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefIpedsOccupationalCategory] CHECK CONSTRAINT [FK_RefIpedsOccupationalCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefIRtKappaAlgorithm_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefItemResponseTheoryKappaAlgorithm]  WITH CHECK ADD  CONSTRAINT [FK_RefIRtKappaAlgorithm_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefItemResponseTheoryKappaAlgorithm] CHECK CONSTRAINT [FK_RefIRtKappaAlgorithm_Organization]
GO
/****** Object:  ForeignKey [FK_RefIRtDifficultyCategory_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefItemResponsseTheoryDifficultyCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefIRtDifficultyCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefItemResponsseTheoryDifficultyCategory] CHECK CONSTRAINT [FK_RefIRtDifficultyCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefK12EndOfCourseRequirement_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefK12EndOfCourseRequirement]  WITH CHECK ADD  CONSTRAINT [FK_RefK12EndOfCourseRequirement_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefK12EndOfCourseRequirement] CHECK CONSTRAINT [FK_RefK12EndOfCourseRequirement_Organization]
GO
/****** Object:  ForeignKey [FK_RefK12LEATitleISupportService_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefK12LeaTitleISupportService]  WITH CHECK ADD  CONSTRAINT [FK_RefK12LEATitleISupportService_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefK12LeaTitleISupportService] CHECK CONSTRAINT [FK_RefK12LEATitleISupportService_Organization]
GO
/****** Object:  ForeignKey [FK_RefK12ResponsibilityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefK12ResponsibilityType]  WITH CHECK ADD  CONSTRAINT [FK_RefK12ResponsibilityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefK12ResponsibilityType] CHECK CONSTRAINT [FK_RefK12ResponsibilityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLanguage_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLanguage]  WITH CHECK ADD  CONSTRAINT [FK_RefLanguage_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLanguage] CHECK CONSTRAINT [FK_RefLanguage_Organization]
GO
/****** Object:  ForeignKey [FK_RefLanguageUseType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLanguageUseType]  WITH CHECK ADD  CONSTRAINT [FK_RefLanguageUseType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLanguageUseType] CHECK CONSTRAINT [FK_RefLanguageUseType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLEAFundsTransferType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLeaFundsTransferType]  WITH CHECK ADD  CONSTRAINT [FK_RefLEAFundsTransferType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLeaFundsTransferType] CHECK CONSTRAINT [FK_RefLEAFundsTransferType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLEAImprovementStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLeaImprovementStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefLEAImprovementStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLeaImprovementStatus] CHECK CONSTRAINT [FK_RefLEAImprovementStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearnerActionType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearnerActionType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearnerActionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearnerActionType] CHECK CONSTRAINT [FK_RefLearnerActionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefMaxTimeAllowedUnits_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearnerActivityMaximumTimeAllowedUnits]  WITH CHECK ADD  CONSTRAINT [FK_RefMaxTimeAllowedUnits_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearnerActivityMaximumTimeAllowedUnits] CHECK CONSTRAINT [FK_RefMaxTimeAllowedUnits_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearnerActivityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearnerActivityType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearnerActivityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearnerActivityType] CHECK CONSTRAINT [FK_RefLearnerActivityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceAccessAPIType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceAccessAPIType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceAccessAPIType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceAccessAPIType] CHECK CONSTRAINT [FK_RefLearningResourceAccessAPIType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceAccessHazardType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceAccessHazardType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceAccessHazardType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceAccessHazardType] CHECK CONSTRAINT [FK_RefLearningResourceAccessHazardType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceAccessModeType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceAccessModeType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceAccessModeType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceAccessModeType] CHECK CONSTRAINT [FK_RefLearningResourceAccessModeType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceBookFormatType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceBookFormatType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceBookFormatType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceBookFormatType] CHECK CONSTRAINT [FK_RefLearningResourceBookFormatType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceCompetencyAlignmentType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceCompetencyAlignmentType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceCompetencyAlignmentType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceCompetencyAlignmentType] CHECK CONSTRAINT [FK_RefLearningResourceCompetencyAlignmentType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceControlFlexibilityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceControlFlexibilityType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceControlFlexibilityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceControlFlexibilityType] CHECK CONSTRAINT [FK_RefLearningResourceControlFlexibilityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceDigitalMediaSubType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceDigitalMediaSubType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceDigitalMediaSubType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceDigitalMediaSubType] CHECK CONSTRAINT [FK_RefLearningResourceDigitalMediaSubType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceDigitalMediaType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceDigitalMediaType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceDigitalMediaType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceDigitalMediaType] CHECK CONSTRAINT [FK_RefLearningResourceDigitalMediaType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLREducationalUse_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceEducationalUse]  WITH CHECK ADD  CONSTRAINT [FK_RefLREducationalUse_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceEducationalUse] CHECK CONSTRAINT [FK_RefLREducationalUse_Organization]
GO
/****** Object:  ForeignKey [FK_RefLRIntendedEndUserRole_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceIntendedEndUserRole]  WITH CHECK ADD  CONSTRAINT [FK_RefLRIntendedEndUserRole_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceIntendedEndUserRole] CHECK CONSTRAINT [FK_RefLRIntendedEndUserRole_Organization]
GO
/****** Object:  ForeignKey [FK_RefLRInteractivityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceInteractivityType]  WITH CHECK ADD  CONSTRAINT [FK_RefLRInteractivityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceInteractivityType] CHECK CONSTRAINT [FK_RefLRInteractivityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourceMediaFeatureType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceMediaFeatureType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourceMediaFeatureType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceMediaFeatureType] CHECK CONSTRAINT [FK_RefLearningResourceMediaFeatureType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningResourcePhysicalMediaType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourcePhysicalMediaType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningResourcePhysicalMediaType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourcePhysicalMediaType] CHECK CONSTRAINT [FK_RefLearningResourcePhysicalMediaType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLRType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningResourceType]  WITH CHECK ADD  CONSTRAINT [FK_RefLRType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningResourceType] CHECK CONSTRAINT [FK_RefLRType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLSDocumentPublicationStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningStandardDocumentPublicationStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefLSDocumentPublicationStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningStandardDocumentPublicationStatus] CHECK CONSTRAINT [FK_RefLSDocumentPublicationStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningStandardItemAssociationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningStandardItemAssociationType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningStandardItemAssociationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningStandardItemAssociationType] CHECK CONSTRAINT [FK_RefLearningStandardItemAssociationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningStandardItemNodeAccessibilityProfile_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningStandardItemNodeAccessibilityProfile]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningStandardItemNodeAccessibilityProfile_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningStandardItemNodeAccessibilityProfile] CHECK CONSTRAINT [FK_RefLearningStandardItemNodeAccessibilityProfile_Organization]
GO
/****** Object:  ForeignKey [FK_RefLearningStandardItemTestabilityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLearningStandardItemTestabilityType]  WITH CHECK ADD  CONSTRAINT [FK_RefLearningStandardItemTestabilityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLearningStandardItemTestabilityType] CHECK CONSTRAINT [FK_RefLearningStandardItemTestabilityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLeaType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLeaType]  WITH CHECK ADD  CONSTRAINT [FK_RefLeaType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLeaType] CHECK CONSTRAINT [FK_RefLeaType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLeaveEventType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLeaveEventType]  WITH CHECK ADD  CONSTRAINT [FK_RefLeaveEventType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLeaveEventType] CHECK CONSTRAINT [FK_RefLeaveEventType_Organization]
GO
/****** Object:  ForeignKey [FK_RefLevelOfInstitution_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLevelOfInstitution]  WITH CHECK ADD  CONSTRAINT [FK_RefLevelOfInstitution_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLevelOfInstitution] CHECK CONSTRAINT [FK_RefLevelOfInstitution_Organization]
GO
/****** Object:  ForeignKey [FK_RefLicenseExempt_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLicenseExempt]  WITH CHECK ADD  CONSTRAINT [FK_RefLicenseExempt_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLicenseExempt] CHECK CONSTRAINT [FK_RefLicenseExempt_Organization]
GO
/****** Object:  ForeignKey [FK_RefLiteracyAssessment_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefLiteracyAssessment]  WITH CHECK ADD  CONSTRAINT [FK_RefLiteracyAssessment_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefLiteracyAssessment] CHECK CONSTRAINT [FK_RefLiteracyAssessment_Organization]
GO
/****** Object:  ForeignKey [FK_RefMagnetSpecialProgram_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMagnetSpecialProgram]  WITH CHECK ADD  CONSTRAINT [FK_RefMagnetSpecialProgram_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMagnetSpecialProgram] CHECK CONSTRAINT [FK_RefMagnetSpecialProgram_Organization]
GO
/****** Object:  ForeignKey [FK_RefMedAlert_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMedicalAlertIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefMedAlert_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMedicalAlertIndicator] CHECK CONSTRAINT [FK_RefMedAlert_Org]
GO
/****** Object:  ForeignKey [FK_RefMEPEnrollmentType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepEnrollmentType]  WITH CHECK ADD  CONSTRAINT [FK_RefMEPEnrollmentType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepEnrollmentType] CHECK CONSTRAINT [FK_RefMEPEnrollmentType_Organization]
GO
/****** Object:  ForeignKey [FK_RefMEPProjectBased_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepProjectBased]  WITH CHECK ADD  CONSTRAINT [FK_RefMEPProjectBased_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepProjectBased] CHECK CONSTRAINT [FK_RefMEPProjectBased_Organization]
GO
/****** Object:  ForeignKey [FK_RefMepProjectType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepProjectType]  WITH CHECK ADD  CONSTRAINT [FK_RefMepProjectType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepProjectType] CHECK CONSTRAINT [FK_RefMepProjectType_Organization]
GO
/****** Object:  ForeignKey [FK_RefMEPServiceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepServiceType]  WITH CHECK ADD  CONSTRAINT [FK_RefMEPServiceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepServiceType] CHECK CONSTRAINT [FK_RefMEPServiceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefMEPSessionType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepSessionType]  WITH CHECK ADD  CONSTRAINT [FK_RefMEPSessionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepSessionType] CHECK CONSTRAINT [FK_RefMEPSessionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefMepStaffCategory_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMepStaffCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefMepStaffCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMepStaffCategory] CHECK CONSTRAINT [FK_RefMepStaffCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefMethodOfServiceDelivery_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMethodOfServiceDelivery]  WITH CHECK ADD  CONSTRAINT [FK_RefMethodOfServiceDelivery_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMethodOfServiceDelivery] CHECK CONSTRAINT [FK_RefMethodOfServiceDelivery_Organization]
GO
/****** Object:  ForeignKey [FK_RefMultipleIntelligenceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefMultipleIntelligenceType]  WITH CHECK ADD  CONSTRAINT [FK_RefMultipleIntelligenceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefMultipleIntelligenceType] CHECK CONSTRAINT [FK_RefMultipleIntelligenceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefNAEPAspectsOfReading_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNaepAspectsOfReading]  WITH CHECK ADD  CONSTRAINT [FK_RefNAEPAspectsOfReading_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNaepAspectsOfReading] CHECK CONSTRAINT [FK_RefNAEPAspectsOfReading_Organization]
GO
/****** Object:  ForeignKey [FK_RefNAEPMathComplexityLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNaepMathComplexityLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefNAEPMathComplexityLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNaepMathComplexityLevel] CHECK CONSTRAINT [FK_RefNAEPMathComplexityLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefNCESCollegeCourseMapCode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNCESCollegeCourseMapCode]  WITH CHECK ADD  CONSTRAINT [FK_RefNCESCollegeCourseMapCode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNCESCollegeCourseMapCode] CHECK CONSTRAINT [FK_RefNCESCollegeCourseMapCode_Organization]
GO
/****** Object:  ForeignKey [FK_RefNeedDeterminationMethod_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNeedDeterminationMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefNeedDeterminationMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNeedDeterminationMethod] CHECK CONSTRAINT [FK_RefNeedDeterminationMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefNeglectedProgramType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNeglectedProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefNeglectedProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNeglectedProgramType] CHECK CONSTRAINT [FK_RefNeglectedProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefNonPromotionReason_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNonPromotionReason]  WITH CHECK ADD  CONSTRAINT [FK_RefNonPromotionReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNonPromotionReason] CHECK CONSTRAINT [FK_RefNonPromotionReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefNonTraditionalGenderStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefNonTraditionalGenderStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefNonTraditionalGenderStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefNonTraditionalGenderStatus] CHECK CONSTRAINT [FK_RefNonTraditionalGenderStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefOperationalStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOperationalStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefOperationalStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOperationalStatus] CHECK CONSTRAINT [FK_RefOperationalStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefOperationalStatus_RefOperationalStatusType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOperationalStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefOperationalStatus_RefOperationalStatusType] FOREIGN KEY([RefOperationalStatusTypeId])
REFERENCES [dbo].[RefOperationalStatusType] ([RefOperationalStatusTypeId])
GO
ALTER TABLE [dbo].[RefOperationalStatus] CHECK CONSTRAINT [FK_RefOperationalStatus_RefOperationalStatusType]
GO
/****** Object:  ForeignKey [FK_RefOperationalStatusType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOperationalStatusType]  WITH CHECK ADD  CONSTRAINT [FK_RefOperationalStatusType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOperationalStatusType] CHECK CONSTRAINT [FK_RefOperationalStatusType_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationElementType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationElementType]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationElementType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationElementType] CHECK CONSTRAINT [FK_RefOrganizationElementType_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdentifierOrg_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationIdentificationSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefIdentifierOrg_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationIdentificationSystem] CHECK CONSTRAINT [FK_RefIdentifierOrg_Org]
GO
/****** Object:  ForeignKey [FK_RefOrgIdentificationSystem _RefOrganizationIdentifierType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationIdentificationSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefOrgIdentificationSystem _RefOrganizationIdentifierType] FOREIGN KEY([RefOrganizationIdentifierTypeId])
REFERENCES [dbo].[RefOrganizationIdentifierType] ([RefOrganizationIdentifierTypeId])
GO
ALTER TABLE [dbo].[RefOrganizationIdentificationSystem] CHECK CONSTRAINT [FK_RefOrgIdentificationSystem _RefOrganizationIdentifierType]
GO
/****** Object:  ForeignKey [FK_RefOrganizationIdentifierType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationIdentifierType]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationIdentifierType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationIdentifierType] CHECK CONSTRAINT [FK_RefOrganizationIdentifierType_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationIndicator_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationIndicator] CHECK CONSTRAINT [FK_RefOrganizationIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationIndicator_RefOrganizationType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationIndicator_RefOrganizationType] FOREIGN KEY([RefOrganizationTypeId])
REFERENCES [dbo].[RefOrganizationType] ([RefOrganizationTypeId])
GO
ALTER TABLE [dbo].[RefOrganizationIndicator] CHECK CONSTRAINT [FK_RefOrganizationIndicator_RefOrganizationType]
GO
/****** Object:  ForeignKey [FK_RefOrganizationLoc_Org]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationLocationType]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationLoc_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationLocationType] CHECK CONSTRAINT [FK_RefOrganizationLoc_Org]
GO
/****** Object:  ForeignKey [FK_RefOrganizationMonitoringNotifications_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationMonitoringNotifications]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationMonitoringNotifications_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationMonitoringNotifications] CHECK CONSTRAINT [FK_RefOrganizationMonitoringNotifications_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationRelationship_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationRelationship]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationRelationship_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationRelationship] CHECK CONSTRAINT [FK_RefOrganizationRelationship_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationType]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOrganizationType] CHECK CONSTRAINT [FK_RefOrganizationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefOrganizationType_RefOrganizationElementType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOrganizationType]  WITH CHECK ADD  CONSTRAINT [FK_RefOrganizationType_RefOrganizationElementType] FOREIGN KEY([RefOrganizationElementTypeId])
REFERENCES [dbo].[RefOrganizationElementType] ([RefOrganizationElementTypeId])
GO
ALTER TABLE [dbo].[RefOrganizationType] CHECK CONSTRAINT [FK_RefOrganizationType_RefOrganizationElementType]
GO
/****** Object:  ForeignKey [FK_RefOtherName_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOtherNameType]  WITH CHECK ADD  CONSTRAINT [FK_RefOtherName_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOtherNameType] CHECK CONSTRAINT [FK_RefOtherName_Organization]
GO
/****** Object:  ForeignKey [FK_RefOutcomeTimePoint_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefOutcomeTimePoint]  WITH CHECK ADD  CONSTRAINT [FK_RefOutcomeTimePoint_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefOutcomeTimePoint] CHECK CONSTRAINT [FK_RefOutcomeTimePoint_Organization]
GO
/****** Object:  ForeignKey [FK_RefParaprofessionalQualification_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefParaprofessionalQualification]  WITH CHECK ADD  CONSTRAINT [FK_RefParaprofessionalQualification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefParaprofessionalQualification] CHECK CONSTRAINT [FK_RefParaprofessionalQualification_Organization]
GO
/****** Object:  ForeignKey [FK_RefParticipationStatusAYP_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefParticipationStatusAyp]  WITH CHECK ADD  CONSTRAINT [FK_RefParticipationStatusAYP_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefParticipationStatusAyp] CHECK CONSTRAINT [FK_RefParticipationStatusAYP_Organization]
GO
/****** Object:  ForeignKey [FK_RefParticipationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefParticipationType]  WITH CHECK ADD  CONSTRAINT [FK_RefParticipationType_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefParticipationType] CHECK CONSTRAINT [FK_RefParticipationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityApprovedFor_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityApprovedFor]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityApprovedFor_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityApprovedFor] CHECK CONSTRAINT [FK_RefPDActivityApprovedFor_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityCreditType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityCreditType]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityCreditType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityCreditType] CHECK CONSTRAINT [FK_RefPDActivityCreditType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityEducationLevelsAddressed_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityEducationLevelsAddressed]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityEducationLevelsAddressed_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityEducationLevelsAddressed] CHECK CONSTRAINT [FK_RefPDActivityEducationLevelsAddressed_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityLevel_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityLevel] CHECK CONSTRAINT [FK_RefPDActivityLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityTargetAudience_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityTargetAudience]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityTargetAudience_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityTargetAudience] CHECK CONSTRAINT [FK_RefPDActivityTargetAudience_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDActivityType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDActivityType]  WITH CHECK ADD  CONSTRAINT [FK_RefPDActivityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDActivityType] CHECK CONSTRAINT [FK_RefPDActivityType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDAudienceType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDAudienceType]  WITH CHECK ADD  CONSTRAINT [FK_RefPDAudienceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDAudienceType] CHECK CONSTRAINT [FK_RefPDAudienceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDDeliveryMethod_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDDeliveryMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefPDDeliveryMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDDeliveryMethod] CHECK CONSTRAINT [FK_RefPDDeliveryMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDInstructionalDeliveryMode_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDInstructionalDeliveryMode]  WITH CHECK ADD  CONSTRAINT [FK_RefPDInstructionalDeliveryMode_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDInstructionalDeliveryMode] CHECK CONSTRAINT [FK_RefPDInstructionalDeliveryMode_Organization]
GO
/****** Object:  ForeignKey [FK_RefPDSessionStatus_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPDSessionStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefPDSessionStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPDSessionStatus] CHECK CONSTRAINT [FK_RefPDSessionStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonalInfoVerification_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonalInformationVerification]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonalInfoVerification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonalInformationVerification] CHECK CONSTRAINT [FK_RefPersonalInfoVerification_Organization]
GO
/****** Object:  ForeignKey [FK_RefIdentifierPerson_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonIdentificationSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefIdentifierPerson_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonIdentificationSystem] CHECK CONSTRAINT [FK_RefIdentifierPerson_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonIdentificationSystem _RefPersonIdentifierType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonIdentificationSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonIdentificationSystem _RefPersonIdentifierType] FOREIGN KEY([RefPersonIdentifierTypeId])
REFERENCES [dbo].[RefPersonIdentifierType] ([RefPersonIdentifierTypeId])
GO
ALTER TABLE [dbo].[RefPersonIdentificationSystem] CHECK CONSTRAINT [FK_RefPersonIdentificationSystem _RefPersonIdentifierType]
GO
/****** Object:  ForeignKey [FK_RefPersonIdentifierType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonIdentifierType]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonIdentifierType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonIdentifierType] CHECK CONSTRAINT [FK_RefPersonIdentifierType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonLocationType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonLocationType]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonLocationType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonLocationType] CHECK CONSTRAINT [FK_RefPersonLocationType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonLocationType_RefAddressType]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonLocationType]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonLocationType_RefAddressType] FOREIGN KEY([RefAddressTypeId])
REFERENCES [dbo].[RefAddressType] ([RefAddressTypeId])
GO
ALTER TABLE [dbo].[RefPersonLocationType] CHECK CONSTRAINT [FK_RefPersonLocationType_RefAddressType]
GO
/****** Object:  ForeignKey [FK_RefRelationship_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonRelationship]  WITH CHECK ADD  CONSTRAINT [FK_RefRelationship_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonRelationship] CHECK CONSTRAINT [FK_RefRelationship_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonStatusType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonStatusType]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonStatusType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonStatusType] CHECK CONSTRAINT [FK_RefPersonStatusType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPersonTelephoneType_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPersonTelephoneNumberType]  WITH CHECK ADD  CONSTRAINT [FK_RefPersonTelephoneType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPersonTelephoneNumberType] CHECK CONSTRAINT [FK_RefPersonTelephoneType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPopulationServed_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPopulationServed]  WITH CHECK ADD  CONSTRAINT [FK_RefPopulationServed_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPopulationServed] CHECK CONSTRAINT [FK_RefPopulationServed_Organization]
GO
/****** Object:  ForeignKey [FK_RefPreAndPostTestIndicator_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPreAndPostTestIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefPreAndPostTestIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPreAndPostTestIndicator] CHECK CONSTRAINT [FK_RefPreAndPostTestIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefPredominantCalendarSystem_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPredominantCalendarSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefPredominantCalendarSystem_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPredominantCalendarSystem] CHECK CONSTRAINT [FK_RefPredominantCalendarSystem_Organization]
GO
/****** Object:  ForeignKey [FK_RefPreKEligibleAgesNonIDEA_Organization]    Script Date: 01/24/2014 13:48:00 ******/
ALTER TABLE [dbo].[RefPreKEligibleAgesNonIDEA]  WITH CHECK ADD  CONSTRAINT [FK_RefPreKEligibleAgesNonIDEA_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPreKEligibleAgesNonIDEA] CHECK CONSTRAINT [FK_RefPreKEligibleAgesNonIDEA_Organization]
GO
/****** Object:  ForeignKey [FK_RefPrekindergartenEligibility_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPrekindergartenEligibility]  WITH CHECK ADD  CONSTRAINT [FK_RefPrekindergartenEligibility_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPrekindergartenEligibility] CHECK CONSTRAINT [FK_RefPrekindergartenEligibility_Organization]
GO
/****** Object:  ForeignKey [FK_RefPresentAttendanceCategory_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPresentAttendanceCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefPresentAttendanceCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPresentAttendanceCategory] CHECK CONSTRAINT [FK_RefPresentAttendanceCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefProfDevFinancialSupport_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProfessionalDevelopmentFinancialSupport]  WITH CHECK ADD  CONSTRAINT [FK_RefProfDevFinancialSupport_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProfessionalDevelopmentFinancialSupport] CHECK CONSTRAINT [FK_RefProfDevFinancialSupport_Organization]
GO
/****** Object:  ForeignKey [FK_RefProfessionalEducationJobClassification_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProfessionalEducationJobClassification]  WITH CHECK ADD  CONSTRAINT [FK_RefProfessionalEducationJobClassification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProfessionalEducationJobClassification] CHECK CONSTRAINT [FK_RefProfessionalEducationJobClassification_Organization]
GO
/****** Object:  ForeignKey [FK_RefProfTechCredentialType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProfessionalTechnicalCredentialType]  WITH CHECK ADD  CONSTRAINT [FK_RefProfTechCredentialType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProfessionalTechnicalCredentialType] CHECK CONSTRAINT [FK_RefProfTechCredentialType_Organization]
GO
/****** Object:  ForeignKey [FK_RefProficiencyStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProficiencyStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefProficiencyStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProficiencyStatus] CHECK CONSTRAINT [FK_RefProficiencyStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefProficiencyTargetAYP_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProficiencyTargetAyp]  WITH CHECK ADD  CONSTRAINT [FK_RefProficiencyTargetAYP_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProficiencyTargetAyp] CHECK CONSTRAINT [FK_RefProficiencyTargetAYP_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramDayLength_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramDayLength]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramDayLength_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramDayLength] CHECK CONSTRAINT [FK_RefProgramDayLength_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramExitReason_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramExitReason]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramExitReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramExitReason] CHECK CONSTRAINT [FK_RefProgramExitReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramGiftedEligibility_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramGiftedEligibility]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramGiftedEligibility_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramGiftedEligibility] CHECK CONSTRAINT [FK_RefProgramGiftedEligibility_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramLengthHoursType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramLengthHoursType]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramLengthHoursType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramLengthHoursType] CHECK CONSTRAINT [FK_RefProgramLengthHoursType_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramSponsorType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramSponsorType]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramSponsorType_Organization] FOREIGN KEY([RefJurisdiction])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramSponsorType] CHECK CONSTRAINT [FK_RefProgramSponsorType_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgramType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgramType] CHECK CONSTRAINT [FK_RefProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefProgressLevel_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProgressLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefProgressLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProgressLevel] CHECK CONSTRAINT [FK_RefProgressLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefPromotionReason_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPromotionReason]  WITH CHECK ADD  CONSTRAINT [FK_RefPromotionReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPromotionReason] CHECK CONSTRAINT [FK_RefPromotionReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefProofOfResidencyType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefProofOfResidencyType]  WITH CHECK ADD  CONSTRAINT [FK_RefProofOfResidencyType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefProofOfResidencyType] CHECK CONSTRAINT [FK_RefProofOfResidencyType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPSEnrollmentAction_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsEnrollmentAction]  WITH CHECK ADD  CONSTRAINT [FK_RefPSEnrollmentAction_Organization] FOREIGN KEY([RefJurisdiction])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsEnrollmentAction] CHECK CONSTRAINT [FK_RefPSEnrollmentAction_Organization]
GO
/****** Object:  ForeignKey [FK_RefPsEnrollmentAwardType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsEnrollmentAwardType]  WITH CHECK ADD  CONSTRAINT [FK_RefPsEnrollmentAwardType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsEnrollmentAwardType] CHECK CONSTRAINT [FK_RefPsEnrollmentAwardType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPsEnrollmentStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsEnrollmentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefPsEnrollmentStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsEnrollmentStatus] CHECK CONSTRAINT [FK_RefPsEnrollmentStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefPsEnrollmentType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsEnrollmentType]  WITH CHECK ADD  CONSTRAINT [FK_RefPsEnrollmentType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsEnrollmentType] CHECK CONSTRAINT [FK_RefPsEnrollmentType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPostsecondaryLEPType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsLepType]  WITH CHECK ADD  CONSTRAINT [FK_RefPostsecondaryLEPType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsLepType] CHECK CONSTRAINT [FK_RefPostsecondaryLEPType_Organization]
GO
/****** Object:  ForeignKey [FK_RefPsStudentLevel_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPsStudentLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefPsStudentLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPsStudentLevel] CHECK CONSTRAINT [FK_RefPsStudentLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefPublicSchoolChoiceStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPublicSchoolChoiceStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefPublicSchoolChoiceStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPublicSchoolChoiceStatus] CHECK CONSTRAINT [FK_RefPublicSchoolChoiceStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefPublicSchoolResidence_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPublicSchoolResidence]  WITH CHECK ADD  CONSTRAINT [FK_RefPublicSchoolResidence_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPublicSchoolResidence] CHECK CONSTRAINT [FK_RefPublicSchoolResidence_Organization]
GO
/****** Object:  ForeignKey [FK_RefPurposeOfMonitoringVisit_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefPurposeOfMonitoringVisit]  WITH CHECK ADD  CONSTRAINT [FK_RefPurposeOfMonitoringVisit_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefPurposeOfMonitoringVisit] CHECK CONSTRAINT [FK_RefPurposeOfMonitoringVisit_Organization]
GO
/****** Object:  ForeignKey [FK_RefQRISParticipation_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefQrisParticipation]  WITH CHECK ADD  CONSTRAINT [FK_RefQRISParticipation_Organization] FOREIGN KEY([RefJusridictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefQrisParticipation] CHECK CONSTRAINT [FK_RefQRISParticipation_Organization]
GO
/****** Object:  ForeignKey [FK_RefRace_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefRace]  WITH CHECK ADD  CONSTRAINT [FK_RefRace_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefRace] CHECK CONSTRAINT [FK_RefRace_Organization]
GO
/****** Object:  ForeignKey [FK_RefREAPAlternativeFundingStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefReapAlternativeFundingStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefREAPAlternativeFundingStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefReapAlternativeFundingStatus] CHECK CONSTRAINT [FK_RefREAPAlternativeFundingStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefReasonDelayTransitionConf_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefReasonDelayTransitionConf]  WITH CHECK ADD  CONSTRAINT [FK_RefReasonDelayTransitionConf_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefReasonDelayTransitionConf] CHECK CONSTRAINT [FK_RefReasonDelayTransitionConf_Organization]
GO
/****** Object:  ForeignKey [FK_RefReconstitutedStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefReconstitutedStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefReconstitutedStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefReconstitutedStatus] CHECK CONSTRAINT [FK_RefReconstitutedStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefReferralOutcome_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefReferralOutcome]  WITH CHECK ADD  CONSTRAINT [FK_RefReferralOutcome_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefReferralOutcome] CHECK CONSTRAINT [FK_RefReferralOutcome_Organization]
GO
/****** Object:  ForeignKey [FK_RefRestructuringAction_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefRestructuringAction]  WITH CHECK ADD  CONSTRAINT [FK_RefRestructuringAction_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefRestructuringAction] CHECK CONSTRAINT [FK_RefRestructuringAction_Organization]
GO
/****** Object:  ForeignKey [FK_RefRLISProgramUse_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefRlisProgramUse]  WITH CHECK ADD  CONSTRAINT [FK_RefRLISProgramUse_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefRlisProgramUse] CHECK CONSTRAINT [FK_RefRLISProgramUse_Organization]
GO
/****** Object:  ForeignKey [FK_RefRoleStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefRoleStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefRoleStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefRoleStatus] CHECK CONSTRAINT [FK_RefRoleStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefSCEDCourseLevel_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSCEDCourseLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefSCEDCourseLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSCEDCourseLevel] CHECK CONSTRAINT [FK_RefSCEDCourseLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefSCEDCourseSubjectArea_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSCEDCourseSubjectArea]  WITH CHECK ADD  CONSTRAINT [FK_RefSCEDCourseSubjectArea_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSCEDCourseSubjectArea] CHECK CONSTRAINT [FK_RefSCEDCourseSubjectArea_Organization]
GO
/****** Object:  ForeignKey [FK_RefSchoolFoodServiceProgram_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolFoodServiceProgram]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolFoodServiceProgram_Organization] FOREIGN KEY([RefJurisdiction])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolFoodServiceProgram] CHECK CONSTRAINT [FK_RefSchoolFoodServiceProgram_Organization]
GO
/****** Object:  ForeignKey [FK_RefSchoolImprovementFunds_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolImprovementFunds]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolImprovementFunds_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolImprovementFunds] CHECK CONSTRAINT [FK_RefSchoolImprovementFunds_Organization]
GO
/****** Object:  ForeignKey [FK_RefSchoolImprovementFunds_Organization1]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolImprovementFunds]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolImprovementFunds_Organization1] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolImprovementFunds] CHECK CONSTRAINT [FK_RefSchoolImprovementFunds_Organization1]
GO
/****** Object:  ForeignKey [FK_RefSchoolImprovementStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolImprovementStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolImprovementStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolImprovementStatus] CHECK CONSTRAINT [FK_RefSchoolImprovementStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefSchoolLevel_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolLevel] CHECK CONSTRAINT [FK_RefSchoolLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefSchoolType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSchoolType]  WITH CHECK ADD  CONSTRAINT [FK_RefSchoolType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSchoolType] CHECK CONSTRAINT [FK_RefSchoolType_Organization]
GO
/****** Object:  ForeignKey [FK_RefScoreMetricType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefScoreMetricType]  WITH CHECK ADD  CONSTRAINT [FK_RefScoreMetricType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefScoreMetricType] CHECK CONSTRAINT [FK_RefScoreMetricType_Organization]
GO
/****** Object:  ForeignKey [FK_RefServiceFrequency_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefServiceFrequency]  WITH CHECK ADD  CONSTRAINT [FK_RefServiceFrequency_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefServiceFrequency] CHECK CONSTRAINT [FK_RefServiceFrequency_Organization]
GO
/****** Object:  ForeignKey [FK_RefServiceOption_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefServiceOption]  WITH CHECK ADD  CONSTRAINT [FK_RefServiceOption_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefServiceOption] CHECK CONSTRAINT [FK_RefServiceOption_Organization]
GO
/****** Object:  ForeignKey [FK_RefServices_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefServices]  WITH CHECK ADD  CONSTRAINT [FK_RefServices_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefServices] CHECK CONSTRAINT [FK_RefServices_Organization]
GO
/****** Object:  ForeignKey [FK_RefServiceSetting_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefServiceSetting]  WITH CHECK ADD  CONSTRAINT [FK_RefServiceSetting_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefServiceSetting] CHECK CONSTRAINT [FK_RefServiceSetting_Organization]
GO
/****** Object:  ForeignKey [FK_RefSessionType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSessionType]  WITH CHECK ADD  CONSTRAINT [FK_RefSessionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSessionType] CHECK CONSTRAINT [FK_RefSessionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefSex_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSex]  WITH CHECK ADD  CONSTRAINT [FK_RefSex_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSex] CHECK CONSTRAINT [FK_RefSex_Organization]
GO
/****** Object:  ForeignKey [FK_RefSigInterventionType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSigInterventionType]  WITH CHECK ADD  CONSTRAINT [FK_RefSigInterventionType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSigInterventionType] CHECK CONSTRAINT [FK_RefSigInterventionType_Organization]
GO
/****** Object:  ForeignKey [FK_RefSingleSexClassStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSingleSexClassStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefSingleSexClassStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSingleSexClassStatus] CHECK CONSTRAINT [FK_RefSingleSexClassStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefSpaceUseType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSpaceUseType]  WITH CHECK ADD  CONSTRAINT [FK_RefSpaceUseType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSpaceUseType] CHECK CONSTRAINT [FK_RefSpaceUseType_Organization]
GO
/****** Object:  ForeignKey [FK_RefSpecialEducationAgeGroupTaught_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSpecialEducationAgeGroupTaught]  WITH CHECK ADD  CONSTRAINT [FK_RefSpecialEducationAgeGroupTaught_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSpecialEducationAgeGroupTaught] CHECK CONSTRAINT [FK_RefSpecialEducationAgeGroupTaught_Organization]
GO
/****** Object:  ForeignKey [FK_RefSpecialEducationExitReason_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSpecialEducationExitReason]  WITH CHECK ADD  CONSTRAINT [FK_RefSpecialEducationExitReason_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSpecialEducationExitReason] CHECK CONSTRAINT [FK_RefSpecialEducationExitReason_Organization]
GO
/****** Object:  ForeignKey [FK_RefSpecialEducationStaffCategory_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSpecialEducationStaffCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefSpecialEducationStaffCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSpecialEducationStaffCategory] CHECK CONSTRAINT [FK_RefSpecialEducationStaffCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefStaffPerformanceLevel_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefStaffPerformanceLevel]  WITH CHECK ADD  CONSTRAINT [FK_RefStaffPerformanceLevel_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefStaffPerformanceLevel] CHECK CONSTRAINT [FK_RefStaffPerformanceLevel_Organization]
GO
/****** Object:  ForeignKey [FK_RefStandardizedAdmissionTest_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefStandardizedAdmissionTest]  WITH CHECK ADD  CONSTRAINT [FK_RefStandardizedAdmissionTest_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefStandardizedAdmissionTest] CHECK CONSTRAINT [FK_RefStandardizedAdmissionTest_Organization]
GO
/****** Object:  ForeignKey [FK_RefState_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefState]  WITH CHECK ADD  CONSTRAINT [FK_RefState_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefState] CHECK CONSTRAINT [FK_RefState_Organization]
GO
/****** Object:  ForeignKey [FK_RefStatePovertyDesignation_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefStatePovertyDesignation]  WITH CHECK ADD  CONSTRAINT [FK_RefStatePovertyDesignation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefStatePovertyDesignation] CHECK CONSTRAINT [FK_RefStatePovertyDesignation_Organization]
GO
/****** Object:  ForeignKey [FK_RefStudentSupportServiceType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefStudentSupportServiceType]  WITH CHECK ADD  CONSTRAINT [FK_RefStudentSupportServiceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefStudentSupportServiceType] CHECK CONSTRAINT [FK_RefStudentSupportServiceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefSupervisedClinicalExper_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefSupervisedClinicalExperience]  WITH CHECK ADD  CONSTRAINT [FK_RefSupervisedClinicalExper_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefSupervisedClinicalExperience] CHECK CONSTRAINT [FK_RefSupervisedClinicalExper_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeacherEduCredentialExam_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeacherEducationCredentialExam]  WITH CHECK ADD  CONSTRAINT [FK_RefTeacherEduCredentialExam_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeacherEducationCredentialExam] CHECK CONSTRAINT [FK_RefTeacherEduCredentialExam_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeacherEduExamScoreType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeacherEducationExamScoreType]  WITH CHECK ADD  CONSTRAINT [FK_RefTeacherEduExamScoreType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeacherEducationExamScoreType] CHECK CONSTRAINT [FK_RefTeacherEduExamScoreType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeacherEduTestCompany_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeacherEducationTestCompany]  WITH CHECK ADD  CONSTRAINT [FK_RefTeacherEduTestCompany_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeacherEducationTestCompany] CHECK CONSTRAINT [FK_RefTeacherEduTestCompany_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeacherPrepCompleterStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeacherPrepCompleterStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefTeacherPrepCompleterStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeacherPrepCompleterStatus] CHECK CONSTRAINT [FK_RefTeacherPrepCompleterStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeacherPrepEnrollStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeacherPrepEnrollmentStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefTeacherPrepEnrollStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeacherPrepEnrollmentStatus] CHECK CONSTRAINT [FK_RefTeacherPrepEnrollStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeachingAssignmentRole_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeachingAssignmentRole]  WITH CHECK ADD  CONSTRAINT [FK_RefTeachingAssignmentRole_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeachingAssignmentRole] CHECK CONSTRAINT [FK_RefTeachingAssignmentRole_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeachingCredentialBasis_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeachingCredentialBasis]  WITH CHECK ADD  CONSTRAINT [FK_RefTeachingCredentialBasis_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeachingCredentialBasis] CHECK CONSTRAINT [FK_RefTeachingCredentialBasis_Organization]
GO
/****** Object:  ForeignKey [FK_RefTeachingCredentialType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTeachingCredentialType]  WITH CHECK ADD  CONSTRAINT [FK_RefTeachingCredentialType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTeachingCredentialType] CHECK CONSTRAINT [FK_RefTeachingCredentialType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTechnicalAssistanceDeliveryType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTechnicalAssistanceDeliveryType]  WITH CHECK ADD  CONSTRAINT [FK_RefTechnicalAssistanceDeliveryType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTechnicalAssistanceDeliveryType] CHECK CONSTRAINT [FK_RefTechnicalAssistanceDeliveryType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTechnicalAssistanceType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTechnicalAssistanceType]  WITH CHECK ADD  CONSTRAINT [FK_RefTechnicalAssistanceType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTechnicalAssistanceType] CHECK CONSTRAINT [FK_RefTechnicalAssistanceType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTechnologyLiteracyStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTechnologyLiteracyStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefTechnologyLiteracyStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTechnologyLiteracyStatus] CHECK CONSTRAINT [FK_RefTechnologyLiteracyStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefTelephoneNumberType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTelephoneNumberType]  WITH CHECK ADD  CONSTRAINT [FK_RefTelephoneNumberType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTelephoneNumberType] CHECK CONSTRAINT [FK_RefTelephoneNumberType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTenureSystem_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTenureSystem]  WITH CHECK ADD  CONSTRAINT [FK_RefTenureSystem_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTenureSystem] CHECK CONSTRAINT [FK_RefTenureSystem_Organization]
GO
/****** Object:  ForeignKey [FK_RefTextComplexitySystem_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTextComplexitySystem]  WITH CHECK ADD  CONSTRAINT [FK_RefTextComplexitySystem_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTextComplexitySystem] CHECK CONSTRAINT [FK_RefTextComplexitySystem_Organization]
GO
/****** Object:  ForeignKey [FK_RefTimeForCompletionUnits_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTimeForCompletionUnits]  WITH CHECK ADD  CONSTRAINT [FK_RefTimeForCompletionUnits_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTimeForCompletionUnits] CHECK CONSTRAINT [FK_RefTimeForCompletionUnits_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIIIAccountability_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIIIAccountability]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIIIAccountability_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIIIAccountability] CHECK CONSTRAINT [FK_RefTitleIIIAccountability_Organization]
GO
/****** Object:  ForeignKey [FK_RefLanguageInstruction_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIIILanguageInstructionProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefLanguageInstruction_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIIILanguageInstructionProgramType] CHECK CONSTRAINT [FK_RefLanguageInstruction_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIIIProfessionalDevType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIIIProfessionalDevelopmentType]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIIIProfessionalDevType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIIIProfessionalDevelopmentType] CHECK CONSTRAINT [FK_RefTitleIIIProfessionalDevType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIIndicator_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIIndicator]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIIndicator_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIIndicator] CHECK CONSTRAINT [FK_RefTitleIIndicator_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIInstructionalServices_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIInstructionalServices]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIInstructionalServices_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIInstructionalServices] CHECK CONSTRAINT [FK_RefTitleIInstructionalServices_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIProgramStaffCategory_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIProgramStaffCategory]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIProgramStaffCategory_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIProgramStaffCategory] CHECK CONSTRAINT [FK_RefTitleIProgramStaffCategory_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitleIProgramType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleIProgramType]  WITH CHECK ADD  CONSTRAINT [FK_RefTitleIProgramType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleIProgramType] CHECK CONSTRAINT [FK_RefTitleIProgramType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTitle1SchoolStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTitleISchoolStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefTitle1SchoolStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTitleISchoolStatus] CHECK CONSTRAINT [FK_RefTitle1SchoolStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefTransferReady_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTransferReady]  WITH CHECK ADD  CONSTRAINT [FK_RefTransferReady_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTransferReady] CHECK CONSTRAINT [FK_RefTransferReady_Organization]
GO
/****** Object:  ForeignKey [FK_RefTuitionResidencyType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTuitionResidencyType]  WITH CHECK ADD  CONSTRAINT [FK_RefTuitionResidencyType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTuitionResidencyType] CHECK CONSTRAINT [FK_RefTuitionResidencyType_Organization]
GO
/****** Object:  ForeignKey [FK_RefTuitionUnit_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefTuitionUnit]  WITH CHECK ADD  CONSTRAINT [FK_RefTuitionUnit_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefTuitionUnit] CHECK CONSTRAINT [FK_RefTuitionUnit_Organization]
GO
/****** Object:  ForeignKey [FK_RefUSCitizenshipStatus_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefUSCitizenshipStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefUSCitizenshipStatus_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefUSCitizenshipStatus] CHECK CONSTRAINT [FK_RefUSCitizenshipStatus_Organization]
GO
/****** Object:  ForeignKey [FK_RefVisaType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefVisaType]  WITH CHECK ADD  CONSTRAINT [FK_RefVisaType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefVisaType] CHECK CONSTRAINT [FK_RefVisaType_Organization]
GO
/****** Object:  ForeignKey [FK_RefVision_Org]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefVisionScreeningStatus]  WITH CHECK ADD  CONSTRAINT [FK_RefVision_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefVisionScreeningStatus] CHECK CONSTRAINT [FK_RefVision_Org]
GO
/****** Object:  ForeignKey [FK_RefWageCollectionMethod_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefWageCollectionMethod]  WITH CHECK ADD  CONSTRAINT [FK_RefWageCollectionMethod_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefWageCollectionMethod] CHECK CONSTRAINT [FK_RefWageCollectionMethod_Organization]
GO
/****** Object:  ForeignKey [FK_RefWageVerification_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefWageVerification]  WITH CHECK ADD  CONSTRAINT [FK_RefWageVerification_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefWageVerification] CHECK CONSTRAINT [FK_RefWageVerification_Organization]
GO
/****** Object:  ForeignKey [FK_RefWeaponType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefWeaponType]  WITH CHECK ADD  CONSTRAINT [FK_RefWeaponType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefWeaponType] CHECK CONSTRAINT [FK_RefWeaponType_Organization]
GO
/****** Object:  ForeignKey [FK_RefWFProgramParticipation_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefWfProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_RefWFProgramParticipation_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefWfProgramParticipation] CHECK CONSTRAINT [FK_RefWFProgramParticipation_Organization]
GO
/****** Object:  ForeignKey [FK_RefWorkbasedLearningOpportunityType_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RefWorkbasedLearningOpportunityType]  WITH CHECK ADD  CONSTRAINT [FK_RefWorkbasedLearningOpportunityType_Organization] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RefWorkbasedLearningOpportunityType] CHECK CONSTRAINT [FK_RefWorkbasedLearningOpportunityType_Organization]
GO
/****** Object:  ForeignKey [FK_RequiredImmunization_Organization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RequiredImmunization]  WITH CHECK ADD  CONSTRAINT [FK_RequiredImmunization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[RequiredImmunization] CHECK CONSTRAINT [FK_RequiredImmunization_Organization]
GO
/****** Object:  ForeignKey [FK_RequiredImmunization_RefImmunization]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RequiredImmunization]  WITH CHECK ADD  CONSTRAINT [FK_RequiredImmunization_RefImmunization] FOREIGN KEY([RefImmunizationTypeId])
REFERENCES [dbo].[RefImmunizationType] ([RefImmunizationTypeId])
GO
ALTER TABLE [dbo].[RequiredImmunization] CHECK CONSTRAINT [FK_RequiredImmunization_RefImmunization]
GO
/****** Object:  ForeignKey [FK_RefRole_Org]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_RefRole_Org] FOREIGN KEY([RefJurisdictionId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_RefRole_Org]
GO
/****** Object:  ForeignKey [FK_RoleAttendance_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendance]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendance_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[RoleAttendance] CHECK CONSTRAINT [FK_RoleAttendance_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefAbsentAttendanceCategory]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefAbsentAttendanceCategory] FOREIGN KEY([RefAbsentAttendanceCategoryId])
REFERENCES [dbo].[RefAbsentAttendanceCategory] ([RefAbsentAttendanceCategoryId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefAbsentAttendanceCategory]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefAttendanceEventType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefAttendanceEventType] FOREIGN KEY([RefAttendanceEventTypeId])
REFERENCES [dbo].[RefAttendanceEventType] ([RefAttendanceEventTypeId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefAttendanceEventType]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefAttendanceStatus]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefAttendanceStatus] FOREIGN KEY([RefAttendanceStatusId])
REFERENCES [dbo].[RefAttendanceStatus] ([RefAttendanceStatusId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefAttendanceStatus]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefLeaveEventType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefLeaveEventType] FOREIGN KEY([RefLeaveEventTypeId])
REFERENCES [dbo].[RefLeaveEventType] ([RefLeaveEventTypeId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefLeaveEventType]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefOrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefOrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefOrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_RoleAttendanceEvent_RefPresentAttendanceCategory]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleAttendanceEvent]  WITH CHECK ADD  CONSTRAINT [FK_RoleAttendanceEvent_RefPresentAttendanceCategory] FOREIGN KEY([RefPresentAttendanceCategoryId])
REFERENCES [dbo].[RefPresentAttendanceCategory] ([RefPresentAttendanceCategoryId])
GO
ALTER TABLE [dbo].[RoleAttendanceEvent] CHECK CONSTRAINT [FK_RoleAttendanceEvent_RefPresentAttendanceCategory]
GO
/****** Object:  ForeignKey [FK_RoleStatus_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleStatus]  WITH CHECK ADD  CONSTRAINT [FK_RoleStatus_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[RoleStatus] CHECK CONSTRAINT [FK_RoleStatus_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_RoleStatus_RefRefRoleStatus]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RoleStatus]  WITH CHECK ADD  CONSTRAINT [FK_RoleStatus_RefRefRoleStatus] FOREIGN KEY([RefRoleStatusId])
REFERENCES [dbo].[RefRoleStatus] ([RefRoleStatusId])
GO
ALTER TABLE [dbo].[RoleStatus] CHECK CONSTRAINT [FK_RoleStatus_RefRefRoleStatus]
GO
/****** Object:  ForeignKey [FK_RubricCriterion_Rubric]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RubricCriterion]  WITH CHECK ADD  CONSTRAINT [FK_RubricCriterion_Rubric] FOREIGN KEY([RubricId])
REFERENCES [dbo].[Rubric] ([RubricId])
GO
ALTER TABLE [dbo].[RubricCriterion] CHECK CONSTRAINT [FK_RubricCriterion_Rubric]
GO
/****** Object:  ForeignKey [FK_RubricCriterionLevel_RubricCriterion]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[RubricCriterionLevel]  WITH CHECK ADD  CONSTRAINT [FK_RubricCriterionLevel_RubricCriterion] FOREIGN KEY([RubricCriterionId])
REFERENCES [dbo].[RubricCriterion] ([RubricCriterionId])
GO
ALTER TABLE [dbo].[RubricCriterionLevel] CHECK CONSTRAINT [FK_RubricCriterionLevel_RubricCriterion]
GO
/****** Object:  ForeignKey [FK_ServicesReceived_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[ServicesReceived]  WITH CHECK ADD  CONSTRAINT [FK_ServicesReceived_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[ServicesReceived] CHECK CONSTRAINT [FK_ServicesReceived_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_ServicesReceived_RefServices]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[ServicesReceived]  WITH CHECK ADD  CONSTRAINT [FK_ServicesReceived_RefServices] FOREIGN KEY([RefServicesId])
REFERENCES [dbo].[RefServices] ([RefServicesId])
GO
ALTER TABLE [dbo].[ServicesReceived] CHECK CONSTRAINT [FK_ServicesReceived_RefServices]
GO
/****** Object:  ForeignKey [FK_ServicesReceived_RefServiceSetting]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[ServicesReceived]  WITH CHECK ADD  CONSTRAINT [FK_ServicesReceived_RefServiceSetting] FOREIGN KEY([RefServicesSettingId])
REFERENCES [dbo].[RefServiceSetting] ([RefServiceSettingId])
GO
ALTER TABLE [dbo].[ServicesReceived] CHECK CONSTRAINT [FK_ServicesReceived_RefServiceSetting]
GO
/****** Object:  ForeignKey [FK_StaffCredential_PersonCredential]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffCredential]  WITH CHECK ADD  CONSTRAINT [FK_StaffCredential_PersonCredential] FOREIGN KEY([PersonCredentialId])
REFERENCES [dbo].[PersonCredential] ([PersonCredentialId])
GO
ALTER TABLE [dbo].[StaffCredential] CHECK CONSTRAINT [FK_StaffCredential_PersonCredential]
GO
/****** Object:  ForeignKey [FK_StaffCredential_RefParaprofessionalQualification]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffCredential]  WITH CHECK ADD  CONSTRAINT [FK_StaffCredential_RefParaprofessionalQualification] FOREIGN KEY([RefParaprofessionalQualificationId])
REFERENCES [dbo].[RefParaprofessionalQualification] ([RefParaprofessionalQualificationId])
GO
ALTER TABLE [dbo].[StaffCredential] CHECK CONSTRAINT [FK_StaffCredential_RefParaprofessionalQualification]
GO
/****** Object:  ForeignKey [FK_StaffCredential_RefProgramSponsorType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffCredential]  WITH CHECK ADD  CONSTRAINT [FK_StaffCredential_RefProgramSponsorType] FOREIGN KEY([RefProgramSponsorTypeId])
REFERENCES [dbo].[RefProgramSponsorType] ([RefProgramSponsorTypeId])
GO
ALTER TABLE [dbo].[StaffCredential] CHECK CONSTRAINT [FK_StaffCredential_RefProgramSponsorType]
GO
/****** Object:  ForeignKey [FK_StaffCredential_RefTeachingCredentialBasis]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffCredential]  WITH CHECK ADD  CONSTRAINT [FK_StaffCredential_RefTeachingCredentialBasis] FOREIGN KEY([RefTeachingCredentialBasisId])
REFERENCES [dbo].[RefTeachingCredentialBasis] ([RefTeachingCredentialBasisId])
GO
ALTER TABLE [dbo].[StaffCredential] CHECK CONSTRAINT [FK_StaffCredential_RefTeachingCredentialBasis]
GO
/****** Object:  ForeignKey [FK_StaffCredential_RefTeachingCredentialType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffCredential]  WITH CHECK ADD  CONSTRAINT [FK_StaffCredential_RefTeachingCredentialType] FOREIGN KEY([RefTeachingCredentialTypeId])
REFERENCES [dbo].[RefTeachingCredentialType] ([RefTeachingCredentialTypeId])
GO
ALTER TABLE [dbo].[StaffCredential] CHECK CONSTRAINT [FK_StaffCredential_RefTeachingCredentialType]
GO
/****** Object:  ForeignKey [FK_StaffEmployment_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_StaffEmployment_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[StaffEmployment] CHECK CONSTRAINT [FK_StaffEmployment_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_StaffEmployment_RefEmploymentSeparationReason]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_StaffEmployment_RefEmploymentSeparationReason] FOREIGN KEY([RefEmploymentSeparationReasonId])
REFERENCES [dbo].[RefEmploymentSeparationReason] ([RefEmploymentSeparationReasonId])
GO
ALTER TABLE [dbo].[StaffEmployment] CHECK CONSTRAINT [FK_StaffEmployment_RefEmploymentSeparationReason]
GO
/****** Object:  ForeignKey [FK_StaffEmployment_RefEmploymentSeparationType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffEmployment]  WITH CHECK ADD  CONSTRAINT [FK_StaffEmployment_RefEmploymentSeparationType] FOREIGN KEY([RefEmploymentSeparationTypeId])
REFERENCES [dbo].[RefEmploymentSeparationType] ([RefEmploymentSeparationTypeId])
GO
ALTER TABLE [dbo].[StaffEmployment] CHECK CONSTRAINT [FK_StaffEmployment_RefEmploymentSeparationType]
GO
/****** Object:  ForeignKey [FK_StaffEvaluation_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_StaffEvaluation_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[StaffEvaluation] CHECK CONSTRAINT [FK_StaffEvaluation_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_StaffEvaluation_RefStaffPerformanceLevel]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_StaffEvaluation_RefStaffPerformanceLevel] FOREIGN KEY([RefStaffPerformanceLevelId])
REFERENCES [dbo].[RefStaffPerformanceLevel] ([RefStaffPerformanceLevelId])
GO
ALTER TABLE [dbo].[StaffEvaluation] CHECK CONSTRAINT [FK_StaffEvaluation_RefStaffPerformanceLevel]
GO
/****** Object:  ForeignKey [FK_StaffExperience_Person]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffExperience]  WITH CHECK ADD  CONSTRAINT [FK_StaffExperience_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[StaffExperience] CHECK CONSTRAINT [FK_StaffExperience_Person]
GO
/****** Object:  ForeignKey [FK_PDActivity_PDRequirement]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDActivity_PDRequirement] FOREIGN KEY([ProfessionalDevelopmentRequirementId])
REFERENCES [dbo].[ProfessionalDevelopmentRequirement] ([ProfessionalDevelopmentRequirementId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDActivity_PDRequirement]
GO
/****** Object:  ForeignKey [FK_PDActivity_RefCourseCreditUnit]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDActivity_RefCourseCreditUnit] FOREIGN KEY([RefCourseCreditUnitId])
REFERENCES [dbo].[RefCourseCreditUnit] ([RefCourseCreditUnitId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDActivity_RefCourseCreditUnit]
GO
/****** Object:  ForeignKey [FK_PDActivity_RefProfDevFinancialSupport]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_PDActivity_RefProfDevFinancialSupport] FOREIGN KEY([RefProfessionalDevelopmentFinancialSupportId])
REFERENCES [dbo].[RefProfessionalDevelopmentFinancialSupport] ([RefProfessionalDevelopmentFinancialSupportId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_PDActivity_RefProfDevFinancialSupport]
GO
/****** Object:  ForeignKey [FK_StaffPDActivity_OrgPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_StaffPDActivity_OrgPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_StaffPDActivity_OrgPersonRole]
GO
/****** Object:  ForeignKey [FK_StaffPDActivity_PDActivity]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_StaffPDActivity_PDActivity] FOREIGN KEY([ProfessionalDevelopmentActivityId])
REFERENCES [dbo].[ProfessionalDevelopmentActivity] ([ProfessionalDevelopmentActivityId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_StaffPDActivity_PDActivity]
GO
/****** Object:  ForeignKey [FK_StaffPDActivity_PDSession]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity]  WITH CHECK ADD  CONSTRAINT [FK_StaffPDActivity_PDSession] FOREIGN KEY([ProfessionalDevelopmentSessionId])
REFERENCES [dbo].[ProfessionalDevelopmentSession] ([ProfessionalDevelopmentSessionId])
GO
ALTER TABLE [dbo].[StaffProfessionalDevelopmentActivity] CHECK CONSTRAINT [FK_StaffPDActivity_PDSession]
GO
/****** Object:  ForeignKey [FK_StaffTechnicalAssistance_OrgPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_StaffTechnicalAssistance_OrgPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[StaffTechnicalAssistance] CHECK CONSTRAINT [FK_StaffTechnicalAssistance_OrgPersonRole]
GO
/****** Object:  ForeignKey [FK_StaffTechnicalAssistance_RefTechnicalAssistanceDeliveryType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_StaffTechnicalAssistance_RefTechnicalAssistanceDeliveryType] FOREIGN KEY([RefTechnicalAssistanceDeliveryTypeId])
REFERENCES [dbo].[RefTechnicalAssistanceDeliveryType] ([RefTechnicalAssistanceDeliveryTypeId])
GO
ALTER TABLE [dbo].[StaffTechnicalAssistance] CHECK CONSTRAINT [FK_StaffTechnicalAssistance_RefTechnicalAssistanceDeliveryType]
GO
/****** Object:  ForeignKey [FK_StaffTechnicalAssistance_RefTechnicalAssistanceType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[StaffTechnicalAssistance]  WITH CHECK ADD  CONSTRAINT [FK_StaffTechnicalAssistance_RefTechnicalAssistanceType] FOREIGN KEY([RefTechnicalAssistanceTypeId])
REFERENCES [dbo].[RefTechnicalAssistanceType] ([RefTechnicalAssistanceTypeId])
GO
ALTER TABLE [dbo].[StaffTechnicalAssistance] CHECK CONSTRAINT [FK_StaffTechnicalAssistance_RefTechnicalAssistanceType]
GO
/****** Object:  ForeignKey [FK_TeacherEducationCredentialExam_RefTeacherEducationTestCompny]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherEducationCredentialExam]  WITH CHECK ADD  CONSTRAINT [FK_TeacherEducationCredentialExam_RefTeacherEducationTestCompny] FOREIGN KEY([RefTeacherEducationTestCompanyId])
REFERENCES [dbo].[RefTeacherEducationTestCompany] ([RefTeacherEducationTestCompanyId])
GO
ALTER TABLE [dbo].[TeacherEducationCredentialExam] CHECK CONSTRAINT [FK_TeacherEducationCredentialExam_RefTeacherEducationTestCompny]
GO
/****** Object:  ForeignKey [FK_TeacherEduCredentialExam_PrgmParticipationTeacherPrep]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherEducationCredentialExam]  WITH CHECK ADD  CONSTRAINT [FK_TeacherEduCredentialExam_PrgmParticipationTeacherPrep] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[ProgramParticipationTeacherPrep] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[TeacherEducationCredentialExam] CHECK CONSTRAINT [FK_TeacherEduCredentialExam_PrgmParticipationTeacherPrep]
GO
/****** Object:  ForeignKey [FK_TeacherEduCredentialExam_RefTeacherEduCredentialExam]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherEducationCredentialExam]  WITH CHECK ADD  CONSTRAINT [FK_TeacherEduCredentialExam_RefTeacherEduCredentialExam] FOREIGN KEY([RefTeacherEducationCredentialExamId])
REFERENCES [dbo].[RefTeacherEducationCredentialExam] ([RefTeacherEducationCredentialExamId])
GO
ALTER TABLE [dbo].[TeacherEducationCredentialExam] CHECK CONSTRAINT [FK_TeacherEduCredentialExam_RefTeacherEduCredentialExam]
GO
/****** Object:  ForeignKey [FK_TeacherEduCredentialExam_RefTeacherEduExamScoreType]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherEducationCredentialExam]  WITH CHECK ADD  CONSTRAINT [FK_TeacherEduCredentialExam_RefTeacherEduExamScoreType] FOREIGN KEY([RefTeacherEducationExamScoreTypeId])
REFERENCES [dbo].[RefTeacherEducationExamScoreType] ([RefTeacherEducationExamScoreTypeId])
GO
ALTER TABLE [dbo].[TeacherEducationCredentialExam] CHECK CONSTRAINT [FK_TeacherEduCredentialExam_RefTeacherEduExamScoreType]
GO
/****** Object:  ForeignKey [FK_TeacherStudentDataLinkExclusion_K12StaffAssignment]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherStudentDataLinkExclusion]  WITH CHECK ADD  CONSTRAINT [FK_TeacherStudentDataLinkExclusion_K12StaffAssignment] FOREIGN KEY([TeacherOrganizationPersonRoleId])
REFERENCES [dbo].[K12StaffAssignment] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[TeacherStudentDataLinkExclusion] CHECK CONSTRAINT [FK_TeacherStudentDataLinkExclusion_K12StaffAssignment]
GO
/****** Object:  ForeignKey [FK_TeacherStudentDataLinkExclusion_K12StudentCourseSection]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[TeacherStudentDataLinkExclusion]  WITH CHECK ADD  CONSTRAINT [FK_TeacherStudentDataLinkExclusion_K12StudentCourseSection] FOREIGN KEY([StudentOrganizationPersonRoleId])
REFERENCES [dbo].[K12StudentCourseSection] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[TeacherStudentDataLinkExclusion] CHECK CONSTRAINT [FK_TeacherStudentDataLinkExclusion_K12StudentCourseSection]
GO
/****** Object:  ForeignKey [FK_WorkforceEmploymentQuarterlyData_OrganizationPersonRole]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[WorkforceEmploymentQuarterlyData]  WITH CHECK ADD  CONSTRAINT [FK_WorkforceEmploymentQuarterlyData_OrganizationPersonRole] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[OrganizationPersonRole] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[WorkforceEmploymentQuarterlyData] CHECK CONSTRAINT [FK_WorkforceEmploymentQuarterlyData_OrganizationPersonRole]
GO
/****** Object:  ForeignKey [FK_WorkforceProgramPartic_RefProfessionalTechnicalCredential]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[WorkforceProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_WorkforceProgramPartic_RefProfessionalTechnicalCredential] FOREIGN KEY([RefProfessionalTechnicalCredentialTypeId])
REFERENCES [dbo].[RefProfessionalTechnicalCredentialType] ([RefProfessionalTechnicalCredentialTypeId])
GO
ALTER TABLE [dbo].[WorkforceProgramParticipation] CHECK CONSTRAINT [FK_WorkforceProgramPartic_RefProfessionalTechnicalCredential]
GO
/****** Object:  ForeignKey [FK_WorkforceProgramPartic_RefWfProgramParticipation]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[WorkforceProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_WorkforceProgramPartic_RefWfProgramParticipation] FOREIGN KEY([RefWfProgramParticipationId])
REFERENCES [dbo].[RefWfProgramParticipation] ([RefWfProgramParticipationId])
GO
ALTER TABLE [dbo].[WorkforceProgramParticipation] CHECK CONSTRAINT [FK_WorkforceProgramPartic_RefWfProgramParticipation]
GO
/****** Object:  ForeignKey [FK_WorkforceProgramParticipation_PersonProgramParticipation]    Script Date: 01/24/2014 13:48:01 ******/
ALTER TABLE [dbo].[WorkforceProgramParticipation]  WITH CHECK ADD  CONSTRAINT [FK_WorkforceProgramParticipation_PersonProgramParticipation] FOREIGN KEY([OrganizationPersonRoleId])
REFERENCES [dbo].[PersonProgramParticipation] ([OrganizationPersonRoleId])
GO
ALTER TABLE [dbo].[WorkforceProgramParticipation] CHECK CONSTRAINT [FK_WorkforceProgramParticipation_PersonProgramParticipation]
GO
