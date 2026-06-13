SET client_encoding TO 'UTF8'; --weird chars random error i got so fixed by setting this 
DROP TABLE IF EXISTS jobs_raw;
 
CREATE TABLE jobs_raw (
    platform              TEXT,
    "postingNo"           TEXT,
    "jobId"               TEXT,
    "jobTitle"            TEXT,
    agency                TEXT,
    "agencyId"            TEXT,
    "agencyDescription"   TEXT,
    "startDate"           TEXT,
    "closingDate"         TEXT,
    "closingDateText"     TEXT,
    "remainingDays"       TEXT,
    "employmentType"      TEXT,
    "employmentTypeCode"  TEXT,
    "experienceRequired"  TEXT,
    "experienceYearsMin"  TEXT,
    "experienceYearsMax"  TEXT,
    field                 TEXT,
    "fieldCode"           TEXT,
    "functionalArea"      TEXT,
    "functionalAreaCode"  TEXT,
    industry              TEXT,
    "educationCode"       TEXT,
    "isNew"               TEXT,
    location              TEXT,
    "jobDescription"      TEXT,
    "jobResponsibilities" TEXT,
    "jobRequirements"     TEXT,
    category              TEXT,
    "workArrangement"     TEXT
);
 
-- Adjust the path to where your CSV actually lives. Mine lives in sep folder.
\copy jobs_raw FROM 'db/job-listings.csv' WITH (FORMAT csv, HEADER true); 
 
SELECT count(*) FROM jobs_raw; 
