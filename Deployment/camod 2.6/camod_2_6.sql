update ENVIRONMENTAL_FACTOR ef
set ef.IS_INDUCED_MUTATION_TRIGGER = '0'
where ef.IS_INDUCED_MUTATION_TRIGGER is null;