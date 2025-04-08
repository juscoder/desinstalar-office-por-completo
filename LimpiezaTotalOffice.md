# 🧼 Desinstalación Total de Microsoft Office

Este es el método más efectivo y confiable si deseas dejar tu sistema completamente limpio de Office, como si **nunca lo hubieras instalado**.

---

## 🔹 Paso 1: Desinstalar Office desde el Panel de Control (Offline)

1. Abre: `Panel de control > Programas y características`.
2. Busca cualquier entrada que diga:
   - *Microsoft Office 2013 / 2016 / 2019 / 2021 / LTSC*
   - *Microsoft 365*
   - *Office Click-to-Run*
3. Haz clic derecho → `Desinstalar`.

> 📌 Esto elimina la mayoría de los archivos, pero **deja rastros ocultos**, por eso necesitas el siguiente paso.

---

## 🔹 Paso 2: Ejecutar el Script de Limpieza Profunda (Automático)

- Ejecuta el archivo `.cmd` proporcionado.
- Este script realiza una limpieza total de los restos de Office en el sistema.
- [Descargar el script de limpieza de Office](https://github.com/juscoder/desinstalar-office-por-completo/releases/download/script-v1.0/limpieza_total_office.cmd)

---

## 📁 Rutas que serán limpiadas por el script

### 🔧 Directorios del sistema:

| Ruta | Descripción |
|------|-------------|
| `C:\Program Files\Microsoft Office` | Archivos principales (64 bits) |
| `C:\Program Files (x86)\Microsoft Office` | Archivos principales (32 bits) |
| `C:\Program Files\Common Files\Microsoft Shared` | Librerías compartidas de Office |
| `C:\ProgramData\Microsoft\Office` | Datos globales de configuración |

### 👤 Directorios de usuario:

| Ruta | Descripción |
|------|-------------|
| `%APPDATA%\Microsoft\Office` → `C:\Users\TuUsuario\AppData\Roaming\Microsoft\Office` | Configuración del usuario |
| `%LOCALAPPDATA%\Microsoft\Office` → `C:\Users\TuUsuario\AppData\Local\Microsoft\Office` | Cachés, logs, configuraciones locales |
| `%TEMP%` | Archivos temporales (Office y otros) |

---

## 🧠 Claves del Registro eliminadas

| Ruta | Descripción |
|------|-------------|
| `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office` | Claves globales de Office |
| `HKEY_CURRENT_USER\Software\Microsoft\Office` | Preferencias del usuario |
| `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc` | Servicio de actualizaciones de Office 365/CTR |

---

## ⏱️ También elimina:

- Tareas programadas de Office (`schtasks` con nombre relacionado)
- Permisos/bloqueos que impiden eliminar carpetas protegidas

---

## 🔐 Aclaraciones importantes

- ✅ **NO se tocan archivos personales** (Word, Excel, etc.)
- ✅ **NO afecta programas ajenos a Office**
- ✅ **NO se desinstalan Visual C++, Outlook independiente u otros programas de Microsoft**
- 📢 El script incluye confirmaciones y puedes revisar el código antes de ejecutarlo.

---

## ✅ Resultado Final

- Office completamente eliminado.
- Sin carpetas residuales.
- Sin claves de registro huérfanas.
- Sin tareas programadas.
- Sistema listo para una **reinstalación limpia y sin errores**.

---

NOTA: voy estar actualizando el script para que sea mas interactivo.
