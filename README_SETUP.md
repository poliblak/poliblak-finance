# 💰 Control Financiero Poliblak — Guía de Despliegue

## Stack: GitHub + Supabase + Vercel

---

## ① SUPABASE — Base de datos en la nube

1. Ve a https://supabase.com → New Project → nombre: `poliblak-finance`
2. SQL Editor → New Query → pega y ejecuta `supabase_setup.sql`
3. Project Settings → API → copia:
   - Project URL: `https://xxxx.supabase.co`
   - anon / public key: `eyJhbGci...`

---

## ② GITHUB

```bash
git init
git add index.html supabase_setup.sql README_SETUP.md
git commit -m "feat: Control Financiero Poliblak v1"
git remote add origin https://github.com/TU_USUARIO/poliblak-finance.git
git push -u origin main
```

---

## ③ VERCEL

1. vercel.com → New Project → Import desde GitHub
2. Framework: Other (no build needed)
3. Deploy → URL lista en ~30s

Cada push a GitHub = deploy automático.

---

## ④ CONFIGURAR EN LA APP

1. Abre la app → clic ⚙️ arriba a la derecha
2. Ingresa Supabase URL y Anon Key
3. Guardar y Conectar → datos sincronizados en todos los dispositivos

---

## ⑤ SIGNOS DE MONTO

- Gastos → − rojo
- Ingresos y Ahorros → + verde/azul
- El balance muestra + o − automáticamente

