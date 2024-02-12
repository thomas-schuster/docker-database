INSERT INTO public.privilege (id, description, name) VALUES (1, ''Can create queries of type sandbox'', ''CREATE_SANDBOX_QUERY'');
INSERT INTO public.privilege (id, description, name) VALUES (2, ''Can create quizzes'', ''CREATE_QUIZ'');
INSERT INTO public.privilege (id, description, name) VALUES (3, ''Can create, update and delete roles'', ''MANAGE_ROLE'');
INSERT INTO public.privilege (id, description, name) VALUES (4, ''Can get data about a specific account'', ''GET_ACCOUNT'');
INSERT INTO public.privilege (id, description, name) VALUES (5, ''Can delete any account'', ''DELETE_ACCOUNT'');
INSERT INTO public.privilege (id, description, name) VALUES (6, ''Can update the data of any account'', ''UPDATE_ACCOUNT'');
INSERT INTO public.privilege (id, description, name) VALUES (7, ''Can update the data of the account, which is currently logged in'', ''UPDATE_OWN_ACCOUNT'');
INSERT INTO public.privilege (id, description, name) VALUES (8, ''Can get a list of all existing accounts and their data'', ''GET_ACCOUNTS'');
INSERT INTO public.privilege (id, description, name) VALUES (9, ''Can delete the account, which is currently logged in'', ''DELETE_OWN_ACCOUNT'');
INSERT INTO public.privilege (id, description, name) VALUES (10, ''Can get information about the backends various detailed metrics'', ''GET_BACKEND_METRICS'');


INSERT INTO public.role (id, created_date, last_modified_date, name, created_by, last_modified_by) VALUES (1000, now(), now(), ''ADMIN'', null, null);
INSERT INTO public.role (id, created_date, last_modified_date, name, created_by, last_modified_by) VALUES (1001, now(), now(), ''USER'', null, null);

INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 1);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 2);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 3);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 4);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 5);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 6);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 7);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 8);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 9);
INSERT INTO public.role_privilege (role_id, privilege_id) VALUES (1000, 10);


INSERT INTO public.account (id, email, enabled, first_name, last_name, username, password, settings) VALUES (10001, ''test@hs-pforzheim.de'', true, ''Admin'', ''Istrator'', ''Administrator'', ''$2a$12$wVRKd37M2S1lMNVlMUgLLe6t7CzvkK7Nr9XK7TdcyQryNWaFkJ/GW'', null);

INSERT INTO public.account_role (account_id, role_id) VALUES (10001, 1000);
INSERT INTO public.account_role (account_id, role_id) VALUES (10001, 1001);