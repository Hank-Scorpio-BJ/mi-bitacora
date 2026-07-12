// ============================================================
// CONFIGURACIÓN DE SUPABASE
// Reemplazá estos dos valores con los de TU proyecto:
// Supabase → tu proyecto → Settings → API
// ============================================================
const SUPABASE_URL = "https://sb_publishable__n_0XP9umPUe_eoQsVgV6w_WsoYUhu1.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpd2Rpc3Z3eGJidmRnenRzcGprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM4NjgzNjcsImV4cCI6MjA5OTQ0NDM2N30.ITLxLI29szuaVx3JRlCsgGvReEomTTNDaoDfOoS2iks";

const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ------------------------------------------------------------
// Helper: devuelve la sesión actual (o null si no hay nadie logueado)
// ------------------------------------------------------------
async function obtenerSesionActual() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  return session;
}

// ------------------------------------------------------------
// Helper: cierra sesión y vuelve al login
// ------------------------------------------------------------
async function cerrarSesion() {
  await supabaseClient.auth.signOut();
  window.location.href = "login.html";
}
