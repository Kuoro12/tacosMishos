// Claves públicas del proyecto Supabase. No pongas aquí contraseñas ni service_role.
const SUPABASE_URL = 'https://uzymbtpcfhcexcjgrixb.supabase.co';
const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_N6JPnQ1a03Yvqpb6msX03A_3lnRc01m';
window.tmSupabase = window.supabase ? window.supabase.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY) : null;
