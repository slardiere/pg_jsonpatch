
create or replace function json_patch( data json, patch json)
returns json
language plv8
set client_min_messages = warning
as $$
p=jsonpatch.apply( data , patch );
plv8.elog(NOTICE,JSON.stringify(p));
return p;
$$ ;

create or replace function jsonb_patch ( data jsonb, patch json )
returns jsonb
language sql
as '
select json_patch( $1::json, $2)::jsonb ;
' ;



