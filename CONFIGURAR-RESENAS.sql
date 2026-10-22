-- Tacos Mishos: reseñas públicas compartidas
-- Ejecuta TODO este archivo en Supabase > SQL Editor > New query > Run.
-- Los visitantes pueden leer y publicar reseñas; no pueden editar ni borrar las de otras personas.

create table if not exists public.resenas (
  id uuid primary key default gen_random_uuid(),
  nombre text not null check (char_length(trim(nombre)) between 1 and 60),
  estrellas integer not null check (estrellas between 1 and 5),
  comentario text not null check (char_length(trim(comentario)) between 1 and 500),
  creado_en timestamptz not null default now()
);

alter table public.resenas enable row level security;
grant select, insert on public.resenas to anon, authenticated;

drop policy if exists "Visitantes pueden leer resenas publicas" on public.resenas;
create policy "Visitantes pueden leer resenas publicas"
  on public.resenas for select to anon, authenticated
  using (true);

drop policy if exists "Visitantes pueden publicar resenas" on public.resenas;
create policy "Visitantes pueden publicar resenas"
  on public.resenas for insert to anon, authenticated
  with check (
    char_length(trim(nombre)) between 1 and 60
    and estrellas between 1 and 5
    and char_length(trim(comentario)) between 1 and 500
  );
