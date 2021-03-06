-- Modify log.notes to log.review_note
ALTER TABLE log RENAME COLUMN notes to review_note;

-- Modify log.type to log.state
ALTER TABLE log RENAME COLUMN type to state;

-- Remove log.subsystem
Alter table log drop column sub_system;

-- Modify Abs_Cancer_Model.xenograftName (for Xenograft object) to Abs_Cancer_Model.name
ALTER TABLE Abs_Cancer_Model RENAME COLUMN xenograft_name to name;

-- Modify Tumor_Code.code to Tumor_Code.abbreviation
ALTER TABLE Tumor_Code RENAME COLUMN code to abbreviation;

-- Modify Image.file_server_location to Image.url
ALTER TABLE Image RENAME COLUMN file_server_location to url;

-- Modify Endpoint_Code.endpoint_code_id to EndPoint.endpoint_id
ALTER TABLE Endpoint_Code RENAME COLUMN endpoint_code_id to endpoint_id;

-- Modify Endpoint_Code object name to EndPoint
-- Create bkp table to hold data
create table Endpoint_bkp as select * from Endpoint_Code;

-- Create table with new name
create table endpoint (
   endpoint_id number(19,0) not null,
   code varchar2(255),
   description varchar2(2000),
   primary key (endpoint_id)
);

-- Move data to new table from bkp
Insert into endpoint
 select Endpoint_id, code, description
   from Endpoint_bkp;

-- Drop Endpoint_bkp and Endpoint_code tables
Drop table Endpoint_bkp cascade constraints;
Drop table Endpoint_Code cascade constraints;

-- Modify invivo table rename endpoint_code_id column to endpoint_id
ALTER TABLE INVIVO_RESULT RENAME COLUMN endpoint_code_id to endpoint_id;

-- Add foreign key constraint for endpoint and invivo_result (automatically deleted when the table was dropped)
Alter table invivo_result add constraint FKC187E8CB887C658A foreign key (endpoint_id) references endpoint;

-- Create bkp table to hold data
create table repository_info_bkp as select * from repository_info;

-- Drop table also drops constraint in repository_info table
Drop table repository_info cascade constraints;

-- Remove repository_info_id from abs_cancer_model
Alter table abs_cancer_model drop column repository_info_id;

-- Modify Graft.graft_type to Graft.source_type
ALTER TABLE ABS_CANCER_MODEL RENAME COLUMN GRAFT_TYPE to SOURCE_TYPE;

-- Modify Graft.graft_type_UNCTRL_VOCAB to Graft.source_type_UNCTRL_VOCAB
ALTER TABLE ABS_CANCER_MODEL RENAME COLUMN GRAFT_TYPE_UNCTRL_VOCAB to SOURCE_TYPE_UNCTRL_VOCAB;

-- Create table with new name
CREATE TABLE GRAFT_INVIVO_RESULT
(
  ABS_CANCER_MODEL_ID  NUMBER(19)               NOT NULL,
  INVIVO_RESULT_ID     NUMBER(19)               NOT NULL
);

-- Create bkp table to hold data
create table XENOGRAFT_INVIVO_RESULT_bkp as select * from XENOGRAFT_INVIVO_RESULT;

-- Move data to new table from bkp
Insert into GRAFT_INVIVO_RESULT
 select ABS_CANCER_MODEL_ID, INVIVO_RESULT_ID
   from XENOGRAFT_INVIVO_RESULT_bkp;
   
-- Drop table also drops constraint in XENOGRAFT_INVIVO_RESULT table
Drop table XENOGRAFT_INVIVO_RESULT cascade constraints;

commit;


