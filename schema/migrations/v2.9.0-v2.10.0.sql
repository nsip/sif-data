/* Invoice */
ALTER TABLE Invoice ADD LocalId varchar(200) DEFAULT NULL after RefId;

CREATE TABLE IF NOT EXISTS Invoice_AccountCode (
    Invoice_RefId  VARCHAR(36),
    AccountCode  VARCHAR(200),
    FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* FinancialAccount */
ALTER TABLE FinancialAccount ADD LocalId varchar(200) DEFAULT NULL after RefId;
ALTER TABLE FinancialAccount ADD AccountCode varchar(200) DEFAULT NULL;

/* TeachingGroup */
ALTER TABLE TeachingGroup ADD KeyLearningArea varchar(36) DEFAULT NULL;

/* PaymentReceipt */
ALTER TABLE PaymentReceipt ADD LocalId varchar(200) DEFAULT NULL after RefId;

CREATE TABLE IF NOT EXISTS PaymentReceipt_AccountCode (
    PaymentReceipt_RefId  VARCHAR(36),
    AccountCode  VARCHAR(200),
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt_PaymentReceiptLine (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    PaymentReceipt_RefId  VARCHAR(36),
    Invoice_RefId  VARCHAR(36) DEFAULT NULL,
    LocalId    VARCHAR(200) DEFAULT NULL,
    LocalPaymentReceiptLineId    VARCHAR(200) DEFAULT NULL,
    TransactionAmount_Value VARCHAR(200) DEFAULT NULL,
    TransactionAmount_Type  VARCHAR(200) DEFAULT NULL,
    FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    AccountCode  VARCHAR(200) DEFAULT NULL,
    TransactionDescription VARCHAR(200) DEFAULT NULL,
    TaxRate VARCHAR(200) DEFAULT NULL,
    TaxAmount VARCHAR(200) DEFAULT NULL,
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Purchase Order */
ALTER TABLE PurchaseOrder ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* Vendor Info */
ALTER TABLE VendorInfo ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* Journal */
ALTER TABLE Journal ADD LocalId varchar(200) DEFAULT NULL after RefId;
ALTER TABLE Journal ADD DebitAccountCode varchar(200) DEFAULT NULL after Debit_FinancialAccount_RefId;
ALTER TABLE Journal ADD CreditAccountCode varchar(200) DEFAULT NULL after Credit_FinancialAccount_RefId;

CREATE TABLE IF NOT EXISTS Journal_JournalAdjustment (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    Journal_RefId  VARCHAR(36),
    Debit_FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    Credit_FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    DebitAccountCode    VARCHAR(200) DEFAULT NULL,
    CreditAccountCode    VARCHAR(200) DEFAULT NULL,
    GSTCodeOriginal    VARCHAR(200) DEFAULT NULL,
    GSTCodeReplacement VARCHAR(200) DEFAULT NULL,
    LineAdjustmentAmount  VARCHAR(200) DEFAULT NULL,
    FOREIGN KEY (Journal_RefId) REFERENCES Journal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Debtor */
ALTER TABLE Debtor ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* WellbeingResponse */
ALTER TABLE WellbeingResponse ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* WellbeingAppeal */
ALTER TABLE WellbeingAppeal ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* PersonalisedPlan */
ALTER TABLE PersonalisedPlan ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* WellbeingCharacteristic */
ALTER TABLE WellbeingCharacteristic ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* WellbeingPersonLink */
ALTER TABLE WellbeingPersonLink ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* PurchaseOrder_PurchasingItems */
ALTER TABLE PurchaseOrder_PurchasingItems ADD LocalItemId varchar(200) DEFAULT NULL after PurchaseOrder_RefId;

/* StudentScoreAgainstJudgment */
create table StudentScoreJudgementAgainstStandard (
  RefId VARCHAR(36) PRIMARY KEY,
  SchoolYear VARCHAR(200) DEFAULT NULL,
  TermInfo_RefId VARCHAR(36) DEFAULT NULL,
  LocalTermCode VARCHAR(200) DEFAULT NULL,
  StudentPersonal_RefId VARCHAR(36) DEFAULT NULL,
  StudentStateProvinceId VARCHAR(200) DEFAULT NULL,
  StudentLocalId VARCHAR(200) DEFAULT NULL,
  YearLevel VARCHAR(200) DEFAULT NULL,
  TeachingGroup_RefId VARCHAR(36) DEFAULT NULL,
  ClassLocalId VARCHAR(200) DEFAULT NULL,
  StaffPersonal_RefId VARCHAR(36) DEFAULT NULL,
  StaffLocalId VARCHAR(200) DEFAULT NULL,
  CurriculumCode VARCHAR(200) DEFAULT NULL,
  CurriculumNodeCode VARCHAR(200) DEFAULT NULL,
  Score VARCHAR(200) DEFAULT NULL,
  SpecialCircumstanceLocalCode VARCHAR(200) DEFAULT NULL,
  ManagedPathwayLocalCode VARCHAR(200) DEFAULT NULL,
  SchoolInfo_RefId VARCHAR(36) DEFAULT NULL,
  SchoolLocalId VARCHAR(200) DEFAULT NULL,
  SchoolCommonwealthId VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentScoreJAS_LearningStandard (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentScoreJudgementAgainstStandard_RefId VARCHAR(36) NOT NULL,
  LearningStandardItem_RefId VARCHAR(36) DEFAULT NULL,
  LearningStandardURL VARCHAR(256) DEFAULT NULL,
  LearningStandardLocalId VARCHAR(200) DEFAULT NULL,
  INDEX `StudentScoreJudgementAgainstStandard_IX` (`StudentScoreJudgementAgainstStandard_RefId`),
  CONSTRAINT `StudentScoreJudgementAgainstStandard_FK` FOREIGN KEY (`StudentScoreJudgementAgainstStandard_RefId`) REFERENCES `StudentScoreJudgementAgainstStandard` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


