
begin;

create table testjsonpatch( id serial primary key, data jsonb ) ;

insert into testjsonpatch( data ) values ('{"foo": [1, 3]}'), ('{"foo": [{"bar": "baz"}]}') ; 

do
language plpgsql

$$
DECLARE
	count int := 0;
BEGIN
  LOOP
    insert into testjsonpatch( data ) select data from testjsonpatch ;
    count = count + 1 ;
    raise notice 'count %', count; 
    IF count >= 2 THEN
        EXIT;
    END IF;
  END LOOP;
END;
$$ ;

analyse testjsonpatch ; 

explain (analyse, buffers) update testjsonpatch set data = jsonb_patch( data, '[{"op": "add", "path": "/foo/1", "value": 2}]');

explain (analyse, buffers) update testjsonpatch set data = jsonb_patch( data, '[{"op": "add", "path": "/foo/bar", "value": 2}]');

select * from testjsonpatch ;

rollback;
