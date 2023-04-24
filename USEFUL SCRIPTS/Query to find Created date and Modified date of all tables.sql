-- qUERY TO FIND CREATED DATE AND Modified date of all tables in db

SELECT
     name, object_id, create_date, modify_date
FROM
     sys.tables

	 -- Query To Fetch The Created Date And Time Of A Table Or Group Of Tables:

	 SELECT
     name, object_id, create_date, modify_date, *
FROM
     sys.tables 
WHERE
     name like 't%'

	 -- Query To Fetch The List Of Tables Created Or Modified During A Certain Period:

	 SELECT
     name, object_id, create_date, modify_date, *
FROM
     sys.tables 
WHERE
     create_date between '2015-03-01' and '2015-03-30' and
     modify_date between '2015-03-01' and '2015-03-30'