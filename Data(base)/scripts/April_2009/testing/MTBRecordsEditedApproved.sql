select abs_cancer_model_id, model_descriptor, state from abs_cancer_model where external_source = 'Jax MTB' and state = 'Edited-approved' order by abs_cancer_model_id desc