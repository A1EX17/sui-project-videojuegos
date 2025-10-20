/// Módulo principal para gestión CRUD de videojuegos en Sui
module crud_videojuegos_move_sui::videojuegos {
    use std::string;
    use std::vector;
    use std::option;

    /// Estructura que representa un videojuego con sus propiedades básicas
    public struct Videojuego has copy, drop, store {
        id: u64,                    // Identificador único del juego
        nombre: string::String,     // Nombre del videojuego
        genero: string::String,     // Género del videojuego
        precio: u64,                // Precio del videojuego
    }

    /// Estructura que contiene una colección de videojuegos
    public struct Catalogo has store, drop {
        juegos: vector<Videojuego>, // Vector que almacena todos los videojuegos
    }

    /// Crea y retorna un nuevo catálogo vacío de videojuegos
    public fun crear_catalogo(): Catalogo {
        Catalogo { juegos: vector::empty<Videojuego>() }
    }

    /// Crea un nuevo videojuego y lo agrega al catálogo
    /// Aborta si ya existe un juego con el mismo ID
    public fun crear_juego(
        catalogo: &mut Catalogo,
        id: u64,
        nombre: string::String,
        genero: string::String,
        precio: u64
    ) {
        let len = vector::length(&catalogo.juegos);
        let mut i = 0;
        // Verificar que no exista un juego con el mismo ID
        while (i < len) {
            let juego = *vector::borrow(&catalogo.juegos, i);
            if (juego.id == id) { abort 1 }; // Aborta si el ID ya existe
            i = i + 1;
        };
        // Crear nuevo videojuego y agregarlo al catálogo
        let nuevo = Videojuego { id, nombre, genero, precio };
        vector::push_back(&mut catalogo.juegos, nuevo);
    }

    /// Busca y retorna un videojuego por su ID
    /// Retorna Option::some(juego) si existe, Option::none() si no existe
    public fun obtener_juego(catalogo: &Catalogo, id: u64): option::Option<Videojuego> {
        let len = vector::length(&catalogo.juegos);
        let mut i = 0;
        // Buscar el juego en el catálogo por ID
        while (i < len) {
            let juego = *vector::borrow(&catalogo.juegos, i);
            if (juego.id == id) { return option::some(juego) }; // Retorna el juego si lo encuentra
            i = i + 1;
        };
        option::none<Videojuego>() // Retorna none si no lo encuentra
    }

    /// Retorna la cantidad total de videojuegos en el catálogo
    public fun contar_juegos(catalogo: &Catalogo): u64 {
        vector::length(&catalogo.juegos)
    }

    /// Actualiza el género y precio de un videojuego existente
    /// Aborta si no encuentra el juego con el ID especificado
    public fun actualizar_juego(
        catalogo: &mut Catalogo,
        id: u64,
        nuevo_genero: string::String,
        nuevo_precio: u64
    ) {
        let len = vector::length(&catalogo.juegos);
        let mut i = 0;
        // Buscar el juego a actualizar
        while (i < len) {
            let juego_ref = vector::borrow_mut(&mut catalogo.juegos, i);
            if (juego_ref.id == id) {
                // Actualizar propiedades del juego
                juego_ref.genero = nuevo_genero;
                juego_ref.precio = nuevo_precio;
                return
            };
            i = i + 1;
        };
        abort 3 // Aborta si no encuentra el juego
    }

    /// Elimina un videojuego del catálogo por su ID
    /// Aborta si no encuentra el juego con el ID especificado
    public fun eliminar_juego(catalogo: &mut Catalogo, id: u64) {
        let len = vector::length(&catalogo.juegos);
        let mut i = 0;
        // Buscar el juego a eliminar
        while (i < len) {
            let juego = *vector::borrow(&catalogo.juegos, i);
            if (juego.id == id) {
                vector::remove(&mut catalogo.juegos, i); // Elimina el juego del vector
                return
            };
            i = i + 1;
        };
        abort 4 // Aborta si no encuentra el juego
    }

    /// Retorna el precio de un videojuego
    public fun obtener_precio(juego: &Videojuego): u64 {
        juego.precio
    }
}