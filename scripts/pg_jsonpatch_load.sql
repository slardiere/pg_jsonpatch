
insert into plv8_modules values ('jsonpatch',true,:'jsonpatch');

-- add func in postgresql.conf 
select plv8_startup();
