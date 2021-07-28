package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Mensaje;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioMensaje extends RepositorioBase<Mensaje>{
    @Query(value = "SELECT * FROM mensajes m JOIN usuarios u ON m.destinatario_id = u.id JOIN usuarios r ON m.remitente_id = r.id WHERE m.remitente_id = ?1 AND m.destinatario_id = ?2 OR m.destinatario_id = ?1 AND m.remitente_id = ?2 ORDER BY m.created_at", nativeQuery = true)
    List<Mensaje> chat(Long usuarioId, Long usuarioDosId);
}
