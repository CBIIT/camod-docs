
-- #6812 Change spelling of Equus Caballus - start Caballus with a lower case "c"
update species sp
set sp.SCIENTIFIC_NAME = 'Equus caballus'
where sp.SPECIES_ID = 11;

-- #10654 Clean up contact_info set e-mail to null
UPDATE CONTACT_INFO
SET EMAIL = Null
WHERE EMAIL IS NOT NULL;

--  #13898 Renamed OtherLocationURL in micro array data object to url
ALTER TABLE MICRO_ARRAY_DATA
RENAME COLUMN OTHER_LOCATION_URL to URL;

-- Add flag named is_Induced_Mutation_Trigger to ENVIRONMENTAL_FACTOR
alter table ENVIRONMENTAL_FACTOR
ADD is_Induced_Mutation_Trigger       NUMBER(1);

-- update models that previously used dose units no longer selectable
update treatment t
set t.DOSAGE_UNIT = 'ml/animal/injection'
where t.id = '10009554';

update treatment t
set t.DOSAGE_UNIT = 'microliter/animal/injection'
where t.id = '50050274';

--  Add RGD_PUB_ID to Publication object for MTB import
alter table PUBLICATION
ADD RGD_PUB_ID       VARCHAR2(255);

-- clean up IM records from EF table to clean up CI adv search dropdown
delete from environmental_factor ef
where ef.ENVIRONMENTAL_FACTOR_ID = '50053159';

delete from environmental_factor ef
where ef.ENVIRONMENTAL_FACTOR_ID = '50057007';

commit;



 

