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
import br.com.horario_docente.entity.SetorEntity;
import br.com.horario_docente.repository.DocenteRepository;
import br.com.horario_docente.repository.SetorRepository;

@Controller
public class SetorController {

	
	@Autowired
	private SetorRepository setorRepository;

	
	@GetMapping("/setor") //nome que eu quiser colocar
	public String setor (ModelMap model)
	{
		model.addAttribute("setores",setorRepository.findAll()); //caminho real do arquivo
		return "setor";
	
	}
	
	
	@PostMapping("/salvar_setor")
	public ModelAndView save (
			ModelMap model,
			@ModelAttribute("setorEntity") SetorEntity setorEntity,
			RedirectAttributes atributes) throws Exception
	{
		
		System.out.println("Nome :" + setorEntity.getNome());

		
	ModelAndView mv = new ModelAndView("redirect:/setor");
	setorRepository.save(setorEntity);
	/*atributes.addFlashAttribute("mensagem", docenteService.save(docenteEntity));
	*/
	return mv;




	}



}