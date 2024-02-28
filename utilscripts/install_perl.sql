CREATE FUNCTION plperl_call_handler () RETURNS language_handler AS '$libdir/plperl' LANGUAGE C;

CREATE FUNCTION plperl_inline_handler (internal) RETURNS void AS '$libdir/plperl' LANGUAGE C STRICT;

CREATE FUNCTION plperl_validator (oid) RETURNS void AS '$libdir/plperl' LANGUAGE C STRICT;

CREATE TRUSTED LANGUAGE plperl HANDLER plperl_call_handler INLINE plperl_inline_handler VALIDATOR plperl_validator;