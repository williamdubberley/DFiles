SELECT
    apps_id as id,
    app as datasource_requested,
    'ORC_'||REPLACE(customer,' ','_')as Name,
    (lobx||chr(10)||contacted||chr(10)||statusx) as description,
    ce_target_date,
    ocs_contact,
        (Select id from contact where contact.email=CAST(ocs_contact AS VARCHAR2(100)))as ocs_contactid,
    project_manager,
        (Select id from contact where contact.email=CAST(project_manager AS VARCHAR2(100)))as project_managerid,
    owner_email_id,
    (Select id from contact where contact.email=CAST(owner_email_id AS VARCHAR2(100)))as owner_email_id,
    ce_assigned,
    (Select id from contact where contact.email=CAST(ce_assigned AS VARCHAR2(100)))as ce_assignedid,
    cpr_contacted_date,
    internal_meeting,
    internal_meeting_date
FROM
    go_sheet;

select sesamese.contact.email,count(*)from SESAMESE.contact where accountid='00130000009b2IjAAI' group by sesamese.contact.email having count(*)>2;
