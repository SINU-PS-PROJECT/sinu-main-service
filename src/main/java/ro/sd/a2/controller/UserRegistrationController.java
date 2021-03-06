package ro.sd.a2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ro.sd.a2.domain.entity.Student;
import ro.sd.a2.domain.entity.dto.UserRegistrationDTO;
import ro.sd.a2.service.serviceImp.StudentServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping("/registration")
public class UserRegistrationController {

  @Autowired
  private StudentServiceImpl studentService;

  @ModelAttribute("user")
  public UserRegistrationDTO userRegistrationDto() {
    return new UserRegistrationDTO();
  }

  @GetMapping
  public String showRegistrationForm(Model model) {
    return "registration";
  }

  @PostMapping
  public String registerUserAccount(@ModelAttribute("user") @Valid UserRegistrationDTO userDto,
                                    BindingResult result) {

    Student existing = studentService.getStudentByEmail(userDto.getEmail());
    if (existing != null) {
      result.rejectValue("email", null, "There is already an account registered with that email");
    }

    if (result.hasErrors()) {
      return "registration";
    }

    studentService.save(userDto);
    return "redirect:/registration?success";
  }

}
