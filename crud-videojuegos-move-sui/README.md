# Proyecto Videojuegos en Move y Sui

Este proyecto es un sistema CRUD para gestionar videojuegos, jugadores e inventarios utilizando el lenguaje Move y la blockchain Sui.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

```
videojuegos-move-sui
├── Move.toml              # Configuración del proyecto Move
├── sources                # Código fuente del proyecto
│   ├── Game.move         # Definición de la clase Game
│   ├── Player.move       # Definición de la clase Player
│   └── Inventory.move     # Definición de la clase Inventory
├── tests                  # Archivos de pruebas
│   ├── unit_tests.move    # Pruebas unitarias
│   └── integration_tests.move # Pruebas de integración
├── scripts                # Scripts para construcción y pruebas
│   ├── build.sh           # Script para compilar el proyecto
│   └── run_tests.sh       # Script para ejecutar las pruebas
├── examples               # Ejemplos de uso
│   └── demo_play.move     # Ejemplo de cómo jugar un videojuego
├── .gitignore             # Archivos y directorios a ignorar por Git
├── LICENSE                # Licencia del proyecto
└── README.md              # Documentación del proyecto
```

## Requisitos

Asegúrate de tener instalado el entorno de desarrollo de Move y Sui. Consulta la documentación oficial para más detalles sobre la instalación y configuración.

## Instalación

1. Clona el repositorio:
   ```
   git clone <url_del_repositorio>
   cd videojuegos-move-sui
   ```

2. Compila el proyecto:
   ```
   ./scripts/build.sh
   ```

## Ejecución de Pruebas

Para ejecutar las pruebas, utiliza el siguiente comando:
```
./scripts/run_tests.sh
```

## Uso

Consulta el archivo `examples/demo_play.move` para ver un ejemplo de cómo interactuar con el sistema de videojuegos.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir cambios.

## Licencia

Este proyecto está licenciado bajo la [Licencia que elijas].