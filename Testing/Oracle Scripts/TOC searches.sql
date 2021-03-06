-- TABLE OF CONTENTS 
-- Mouse model with primary tumor in cardiovascular system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code IN ('C22497','C22499','C22498'))



-- Mouse model with primary tumor in digestive system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22500','C22502','C22509','C22508','C22510','C22521','C22526','C22527','C22533','C22532','C22528','C22529','C22531','C22530','C22522',
'C22524','C22523','C22525','C22511','C22513','C22514','C22512','C22515','C22517','C22516','C22518','C22519','C22507','C24044','C22639','C22640',
'C22641','C22642','C24043','C24045','C22643','C24041','C22520','C24042','C22501','C22503','C22506','C22505','C22504'))



-- Mouse model with primary tumor in endocrine gland system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22634','C22646','C22649','C22648','C22647','C22650','C22651','C22652','C22639','C22640','C22641','C22642','C22635','C22636','C22638','C22637','C22645','C22644'))



-- Mouse model with primary tumor in integument system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22534','C22550','C22535','C22543','C22545','C22547','C22546','C22548','C22544','C22537','C22536','C22539','C22541','C22540','C22542','C22538','C22549'))



-- Mouse model with primary tumor in lymphohematopoetic system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22551','C22569','C22568','C22570','C22585','C22584','C22572','C22575','C22582','C22574','C22576','C22577','C22578','C22579','C22581','C22573',
'C22580','C22583','C22586','C22587','C22588','C22595','C22589','C22571','C22590','C22593','C22592','C22591','C22594','C22565','C22564','C22556','C22557',
'C22558','C22567','C22559','C22566','C22561','C22553','C22555','C22554','C22560','C22596','C24191','C22563','C22552','C22562'))



-- Mouse model with primary tumor in musculoskeletal system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C24194','C22679','C22681','C22680','C22682','C22684','C22683','C22685','C22687','C22686','C22689','C22688','C22691','C22694','C22696',
'C22698','C22695','C22693','C22692','C22690','C22709','C22708','C22703','C22705','C22704','C22697','C22707','C22706','C22699','C24198','C22701','C22700','C22702'))



-- Mouse model with primary tumor in nervous system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22604','C22631','C22628','C24189','C22629','C24190','C22632','C22630','C22605','C22606','C22617','C22616','C22619','C22618','C22607','C22624',
'C22613','C22612','C22615','C22614','C22609','C22608','C22611','C22610','C22621','C22620','C22623','C22622','C22625','C22626','C22627'))





-- Mouse model with primary tumor in reproductive system
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C24192','C22653','C22667','C22655','C22654','C22656','C22666','C22661','C22660','C22663','C22662','C22657','C22659','C22658','C22665',
'C22664','C22677','C22676','C22668','C22669','C22678','C22671','C22673','C22672','C22675','C22674','C22670','C22165','C22167','C22166',
'C24047','C24048','C24046','C22169','C22173','C22172','C22175','C22177','C22174','C22176','C22168','C22178','C22181','C22185','C22180',
'C22184','C22182','C22183','C22186','C22179','C22170','C22171','C24193'))



-- Mouse model with primary tumor in respiratory system 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22597','C22599','C22600','C22601','C22603','C22602','C24050','C22598'))



-- Mouse model with primary tumor in special sensory organ 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22710','C22723','C22724','C22725','C22726','C22727','C22711','C22717','C22722','C22716','C22719','C22718','C22721','C22720','C22712','C22713','C22715','C22714'))



-- Mouse model with primary tumor in urinary system 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22728','C22737','C22739','C22740','C22729','C22738','C22730','C22736','C22731','C22733','C22735','C22734','C22732'))

-- MOUSE MODELS WITH TUMORS IN THE FOLLOWING SITES 

-- Mouse model with tumor in head/neck tumor ; the codes are diagnoses codes not anatomy codes 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C26401','C23045','C23046','C23061','C23062','C23053','C23055','C23054','C23063','C23064','C23065','C23066','C23067','C23056','C23057','C23058',
'C23059','C23060','C23047','C23048','C23052','C23049','C23125','C23126','C23127','C23137','C23136','C23128','C23130','C23140','C23146','C23141',
'C23145','C23144','C23143','C23142','C23148','C23149','C23150','C23151','C23147','C23068','C23079','C23080','C23069','C23071','C23073','C23072',
'C23070','C23074','C23075','C23076','C23083','C23084','C23085','C23086','C23087','C23077','C23078','C23081','C23082','C23109','C23121','C23122',
'C23118','C23119','C23120','C23123','C23124','C23110','C23111','C23112','C23117','C23116','C23113','C23115','C23088','C23107','C23108','C23097',
'C23098','C23095','C23096','C23099','C23100','C23101','C23103','C23104','C23089','C23090','C23091','C23092','C23094','C23105','C23106'))


-- Mouse model with tumor in prostate
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22166','C24047','C24048','C24046','C22169'))

 
-- Mouse model with tumor in mammary gland 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code IN ('C22549'))


-- Mouse model with tumor in brain 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22606','C22617','C22616','C22619','C22618','C22607','C22624','C22613','C22612','C22615','C22614','C22609','C22608','C22611','C22610','C22621','C22620','C22623','C22622'))


-- Mouse model with tumor in liver 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select distinct h.abs_cancer_model_id from histopathology h where h.organ_id IN (select o.organ_id from organ o where o.concept_code 
IN ('C22515','C22517','C22516','C22518','C22519'))


-- MOUSE MODELS WITH METASTASES 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select a.abs_cancer_model_id from abs_cancer_model a where a.STRAIN_ID IN (select st.strain_id from strain st where st.species_id=1)
INTERSECT
select distinct hp.abs_cancer_model_id from histopathology hp where hp.histopathology_id IN (select h.parent_histopathology_id 
from histopathology h where h.parent_histopathology_id is not null)




-- RAT MODELS 
-- Rattus norvegicus 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select a.abs_cancer_model_id from abs_cancer_model a where a.STRAIN_ID IN (select st.strain_id from strain st where st.species_id=4)


--Rattus rattus 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select a.abs_cancer_model_id from abs_cancer_model a where a.STRAIN_ID IN (select st.strain_id from strain st where st.species_id=3)


-- TRANSPLANT MODELS 
select am.abs_cancer_model_id from abs_cancer_model am Inner join availability av on am.AVAILABILITY_ID=av.availability_id 
where am.STATE='Edited-approved'  and av.release_date < sysdate
INTERSECT
select am.par_abs_can_model_id from abs_cancer_model am where am.par_abs_can_model_id is not null

