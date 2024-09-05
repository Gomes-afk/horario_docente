package br.com.horario_docente.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.horario_docente.entity.DocenteEntity;
import br.com.horario_docente.repository.DocenteRepository;

@Controller
public class DocenteController{

	
	@Autowired
	private DocenteRepository docenteRepository;

@GetMapping("/docente") //nome que eu quiser colocar
public String docente()
{
	return "docente"; //caminho real do arquivo
}



@PostMapping("/salvar_docente")
public ModelAndView save (
		ModelMap model,
		@ModelAttribute("docenteEntity") DocenteEntity docenteEntity,
		RedirectAttributes atributes) throws Exception
{
	
	System.out.println("Nome :" + docenteEntity.getNome());
	System.out.println("Sobrenome :" + docenteEntity.getSobrenome());
	System.out.println("Cpf :" + docenteEntity.getCpf());
	System.out.println("Email :" + docenteEntity.getEmail());
	
ModelAndView mv = new ModelAndView("redirect:/docente");
docenteRepository.save(docenteEntity);
/*atributes.addFlashAttribute("mensagem", docenteService.save(docenteEntity));
*/
return mv;




}


}