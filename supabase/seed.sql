-- Create user table used by web3auth
create table
  public.users (
    id bigint generated by default as identity not null,
    created_at timestamp with time zone null default now(),
    auth json null,
    address character varying null,
    constraint users_pkey primary key (id)
  ) tablespace pg_default;

-- Create a service role policy to create users for web3auth
CREATE POLICY "service_role_full_access"
  ON users FOR select 
  to service_role
  USING (true);