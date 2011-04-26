SELECT * FROM [CLASSIFY].[CATE_AND_EMP] e
left outer join [CLASSIFY].[CATEGORY] c on e.category_key=c.category_key 
left outer join [CLASSIFY].[LINKED_CATEGORY] l ON  c.category_key = l.category_key
where c.category_type_key=8

select * from classify.category where category_key= 698

SELECT [ID],[CATEGORY_KEY],[LINK_TO_CATEGORY_KEY],[LINKED_TYPE_KEY],[DEL_FLAG] FROM [BAY01].[CLASSIFY].[LINKED_CATEGORY]