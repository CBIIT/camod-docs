select a.abs_cancer_model_id from abs_cancer_model a where a.external_source = 'Jax MTB' and a.state = 'Edited-approved' 
and (a.abs_cancer_model_id not in (select distinct acmp.abs_cancer_model_id from abs_can_mod_publication acmp))