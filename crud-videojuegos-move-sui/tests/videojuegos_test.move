/// Módulo de pruebas para el CRUD de videojuegos
module 0x0::videojuegos_test {
    use std::string;
    use crud_videojuegos_move_sui::videojuegos;
    use std::option;

    /// Prueba completa que verifica todas las operaciones CRUD
    #[test]
    public fun test_crud_completo() {
        // Crear un catálogo vacío
        let mut catalogo = videojuegos::crear_catalogo();

        // Crear juegos de prueba
        videojuegos::crear_juego(&mut catalogo, 1, string::utf8(b"Zelda"), string::utf8(b"Aventura"), 1200);
        videojuegos::crear_juego(&mut catalogo, 2, string::utf8(b"Mario Kart"), string::utf8(b"Carreras"), 900);

        // Verificar cantidad inicial de juegos
        let count = videojuegos::contar_juegos(&catalogo);
        if (!(count == 2)) { abort 100 }; // Verifica que hay 2 juegos

        // Verificar existencia del juego 1
        let maybe1 = videojuegos::obtener_juego(&catalogo, 1);
        assert!(option::is_some(&maybe1)); // Confirma que el juego 1 existe

        // Actualizar propiedades del juego 2
        videojuegos::actualizar_juego(&mut catalogo, 2, string::utf8(b"Competitivo"), 950);
        let maybe2 = videojuegos::obtener_juego(&catalogo, 2);
        assert!(option::is_some(&maybe2)); // Confirma que el juego 2 existe después de actualizar
        
        // Obtener referencia al juego 2 para verificar cambios
        let j2 = option::borrow(&maybe2);

        // Verificar que el precio se actualizó correctamente
        assert!(videojuegos::obtener_precio(j2) == 950);

        // Eliminar el juego 1 del catálogo
        videojuegos::eliminar_juego(&mut catalogo, 1);
        let maybe1_after = videojuegos::obtener_juego(&catalogo, 1);
        assert!(option::is_none(&maybe1_after)); // Confirma que el juego 1 ya no existe

        // Verificar cantidad final de juegos
        let count2 = videojuegos::contar_juegos(&catalogo);
        assert!(count2 == 1); // Confirma que solo queda 1 juego
    }
}