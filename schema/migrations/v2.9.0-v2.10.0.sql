/* Invoice */
ALTER TABLE Invoice ADD LocalId varchar(200) DEFAULT NULL after RefId;

CREATE TABLE IF NOT EXISTS Invoice_AccountCode (
    Invoice_RefId  VARCHAR(36),
    AccountCode  VARCHAR(200),
    FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId),
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
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId),
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
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Purchase Order */
ALTER TABLE PurchaseOrder ADD LocalId varchar(200) DEFAULT NULL after RefId;

/* Vendor Info */
ALTER TABLE VendorInfo ADD LocalId varchar(200) DEFAULT NULL after RefId;