/* Invoice */
ALTER TABLE Invoice ADD LocalId varchar(200) DEFAULT NULL after RefId;

CREATE TABLE IF NOT EXISTS Invoice_AccountCode (
    -- This is a 1:n join of Invoice to FinancialAccount?
    Invoice_RefId  VARCHAR(36), -- joins to Invoice/RefId?,
    AccountCode  VARCHAR(200),
    FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* FinancialAccount */
ALTER TABLE FinancialAccount ADD LocalId varchar(200) DEFAULT NULL after RefId;
ALTER TABLE FinancialAccount ADD AccountCode varchar(200) DEFAULT NULL;

/* TeachingGroup */
ALTER TABLE TeachingGroup ADD KeyLearningArea varchar(36) DEFAULT NULL;