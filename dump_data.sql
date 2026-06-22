--
 set search_path = odts;
 --
-- Data for user_roles_master table
--
Insert into odts.user_roles_master (role_name, role_desc) 
values
('DEALER', 'Dealer'),
('DISPATCHER', 'Dispatcher'),
('OFFICE_EXECUTIVE', 'Office operations'),
('SALES_OFFICER', 'Sales team'),
('STOCK_MANAGER', 'Warehouse stock management'),
('ADMIN', 'Administrator');
--
--INSERT INTO odts.user_roles_master (role_name) VALUES ('STOCK_MANAGER') ON CONFLICT DO NOTHING;
--
-- Data for product_master table
--
insert into odts.product_master ( product_name, product_desc, product_is_active_flag) 
values
( 'GOLD', 'Premium grade product', true),
( 'POWER', 'High performance  ', true),
( 'PLUS', 'Standard product', true);
--
-- Data for code reference table
--
INSERT INTO odts.code_reference (code_type, code_label, code, code_desc, code_sort_order)
VALUES
  ('system_config',     'Admin Phone Number',        'admin_phone',  '+917042656633', 1)
--
--
INSERT INTO odts.warehouse_master (warehouse_type, warehouse_ui_label, warehouse_code, warehouse_name, warehouse_ui_order)
VALUES
  ('loading_type',     NULL,        'SLF_DOT',  'Self DOT (Dealer own truck)',  1 ),
  ('loading_type',     NULL,        'CMP_TRN',  'Company Transport',            2 ),
  ('loading_location', 'RAKE',      'RAK_CHA',  'Rake (Chaukhadi)',             1 ),
  ('loading_location', 'RAKE',      'RAK_SHI',  'Rake (Shivpur)',               2 ),
  ('loading_location', 'WAREHOUSE', 'WH_TAR',   'Warehouse (Tarna)',            3 ),
  ('loading_location', 'WAREHOUSE', 'WH_GOE',   'Warehouse (Goenka)',           4 ),
  ('loading_location', 'WAREHOUSE', 'WH_BHU',   'Warehouse (Bhupur)',           5 ),
  ('loading_location', 'WAREHOUSE', 'WH_DAF',   'Warehouse (Dafi)',             6 ),
  ('loading_location', 'WAREHOUSE', 'WH_OTH',   'Warehouse (Any other)',        7 ),
  ('loading_location', 'SOW',       'SOW_BHA',  'SOW (Bhabhua)',                8 ),
  ('loading_location', 'SOW',       'SOW_TEK',  'SOW (Tekaria)',                9 );
