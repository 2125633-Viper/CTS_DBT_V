{{config(materialized = 'table', schema = 'Transformation_Dev')}}


/*elect 
emp.EMPID,
emp.FIRST_NAME,
emp.LAST_NAME,
emp.TITLE,
emp.HIRE_DATE,
IFF(emp.extension = '-', 'NA', emp.extension) as extension,
emp.YEAR_SALARY,
iff(mng.FIRST_NAME is null , emp.FIRST_NAME,mng.FIRST_NAME) as Manager_name,
iff(mng.TITLE is null , emp.TITLE, mng.TITLE) as Manager_title,
ofc.address,
ofc.OFFICECITY,
ofc.country
from {{ref('STG_Employes')}} as emp 
inner join 
{{ref('STG_Employes')}} as mng 
on emp.REPORTS_TO = mng.EMPID
left join {{ref('STG_Office')}} as Ofc 
on ofc.OFFICE = emp.OFFICE*/

 with recursive managers
        (indent, officeid, empid, empname, emptitle, managerid, managername, managertitle)
    as
      (
 
    select '*' as indent,
                    office as officeid,
                    empid,
                    FIRST_NAME as empname,
                    title as emptitle,
                    empid as managerid,
                    FIRST_NAME as managername,
                    title as managertitle
                    from {{ref('STG_Employes')}} where title = 'President'
 
        union all
 
          select indent || '*',
            emp.office as officeid,
            emp.empid,
            emp.FIRST_NAME as empname,
            emp.title as emptitle,
            mgr.empid as managerid,
            mgr.empname as managername,
            mgr.emptitle as managertitle
          from {{ref('STG_Employes')}} as emp inner join managers as mgr
            on emp.REPORTS_TO = mgr.empid
      ),
 
      office (officeid, city, country)
      as
      (
      select OFFICE, OFFICECITY, COUNTRY from {{ref('STG_Office')}}
      )
 
  select indent,  empid, empname, emptitle, managerid, managername, managertitle,
  ofc.city, ofc.country
    from managers as mgr inner join office as ofc on mgr.officeid = ofc.officeid
 
