-- ============================================================
-- TABLAS ADICIONALES: canciones, libros, fotos, favoritos
-- Copiá y pegá esto en Supabase → SQL Editor → RUN
-- (Se agrega a lo que ya creaste con supabase-schema.sql)
-- ============================================================

-- ------------------------------------------------------------
-- TABLA: canciones
-- ------------------------------------------------------------
create table canciones (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  album text not null,
  artista text,
  anio text,
  resena text,
  creado_en timestamp with time zone default now()
);

alter table canciones enable row level security;

create policy "Las canciones son visibles para todos"
  on canciones for select using (true);
create policy "Cada usuario crea sus propias canciones"
  on canciones for insert with check (auth.uid() = user_id);
create policy "Cada usuario edita sus propias canciones"
  on canciones for update using (auth.uid() = user_id);
create policy "Cada usuario borra sus propias canciones"
  on canciones for delete using (auth.uid() = user_id);

-- ------------------------------------------------------------
-- TABLA: libros
-- ------------------------------------------------------------
create table libros (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  titulo text not null,
  autor text,
  analisis text,
  valoracion text,
  creado_en timestamp with time zone default now()
);

alter table libros enable row level security;

create policy "Los libros son visibles para todos"
  on libros for select using (true);
create policy "Cada usuario crea sus propios libros"
  on libros for insert with check (auth.uid() = user_id);
create policy "Cada usuario edita sus propios libros"
  on libros for update using (auth.uid() = user_id);
create policy "Cada usuario borra sus propios libros"
  on libros for delete using (auth.uid() = user_id);

-- ------------------------------------------------------------
-- TABLA: fotos
-- ------------------------------------------------------------
create table fotos (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  leyenda text,
  url_imagen text not null,
  creado_en timestamp with time zone default now()
);

alter table fotos enable row level security;

create policy "Las fotos son visibles para todos"
  on fotos for select using (true);
create policy "Cada usuario crea sus propias fotos"
  on fotos for insert with check (auth.uid() = user_id);
create policy "Cada usuario edita sus propias fotos"
  on fotos for update using (auth.uid() = user_id);
create policy "Cada usuario borra sus propias fotos"
  on fotos for delete using (auth.uid() = user_id);

-- ------------------------------------------------------------
-- TABLA: favoritos (versos/citas ajenas)
-- ------------------------------------------------------------
create table favoritos (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  cita text not null,
  autor text,
  creado_en timestamp with time zone default now()
);

alter table favoritos enable row level security;

create policy "Los favoritos son visibles para todos"
  on favoritos for select using (true);
create policy "Cada usuario crea sus propios favoritos"
  on favoritos for insert with check (auth.uid() = user_id);
create policy "Cada usuario edita sus propios favoritos"
  on favoritos for update using (auth.uid() = user_id);
create policy "Cada usuario borra sus propios favoritos"
  on favoritos for delete using (auth.uid() = user_id);
