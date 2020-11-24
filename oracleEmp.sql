Select id SFID ,
Firstname First_Name,
Lastname Last_Name,
Namex Full_Name,
Email,
Phone Office_Phone,
Mobilephone Mobile_Phone,
Reportstoid Reports_To,
titlex Title 
from contact 
where accountid in
 (select id from accountx where namex like 'Oracle%')


select id SFID,
Firstname FIRST_NAME,
LASTNAME LAST_NAME,
Namex FULL_NAME,
Email,
Phone,
Mobilephone Mobile_phone,
titlex Title,
SYSTEMMODSTAMP Modified
from userx 
where id in('00550000007kLPgAAM' -- Caleb
,'00550000007DaZQAA0' -- Josh
,'0051T000009f2xmQAA' -- Kaleb
,'00550000006fT10AAE' -- Martha
,'0051T000009f2xwQAA' -- Rachel
,'00550000007DaYrAAK' -- Robert
,'005500000011x9rAAA' -- William
);

select id SFID
,namex Opportunity_Name
,description Description
,(select a.PARTNER_CUSTOMER_ID__C from accountx a where a.id=o.accountid) as customer_id
,o.stagename Current_Stage
,o.nextstep Next_step
,o.Reason_Lost__c Reason_Lost
,o.other_lost_reason__c as Closing_COMMENT
,o.systemmodstamp Modified
,o.PARTNER_SALES_REP__C Oracle_sales_rep
,o.PARTNER_ENGINEER__C ORACLE_ENGINEER
,o.ownerid SESAME_SALES_REP
,o.demo_sales_engineer__c SESAME_ENGINEER
,o.Presentation_Demo_Scheduled_Datee__c DEMO_SCHEDULED
,o.demo_actual_date__c DEMO_ACTUAL
,o.POC_Scheduled_start_Date__c POC_SCHEDULED
,o.Proof_of_Concept_Start__c POC_ACTUAL
from opportunity o
where 
accountid in (select id from accountx where namex like 'Oracle%') 
or 
accountid in (select id from accountx where parentid in (select id from accountx where namex like 'Oracle%'))

create user NETSUITE_CLONE identified by R3Lati0nal##;
GRANT dwrole TO NETSUITE_CLONE;
GRANT CREATE SESSION TO NETSUITE_CLONE;
GRANT UNLIMITED TABLESPACE TO NETSUITE_CLONE;\



CALEB.MCLAIN	
KALEB.CROFT	
MARTHA.AUSTIN	
RACHEL.WHITE	
ROBERT.LUKE	
WILLIAM.DUBBERLEY	