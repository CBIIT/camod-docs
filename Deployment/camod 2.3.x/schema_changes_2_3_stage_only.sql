-- Fix stocks numbers on dev, qa and stage
UPDATE ANIMAL_AVAILABILITY SET STOCK_NUMBER = '-1' WHERE ABS_CANCER_MODEL_ID = '106' and animal_distributor_id=1;
UPDATE ANIMAL_AVAILABILITY SET STOCK_NUMBER = '-1' WHERE ABS_CANCER_MODEL_ID = '217' and animal_distributor_id=1;
UPDATE ANIMAL_AVAILABILITY SET STOCK_NUMBER = '-1' WHERE ABS_CANCER_MODEL_ID = '251' and animal_distributor_id=1;
UPDATE ANIMAL_AVAILABILITY SET STOCK_NUMBER = '-1' WHERE ABS_CANCER_MODEL_ID = '252' and animal_distributor_id=1;

commit;