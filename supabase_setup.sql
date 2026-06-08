-- ═══════════════════════════════════════════════════════════
--  CONTROL FINANCIERO POLIBLAK — Supabase Schema
--  Ejecuta este SQL en: Supabase → SQL Editor → New Query
-- ═══════════════════════════════════════════════════════════

-- 1. TABLA PRINCIPAL
create table if not exists transactions (
  id              uuid default gen_random_uuid() primary key,
  created_at      timestamptz default now(),
  date            date not null,
  type            text not null check (type in ('gasto','ingreso','ahorro')),
  category        text default '',
  concept         text not null,
  amount          numeric(12,2) not null check (amount > 0),
  payment_method  text default '',
  expense_type    text default '',
  notes           text default '',
  year            int generated always as (extract(year from date)::int) stored,
  month           int generated always as (extract(month from date)::int) stored
);

-- 2. ÍNDICES para performance
create index if not exists idx_transactions_date  on transactions (date desc);
create index if not exists idx_transactions_type  on transactions (type);
create index if not exists idx_transactions_year  on transactions (year, month);

-- 3. ROW LEVEL SECURITY (app personal → acceso libre)
alter table transactions enable row level security;

create policy "Allow all access"
  on transactions for all
  using (true)
  with check (true);

-- 4. Verificar que todo quedó bien
select 
  column_name,
  data_type,
  is_nullable
from information_schema.columns
where table_name = 'transactions'
order by ordinal_position;
