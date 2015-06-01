# pg_jsonpatch Extension

This extension add the support of jsonpatch
[RFC 6902](https://tools.ietf.org/html/rfc6902) to PostgreSQL It use
PLV8 language, and the
[https://github.com/bruth/jsonpatch-js](https://github.com/bruth/jsonpatch-js)
javascript implementation.

To permit the use of an existing implementation, it need [plv8_modules]() 
extension. this extension load the javascript implementation in the
instance.
