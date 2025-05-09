# sandbox-robot

Ein Beispielprojekt für Robot Framework mit Browser-Tests.

## Voraussetzungen

- Python 3.8+
- [pip](https://pip.pypa.io/)
- [Node.js](https://nodejs.org/) (für `rfbrowser init`)

## Einrichtung

1. **Virtuelle Umgebung erstellen und aktivieren:**

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

2. **Abhängigkeiten installieren:**

   ```bash
   pip install -r requirements.txt
   ```

3. **Robot Framework Browser initialisieren:**

   ```bash
   rfbrowser init
   ```

## Tests ausführen

```bash
robot tests/
```

## Projektstruktur

```
.
├── requirements.txt
├── .gitignore
├── README.md
├── tests/
│   └── test_quick_start.robot
└── CustomLibrary.py
```

## Nützliche Befehle

- Virtuelle Umgebung aktivieren:  
  `source .venv/bin/activate`
- Tests ausführen:  
  `robot tests/`
- Browser-Komponenten installieren:  
  `rfbrowser init`

## Hinweise

- Die Datei `.gitignore` sorgt dafür, dass temporäre Dateien, virtuelle Umgebungen und Ausgaben von Robot Framework nicht ins Repository gelangen.
- Die Datei `requirements.txt` enthält alle Python-Abhängigkeiten.
