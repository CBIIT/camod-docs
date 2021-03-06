
-- #6812 Change spelling of Equus Caballus - start Caballus with a lower case "c"
update species sp
set sp.SCIENTIFIC_NAME = 'Equus caballus'
where sp.SPECIES_ID = 11;

--  #13898 Renamed OtherLocationURL in micro array data object to url
ALTER TABLE MICRO_ARRAY_DATA
RENAME COLUMN OTHER_LOCATION_URL to URL;

-- Add flag named is_Induced_Mutation_Trigger to ENVIRONMENTAL_FACTOR
alter table ENVIRONMENTAL_FACTOR
ADD is_Induced_Mutation_Trigger       NUMBER(1);

-- update models that previously used dose units no longer selectable
update TREATMENT t
set t.DOSAGE_UNIT = 'ml/animal/injection'
where t.TREATMENT_id = '10009554';

update treatment t
set t.DOSAGE_UNIT = 'microliter/animal/injection'
where t.TREATMENT_id = '50050274';

--  Add RGD_PUB_ID to Publication object for MTB import
alter table PUBLICATION
ADD RGD_PUB_ID       VARCHAR2(255);

-- clean up IM records from EF table to clean up CI adv search dropdown
delete from environmental_factor ef
where ef.ENVIRONMENTAL_FACTOR_ID = '50053159';

delete from environmental_factor ef
where ef.ENVIRONMENTAL_FACTOR_ID = '50057007';

-- clean up Animal Availability records for models with IMSR (test models added)
-- clean up models not deleted correctly through GUI
delete from ANIMAL_AVAILABILITY aa
where aa.ABS_CANCER_MODEL_ID is null;

-- Update Environmental_Factor and set IS_INDUCED_MUTATION_TRIGGER flag for CE and IM
update Environmental_Factor ef
set ef.IS_INDUCED_MUTATION_TRIGGER = 1
where ef.environmental_factor_id IN 
(select environmental_factor_id from engineered_gene where engineered_gene_type='IM' and environmental_factor_id is not null);

update Environmental_Factor ef
set ef.IS_INDUCED_MUTATION_TRIGGER = 0
where ef.IS_INDUCED_MUTATION_TRIGGER IS NULL;

--  Add comments to PROTEOMICS_DATA object for 2.5 Grid Data Service (match with OM)
alter table PROTEOMICS_DATA
ADD COMMENTS  VARCHAR2(2000);

-- Replace Amnon's party_id (submitter_id column in abs_cancer_model)  with the curator account id for all models
update abs_cancer_model ac
set ac.SUBMITTER_ID = '50057228'
where ac.SUBMITTER_ID = '10006111';

-- Increase column size for additional text entry
ALTER TABLE THERAPY 
MODIFY EXPERIMENT VARCHAR2(2000);

ALTER TABLE THERAPY 
MODIFY RESULTS VARCHAR2(2000);

ALTER TABLE THERAPY 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE ABS_CANCER_MODEL 
MODIFY COMMENTS VARCHAR2(2000);

-- Increase column size for additional text entry 
ALTER TABLE SPONTANEOUS_MUTATION 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE PUBLICATION 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE CLINICAL_MARKER 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE GENE_DELIVERY 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE ENVIRONMENTAL_FACTOR 
MODIFY COMMENTS VARCHAR2(2000);

ALTER TABLE IMAGE 
MODIFY COMMENTS VARCHAR2(2000);


commit;



 

