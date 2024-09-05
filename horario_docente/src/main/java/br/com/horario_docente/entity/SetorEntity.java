package br.com.horario_docente.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

public class SetorEntity {
	@Entity
	@Table(name = "Setor" , schema = "horario_docente")
	public class setorEntity implements Serializable {

		private static final long serialVersionUID = 1L;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id_Setor")
		private Long idSetor;
		
		@Column(name = "nome")
		private String nome;
}
}