--
--
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110202061','ANKIT BUILDING MATERIALS','VARANASI',9453397468,'ABHAY KUMAR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110046614','PURWAR CEMENT BHANDAR','VARANASI',9415305397,'ADITYA GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110170402','KOMAL ENTERPRISES','VARANASI',7376746105,'AMIT',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110220933','SN INFRA MARKET','VARANASI',7905258004,'AMIT UPADHYAY',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110032672','ADESH TRADERS','VARANASI',9415204148,'ANAND GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110190952','MAA VAISHNO ENTERPRISES','VARANASI',9450330719,'ANIL KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033203','ANJALI ENTERPRISES','VARANASI',9415336241,'ANIL KUMAR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110235624','SINGH BROTHERS','VARANASI',9838808962,'ANIL KUMAR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110220921','PARTH BUILDCON','VARANASI',9611375476,'ANJESH KUMAR TRIPATHI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110209421','FVS TRADING CORPORATION','VARANASI',9125461413,'ARSHAD ANSARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110206767','SHREE RAM STEEL','VARANASI',6392041429,'ASHOK SETH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110117683','AKK TRADERS','VARANASI',7860091091,'Ashwani Kumar Khanna',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110224954','SHRI RAM ENTERPRISES','VARANASI',7071973919,'AYUSH JAISWAL',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110045030','KRIPA SHANKAR SINGH','VARANASI',9415300220,'Balkeshwar Prasad Singh',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033213','SHREE RAM IRON STORES','VARANASI',9415447483,'BRIJESH KUMAR VARMAN',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110092656','MALTI BUILDING MATERIAL','VARANASI',9839519855,'Chote Lal Pathak',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033205','SHIVA CEMENT AGENCY','VARANASI',9415988037,'Dhirendra Kumar Yadav',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110092659','BHOLE NATH ENTERPRISES','VARANASI',9454231797,'Dilip Kumar Rai',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110144134','G S TRADERS','VARANASI',9415696821,'GHANSHYAM YADAV',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110172831','MAA VASHINO HARDWARE BUILDING','VARANASI',9918777813,'GURU',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110217758','AYUSH TRADING COMPANY','VARANASI',9451609946,'HARIDASH JAISHAWAL',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110097794','AJAY PAINT AND HARDWARE STORES','VARANASI',9450872462,'HIMANSHU AGRAHARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110183722','SHRI SIDDHI VINAYAK BUILDING','VARANASI',6394817496,'JAY',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110202060','JYOTI BUILDING MATERIALS','VARANASI',8115332151,'JYOTI BHUSHAN SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110130915','MAHARAJ JI BUILDING MATERIAL','VARANASI',9839903666,'KRISHNA AVATAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110232851','BHAGIRATHI CONSTRUCTION AND SUPPLIE','VARANASI',9044339800,'LALLAN SHARMA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110188732','VIDHYA ENTERPRISES','VARANASI',9559895003,'MAHENDRA PRATAP SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110234954','M K ENTERPRISES','VARANASI',9695795004,'MANOJ KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110235576','BEMISHAL CEMENT AGENCY','VARANASI',8318590576,'MOHAMMAD SALMAN',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110234216','OM SHREE SAI NATH ENTERPRISES','VARANASI',9919781361,'MUHAMMAD SALIM',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110200556','OM BUILDING MATERIAL','VARANASI',9919568696,'MUKESH YADAV',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110184692','GEETA BUILDING MATERIAL','VARANASI',9839144542,'NAND',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110159541','SHREE BALAJI ENTERPRISES','VARANASI',9336182012,'NANDINI SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110231172','MOURYA ENTERRPISES','VARANASI',7524936871,'NANDLAL MAURYA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110205222','KRISHNA ENTERPRISES','VARANASI',9219785608,'NRIPENDRA SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110173220','HEMANT ENTERPRISES','VARANASI',9415980801,'OM PRAKASH CHAURASIA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110070000','RAJARAM OMPRAKASH IRON STORE','VARANASI',9956585951,'OM PRAKASH GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110178852','HARSH CEMENT AGENCY','VARANASI',9838674727,'PANKAJ KUMAR DUBEY',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110187741','MAHAVEER ENTERPRISES','VARANASI',9695004001,'PANKAJ KUMAR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110237589','PAWAN ENTERPRISES','VARANASI',8090412525,'PAWAN KUMAR CHOUBEY',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110178792','PATHAK BUILDING MATERIALS','VARANASI',9839505929,'PRADEEP KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110228566','NEW PRADEEP STEELS','VARANASI',9839093699,'PRADIP KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110225636','KRIPA TRADERS','VARANASI',9120292964,'PRAJJWAL CHAUBEY',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110234300','SHRI GANPATI INFRATECH','VARANASI',7376590900,'PRATIBHA TIWARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110217209','MISHRA BUILDING SOLUTIONS','VARANASI',7007599046,'PRAVINA DEVI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110225594','RAGINI ENTERPRISES','VARANASI',9088666333,'RAGINI SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110235580','SHREE MAHADEV BUILDING MATERIAL','VARANASI',7785804546,'RAJAT SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110207934','AWANTI CEMENT AGENCY','VARANASI',8887652664,'RAJENDRA NATH GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033207','SHIVAM CEMENT AGENCY','VARANASI',9415446150,'RAJESH KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110235610','AMAN BUILDING MATERIALS','VARANASI',9450251409,'RAMASHREY SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110131504','DEVARSHI ENTERPRISES','VARANASI',7754994433,'Ramesh Pratap Singh',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110145353','VINAY BUILDING MATERIALS','VARANASI',9450012613,'RANJEET SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110171676','KAMAL ENTERPRISES','VARANASI',7007810004,'RATNESH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110236010','KESHARWANI AGENCIES','VARANASI',9415619899,'RAVI SHANKER KESARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033210','R K BUILDING MATERIAL','VARANASI',9415343325,'RISHIKESH SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110170948','OM SHIV BHOLE BUILDING MATERIAL','VARANASI',8840542177,'RITU TIWARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110204851','DIVYANSH BUILDING MATERIAL','VARANASI',9795337722,'ROSHAN YADAV',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110206595','JAY AMBEY ENTERPRISES','VARANASI',9451137695,'SANI KUMAR CHAURASIYA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033145','VISHWANATH PRASAD SATYA CHARAN','VARANASI',9415228637,'SANJAY BARANWAL',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033101','BIRASAN ENTERPRISES','VARANASI',9415223227,'Sanjay Ghosh',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110187050','DAYAL TRADERS','VARANASI',9919156255,'SANTOSH KUMAR GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110180027','S K ENTERPRISES','VARANASI',9919010488,'SATISH KUMAR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110208384','MATICOTECH INFRASTRUCTURE PVT LTD','VARANASI',8707339385,'SHIKHA SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033198','OM TRADERS','VARANASI',9451582416,'Shiv Bhajan Pandey',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033143','AKASH ENTERPRISES','VARANASI',9415202341,'SHUBHASH JAISWAL',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110206768','SAHU TRADERS','VARANASI',7905825188,'SHWETA GUPTA',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110146501','KRISHNA ENTERPRISES','VARANASI',9235600165,'SHYAM BABU',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033156','SATYA NARAIN CEMENT AGENCY','VARANASI',9839910609,'Shyam Narain Singh',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110078716','SAMRAT IRON STORES','VARANASI',9415285959,'Shyam Sundar Singh Kashyap',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110208385','ANUJ TRADING COMPANY','VARANASI',8052212829,'SIMPAL KESHARI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110166533','SUMITRA TRADERS','VARANASI',8318581393,'SUMITRA DEVI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110221017','AMAR CONSTRUCTIONS AND SUPPLIER','VARANASI',9336835074,'SUNIL KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110203758','KRV ENTERPRISES','VARANASI',9717082620,'SUREKHA DEVI',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110068757','SUNDER CEMENT AGENCY','VARANASI',7905926492,'SURENDRA KUMAR YADAV',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110093690','SAI CEMENT AGENCY','VARANASI',9453203994,'Tribhuvan Mishra',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110033157','ROSHAN CEMENT AGENCY','VARANASI',9415304457,'UMESH KUMAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110228028','SRI MAHADEV ENTERPRISES','VARANASI',8574508918,'VIJAY BAHADUR SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110162175','VIJAY SHANKAR CONSTRUCTION','VARANASI',9935262692,'VIJAY SHANKAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110235599','ROYAL TRADERS','VARANASI',8318617656,'WASEEM AKHTAR',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);


Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110206767','SHREE RAM STEEL','CHANDAULI',6392041429,'ASHOK SETH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);
Insert into odts.dealer_master (dealer_code, dealer_company_name, dealer_address, dealer_phone, dealer_name,  created_by, created_at, updated_by, updated_at) values ( '9110159541','SHREE BALAJI ENTERPRISES','CHANDAULI',9336182012,'NANDINI SINGH',0, CURRENT_TIMESTAMP,0, CURRENT_TIMESTAMP);


insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('160','9110202061','ANKIT BUILDING MATERIALS','A NO. 530 GADHWA ROAD PATEL NAGAR BHAGWANPUR','9453397468');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111150322','SHASHANK CEMENT AGENCEY','POLICE LINE, VARANASI','9415305394');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111150321','JAISWAL CEMENT STORE','MACHCHODRI,VARANASI','9781900764');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111169467','JAI PRAKASH SINGH','HARHUA','9415353504');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111169457','JP BUILDERS','GHAMRAHA','9981909216');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111367092','ADITYA RAJ JAISWAL','A-39/289, LAAH SARAIYA, SARNATH','9415305397');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9111169452','PUJA CEMENT AGENCY','DAULAPUR,VARANASI','7800511116');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('161','9110046614','PURWAR CEMENT BHANDAR','Senpura Bagh, Kaniyadal','9415305394');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('162','9110170402','KOMAL ENTERPRISES','AMAULI BHAGATUA, CHAUBEPUR','7376746105');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('163','9110220933','SN INFRA MARKET','PANCHKOSHI ROAD SHIVPUR','7905258004');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('164','9110032672','ADESH TRADERS','KACHHWA ROAD,VARANASI','9415221317');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('164','9111344015','A.K.BROTHERS','THATHARA,KACHWA ROAD','9795683731');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('164','9111066282','NARAIN CEMENT AGENCY','KOTHAWA,VARANASI','9981910743');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('165','9110190952','MAA VAISHNO ENTERPRISES','BHULLANPUR, MARAULI','9450330719');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('166','9111348632','SHYAM LAL JINDAL','MANANV NAGAR,BADAGAON','9481905235');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('166','9110033203','ANJALI ENTERPRISES','VISHWAKARMA NAGAR,KANDWA,CHITAIPUR','9415336241');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('166','9111394841','VERMA LIME STORE','N 9/33 BADIPATIYA','9415353464');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('167','9110235624','SINGH BROTHERS','CHITTUPUR, HINDU VISHWA VIDYALAYA','9838808962');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('168','9111460257','SHUBHI TRADERS','BELWAN','9450287028');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('168','9110220921','PARTH BUILDCON','KHATA NO 00112 BELAWA','9611375476');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('169','9111452654','SHIDRATH ENTERPRISES','MIRZAMURAD,KALLIPUR ROAD,BENIPUR','8009541262');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('169','9111489795','VISHAL BUILDING MATERIALS','GAUR MIRZAMURAD','8528761774');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('169','9110209421','FVS TRADING CORPORATION','DEIPUR, JANSA ROAD, JHABRA','9125461413');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('169','9111470084','SHIVAM SINGH','KALLIPUR ARAJILINE','7651918483');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9110206767','SHREE RAM STEEL','AURAH,DELHANA,KACHNAR','6392041429');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111441931','DEEPAK IRON STORE','AMARA KHAIRA CHAK, POST KANDWA','7985131440');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111456089','DEEPAK CEMENT AND HARDWARE STORE','D 57 48 A 3, NEAR PANI TANKI, SONIA','9839067496');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111469058','JAIN ENTERPRISES','CHAUBEYPUR','9335587878');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111488051','MARUTI BUILDING MATERIAL AND','CHUNAR ROAD AKHARI BYPASS KHANAW','9336721212');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111480499','JAISWAL BUILDING MATERIAL','MOHANSARAI GANGAPUR','8858208677');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111451366','DHIRENDRA KUMAR','K 56 3, AUSAANGANJ','8924009272');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111442996','SINGH BROTHER CONSTRUCTION','LALPUR ANOOLA','8077724856');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111470299','VIVEK ENTERPRISES','MAHAVAN BABHINIYAW','8887899149');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111445246','SETH BUILDING MATERIAL','NEAR POLICE STATION, RASULHA, AKORH','9415305531');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111449029','SHAURY CONSTRUCTION','VILL CHITAUNI KOT  BACHCHHAWAN','9450252566');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111441150','SHARDA ENTERPRISES','B 27 70 H, DURGAKUND, BARHAR KOTHI','9956989994');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111480595','SKS ENTERPRISES','KATESAR RAMNAGAR','9695451024');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111453795','PRAVEEN PATHAK','RAJWARI, BHANDAHA KALA','7052212647');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111490757','RAI TRADING COMPANY','KARMANVEER SUSUWAHI','6393633231');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111456429','ASHA ENTERPRISES','DAFI, NUAAV, NAIPURA KHURD','8887589089');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111442995','AYUSH SHARMA','HARAHA','9919955116');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('170','9111439938','VIDHAN CONSTRUCTION','KANDAWA, CHITAIPUR','9140514204');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111439952','OM BUILDING MATERIAL','KACHHAWA ROAD','9621262184');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111490755','S K ENTERPRISES','KANDAWA VARANASI','8707318001');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111472814','CHIRANJEEVI CONSTRUCTION','NAWALPUR ROAD','9118404744');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9110117683','AKK TRADERS','C-33/52 17 INDRA NAGAR CHITUPUR SIG','6392475879');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111396158','AMBA TRADERS','RAJWARI','9450785447');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111372887','BHARAT ENTERPRISES','KACHWA BAZAR','9198434344');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111367518','NASEER KHAN','SINDHORIYA POKHRI,SHIVDASPUR','6386913676');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111369361','SHYAMA ENTERPRISES','KASWAR RAJATALAB VARANASI','8318295800');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111470298','AVANI BUILDING MATERIAL','AKHARI KURAHUNA','8960508003');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111388702','KHAN BUILDING MATERIAL','TELIYANA BAJARDIHA','7007213779');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111356849','SHUBHI BUILDING MATERIAL','C33/188 L CHANDUA CHITTUPUR,SIGRA','8858521144');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111389988','VARANASI CONCRETE','MIRZAMURAD','7408289334');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('171','9111388703','KHAN AND SONS','MIRZAMURAD RAJATALAB','8004766138');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('172','9111474990','MAA DURGA TREADING','GATA NO 378, MILKOPUR, JALHUPUR','6394146107');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('172','9110224954','SHRI RAM ENTERPRISES','KHALISHPUR MOHANA','9532621248');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('172','9111486606','DHANSHRI ENTERPRISES','MIRANPUR BASAHI','9532621248');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('173','9110045030','KRIPA SHANKAR SINGH','Kachmar, Raja Talab','9415300220');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('174','9110033213','SHREE RAM IRON STORES','17/138 PAHADIA CHAURAHA,VARANASI','9415447483');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('175','9110092656','MALTI BUILDING MATERIAL','SATYAM NAGAR COLONY, NEAR GARDENIA','9839519855');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('176','9110033205','SHIVA CEMENT AGENCY','SH-3/1-A/C (KHA),NAWALPUR,BASAIN','9450711701');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('177','9110092659','BHOLE NATH ENTERPRISES','HAIDRABAD GATE,NASIRPUR ROAD,','9454231797');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('178','9110144134','G S TRADERS','PANDEY HAVELI, SONARPURA','9415696821');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('178','9111400344','ABRAR KHAN','N 12/214-K-1, BAZARDIHA,','9415987473');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('178','9111413749','ABHAY YADAV','B 13/94, KALI BADI,SONARPURA','7052083218');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('179','9111456645','PATEL ENTERPRISE','BHULLANPUR ROAD,ROHANIYA','6392848884');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('179','9111480441','JAI MAA KALI HARDWARE SANITARY AND','ANAND NAGAR COLONY SARNATH ASHAPUR','9305449816');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('179','9111450846','ARPIT ENTERPRISES','KAMAULI, BABHANPURA, TATEPUR','9651975051');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('179','9110172831','MAA VASHINO HARDWARE BUILDING','117, GAURAKALA, CHIRAI GAON,','9935327836');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('179','9111382007','KARAN CONSTRUCTION','GAURAKALA, DOMANPUR CHIRAIGAON','9935327836');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('180','9110217758','AYUSH TRADING COMPANY','NEW COLONY, SOYEPUR, BELWA BABA','9451609946');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('181','9110097794','AJAY PAINT AND HARDWARE STORES','J 15/65, E-5 GT ROAD, CHAUKAGHAT','9450872462');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('182','9110183722','SHRI SIDDHI VINAYAK BUILDING','0, MUNARI ROAD,','6394817496');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('182','9111394846','JAGDISH NARAYAN','RAUNA KHURD,','8887736005');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('183','9110202060','JYOTI BUILDING MATERIALS','0,DAFFI,NUNAW','8115332151');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('183','9111456432','PARVATI BUILDING MATERIAL','NUVAV','8979629260');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('184','9110130915','MAHARAJ JI BUILDING MATERIAL','N8/251-A-2-S,NEWADA,NEAR PATEL STEE','9839903666');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('185','9110232851','BHAGIRATHI CONSTRUCTION AND SUPPLIE','N 1 12 F 11 GANGOTRI VIHAR NAGWA','9044339800');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('186','9110188732','VIDHYA ENTERPRISES','ARAZI NO. 243 BABATPUR ROAD PINDRA','9559895003');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('186','9111400343','VIDYA STEEL','GOKULPUR,KAJISARAI','9721111898');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('187','9110234954','M K ENTERPRISES','MAHESHPUR TARNA SHIVPUR','9919505738');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('188','9110235576','BEMISHAL CEMENT AGENCY','MAIDAGIN SAPT SAGAR','8318590576');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('189','9110234216','OM SHREE SAI NATH ENTERPRISES','CHOLAPUR JAGDISHPUR KATEHAR','9919781361');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('190','9110200556','OM BUILDING MATERIAL','SEERGOVERDHAN TOLL TAX ','9919568696');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('191','9110184692','GEETA BUILDING MATERIAL','0, MADAWA, LAMHI','9839144542');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('192','9111371492','SRI JAGDAMBA CEMENT STORE','B 30/2-A-5,GANGABAGH COLONY,LANKA','9336182012');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('192','9111449234','PRADEEP KUMAR','SAKALDIHA','9336182012');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('192','9111413909','PANKAJ KUMAR','B 30/2 A-5 LANKA','8052325181');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('192','9110159541','SHREE BALAJI ENTERPRISES','N 812/2, MADARWA, LANKA,CHHITTUPUR','9336182012');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('193','9110231172','MOURYA ENTERRPISES','PUARIKALA PINDRA','7524936871');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('194','9110205222','KRISHNA ENTERPRISES','ARAJI NO 9/1 PLOT NO 18, SOYEPUR','9219785608');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('194','9111439951','NARAYAN ENTERPRISES','KHATA NO 70,SINDHORA ROAD,KANUDIH PRANGANA SHIVPUR','7844844466');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('194','9111437590','AKANCHHA ENTERPRISES','VILL BELWA BABA, LAMHI','9452072786');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('195','9110173220','HEMANT ENTERPRISES','CHAUBEPUR','7880575030');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('195','9111489818','JAI AMBEY TRADERS','KATEHAR CHAUBEYPUR','7880575030');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('196','9110070000','RAJARAM OMPRAKASH IRON STORE','S 9 78 1K PANDEYPUR','9956585951');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('197','9110178852','HARSH CEMENT AGENCY','CHUNAR ROAD, AMRA','9838674727');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('198','9110187741','MAHAVEER ENTERPRISES','SH 6/3 2, HANUMANT NAGAR, SHIVPUR','9695004001');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('199','9110237589','PAWAN ENTERPRISES','B24 DAFI DWARIKA PURAM COLONY','8090412525');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('200','9110178792','PATHAK BUILDING MATERIALS','SA-15/144-2KH,','9839505929');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111432573','ROHIT CEMENT AGENCY','D40 19AND 22,LAKSHAMANPUR GODWALIYA','8604346970');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9110228566','NEW PRADEEP STEELS','C 30 35 C 2 MALDAHIYA LOHAMANDI','9839093699');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111343558','SIDDHART TRADERS','VILL-BHITARI,POST-LOHTA','9125366516');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111424087','VIVEK CEMENT AGENCY','N 8/52 C 2 NEWADA SUNDERPUR','8960581162');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111380045','GOPAL ENTERPRISES','B 34/6-3C-N SARAYNANDAN','7398356958');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111346005','KRISHNA ENTERPRISES','K43/25,BANGALI BADA','7754994433');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111188823','FRIENDS ENTERPRISES','NAKKHASH LOHATIA','9781922035');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111203452','JAISWAL CEMENT AGENCY','NADESAR,VARANASI','9781911013');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111331033','MAA BAGESHWARI ENTERPRISES','J721D GOPAL GANJ JAITPURA','9452197229');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111345770','GAURAV ENTERPRISES','NAKKHIGHAT,SARANG CHAURAHA','9415284041');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111346004','AGRAHARI CEMENT AGENCY','PISACH MOCHAN,VARANASI','8188001059');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111394842','BABA KINARAM TRADERS','B-23/21 KHOJWAN','8115903048');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111486628','ADITI CONSTRUCTION','PATERCHAK HATHI BAZAR','9984820302');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111236126','SUNIL KUMAR','MURDAHA,VARANASI','8400044440');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111392096','SANJANA STEELS','VILL-SOYEPUR, HARHUAN','9453639918');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111416945','SHUBH BUILDING MATERIAL','MADHAULI, BHULLANPUR','9795888660');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111418150','MAYANK TRADERS','HASHIMPUR, LALPUR','9839706475');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111475008','HAYAN TRADERS','GRAM ASHAPUR TEHSIL PINDRA','9517333352');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111188825','SALIM BUILDING MATERIAL','KOYLA BAZAR','9839742349');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111456418','JAI MAA ENTERPRISES','KONIYA','9621653663');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111410766','ANKUR AGRAHARI','LOHA MANDI MALDAHIYA RAM SUMER ASHRAM','7753942345');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111378581','GANPATI ENTERPRISES','N 15/572-11 A JIVDHEEPUR, BAJARDIHA','8887497127');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111238061','ALOK KUMAR GUPTA','HUKULGANJ,VARANASI','8745851542');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111188822','RAM SUMER & SONS','MALDAHIYA, VARANASI','9581907238');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111449028','KRISHNA TRADERS','BHADAINI SHIVALA','9559371838');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111380046','HARE KRISHNA CEMENT STORE','18/25 B-1 MAUJA HALL HALGAON','7355461096');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111437591','INDRASANI BUILDING MATERIAL','ARAZI NO 161, PARMANANDPUR, SHIVPUR','9450538063');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111271757','ASHUTOSH ENTERPRISES','B-23/62-1A NAI BAZAR KHOJWAN','7905020682');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('201','9111190464','SHIV BUILDING MATERILS','SUNDERPUR,VARANASI','9481911778');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('202','9110225636','KRIPA TRADERS','BHOJUBEER PALAHIPATTI','9120292964');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('203','9110234300','SHRI GANPATI INFRATECH','AMRAKHAIRACHAK','7376590900');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('204','9111452655','JAMUNA PRASAD GAYA PRASAD','0K67/85 A,NATIIMLI','9839400400');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('204','9110217209','MISHRA BUILDING SOLUTIONS','BANWARIPUR LAMHI','7007599046');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('205','9111472813','JYOTSANA ENTERPRISES','CHAHIN KATEHAR','8299669765');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('205','9110225594','RAGINI ENTERPRISES','BARALALPUR, VDA COLONY PHASE 1','9088666333');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('205','9111472812','MAA GAYATRI TRADERS','LAMAHI','7505945843');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('206','9110235580','SHREE MAHADEV BUILDING MATERIAL','NARPATPUR NARAYANPUR CHAUBEPUR','7785804546');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('207','9110207934','AWANTI CEMENT AGENCY','SHIVPURWA, MAHMOORGANJ','8887652664');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('207','9111414832','DINESH KUMAR VERMA','VILL PHOOLPUR THANA PHOOLPUR','9935370590');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('207','9111443375','SAROJ DEVI','51 1 VASUNDHARA GATE 1 RAILWAY COLO','9140211284');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9110033207','SHIVAM CEMENT AGENCY','BHAGWATIPUR CHAURAHA,TIKRI,VARANASI','9415446150');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111463014','ADARSH BUILDING MATERIAL','KHANAW BACHCHAW','8840401649');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111478154','ANNAPURNA ENTERPRISES','CHUNAR ROAD BACHCHHAON','7080206252');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111462090','RAJBALI BUILDING MATERIAL','MURADEV TIKARI','8737802373');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111416890','RAKSHAK BUILDING MATERIALS','JAKKHINI','9936607091');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111304913','SWASHTIK BUILDING M.','AFHY BY VILLAGE NUWAVAN NARAYANPUR','9936999357');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111442994','NILKANTH BUILDING MATERIAL','SUSHWAHI','7275617776');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111304910','VIKAS CEMENT AGENCIES','ADITYANAGAR SUSWAHI,VARANASI','9781916364');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111435451','PATEL BUILDING MATERIAL','GHAMAHAPUR, KASHIPUR','9795195458');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111066207','NEW PATEL CEMENT SALES','CHETAIPUR,VARANASI','9026625987');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111364351','AVANISH CEMENT AGENCY','KAMLEH PURA BARIYA,BARKI UP','9450868971');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111464761','A K ENTERPRISES','CHHITAUNI, SOOLTANKESHWAR ROAD','9415949444');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111066230','RAJ BUILDING MATERIAL','KHANAO 9881911856','9181903605');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111154857','RAJENDER CEMENT AGENCY.','CHITAIPUR 9281913670','9281913670');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111063755','ANAND BUILDING MATERIAL','MUDADEH','9452566838');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111470083','OM SAI ENTERPRISES','BACHHAON KHANWA','8318414484');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111330948','AARAV ENTERPRISES','BACHCHHAWON,VARANASI','7843832315');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111315471','PAL BUILDING MATERIAL','ASI AWLESHPUR KANDAWA CHITAIPUR VAR','8931893802');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('208','9111063797','PUJA BUILDING MATERIAL','PARUSHURAMPUR','9681911975');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('209','9110235610','AMAN BUILDING MATERIALS','DHARSAUNA CHOLAPUR','9450251409');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111447527','HARSHIT ENTERPRISES','KESHARIPUR, LOHTA','7007460676');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9110131504','DEVARSHI ENTERPRISES','J 13/93 A-14 K-4, COTTON MILL, CHOW','7754994433');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111330368','VERMA CEMENT AGENCY','JALALIPATTI,BHULLANPUR','9415353464');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111066186','CHANDEL ENTERPRISES','AULESHPUR,VARANASI','9781903951');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111432362','VIBHA ENTERPRISES','BACCHAON','9335856164');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111392099','GAURAV TRADERS','PINDRA BAJAR','9415225461');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111205007','S KUMAR BUILDING MATERIAL','KERAKETPUR, LOHATA','9381909978');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111299352','POORNIMA ENTERPRISES','CHANDPUR LOHATA,VARANASI','9381906777');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('210','9111408192','OM ENTERPRISES','SHOP NO 01&04, NARAYANPUR, DAFFI','9984438125');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('211','9110145353','VINAY BUILDING MATERIALS','SA-5/159-E-3,RAMAREPUR,PAHARIYA','9450012613');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('212','9110171676','KAMAL ENTERPRISES','KEWTAN, SAKALPUR SEWAPURI','9451230014');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('213','9110236010','KESHARWANI AGENCIES','A8 25 TELIYANALA PRAHALADGHAT','9415619899');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('214','9110033210','R K BUILDING MATERIAL','AULESHPUR,KANDWA','9415343325');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('215','9110170948','OM SHIV BHOLE BUILDING MATERIAL','ARAJI NO. 209, LEDHUPUR, ASHAPUR','9839110158');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('216','9110204851','DIVYANSH BUILDING MATERIAL','VILL MUDADEV, POST TIKARI BHU','9795337722');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('217','9110206595','JAY AMBEY ENTERPRISES','DANDUPUR, 137, DHAUKALGANJ','9451137695');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('217','9111458482','R R CHAURASHIYA BUILDING MATERIAL','DANDUPUR','9838600365');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111449027','TIRUPATI BUILDING MATERIAL','CHILBILA KUNDI','9956033027');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111457222','CHANDAN BUILDING MATERIAL','SH 2 635B CENTRAL JAILROAD SIKRAUL','8808466433');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111383616','SHIVAM ENTERPRISES','BARAWAN KATAUNA','9839936071');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111329304','SANDEEP BUILDING MATERIAL','BELA ROAD,ARAZI 59/1,OM NAGAR','9555335157');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304866','HARDIK HARDWERE AND BUILDING MAT','BABUA PUR KASAWAR RAJA RAJA','9452037771');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111457192','DEEP SHIKHA BUILDING MATERIAL','KARDHANA MIRZAMURAD','6307538996');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9110033145','VISHWANATH PRASAD SATYA CHARAN','BARAGAON','6387763207');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111066192','RADHESHYAM GUPTA CEMENT STOCKIST','BADAGAON','8574391948');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111358887','PRINCE BUILDING MATERIAL','NARAYANPUR,KATAUNA','9838240758');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111062067','ALAKH NARAIN SINGH','SADHOGANJ','8471031883');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111342165','PRADHAN BUILDING MATERIAL','VILL-KHARAWAN,SADOGANJ','9451268426');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304871','SAMRAT BUILDING MATERIAL','VILL AND POST SINDHORA ,VARANASI','9005699657');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111329098','YADAV BUILDING MATERIAL','PHOOLPUR,VARANASI','9044717941');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111480495','SURENDRA KUMAR JAISWAL','KOIRIPUR BARAGAON','8009667706');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111225822','SANJAY BUILDING MATERIALS','VARANASI DEHAT','9628443027');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111147165','RATAN LAL BUILDING MATERIAL','SINDHORA, PHOOLPUR','9451269148');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111439453','BHAVANI ENTERPRISES','PHULPUR ROAD, PINDRA PHATEHPUR KATA SINDHORA','8328481678');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111468256','SHREE PARAMHANS BUILDING MATERIAL','PANDITPUR KASHIPUR KACHNAR','9415981566');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111328483','SHRI KRISHNA BUILDING MATERIAL','OPPOSITE,KGSG BANK,JANSA','9452071773');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111468257','SHREYANS BUILDING MATERIALS','BANDEPUR','9415617356');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111203466','SRI RADHESHYAM BUILDING MATERIAL','RAJPUR,VARANASI ','9198943416');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111414555','GUPTA BUILDING MATERIAL','KUNWAR BAZAR BARAGAON','7652031220');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111443376','SHREE RAM CEMENT AGENCY','N6 2 B 125 INDIRA NAGAR CHITAIPUR','9125833244');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111470081','BABA JI BUILDING MATERIALS','BHATAULI NAIPURA HATHIBAZAR','9731110159');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111394845','JANTA BUILDING MATERIAL','KATHIRAON','9653074027');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111384024','TIRUPATI CONSTRUCTION COMPANY','PLOT NO.C-36, V.D.A COLONY,','8299336717');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304442','AZAD BUILDING MATERIAL','ARANASI S-2/240-C-1 PANDEYPUR,SHIVN','9336943504');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111488048','ALOK BUILDING MATERIALS','RASOOLGARH SARNATH','9984369716');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111488056','RAJ ENTERPRISES','SINGHPUR SARNATH','7905736592');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111346195','MAA VIDYAVATI ENTERPRISES & SONS','BABATPUR,HARHUA ROAD','9695964276');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111437589','KUSH BUILDING MATERIAL','RAMDUTPUR, PANDEYPUR','9026511082');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111451895','SARASWATI BUILDING MATERIAL','BHU, SEERGOVARDHANPUR','9415245002');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111198403','STAR STEEL','CHHITAUNI VARANASI','9781910409');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111360310','SHRI KESHARI BUILDING MATERIALS','BHULLANPUR,PAC VARANASI','6387674260');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111062034','RAMJI BUILDING MATERIAL','NAYEPUR','9450249830');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111470082','D K PRADHAN BUILDING MATERIAL','GAJOKHAR DEVJI, PINDRA','8009866485');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111454465','GANGA BUILDING MATERIALS','SH 8/82, SHIVPUR','9935351231');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111152711','BABA BUILDING MATERIAL','POLICE LINE VARANASI','9415683451');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111287417','JAI BAJRANG CEMENT AGENCY','KOIRIPUR,BARAGAON,VARANASI','9981904021');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111469057','SHIV SHAKTI PRINCE BUILDING','JALALPUR NAWALPUR JANSA','8574746211');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111447980','JBS TRADING COMPANY','MIRANPUR BASAHI','8090350556');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111405853','SHREE BUILDING MATERIAL','AUDHE, VISHOKHAR, BACCHAON','8299688095');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111066202','SHIVAM ENTERPRISES','CHANDMARI,VARANASI','7081876746');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111066255','PRATAP BUILDERS AND HARDWARE','SHIVPUR BYPASS','7499979620');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111390453','MAA INDRAWATI BUILDING MATERIAL','0, KARKHIYAON, PHOOLPUR','8090589311');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111480494','VIDYARAJ TRADERS','KHEWASIPUR KORAUTA VILLAGE ROAD','7800677894');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111464767','SWASTIK ENTERPRISES','S 2 247 1 K URMILA KATRA BHOJUBIR','7007829805');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111388200','VIJAY CONSTRUCTION AND SUPPLY WORKS','BHIKHARIPUR,RAJATALAB,VARANASI','9956960232');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111443377','SATYA ENTERPRISES','KOERIPUR BARAGAON','8960297067');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304904','AMIT TRADERS','SH-15/47K BHARLAI SHIVPUR,VARANS','9984509595');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111445760','ANKIT TRADERS','KASWAR RAJA,KACHHWA ROAD','8318585861');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111395235','CHAURASIYA FERTILIZER','0, DEIPUR','9451440447');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111061058','DIXIT BUILDING MATERIAL','CHILBILA','9452064067');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111061087','AGRAHARI BUILDING MATERIAL','JALALPUR','9935957562');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111149750','GAURAV BUILDING MATERIAL','PHOOLPUR','9451580423');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111066263','DIGVIJAY CEMENT AGENCY','VARANASI','9956430991');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304897','GAUTAM CEMENT AGENCIE','ASI 15/50 C 7 R BHARLAI SHIVPUR,VAR','7905813795');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304906','GIRDHARI ENTERPRISES','HIVPUR, SH 16/21 ARAZI NO.147/2 KAD','9181905538');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304903','GOVIND BUILDING MATERIAL','KAJISARAI,VARANASI','8299711712');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111392095','HARI OM BUILDING MATERIAL','GANGAPUR, CHAURAHA MANGARI','9453898144');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111340292','PATEL ENTERPRISES','SAMOGARA,PINDRA','7379123126');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111340688','HEMANT BUILDING MATERIAL','RAMSINGHPUR,HARAHUA','9170209594');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111332381','JAI MAA SHARDA STEELS','8/29,PANCHKOSHI ROAD,SHIVPUR','9721272837');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111397839','MAA DURGA ENTERPRISES','SINDHORA, MAGHAWAN','7859875775');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111328432','PATEL BUILDING MATERIAL','JANSA,VARANASI','9807643629');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304895','PANKAJ TRADERS','C NAWALPUR BASAHI','9919549012');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111480496','MAA LAXMI TRADERS','TARNA BAZAR','9336491627');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111304901','MAHABEER BUILDING MATERIAL','RANASI VILLAGE BAREMA POST RAMESHWA','9451580423');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('218','9111489819','MAA VINDHYAVASINI CONSTRUCTION COMP','CHHITAUNI','8005129304');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('219','9111063700','KAMAKYHA ENTERPRISES','VARANASI','9381904627');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('219','9111311873','KHALIK BUILDING MATERIAL','MAUJA HARPALPUR,LOHTA,VARANASI','9681920376');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('219','9110033101','BIRASAN ENTERPRISES','D-60/103 CHOTTI GAIBI,VARANASI','9415695224');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('220','9111480498','AARADHY BUILDING MATERIAL','BAIRAMPUR DEBATHUA','7398701575');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('220','9110187050','DAYAL TRADERS','GHAMAHAPUR, KUWAR, BASNI ROAD','9919156255');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('220','9111434373','R S CONSTRUCTION AGENCY','PINDRA','9621498060');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('221','9110180027','S K ENTERPRISES','0 N1/66-E-8, NAGWA','9919010488');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('222','9111490758','GAUTAMI STEELS','THASIL PINDRA DHANESHRI','9119117013');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('222','9110208384','MATICOTECH INFRASTRUCTURE PVT LTD','HARAHUAA','8707339385');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('223','9110033198','OM TRADERS','BANSI DHAR KA BAGICHA,SHIVDASPUR,VA','9451582416');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111395954','ADARSH BUILDING MATERIALS','SA 21/21 RUPPANPUR SARNATH','9140323977');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9110033143','AKASH ENTERPRISES','HARHUA','9532323999');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111341619','SHRI LAXMIPATI BALAJEE INTERPRISES','ARZI NO.432,GAURA KALA,JALHUPUR','9196376252');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111396089','SHIV SHAKTI BUILDING MATERIAL','VILLAGE UMARAHA BAZAR POST SARNATH','9415697847');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111393309','SHIVAM BUILDING MATERIAL','PAIGAMBERPUR, PACHKOSI','8858382801');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111450847','PRITAM BUILDING MATERIAL','MATAL DEI, CHAKMATAL DAI','9554387080');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111450845','PURVANCHAL STEEL UDYOG','PARGANA SHIVPUR, DOMANPUR, SARNATH','9984417728');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111395959','NAV DURGA ENTERPRISES','SA 13/46 G-15, KHAJUHI,','8931891116');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111395237','ARVIND CHAUBEY','ASHAPUR SHIVLOK HOSPITAL','8542818283');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111282887','AYUSH ENTERPRISES','BELA ROAD RAMREPUR,VARANASI','');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111395238','KHUSHI ENTERPRISES','VILL CHAUBEYPUR, CHAUBEYPUR','9935343349');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111441930','DILEEP KUMAR JAISWAL','SA 21 13 ASHAPUR SARNATH','9919431264');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111486627','AZEEM BUILDING MATERIAL','PURANAPUL PULKOHANA','8887809966');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111153859','SUNIL BUILDING MATERIAL','CHIRAIGAON','');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111482874','MAA AMBE BUILDING MATERIAL','75 CANT ROAD SUZABAD','9455667799');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111249789','SHRI BALAJI BUILDING MATERIAL','BAIJALPATTI','7524056333');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111437592','RAJNATH BUILDING MATERIALS','46/51, SARAIYA NO 2, CHAUBEPUR, SAR','9598958074');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111393307','MISHRA BUILDING MATERIAL','TILMAPUR ASHAPUR SARNATH','9919000082');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111441929','SATYANANT ENTERPRISES','C 32 7 KASHI VIDYAPITH ROAD','9305521722');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111396088','SENGER BUILDING MATERIAL','POST-JHALUPUR, VILL- JHALUPUR GAURA','9453109024');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111393308','BAJRANG HARDWARE & BUILDING MATERIA','ARAJI NO.256/4, MAWAIYA ASHAPUR','9140772052');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('224','9111441928','SADGURU ENTERPRISES','PRATHMIK VIDYALAY GAURAKALA MARKET','9453365498');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('225','9111471419','PATEL BUILDING MATERIAL','BIRBHANPUR RAJATALAB','9559216698');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('225','9111207346','SONU BUILDING MATERIAL','AWLESHPUR,VARANASI','9681910603');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('225','9111435449','PATEL KHADH BHANDAR','KANERI, GANGAPUR','9936935737');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('225','9110206768','SAHU TRADERS','TARAPUR,TIKARI,NAROTTAMPUR KALA','7905825188');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('226','9110146501','KRISHNA ENTERPRISES','SIGRA,VARANASI','9235600165');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('227','9110033156','SATYA NARAIN CEMENT AGENCY','INFRONT OF LIC & SURABHI,UTSAV,PAHA','9839910609');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('228','9110078716','SAMRAT IRON STORES','CHITAIPUR CROSSING, KANDAWA','9450540237');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('229','9110208385','ANUJ TRADING COMPANY','SALARPUR','8052212829');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('229','9111442997','MAA SANKTHA ENTERPRISES','KANDWA','8887846035');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9110166533','SUMITRA TRADERS','J8/11-A-C-3-, JAITPURA DIGIYA','8318581393');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111393559','PANKAJ JAISWAL','VILL- KAITHI, POST KAITHI','8318584368');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111489791','MAA ANNAPURNA ENTERPRISES','BHU, BHAGWANPUR','9451928424');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111488050','AMAN BUILDING MATERIAL','JAITPURA','8960956294');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111456150','SATISH KUMAR JAISWAL','PHOOLPUR','7307099535');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111375229','RAMESH CHANDRA TRADERS','VILLAGE KARKHAIYAON POST PHOOLPUR','8318584368');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('230','9111451270','DASHARATH KUMAR RAI','MADRVA, CHHITTUPUR','9005315333');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('231','9111480449','OM SAKSHI TRADERS','RAMNA','8808053595');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('231','9110221017','AMAR CONSTRUCTIONS AND SUPPLIER','RAMNAGAR ROAD BHAGWANPUR','9336835074');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('231','9111463830','A P BUILDING MATERIALS','BHAGWANPUR , BHU, LANKA','8354811426');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('231','9111489817','DHEER ENTERPRISES','SUDDHIPUR SHIVPUR','7617071031');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('232','9110203758','KRV ENTERPRISES','0, ANEI, RAIPUR','9717082620');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('233','9110068757','SUNDER CEMENT AGENCY','PANCHKROSHI ROAD','9935341411');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('234','9110093690','SAI CEMENT AGENCY','SA 15/138 SG MAVAIYA SARNATH VARANA','9453203994');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('235','9110033157','ROSHAN CEMENT AGENCY','D-58/5,MEHMOORGANJ ROAD,(NEAR LAXMI','9415304457');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('236','9110228028','SRI MAHADEV ENTERPRISES','SEER GOVARDHANPUR','8574508918');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9110162175','VIJAY SHANKAR CONSTRUCTION','NARPATPUR,DUBKIYA,VARANASI-221004','9935262692');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111396267','OM PRAKASH','VILL- AILY POST TIWARIPUR','9580434705');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111367520','KHUSHBOO BUILDING MATERIAL','PANIHARI, CHAUBEYPUR','9889355813');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111475713','MAYA MISHRA','LOHTA','9279743843');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111392094','AVI BUILDING MATERIAL','GOITHAHAN SARNATH','9519299299');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111367519','NEW MAA SHITLA BUILDING MATERIAL','PAHARIYA, NARAYANPUR','9415268223');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111382006','AMAN BUILDING MATERIAL','SA 7/48-A-3-K, BENIPUR SARNATH','8303340281');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111448528','OM TRADERS','FARIDPUR,SARNATH','9551545004');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111409381','RIDDHI SIDDHI TRADING','ASHAPUR','7084665449');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111369360','BABA BAIJNATH ENTERPRISES','RUSTHAMPUR, ASHAPUR','7800629334');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111434374','KEDAR BUILDING MATERIAL','IMLIYA, SARAIYA NO.1, CHOLAPUR','9044640200');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111404209','KRISHNA BUILDING MATERIAL','RAMNA JHALUPUR','6386834191');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111448487','KIRAN BUILDING MATERIAL','HANUMANGANJ, CHAMRAHA','9415223560');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111367522','NITISH YADAV','NARATPAUR,CHITAIPUR','9415237718');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111457767','SHIV SHAKTI ASSOCIATE','PAHARIA','9555452150');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('237','9111373717','TARA DEVI','CHIRAIGAON, NARAYANPUR','9118363046');
insert into odts.dealer_party_master (dealer_id, party_code, party_company_name, party_address, party_phone) values ('238','9110235599','ROYAL TRADERS','BHORA TALAB LOHTA BAZAR','8318617656');
—-
--
INSERT INTO odts.user_master (
  user_login_name,
  user_name,
  user_email,
  user_phone,
  password_hash,
  user_role_id,
  user_is_active_flag,
  user_is_locked_flag,
  created_by,
  updated_by
) VALUES (
  'warehouse',
  'Warehouse Manager',
  'xx@gmail.com',
  '9993399999',
  public.crypt('warehouse123', public.gen_salt('bf')),
  (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'STOCK_MANAGER'),
  true,
  false,
  0,
  0);
