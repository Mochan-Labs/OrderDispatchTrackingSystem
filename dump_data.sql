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
('ADMIN', 'Administrator');
--
--INSERT INTO odts.user_roles_master (role_name) VALUES ('STOCK_MANAGER') ON CONFLICT DO NOTHING;
--
-- Data for product_master table
--
insert into odts.product_master ( product_name, product_desc, product_is_active_flag) 
values
  ( 'GOLD', 'Premium grade product', true),
  ( 'POWER PLUS', 'High performance  ', true),
  ( 'CONCRETE PLUS', 'Standard product', true);
--
-- Data for code reference table
--
INSERT INTO odts.code_reference (code_type, code_label, code, code_desc, code_sort_order)
VALUES
  ('system_config',     'Admin Phone Number',        'admin_phone',  '+917042656633', 1)
--
--for loading type
--
INSERT INTO odts.code_reference (code_type, code_label, code, code_desc, code_sort_order)
VALUES
  ('loading_type',     NULL,        'SLF_DOT',  'Self DOT (Dealer own truck)',  1 ),
  ('loading_type',     NULL,        'CMP_TRN',  'Company Transport',            2 );
 
--
INSERT INTO odts.warehouse_master (warehouse_type, warehouse_ui_label, warehouse_code, warehouse_name, warehouse_ui_order)
VALUES
   ('loading_location', 'RAKE',      'RAK_CHA',  'Rake (Chaukhadi)',            1 ),
  ('loading_location', 'RAKE',      'RAK_SHI',  'Rake (Shivpur)',               2 ),
  ('loading_location', 'WAREHOUSE', 'WH_TAR',   'Warehouse (Tarna)',            3 ),
  ('loading_location', 'WAREHOUSE', 'WH_GOE',   'Warehouse (Goenka)',           4 ),
  ('loading_location', 'WAREHOUSE', 'WH_BHU',   'Warehouse (Bhupur)',           5 ),
  ('loading_location', 'WAREHOUSE', 'WH_DAF',   'Warehouse (Dafi)',             6 ),
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
--
--
INSERT INTO odts.dealer_party_master
(party_code, dealer_id, party_name, party_company_name, party_phone, party_email, party_address, party_is_active_flag, created_at, created_by, updated_at, updated_by)
VALUES
('9110032672', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110032672' LIMIT 1), NULL, 'ADESH TRADERS', '9415221317', NULL, 'KACHHWA ROAD,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111066282', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110032672' LIMIT 1), NULL, 'NARAIN CEMENT AGENCY', '9981910743', NULL, 'KOTHAWA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111344015', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110032672' LIMIT 1), NULL, 'A.K.BROTHERS', '9795683731', NULL, 'THATHARA,KACHWA ROAD', TRUE, NOW(), 0, NOW(), 0),
('9110033101', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033101' LIMIT 1), NULL, 'BIRASAN ENTERPRISES', '9415695224', NULL, 'D-60/103 CHOTTI GAIBI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111063700', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033101' LIMIT 1), NULL, 'KAMAKYHA ENTERPRISES', '9381904627', NULL, 'VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111311873', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033101' LIMIT 1), NULL, 'KHALIK BUILDING MATERIAL', '9681920376', NULL, 'MAUJA HARPALPUR,LOHTA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9110033143', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'AKASH ENTERPRISES', '9532323999', NULL, 'HARHUA', TRUE, NOW(), 0, NOW(), 0),
('9111153859', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SUNIL BUILDING MATERIAL', NULL, NULL, 'CHIRAIGAON', TRUE, NOW(), 0, NOW(), 0),
('9111249789', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SHRI BALAJI BUILDING MATERIAL', '7524056333', NULL, 'BAIJALPATTI', TRUE, NOW(), 0, NOW(), 0),
('9111282887', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'AYUSH ENTERPRISES', NULL, NULL, 'BELA ROAD RAMREPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111341619', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SHRI LAXMIPATI BALAJEE INTERPRISES', '9196376252', NULL, 'ARZI NO.432,GAURA KALA,JALHUPUR', TRUE, NOW(), 0, NOW(), 0),
('9111393307', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'MISHRA BUILDING MATERIAL', '9919000082', NULL, 'TILMAPUR ASHAPUR SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111393308', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'BAJRANG HARDWARE & BUILDING MATERIA', '9140772052', NULL, 'ARAJI NO.256/4, MAWAIYA ASHAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111393309', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SHIVAM BUILDING MATERIAL', '8858382801', NULL, 'PAIGAMBERPUR, PACHKOSI', TRUE, NOW(), 0, NOW(), 0),
('9111395237', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'ARVIND CHAUBEY', '8542818283', NULL, 'ASHAPUR SHIVLOK HOSPITAL', TRUE, NOW(), 0, NOW(), 0),
('9111395238', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'KHUSHI ENTERPRISES', '9935343349', NULL, 'VILL CHAUBEYPUR, CHAUBEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9111395954', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'ADARSH BUILDING MATERIALS', '9140323977', NULL, 'SA 21/21 RUPPANPUR SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111395959', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'NAV DURGA ENTERPRISES', '8931891116', NULL, 'SA 13/46 G-15, KHAJUHI,', TRUE, NOW(), 0, NOW(), 0),
('9111396088', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SENGER BUILDING MATERIAL', '9453109024', NULL, 'POST-JHALUPUR, VILL- JHALUPUR GAURA', TRUE, NOW(), 0, NOW(), 0),
('9111396089', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SHIV SHAKTI BUILDING MATERIAL', '9415697847', NULL, 'VILLAGE UMARAHA BAZAR POST SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111437592', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'RAJNATH BUILDING MATERIALS', '9598958074', NULL, '46/51, SARAIYA NO 2, CHAUBEPUR, SAR', TRUE, NOW(), 0, NOW(), 0),
('9111441928', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SADGURU ENTERPRISES', '9453365498', NULL, 'PRATHMIK VIDYALAY GAURAKALA MARKET', TRUE, NOW(), 0, NOW(), 0),
('9111441929', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'SATYANANT ENTERPRISES', '9305521722', NULL, 'C 32 7 KASHI VIDYAPITH ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111441930', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'DILEEP KUMAR JAISWAL', '9919431264', NULL, 'SA 21 13 ASHAPUR SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111450845', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'PURVANCHAL STEEL UDYOG', '9984417728', NULL, 'PARGANA SHIVPUR, DOMANPUR, SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111450847', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'PRITAM BUILDING MATERIAL', '9554387080', NULL, 'MATAL DEI, CHAKMATAL DAI', TRUE, NOW(), 0, NOW(), 0),
('9111482874', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'MAA AMBE BUILDING MATERIAL', '9455667799', NULL, '75 CANT ROAD SUZABAD', TRUE, NOW(), 0, NOW(), 0),
('9111486627', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033143' LIMIT 1), NULL, 'AZEEM BUILDING MATERIAL', '8887809966', NULL, 'PURANAPUL PULKOHANA', TRUE, NOW(), 0, NOW(), 0),
('9110033145', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'VISHWANATH PRASAD SATYA CHARAN', '6387763207', NULL, 'BARAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111061058', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'DIXIT BUILDING MATERIAL', '9452064067', NULL, 'CHILBILA', TRUE, NOW(), 0, NOW(), 0),
('9111061087', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'AGRAHARI BUILDING MATERIAL', '9935957562', NULL, 'JALALPUR', TRUE, NOW(), 0, NOW(), 0),
('9111062034', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'RAMJI BUILDING MATERIAL', '9450249830', NULL, 'NAYEPUR', TRUE, NOW(), 0, NOW(), 0),
('9111062067', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'ALAKH NARAIN SINGH', '8471031883', NULL, 'SADHOGANJ', TRUE, NOW(), 0, NOW(), 0),
('9111066192', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'RADHESHYAM GUPTA CEMENT STOCKIST', '8574391948', NULL, 'BADAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111066202', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHIVAM ENTERPRISES', '7081876746', NULL, 'CHANDMARI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111066255', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PRATAP BUILDERS AND HARDWARE', '7499979620', NULL, 'SHIVPUR BYPASS', TRUE, NOW(), 0, NOW(), 0),
('9111066263', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'DIGVIJAY CEMENT AGENCY', '9956430991', NULL, 'VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111147165', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'RATAN LAL BUILDING MATERIAL', '9451269148', NULL, 'SINDHORA, PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111149750', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GAURAV BUILDING MATERIAL', '9451580423', NULL, 'PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111152711', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'BABA BUILDING MATERIAL', '9415683451', NULL, 'POLICE LINE VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111198403', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'STAR STEEL', '9781910409', NULL, 'CHHITAUNI VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111203466', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SRI RADHESHYAM BUILDING MATERIAL', '9198943416', NULL, 'RAJPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111225822', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SANJAY BUILDING MATERIALS', '9628443027', NULL, 'VARANASI DEHAT', TRUE, NOW(), 0, NOW(), 0),
('9111287417', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'JAI BAJRANG CEMENT AGENCY', '9981904021', NULL, 'KOIRIPUR,BARAGAON,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111304442', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'AZAD BUILDING MATERIAL', '9336943504', NULL, 'ARANASI S-2/240-C-1 PANDEYPUR,SHIVN', TRUE, NOW(), 0, NOW(), 0),
('9111304866', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'HARDIK HARDWERE AND BUILDING MAT', '9452037771', NULL, 'BABUA PUR KASAWAR RAJA RAJA', TRUE, NOW(), 0, NOW(), 0),
('9111304871', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SAMRAT BUILDING MATERIAL', '9005699657', NULL, 'VILL AND POST SINDHORA ,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111304895', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PANKAJ TRADERS', '9919549012', NULL, 'C NAWALPUR BASAHI', TRUE, NOW(), 0, NOW(), 0),
('9111304897', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GAUTAM CEMENT AGENCIE', '7905813795', NULL, 'ASI 15/50 C 7 R BHARLAI SHIVPUR,VAR', TRUE, NOW(), 0, NOW(), 0),
('9111304901', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAHABEER BUILDING MATERIAL', '9451580423', NULL, 'RANASI VILLAGE BAREMA POST RAMESHWA', TRUE, NOW(), 0, NOW(), 0),
('9111304903', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GOVIND BUILDING MATERIAL', '8299711712', NULL, 'KAJISARAI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111304904', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'AMIT TRADERS', '9984509595', NULL, 'SH-15/47K BHARLAI SHIVPUR,VARANS', TRUE, NOW(), 0, NOW(), 0),
('9111304906', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GIRDHARI ENTERPRISES', '9181905538', NULL, 'HIVPUR, SH 16/21 ARAZI NO.147/2 KAD', TRUE, NOW(), 0, NOW(), 0),
('9111328432', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PATEL BUILDING MATERIAL', '9807643629', NULL, 'JANSA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111328483', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHRI KRISHNA BUILDING MATERIAL', '9452071773', NULL, 'OPPOSITE,KGSG BANK,JANSA', TRUE, NOW(), 0, NOW(), 0),
('9111329098', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'YADAV BUILDING MATERIAL', '9044717941', NULL, 'PHOOLPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111329304', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SANDEEP BUILDING MATERIAL', '9555335157', NULL, 'BELA ROAD,ARAZI 59/1,OM NAGAR', TRUE, NOW(), 0, NOW(), 0),
('9111332381', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'JAI MAA SHARDA STEELS', '9721272837', NULL, '8/29,PANCHKOSHI ROAD,SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9111340292', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PATEL ENTERPRISES', '7379123126', NULL, 'SAMOGARA,PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9111340688', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'HEMANT BUILDING MATERIAL', '9170209594', NULL, 'RAMSINGHPUR,HARAHUA', TRUE, NOW(), 0, NOW(), 0),
('9111342165', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PRADHAN BUILDING MATERIAL', '9451268426', NULL, 'VILL-KHARAWAN,SADOGANJ', TRUE, NOW(), 0, NOW(), 0),
('9111346195', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAA VIDYAVATI ENTERPRISES & SONS', '9695964276', NULL, 'BABATPUR,HARHUA ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111358887', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'PRINCE BUILDING MATERIAL', '9838240758', NULL, 'NARAYANPUR,KATAUNA', TRUE, NOW(), 0, NOW(), 0),
('9111360310', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHRI KESHARI BUILDING MATERIALS', '6387674260', NULL, 'BHULLANPUR,PAC VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111383616', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHIVAM ENTERPRISES', '9839936071', NULL, 'BARAWAN KATAUNA', TRUE, NOW(), 0, NOW(), 0),
('9111384024', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'TIRUPATI CONSTRUCTION COMPANY', '8299336717', NULL, 'PLOT NO.C-36, V.D.A COLONY,', TRUE, NOW(), 0, NOW(), 0),
('9111388200', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'VIJAY CONSTRUCTION AND SUPPLY WORKS', '9956960232', NULL, 'BHIKHARIPUR,RAJATALAB,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111390453', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAA INDRAWATI BUILDING MATERIAL', '8090589311', NULL, '0, KARKHIYAON, PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111392095', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'HARI OM BUILDING MATERIAL', '9453898144', NULL, 'GANGAPUR, CHAURAHA MANGARI', TRUE, NOW(), 0, NOW(), 0),
('9111394845', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'JANTA BUILDING MATERIAL', '9653074027', NULL, 'KATHIRAON', TRUE, NOW(), 0, NOW(), 0),
('9111395235', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'CHAURASIYA FERTILIZER', '9451440447', NULL, '0, DEIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111397839', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAA DURGA ENTERPRISES', '7859875775', NULL, 'SINDHORA, MAGHAWAN', TRUE, NOW(), 0, NOW(), 0),
('9111405853', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHREE BUILDING MATERIAL', '8299688095', NULL, 'AUDHE, VISHOKHAR, BACCHAON', TRUE, NOW(), 0, NOW(), 0),
('9111414555', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GUPTA BUILDING MATERIAL', '7652031220', NULL, 'KUNWAR BAZAR BARAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111437589', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'KUSH BUILDING MATERIAL', '9026511082', NULL, 'RAMDUTPUR, PANDEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9111439453', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'BHAVANI ENTERPRISES', '8328481678', NULL, 'PHULPUR ROAD, PINDRA PHATEHPUR KATA SINDHORA', TRUE, NOW(), 0, NOW(), 0),
('9111443376', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHREE RAM CEMENT AGENCY', '9125833244', NULL, 'N6 2 B 125 INDIRA NAGAR CHITAIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111443377', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SATYA ENTERPRISES', '8960297067', NULL, 'KOERIPUR BARAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111445760', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'ANKIT TRADERS', '8318585861', NULL, 'KASWAR RAJA,KACHHWA ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111447980', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'JBS TRADING COMPANY', '8090350556', NULL, 'MIRANPUR BASAHI', TRUE, NOW(), 0, NOW(), 0),
('9111449027', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'TIRUPATI BUILDING MATERIAL', '9956033027', NULL, 'CHILBILA KUNDI', TRUE, NOW(), 0, NOW(), 0),
('9111451895', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SARASWATI BUILDING MATERIAL', '9415245002', NULL, 'BHU, SEERGOVARDHANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111454465', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'GANGA BUILDING MATERIALS', '9935351231', NULL, 'SH 8/82, SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9111457192', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'DEEP SHIKHA BUILDING MATERIAL', '6307538996', NULL, 'KARDHANA MIRZAMURAD', TRUE, NOW(), 0, NOW(), 0),
('9111457222', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'CHANDAN BUILDING MATERIAL', '8808466433', NULL, 'SH 2 635B CENTRAL JAILROAD SIKRAUL', TRUE, NOW(), 0, NOW(), 0),
('9111464767', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SWASTIK ENTERPRISES', '7007829805', NULL, 'S 2 247 1 K URMILA KATRA BHOJUBIR', TRUE, NOW(), 0, NOW(), 0),
('9111468256', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHREE PARAMHANS BUILDING MATERIAL', '9415981566', NULL, 'PANDITPUR KASHIPUR KACHNAR', TRUE, NOW(), 0, NOW(), 0),
('9111468257', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHREYANS BUILDING MATERIALS', '9415617356', NULL, 'BANDEPUR', TRUE, NOW(), 0, NOW(), 0),
('9111469057', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SHIV SHAKTI PRINCE BUILDING', '8574746211', NULL, 'JALALPUR NAWALPUR JANSA', TRUE, NOW(), 0, NOW(), 0),
('9111470081', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'BABA JI BUILDING MATERIALS', '9731110159', NULL, 'BHATAULI NAIPURA HATHIBAZAR', TRUE, NOW(), 0, NOW(), 0),
('9111470082', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'D K PRADHAN BUILDING MATERIAL', '8009866485', NULL, 'GAJOKHAR DEVJI, PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9111480494', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'VIDYARAJ TRADERS', '7800677894', NULL, 'KHEWASIPUR KORAUTA VILLAGE ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111480495', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'SURENDRA KUMAR JAISWAL', '8009667706', NULL, 'KOIRIPUR BARAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111480496', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAA LAXMI TRADERS', '9336491627', NULL, 'TARNA BAZAR', TRUE, NOW(), 0, NOW(), 0),
('9111488048', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'ALOK BUILDING MATERIALS', '9984369716', NULL, 'RASOOLGARH SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111488056', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'RAJ ENTERPRISES', '7905736592', NULL, 'SINGHPUR SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111489819', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033145' LIMIT 1), NULL, 'MAA VINDHYAVASINI CONSTRUCTION COMP', '8005129304', NULL, 'CHHITAUNI', TRUE, NOW(), 0, NOW(), 0),
('9110033156', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033156' LIMIT 1), NULL, 'SATYA NARAIN CEMENT AGENCY', '9839910609', NULL, 'INFRONT OF LIC & SURABHI,UTSAV,PAHA', TRUE, NOW(), 0, NOW(), 0),
('9110033157', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033157' LIMIT 1), NULL, 'ROSHAN CEMENT AGENCY', '9415304457', NULL, 'D-58/5,MEHMOORGANJ ROAD,(NEAR LAXMI', TRUE, NOW(), 0, NOW(), 0),
('9110033198', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033198' LIMIT 1), NULL, 'OM TRADERS', '9451582416', NULL, 'BANSI DHAR KA BAGICHA,SHIVDASPUR,VA', TRUE, NOW(), 0, NOW(), 0),
('9110033203', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033203' LIMIT 1), NULL, 'ANJALI ENTERPRISES', '9415336241', NULL, 'VISHWAKARMA NAGAR,KANDWA,CHITAIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111348632', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033203' LIMIT 1), NULL, 'SHYAM LAL JINDAL', '9481905235', NULL, 'MANANV NAGAR,BADAGAON', TRUE, NOW(), 0, NOW(), 0),
('9111394841', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033203' LIMIT 1), NULL, 'VERMA LIME STORE', '9415353464', NULL, 'N 9/33 BADIPATIYA', TRUE, NOW(), 0, NOW(), 0),
('9110033205', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033205' LIMIT 1), NULL, 'SHIVA CEMENT AGENCY', '9450711701', NULL, 'SH-3/1-A/C (KHA),NAWALPUR,BASAIN', TRUE, NOW(), 0, NOW(), 0),
('9110033207', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'SHIVAM CEMENT AGENCY', '9415446150', NULL, 'BHAGWATIPUR CHAURAHA,TIKRI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111063755', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'ANAND BUILDING MATERIAL', '9452566838', NULL, 'MUDADEH', TRUE, NOW(), 0, NOW(), 0),
('9111063797', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'PUJA BUILDING MATERIAL', '9681911975', NULL, 'PARUSHURAMPUR', TRUE, NOW(), 0, NOW(), 0),
('9111066207', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'NEW PATEL CEMENT SALES', '9026625987', NULL, 'CHETAIPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111066230', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'RAJ BUILDING MATERIAL', '9181903605', NULL, 'KHANAO 9881911856', TRUE, NOW(), 0, NOW(), 0),
('9111154857', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'RAJENDER CEMENT AGENCY.', '9281913670', NULL, 'CHITAIPUR 9281913670', TRUE, NOW(), 0, NOW(), 0),
('9111304910', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'VIKAS CEMENT AGENCIES', '9781916364', NULL, 'ADITYANAGAR SUSWAHI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111304913', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'SWASHTIK BUILDING M.', '9936999357', NULL, 'AFHY BY VILLAGE NUWAVAN NARAYANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111315471', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'PAL BUILDING MATERIAL', '8931893802', NULL, 'ASI AWLESHPUR KANDAWA CHITAIPUR VAR', TRUE, NOW(), 0, NOW(), 0),
('9111330948', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'AARAV ENTERPRISES', '7843832315', NULL, 'BACHCHHAWON,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111364351', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'AVANISH CEMENT AGENCY', '9450868971', NULL, 'KAMLEH PURA BARIYA,BARKI UP', TRUE, NOW(), 0, NOW(), 0),
('9111416890', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'RAKSHAK BUILDING MATERIALS', '9936607091', NULL, 'JAKKHINI', TRUE, NOW(), 0, NOW(), 0),
('9111435451', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'PATEL BUILDING MATERIAL', '9795195458', NULL, 'GHAMAHAPUR, KASHIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111442994', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'NILKANTH BUILDING MATERIAL', '7275617776', NULL, 'SUSHWAHI', TRUE, NOW(), 0, NOW(), 0),
('9111462090', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'RAJBALI BUILDING MATERIAL', '8737802373', NULL, 'MURADEV TIKARI', TRUE, NOW(), 0, NOW(), 0),
('9111463014', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'ADARSH BUILDING MATERIAL', '8840401649', NULL, 'KHANAW BACHCHAW', TRUE, NOW(), 0, NOW(), 0),
('9111464761', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'A K ENTERPRISES', '9415949444', NULL, 'CHHITAUNI, SOOLTANKESHWAR ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111470083', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'OM SAI ENTERPRISES', '8318414484', NULL, 'BACHHAON KHANWA', TRUE, NOW(), 0, NOW(), 0),
('9111478154', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033207' LIMIT 1), NULL, 'ANNAPURNA ENTERPRISES', '7080206252', NULL, 'CHUNAR ROAD BACHCHHAON', TRUE, NOW(), 0, NOW(), 0),
('9110033210', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033210' LIMIT 1), NULL, 'R K BUILDING MATERIAL', '9415343325', NULL, 'AULESHPUR,KANDWA', TRUE, NOW(), 0, NOW(), 0),
('9110033213', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110033213' LIMIT 1), NULL, 'SHREE RAM IRON STORES', '9415447483', NULL, '17/138 PAHADIA CHAURAHA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9110045030', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110045030' LIMIT 1), NULL, 'KRIPA SHANKAR SINGH', '9415300220', NULL, 'Kachmar, Raja Talab', TRUE, NOW(), 0, NOW(), 0),
('9110046614', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'PURWAR CEMENT BHANDAR', '9415305394', NULL, 'Senpura Bagh, Kaniyadal', TRUE, NOW(), 0, NOW(), 0),
('9111150321', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'JAISWAL CEMENT STORE', '9781900764', NULL, 'MACHCHODRI,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111150322', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'SHASHANK CEMENT AGENCEY', '9415305394', NULL, 'POLICE LINE, VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111169452', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'PUJA CEMENT AGENCY', '7800511116', NULL, 'DAULAPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111169457', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'JP BUILDERS', '9981909216', NULL, 'GHAMRAHA', TRUE, NOW(), 0, NOW(), 0),
('9111169467', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'JAI PRAKASH SINGH', '9415353504', NULL, 'HARHUA', TRUE, NOW(), 0, NOW(), 0),
('9111367092', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110046614' LIMIT 1), NULL, 'ADITYA RAJ JAISWAL', '9415305397', NULL, 'A-39/289, LAAH SARAIYA, SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9110068757', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110068757' LIMIT 1), NULL, 'SUNDER CEMENT AGENCY', '9935341411', NULL, 'PANCHKROSHI ROAD', TRUE, NOW(), 0, NOW(), 0),
('9110070000', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110070000' LIMIT 1), NULL, 'RAJARAM OMPRAKASH IRON STORE', '9956585951', NULL, 'S 9 78 1K PANDEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9110078716', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110078716' LIMIT 1), NULL, 'SAMRAT IRON STORES', '9450540237', NULL, 'CHITAIPUR CROSSING, KANDAWA', TRUE, NOW(), 0, NOW(), 0),
('9110092656', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110092656' LIMIT 1), NULL, 'MALTI BUILDING MATERIAL', '9839519855', NULL, 'SATYAM NAGAR COLONY, NEAR GARDENIA', TRUE, NOW(), 0, NOW(), 0),
('9110092659', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110092659' LIMIT 1), NULL, 'BHOLE NATH ENTERPRISES', '9454231797', NULL, 'HAIDRABAD GATE,NASIRPUR ROAD,', TRUE, NOW(), 0, NOW(), 0),
('9110093690', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110093690' LIMIT 1), NULL, 'SAI CEMENT AGENCY', '9453203994', NULL, 'SA 15/138 SG MAVAIYA SARNATH VARANA', TRUE, NOW(), 0, NOW(), 0),
('9110097794', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110097794' LIMIT 1), NULL, 'AJAY PAINT AND HARDWARE STORES', '9450872462', NULL, 'J 15/65, E-5 GT ROAD, CHAUKAGHAT', TRUE, NOW(), 0, NOW(), 0),
('9110117683', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'AKK TRADERS', '6392475879', NULL, 'C-33/52 17 INDRA NAGAR CHITUPUR SIG', TRUE, NOW(), 0, NOW(), 0),
('9111356849', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'SHUBHI BUILDING MATERIAL', '8858521144', NULL, 'C33/188 L CHANDUA CHITTUPUR,SIGRA', TRUE, NOW(), 0, NOW(), 0),
('9111367518', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'NASEER KHAN', '6386913676', NULL, 'SINDHORIYA POKHRI,SHIVDASPUR', TRUE, NOW(), 0, NOW(), 0),
('9111369361', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'SHYAMA ENTERPRISES', '8318295800', NULL, 'KASWAR RAJATALAB VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111372887', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'BHARAT ENTERPRISES', '9198434344', NULL, 'KACHWA BAZAR', TRUE, NOW(), 0, NOW(), 0),
('9111388702', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'KHAN BUILDING MATERIAL', '7007213779', NULL, 'TELIYANA BAJARDIHA', TRUE, NOW(), 0, NOW(), 0),
('9111388703', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'KHAN AND SONS', '8004766138', NULL, 'MIRZAMURAD RAJATALAB', TRUE, NOW(), 0, NOW(), 0),
('9111389988', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'VARANASI CONCRETE', '7408289334', NULL, 'MIRZAMURAD', TRUE, NOW(), 0, NOW(), 0),
('9111396158', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'AMBA TRADERS', '9450785447', NULL, 'RAJWARI', TRUE, NOW(), 0, NOW(), 0),
('9111439952', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'OM BUILDING MATERIAL', '9621262184', NULL, 'KACHHAWA ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111470298', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'AVANI BUILDING MATERIAL', '8960508003', NULL, 'AKHARI KURAHUNA', TRUE, NOW(), 0, NOW(), 0),
('9111472814', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'CHIRANJEEVI CONSTRUCTION', '9118404744', NULL, 'NAWALPUR ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111490755', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110117683' LIMIT 1), NULL, 'S K ENTERPRISES', '8707318001', NULL, 'KANDAWA VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9110130915', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110130915' LIMIT 1), NULL, 'MAHARAJ JI BUILDING MATERIAL', '9839903666', NULL, 'N8/251-A-2-S,NEWADA,NEAR PATEL STEE', TRUE, NOW(), 0, NOW(), 0),
('9110131504', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'DEVARSHI ENTERPRISES', '7754994433', NULL, 'J 13/93 A-14 K-4, COTTON MILL, CHOW', TRUE, NOW(), 0, NOW(), 0),
('9111066186', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'CHANDEL ENTERPRISES', '9781903951', NULL, 'AULESHPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111205007', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'S KUMAR BUILDING MATERIAL', '9381909978', NULL, 'KERAKETPUR, LOHATA', TRUE, NOW(), 0, NOW(), 0),
('9111299352', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'POORNIMA ENTERPRISES', '9381906777', NULL, 'CHANDPUR LOHATA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111330368', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'VERMA CEMENT AGENCY', '9415353464', NULL, 'JALALIPATTI,BHULLANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111392099', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'GAURAV TRADERS', '9415225461', NULL, 'PINDRA BAJAR', TRUE, NOW(), 0, NOW(), 0),
('9111408192', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'OM ENTERPRISES', '9984438125', NULL, 'SHOP NO 01&04, NARAYANPUR, DAFFI', TRUE, NOW(), 0, NOW(), 0),
('9111432362', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'VIBHA ENTERPRISES', '9335856164', NULL, 'BACCHAON', TRUE, NOW(), 0, NOW(), 0),
('9111447527', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110131504' LIMIT 1), NULL, 'HARSHIT ENTERPRISES', '7007460676', NULL, 'KESHARIPUR, LOHTA', TRUE, NOW(), 0, NOW(), 0),
('9110144134', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110144134' LIMIT 1), NULL, 'G S TRADERS', '9415696821', NULL, 'PANDEY HAVELI, SONARPURA', TRUE, NOW(), 0, NOW(), 0),
('9111400344', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110144134' LIMIT 1), NULL, 'ABRAR KHAN', '9415987473', NULL, 'N 12/214-K-1, BAZARDIHA,', TRUE, NOW(), 0, NOW(), 0),
('9111413749', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110144134' LIMIT 1), NULL, 'ABHAY YADAV', '7052083218', NULL, 'B 13/94, KALI BADI,SONARPURA', TRUE, NOW(), 0, NOW(), 0),
('9110145353', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110145353' LIMIT 1), NULL, 'VINAY BUILDING MATERIALS', '9450012613', NULL, 'SA-5/159-E-3,RAMAREPUR,PAHARIYA', TRUE, NOW(), 0, NOW(), 0),
('9110146501', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110146501' LIMIT 1), NULL, 'KRISHNA ENTERPRISES', '9235600165', NULL, 'SIGRA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9110159541', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110159541' LIMIT 1), NULL, 'SHREE BALAJI ENTERPRISES', '9336182012', NULL, 'N 812/2, MADARWA, LANKA,CHHITTUPUR', TRUE, NOW(), 0, NOW(), 0),
('9111371492', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110159541' LIMIT 1), NULL, 'SRI JAGDAMBA CEMENT STORE', '9336182012', NULL, 'B 30/2-A-5,GANGABAGH COLONY,LANKA', TRUE, NOW(), 0, NOW(), 0),
('9111413909', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110159541' LIMIT 1), NULL, 'PANKAJ KUMAR', '8052325181', NULL, 'B 30/2 A-5 LANKA', TRUE, NOW(), 0, NOW(), 0),
('9111449234', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110159541' LIMIT 1), NULL, 'PRADEEP KUMAR', '9336182012', NULL, 'SAKALDIHA', TRUE, NOW(), 0, NOW(), 0),
('9110162175', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'VIJAY SHANKAR CONSTRUCTION', '9935262692', NULL, 'NARPATPUR,DUBKIYA,VARANASI-221004', TRUE, NOW(), 0, NOW(), 0),
('9111367519', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'NEW MAA SHITLA BUILDING MATERIAL', '9415268223', NULL, 'PAHARIYA, NARAYANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111367520', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'KHUSHBOO BUILDING MATERIAL', '9889355813', NULL, 'PANIHARI, CHAUBEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9111367522', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'NITISH YADAV', '9415237718', NULL, 'NARATPAUR,CHITAIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111369360', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'BABA BAIJNATH ENTERPRISES', '7800629334', NULL, 'RUSTHAMPUR, ASHAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111373717', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'TARA DEVI', '9118363046', NULL, 'CHIRAIGAON, NARAYANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111382006', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'AMAN BUILDING MATERIAL', '8303340281', NULL, 'SA 7/48-A-3-K, BENIPUR SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111392094', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'AVI BUILDING MATERIAL', '9519299299', NULL, 'GOITHAHAN SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111396267', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'OM PRAKASH', '9580434705', NULL, 'VILL- AILY POST TIWARIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111404209', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'KRISHNA BUILDING MATERIAL', '6386834191', NULL, 'RAMNA JHALUPUR', TRUE, NOW(), 0, NOW(), 0),
('9111409381', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'RIDDHI SIDDHI TRADING', '7084665449', NULL, 'ASHAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111434374', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'KEDAR BUILDING MATERIAL', '9044640200', NULL, 'IMLIYA, SARAIYA NO.1, CHOLAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111448487', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'KIRAN BUILDING MATERIAL', '9415223560', NULL, 'HANUMANGANJ, CHAMRAHA', TRUE, NOW(), 0, NOW(), 0),
('9111448528', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'OM TRADERS', '9551545004', NULL, 'FARIDPUR,SARNATH', TRUE, NOW(), 0, NOW(), 0),
('9111457767', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'SHIV SHAKTI ASSOCIATE', '9555452150', NULL, 'PAHARIA', TRUE, NOW(), 0, NOW(), 0),
('9111475713', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110162175' LIMIT 1), NULL, 'MAYA MISHRA', '9279743843', NULL, 'LOHTA', TRUE, NOW(), 0, NOW(), 0),
('9110166533', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'SUMITRA TRADERS', '8318581393', NULL, 'J8/11-A-C-3-, JAITPURA DIGIYA', TRUE, NOW(), 0, NOW(), 0),
('9111375229', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'RAMESH CHANDRA TRADERS', '8318584368', NULL, 'VILLAGE KARKHAIYAON POST PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111393559', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'PANKAJ JAISWAL', '8318584368', NULL, 'VILL- KAITHI, POST KAITHI', TRUE, NOW(), 0, NOW(), 0),
('9111451270', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'DASHARATH KUMAR RAI', '9005315333', NULL, 'MADRVA, CHHITTUPUR', TRUE, NOW(), 0, NOW(), 0),
('9111456150', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'SATISH KUMAR JAISWAL', '7307099535', NULL, 'PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111488050', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'AMAN BUILDING MATERIAL', '8960956294', NULL, 'JAITPURA', TRUE, NOW(), 0, NOW(), 0),
('9111489791', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110166533' LIMIT 1), NULL, 'MAA ANNAPURNA ENTERPRISES', '9451928424', NULL, 'BHU, BHAGWANPUR', TRUE, NOW(), 0, NOW(), 0),
('9110170402', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110170402' LIMIT 1), NULL, 'KOMAL ENTERPRISES', '7376746105', NULL, 'AMAULI BHAGATUA, CHAUBEPUR', TRUE, NOW(), 0, NOW(), 0),
('9110170948', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110170948' LIMIT 1), NULL, 'OM SHIV BHOLE BUILDING MATERIAL', '9839110158', NULL, 'ARAJI NO. 209, LEDHUPUR, ASHAPUR', TRUE, NOW(), 0, NOW(), 0),
('9110171676', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110171676' LIMIT 1), NULL, 'KAMAL ENTERPRISES', '9451230014', NULL, 'KEWTAN, SAKALPUR SEWAPURI', TRUE, NOW(), 0, NOW(), 0),
('9110172831', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110172831' LIMIT 1), NULL, 'MAA VASHINO HARDWARE BUILDING', '9935327836', NULL, '117, GAURAKALA, CHIRAI GAON,', TRUE, NOW(), 0, NOW(), 0),
('9111382007', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110172831' LIMIT 1), NULL, 'KARAN CONSTRUCTION', '9935327836', NULL, 'GAURAKALA, DOMANPUR CHIRAIGAON', TRUE, NOW(), 0, NOW(), 0),
('9111450846', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110172831' LIMIT 1), NULL, 'ARPIT ENTERPRISES', '9651975051', NULL, 'KAMAULI, BABHANPURA, TATEPUR', TRUE, NOW(), 0, NOW(), 0),
('9111456645', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110172831' LIMIT 1), NULL, 'PATEL ENTERPRISE', '6392848884', NULL, 'BHULLANPUR ROAD,ROHANIYA', TRUE, NOW(), 0, NOW(), 0),
('9111480441', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110172831' LIMIT 1), NULL, 'JAI MAA KALI HARDWARE SANITARY AND', '9305449816', NULL, 'ANAND NAGAR COLONY SARNATH ASHAPUR', TRUE, NOW(), 0, NOW(), 0),
('9110173220', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110173220' LIMIT 1), NULL, 'HEMANT ENTERPRISES', '7880575030', NULL, 'CHAUBEPUR', TRUE, NOW(), 0, NOW(), 0),
('9111489818', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110173220' LIMIT 1), NULL, 'JAI AMBEY TRADERS', '7880575030', NULL, 'KATEHAR CHAUBEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9110178792', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110178792' LIMIT 1), NULL, 'PATHAK BUILDING MATERIALS', '9839505929', NULL, 'SA-15/144-2KH,', TRUE, NOW(), 0, NOW(), 0),
('9110178852', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110178852' LIMIT 1), NULL, 'HARSH CEMENT AGENCY', '9838674727', NULL, 'CHUNAR ROAD, AMRA', TRUE, NOW(), 0, NOW(), 0),
('9110180027', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110180027' LIMIT 1), NULL, 'S K ENTERPRISES', '9919010488', NULL, '0 N1/66-E-8, NAGWA', TRUE, NOW(), 0, NOW(), 0),
('9110183722', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110183722' LIMIT 1), NULL, 'SHRI SIDDHI VINAYAK BUILDING', '6394817496', NULL, '0, MUNARI ROAD,', TRUE, NOW(), 0, NOW(), 0),
('9111394846', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110183722' LIMIT 1), NULL, 'JAGDISH NARAYAN', '8887736005', NULL, 'RAUNA KHURD,', TRUE, NOW(), 0, NOW(), 0),
('9110184692', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110184692' LIMIT 1), NULL, 'GEETA BUILDING MATERIAL', '9839144542', NULL, '0, MADAWA, LAMHI', TRUE, NOW(), 0, NOW(), 0),
('9110187050', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110187050' LIMIT 1), NULL, 'DAYAL TRADERS', '9919156255', NULL, 'GHAMAHAPUR, KUWAR, BASNI ROAD', TRUE, NOW(), 0, NOW(), 0),
('9111434373', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110187050' LIMIT 1), NULL, 'R S CONSTRUCTION AGENCY', '9621498060', NULL, 'PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9111480498', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110187050' LIMIT 1), NULL, 'AARADHY BUILDING MATERIAL', '7398701575', NULL, 'BAIRAMPUR DEBATHUA', TRUE, NOW(), 0, NOW(), 0),
('9110187741', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110187741' LIMIT 1), NULL, 'MAHAVEER ENTERPRISES', '9695004001', NULL, 'SH 6/3 2, HANUMANT NAGAR, SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9110188732', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110188732' LIMIT 1), NULL, 'VIDHYA ENTERPRISES', '9559895003', NULL, 'ARAZI NO. 243 BABATPUR ROAD PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9111400343', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110188732' LIMIT 1), NULL, 'VIDYA STEEL', '9721111898', NULL, 'GOKULPUR,KAJISARAI', TRUE, NOW(), 0, NOW(), 0),
('9110190952', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110190952' LIMIT 1), NULL, 'MAA VAISHNO ENTERPRISES', '9450330719', NULL, 'BHULLANPUR, MARAULI', TRUE, NOW(), 0, NOW(), 0),
('9110200556', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110200556' LIMIT 1), NULL, 'OM BUILDING MATERIAL', '9919568696', NULL, 'SEERGOVERDHAN TOLL TAX', TRUE, NOW(), 0, NOW(), 0),
('9110202060', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202060' LIMIT 1), NULL, 'JYOTI BUILDING MATERIALS', '8115332151', NULL, '0,DAFFI,NUNAW', TRUE, NOW(), 0, NOW(), 0),
('9111456432', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202060' LIMIT 1), NULL, 'PARVATI BUILDING MATERIAL', '8979629260', NULL, 'NUVAV', TRUE, NOW(), 0, NOW(), 0),
('9110202061', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202061' LIMIT 1), NULL, 'ANKIT BUILDING MATERIALS', '9453397468', NULL, 'A NO. 530 GADHWA ROAD PATEL NAGAR BHAGWANPUR', TRUE, NOW(), 0, NOW(), 0),
('ATULJI_95251', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202061' LIMIT 1), NULL, 'Atul ji', '9415941520', NULL, 'Lnka', TRUE, NOW(), 0, NOW(), 0),
('JAGDAMBA_78001', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202061' LIMIT 1), NULL, 'jagdamba Cement agency', '9415302508', NULL, NULL, TRUE, NOW(), 0, NOW(), 0),
('RAJBUILD_25269', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202061' LIMIT 1), NULL, 'Raj Building Material', '8988998999', NULL, 'Chaukahandi', TRUE, NOW(), 0, NOW(), 0),
('RISHNAKU_46646', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110202061' LIMIT 1), NULL, 'RISHNA KUMAR', '99999999', NULL, 'Bhadwar', TRUE, NOW(), 0, NOW(), 0),
('9110203758', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110203758' LIMIT 1), NULL, 'KRV ENTERPRISES', '9717082620', NULL, '0, ANEI, RAIPUR', TRUE, NOW(), 0, NOW(), 0),
('9110204851', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110204851' LIMIT 1), NULL, 'DIVYANSH BUILDING MATERIAL', '9795337722', NULL, 'VILL MUDADEV, POST TIKARI BHU', TRUE, NOW(), 0, NOW(), 0),
('9110205222', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110205222' LIMIT 1), NULL, 'KRISHNA ENTERPRISES', '9219785608', NULL, 'ARAJI NO 9/1 PLOT NO 18, SOYEPUR', TRUE, NOW(), 0, NOW(), 0),
('9111437590', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110205222' LIMIT 1), NULL, 'AKANCHHA ENTERPRISES', '9452072786', NULL, 'VILL BELWA BABA, LAMHI', TRUE, NOW(), 0, NOW(), 0),
('9111439951', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110205222' LIMIT 1), NULL, 'NARAYAN ENTERPRISES', '7844844466', NULL, 'KHATA NO 70,SINDHORA ROAD,KANUDIH PRANGANA SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9110206595', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206595' LIMIT 1), NULL, 'JAY AMBEY ENTERPRISES', '9451137695', NULL, 'DANDUPUR, 137, DHAUKALGANJ', TRUE, NOW(), 0, NOW(), 0),
('9111458482', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206595' LIMIT 1), NULL, 'R R CHAURASHIYA BUILDING MATERIAL', '9838600365', NULL, 'DANDUPUR', TRUE, NOW(), 0, NOW(), 0),
('9110206767', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SHREE RAM STEEL', '6392041429', NULL, 'AURAH,DELHANA,KACHNAR', TRUE, NOW(), 0, NOW(), 0),
('9111439938', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'VIDHAN CONSTRUCTION', '9140514204', NULL, 'KANDAWA, CHITAIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111441150', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SHARDA ENTERPRISES', '9956989994', NULL, 'B 27 70 H, DURGAKUND, BARHAR KOTHI', TRUE, NOW(), 0, NOW(), 0),
('9111441931', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'DEEPAK IRON STORE', '7985131440', NULL, 'AMARA KHAIRA CHAK, POST KANDWA', TRUE, NOW(), 0, NOW(), 0),
('9111442995', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'AYUSH SHARMA', '9919955116', NULL, 'HARAHA', TRUE, NOW(), 0, NOW(), 0),
('9111442996', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SINGH BROTHER CONSTRUCTION', '8077724856', NULL, 'LALPUR ANOOLA', TRUE, NOW(), 0, NOW(), 0),
('9111445246', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SETH BUILDING MATERIAL', '9415305531', NULL, 'NEAR POLICE STATION, RASULHA, AKORH', TRUE, NOW(), 0, NOW(), 0),
('9111449029', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SHAURY CONSTRUCTION', '9450252566', NULL, 'VILL CHITAUNI KOT  BACHCHHAWAN', TRUE, NOW(), 0, NOW(), 0),
('9111451366', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'DHIRENDRA KUMAR', '8924009272', NULL, 'K 56 3, AUSAANGANJ', TRUE, NOW(), 0, NOW(), 0),
('9111453795', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'PRAVEEN PATHAK', '7052212647', NULL, 'RAJWARI, BHANDAHA KALA', TRUE, NOW(), 0, NOW(), 0),
('9111456089', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'DEEPAK CEMENT AND HARDWARE STORE', '9839067496', NULL, 'D 57 48 A 3, NEAR PANI TANKI, SONIA', TRUE, NOW(), 0, NOW(), 0),
('9111456429', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'ASHA ENTERPRISES', '8887589089', NULL, 'DAFI, NUAAV, NAIPURA KHURD', TRUE, NOW(), 0, NOW(), 0),
('9111469058', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'JAIN ENTERPRISES', '9335587878', NULL, 'CHAUBEYPUR', TRUE, NOW(), 0, NOW(), 0),
('9111470299', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'VIVEK ENTERPRISES', '8887899149', NULL, 'MAHAVAN BABHINIYAW', TRUE, NOW(), 0, NOW(), 0),
('9111480499', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'JAISWAL BUILDING MATERIAL', '8858208677', NULL, 'MOHANSARAI GANGAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111480595', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'SKS ENTERPRISES', '9695451024', NULL, 'KATESAR RAMNAGAR', TRUE, NOW(), 0, NOW(), 0),
('9111488051', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'MARUTI BUILDING MATERIAL AND', '9336721212', NULL, 'CHUNAR ROAD AKHARI BYPASS KHANAW', TRUE, NOW(), 0, NOW(), 0),
('9111490757', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'RAI TRADING COMPANY', '6393633231', NULL, 'KARMANVEER SUSUWAHI', TRUE, NOW(), 0, NOW(), 0),
('SHIVAMSI_00999', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206767' LIMIT 1), NULL, 'Shivam singh', '9898988976', NULL, 'Nakhatpur - Panserwa Rd', TRUE, NOW(), 0, NOW(), 0),
('9110206768', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206768' LIMIT 1), NULL, 'SAHU TRADERS', '7905825188', NULL, 'TARAPUR,TIKARI,NAROTTAMPUR KALA', TRUE, NOW(), 0, NOW(), 0),
('9111207346', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206768' LIMIT 1), NULL, 'SONU BUILDING MATERIAL', '9681910603', NULL, 'AWLESHPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111435449', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206768' LIMIT 1), NULL, 'PATEL KHADH BHANDAR', '9936935737', NULL, 'KANERI, GANGAPUR', TRUE, NOW(), 0, NOW(), 0),
('9111471419', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110206768' LIMIT 1), NULL, 'PATEL BUILDING MATERIAL', '9559216698', NULL, 'BIRBHANPUR RAJATALAB', TRUE, NOW(), 0, NOW(), 0),
('9110207934', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110207934' LIMIT 1), NULL, 'AWANTI CEMENT AGENCY', '8887652664', NULL, 'SHIVPURWA, MAHMOORGANJ', TRUE, NOW(), 0, NOW(), 0),
('9111414832', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110207934' LIMIT 1), NULL, 'DINESH KUMAR VERMA', '9935370590', NULL, 'VILL PHOOLPUR THANA PHOOLPUR', TRUE, NOW(), 0, NOW(), 0),
('9111443375', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110207934' LIMIT 1), NULL, 'SAROJ DEVI', '9140211284', NULL, '51 1 VASUNDHARA GATE 1 RAILWAY COLO', TRUE, NOW(), 0, NOW(), 0),
('9110208384', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110208384' LIMIT 1), NULL, 'MATICOTECH INFRASTRUCTURE PVT LTD', '8707339385', NULL, 'HARAHUAA', TRUE, NOW(), 0, NOW(), 0),
('9111490758', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110208384' LIMIT 1), NULL, 'GAUTAMI STEELS', '9119117013', NULL, 'THASIL PINDRA DHANESHRI', TRUE, NOW(), 0, NOW(), 0),
('9110208385', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110208385' LIMIT 1), NULL, 'ANUJ TRADING COMPANY', '8052212829', NULL, 'SALARPUR', TRUE, NOW(), 0, NOW(), 0),
('9111442997', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110208385' LIMIT 1), NULL, 'MAA SANKTHA ENTERPRISES', '8887846035', NULL, 'KANDWA', TRUE, NOW(), 0, NOW(), 0),
('9110209421', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'FVS TRADING CORPORATION', '9125461413', NULL, 'DEIPUR, JANSA ROAD, JHABRA', TRUE, NOW(), 0, NOW(), 0),
('9111452654', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'SHIDRATH ENTERPRISES', '8009541262', NULL, 'MIRZAMURAD,KALLIPUR ROAD,BENIPUR', TRUE, NOW(), 0, NOW(), 0),
('9111470084', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'SHIVAM SINGH', '7651918483', NULL, 'KALLIPUR ARAJILINE', TRUE, NOW(), 0, NOW(), 0),
('9111489795', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'VISHAL BUILDING MATERIALS', '8528761774', NULL, 'GAUR MIRZAMURAD', TRUE, NOW(), 0, NOW(), 0),
('ASHISH_20425', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'Ashish', '9559155529', NULL, 'Chitaipur', TRUE, NOW(), 0, NOW(), 0),
('JCJFJJ_32890', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'Jcjfjj', NULL, NULL, NULL, TRUE, NOW(), 0, NOW(), 0),
('PRKASH_86841', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110209421' LIMIT 1), NULL, 'Prkash', NULL, NULL, 'Nakhatpur - Panserwa Rd', TRUE, NOW(), 0, NOW(), 0),
('9110217209', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110217209' LIMIT 1), NULL, 'MISHRA BUILDING SOLUTIONS', '7007599046', NULL, 'BANWARIPUR LAMHI', TRUE, NOW(), 0, NOW(), 0),
('9111452655', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110217209' LIMIT 1), NULL, 'JAMUNA PRASAD GAYA PRASAD', '9839400400', NULL, '0K67/85 A,NATIIMLI', TRUE, NOW(), 0, NOW(), 0),
('9110217758', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110217758' LIMIT 1), NULL, 'AYUSH TRADING COMPANY', '9451609946', NULL, 'NEW COLONY, SOYEPUR, BELWA BABA', TRUE, NOW(), 0, NOW(), 0),
('9110220921', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110220921' LIMIT 1), NULL, 'PARTH BUILDCON', '9611375476', NULL, 'KHATA NO 00112 BELAWA', TRUE, NOW(), 0, NOW(), 0),
('9111460257', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110220921' LIMIT 1), NULL, 'SHUBHI TRADERS', '9450287028', NULL, 'BELWAN', TRUE, NOW(), 0, NOW(), 0),
('9110220933', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110220933' LIMIT 1), NULL, 'SN INFRA MARKET', '7905258004', NULL, 'PANCHKOSHI ROAD SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9110221017', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110221017' LIMIT 1), NULL, 'AMAR CONSTRUCTIONS AND SUPPLIER', '9336835074', NULL, 'RAMNAGAR ROAD BHAGWANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111463830', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110221017' LIMIT 1), NULL, 'A P BUILDING MATERIALS', '8354811426', NULL, 'BHAGWANPUR , BHU, LANKA', TRUE, NOW(), 0, NOW(), 0),
('9111480449', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110221017' LIMIT 1), NULL, 'OM SAKSHI TRADERS', '8808053595', NULL, 'RAMNA', TRUE, NOW(), 0, NOW(), 0),
('9111489817', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110221017' LIMIT 1), NULL, 'DHEER ENTERPRISES', '7617071031', NULL, 'SUDDHIPUR SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('SANJAY_58666', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110221017' LIMIT 1), NULL, 'Sanjay', '99999999', NULL, 'Sundarpur', TRUE, NOW(), 0, NOW(), 0),
('9110224954', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110224954' LIMIT 1), NULL, 'SHRI RAM ENTERPRISES', '9532621248', NULL, 'KHALISHPUR MOHANA', TRUE, NOW(), 0, NOW(), 0),
('9111474990', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110224954' LIMIT 1), NULL, 'MAA DURGA TREADING', '6394146107', NULL, 'GATA NO 378, MILKOPUR, JALHUPUR', TRUE, NOW(), 0, NOW(), 0),
('9111486606', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110224954' LIMIT 1), NULL, 'DHANSHRI ENTERPRISES', '9532621248', NULL, 'MIRANPUR BASAHI', TRUE, NOW(), 0, NOW(), 0),
('9110225594', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110225594' LIMIT 1), NULL, 'RAGINI ENTERPRISES', '9088666333', NULL, 'BARALALPUR, VDA COLONY PHASE 1', TRUE, NOW(), 0, NOW(), 0),
('9111472812', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110225594' LIMIT 1), NULL, 'MAA GAYATRI TRADERS', '7505945843', NULL, 'LAMAHI', TRUE, NOW(), 0, NOW(), 0),
('9111472813', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110225594' LIMIT 1), NULL, 'JYOTSANA ENTERPRISES', '8299669765', NULL, 'CHAHIN KATEHAR', TRUE, NOW(), 0, NOW(), 0),
('9110225636', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110225636' LIMIT 1), NULL, 'KRIPA TRADERS', '9120292964', NULL, 'BHOJUBEER PALAHIPATTI', TRUE, NOW(), 0, NOW(), 0),
('9110228028', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228028' LIMIT 1), NULL, 'SRI MAHADEV ENTERPRISES', '8574508918', NULL, 'SEER GOVARDHANPUR', TRUE, NOW(), 0, NOW(), 0),
('9110228566', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'NEW PRADEEP STEELS', '9839093699', NULL, 'C 30 35 C 2 MALDAHIYA LOHAMANDI', TRUE, NOW(), 0, NOW(), 0),
('9111188822', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'RAM SUMER & SONS', '9581907238', NULL, 'MALDAHIYA, VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111188823', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'FRIENDS ENTERPRISES', '9781922035', NULL, 'NAKKHASH LOHATIA', TRUE, NOW(), 0, NOW(), 0),
('9111188825', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SALIM BUILDING MATERIAL', '9839742349', NULL, 'KOYLA BAZAR', TRUE, NOW(), 0, NOW(), 0),
('9111190464', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SHIV BUILDING MATERILS', '9481911778', NULL, 'SUNDERPUR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111203452', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'JAISWAL CEMENT AGENCY', '9781911013', NULL, 'NADESAR,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111236126', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SUNIL KUMAR', '8400044440', NULL, 'MURDAHA,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111238061', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'ALOK KUMAR GUPTA', '8745851542', NULL, 'HUKULGANJ,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111271757', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'ASHUTOSH ENTERPRISES', '7905020682', NULL, 'B-23/62-1A NAI BAZAR KHOJWAN', TRUE, NOW(), 0, NOW(), 0),
('9111331033', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'MAA BAGESHWARI ENTERPRISES', '9452197229', NULL, 'J721D GOPAL GANJ JAITPURA', TRUE, NOW(), 0, NOW(), 0),
('9111343558', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SIDDHART TRADERS', '9125366516', NULL, 'VILL-BHITARI,POST-LOHTA', TRUE, NOW(), 0, NOW(), 0),
('9111345770', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'GAURAV ENTERPRISES', '9415284041', NULL, 'NAKKHIGHAT,SARANG CHAURAHA', TRUE, NOW(), 0, NOW(), 0),
('9111346004', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'AGRAHARI CEMENT AGENCY', '8188001059', NULL, 'PISACH MOCHAN,VARANASI', TRUE, NOW(), 0, NOW(), 0),
('9111346005', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'KRISHNA ENTERPRISES', '7754994433', NULL, 'K43/25,BANGALI BADA', TRUE, NOW(), 0, NOW(), 0),
('9111378581', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'GANPATI ENTERPRISES', '8887497127', NULL, 'N 15/572-11 A JIVDHEEPUR, BAJARDIHA', TRUE, NOW(), 0, NOW(), 0),
('9111380045', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'GOPAL ENTERPRISES', '7398356958', NULL, 'B 34/6-3C-N SARAYNANDAN', TRUE, NOW(), 0, NOW(), 0),
('9111380046', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'HARE KRISHNA CEMENT STORE', '7355461096', NULL, '18/25 B-1 MAUJA HALL HALGAON', TRUE, NOW(), 0, NOW(), 0),
('9111392096', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SANJANA STEELS', '9453639918', NULL, 'VILL-SOYEPUR, HARHUAN', TRUE, NOW(), 0, NOW(), 0),
('9111394842', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'BABA KINARAM TRADERS', '8115903048', NULL, 'B-23/21 KHOJWAN', TRUE, NOW(), 0, NOW(), 0),
('9111410766', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'ANKUR AGRAHARI', '7753942345', NULL, 'LOHA MANDI MALDAHIYA RAM SUMER ASHRAM', TRUE, NOW(), 0, NOW(), 0),
('9111416945', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'SHUBH BUILDING MATERIAL', '9795888660', NULL, 'MADHAULI, BHULLANPUR', TRUE, NOW(), 0, NOW(), 0),
('9111418150', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'MAYANK TRADERS', '9839706475', NULL, 'HASHIMPUR, LALPUR', TRUE, NOW(), 0, NOW(), 0),
('9111424087', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'VIVEK CEMENT AGENCY', '8960581162', NULL, 'N 8/52 C 2 NEWADA SUNDERPUR', TRUE, NOW(), 0, NOW(), 0),
('9111432573', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'ROHIT CEMENT AGENCY', '8604346970', NULL, 'D40 19AND 22,LAKSHAMANPUR GODWALIYA', TRUE, NOW(), 0, NOW(), 0),
('9111437591', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'INDRASANI BUILDING MATERIAL', '9450538063', NULL, 'ARAZI NO 161, PARMANANDPUR, SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9111449028', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'KRISHNA TRADERS', '9559371838', NULL, 'BHADAINI SHIVALA', TRUE, NOW(), 0, NOW(), 0),
('9111456418', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'JAI MAA ENTERPRISES', '9621653663', NULL, 'KONIYA', TRUE, NOW(), 0, NOW(), 0),
('9111475008', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'HAYAN TRADERS', '9517333352', NULL, 'GRAM ASHAPUR TEHSIL PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9111486628', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110228566' LIMIT 1), NULL, 'ADITI CONSTRUCTION', '9984820302', NULL, 'PATERCHAK HATHI BAZAR', TRUE, NOW(), 0, NOW(), 0),
('9110231172', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110231172' LIMIT 1), NULL, 'MOURYA ENTERRPISES', '7524936871', NULL, 'PUARIKALA PINDRA', TRUE, NOW(), 0, NOW(), 0),
('9110232851', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110232851' LIMIT 1), NULL, 'BHAGIRATHI CONSTRUCTION AND SUPPLIE', '9044339800', NULL, 'N 1 12 F 11 GANGOTRI VIHAR NAGWA', TRUE, NOW(), 0, NOW(), 0),
('9110234216', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110234216' LIMIT 1), NULL, 'OM SHREE SAI NATH ENTERPRISES', '9919781361', NULL, 'CHOLAPUR JAGDISHPUR KATEHAR', TRUE, NOW(), 0, NOW(), 0),
('9110234300', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110234300' LIMIT 1), NULL, 'SHRI GANPATI INFRATECH', '7376590900', NULL, 'AMRAKHAIRACHAK', TRUE, NOW(), 0, NOW(), 0),
('9110234954', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110234954' LIMIT 1), NULL, 'M K ENTERPRISES', '9919505738', NULL, 'MAHESHPUR TARNA SHIVPUR', TRUE, NOW(), 0, NOW(), 0),
('9110235576', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110235576' LIMIT 1), NULL, 'BEMISHAL CEMENT AGENCY', '8318590576', NULL, 'MAIDAGIN SAPT SAGAR', TRUE, NOW(), 0, NOW(), 0),
('9110235580', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110235580' LIMIT 1), NULL, 'SHREE MAHADEV BUILDING MATERIAL', '7785804546', NULL, 'NARPATPUR NARAYANPUR CHAUBEPUR', TRUE, NOW(), 0, NOW(), 0),
('9110235599', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110235599' LIMIT 1), NULL, 'ROYAL TRADERS', '8318617656', NULL, 'BHORA TALAB LOHTA BAZAR', TRUE, NOW(), 0, NOW(), 0),
('9110235610', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110235610' LIMIT 1), NULL, 'AMAN BUILDING MATERIALS', '9450251409', NULL, 'DHARSAUNA CHOLAPUR', TRUE, NOW(), 0, NOW(), 0),
('9110235624', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110235624' LIMIT 1), NULL, 'SINGH BROTHERS', '9838808962', NULL, 'CHITTUPUR, HINDU VISHWA VIDYALAYA', TRUE, NOW(), 0, NOW(), 0),
('9110236010', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110236010' LIMIT 1), NULL, 'KESHARWANI AGENCIES', '9415619899', NULL, 'A8 25 TELIYANALA PRAHALADGHAT', TRUE, NOW(), 0, NOW(), 0),
('9110237589', (SELECT dealer_id FROM odts.dealer_master WHERE dealer_code = '9110237589' LIMIT 1), NULL, 'PAWAN ENTERPRISES', '8090412525', NULL, 'B24 DAFI DWARIKA PURAM COLONY', TRUE, NOW(), 0, NOW(), 0);
--
--SYSTEM
INSERT INTO odts.user_master (
user_id,
user_role_id,
dealer_id,
user_name,
user_login_name,
password_hash,
user_phone,
user_email
)
values (0,0, null, 'system', 'system', public.crypt('system123', public.gen_salt('bf')), NULL, NULL);
--
--ADMIN
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
-- its not required as user and password for dealers has been changed
/*
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
—-
*/

INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('chaukhadi', 'Warehouse (Chaukhadi)', 'chaukhadi@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Chaukhadi%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Chaukhadi%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 2: Shivpur
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('shivpur', 'Warehouse (Shivpur)', 'shivpur@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Shivpur%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Shivpur%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 3: Tarna
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('tarna', 'Warehouse (Tarna)', 'tarna@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Tarna%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Tarna%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 4: Goenka
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('goenka', 'Warehouse (Goenka)', 'goenka@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Goenka%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Goenka%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 5: Bhupur
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('bhupur', 'Warehouse (Bhupur)', 'bhupur@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Bhupur%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Bhupur%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 6: Dafi
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('dafi', 'Warehouse (Dafi)', 'dafi@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Dafi%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Dafi%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 7: Bhabhua
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('bhabhua', 'Warehouse (Bhabhua)', 'bhabhua@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Bhabhua%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Bhabhua%' LIMIT 1), 1, NOW(), 1, NOW());

-- Insert 8: Tekaria
INSERT INTO odts.user_master (user_login_name, user_name, user_email, user_phone, password_hash, user_role_id, user_is_active_flag, user_is_locked_flag, user_warehouse_id, created_by, created_at, updated_by, updated_at)
VALUES ('tekaria', 'Warehouse (Tekaria)', 'tekaria@warehouse.local', '999999' || LPAD(((SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Tekaria%' LIMIT 1) + 1)::text, 4, '0'), '$2b$10$ZX5EqgQ6W9qJ.5l3Q7q9i.xVzQZVqZVqZVqZVqZVqZVqZVqZVqZVq', (SELECT role_id FROM odts.user_roles_master WHERE role_name = 'DISPATCHER' LIMIT 1), TRUE, FALSE, (SELECT warehouse_id FROM odts.warehouse_master WHERE warehouse_name LIKE '%Tekaria%' LIMIT 1), 1, NOW(), 1, NOW());
--
UPDATE odts.user_master 
SET password_hash = '$2b$10$KnKPtM2Pp6Qrrq3DmK9AweWqL6H69vSSa1zztd0MCUlFyrU5.ZXOO'
WHERE user_login_name IN (
  'chaukhadi', 'shivpur', 'tarna', 'goenka', 'bhupur', 'dafi', 'bhabhua', 'tekaria'
);
-- Verify
SELECT user_login_name, password_hash FROM odts.user_master 
WHERE user_login_name IN ('chaukhadi', 'shivpur', 'tarna', 'goenka', 'bhupur', 'dafi', 'bhabhua', 'tekaria');
--
INSERT INTO odts.whatsapp_message_templates (template_name, message_body, created_by) VALUES
('Order Confirmation', 'Hi {{dealer_name}}, your order has been confirmed. Your Dealer Code: {{dealer_code}}. We will contact you shortly with dispatch details.', 0),
('Dispatch Alert', 'Hi {{dealer_name}}, your order is on its way! Driver will reach soon. Contact: {{dealer_phone}}', 0),
('Delivery Complete', 'Hi {{dealer_name}}, your order has been successfully delivered. Thank you for your business!', 0),
('Follow-up', 'Hi {{dealer_name}}, we hope you received your order. Please let us know if you have any questions.', 0);