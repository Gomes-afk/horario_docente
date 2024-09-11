package br.com.horario_docente.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.horario_docente.entity.DocenteEntity;
import br.com.horario_docente.entity.SetorEntity;

@Repository
public interface SetorRepository
extends JpaRepository<SetorEntity, Long> {

}
