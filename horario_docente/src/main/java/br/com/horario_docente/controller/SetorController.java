package br.com.horario_docente.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SetorController {

	@GetMapping("/") //nome que eu quiser colocar
	public String principal()
	{
		return "principal"; //caminho real do arquivo
	
	}
@GetMapping("/principal") //nome que eu quiser colocar
public String home()
{
	return "principal"; //caminho real do arquivo
}

}