--
INSERT INTO odts.user_master (
  user_login_name,
  user_name,
  user_email,
  user_phone,
  password_hash,
  user_role_id,
  user_is_active_flag,
  user_is_locked_flag,
  created_by,
  updated_by
) VALUES (
  'admin',
  'Admin',
   NULL,
  '9993359999',
  public.crypt('admin123', public.gen_salt('bf')),
  (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'ADMIN'),
  true,
  false,
  0,
  0);
--
--
INSERT INTO odts.user_master (        
    user_role_id,       
    dealer_id,  
    user_name,      
    user_login_name,        
    password_hash,  
    user_phone,         
    user_email      
)       
SELECT      
    ur.role_id,     
    d.dealer_id,    
    d.dealer_name,      
    CASE        
        WHEN rn BETWEEN 1 AND 20 THEN 'alpha' || rn     
        WHEN rn BETWEEN 21 AND 40 THEN 'beta' || rn     
        WHEN rn BETWEEN 41 AND 60 THEN 'gamma' || rn        
        WHEN rn BETWEEN 61 AND 80 THEN 'delta' || rn
    END,        
    public.crypt( CASE  
        WHEN rn BETWEEN 1 AND 20 THEN 'alpha' || rn     
        WHEN rn BETWEEN 21 AND 40 THEN 'beta' || rn     
        WHEN rn BETWEEN 41 AND 60 THEN 'gamma' || rn        
        WHEN rn BETWEEN 61 AND 80 THEN 'delta' || rn
    END, public.gen_salt('bf')),        
    d.dealer_phone,     
    d.dealer_email  
FROM (      
    SELECT      
        d.*,        
        ROW_NUMBER() OVER (ORDER BY d.dealer_id) AS rn      
    FROM odts.dealer_master d     
) d     
JOIN odts.user_roles_master ur         
    ON ur.role_name = 'DEALER';     
—

INSERT INTO odts.user_master (
user_role_id,
dealer_id,
user_name,
user_login_name,
password_hash,
user_phone,
user_email
)
values (0, null, 'system', 'system', public.crypt('system123', public.gen_salt('bf')), NULL, NULL);
--
INSERT INTO odts.whatsapp_message_templates (template_name, message_body, created_by) VALUES
('Order Confirmation', 'Hi {{dealer_name}}, your order has been confirmed. Your Dealer Code: {{dealer_code}}. We will contact you shortly with dispatch details.', 0),
('Dispatch Alert', 'Hi {{dealer_name}}, your order is on its way! Driver will reach soon. Contact: {{dealer_phone}}', 0),
('Delivery Complete', 'Hi {{dealer_name}}, your order has been successfully delivered. Thank you for your business!', 0),
('Follow-up', 'Hi {{dealer_name}}, we hope you received your order. Please let us know if you have any questions.', 0);