package yavirac.seguridad.feature.person;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/person")
@CrossOrigin({"*"})
public class PersonController {
    
    @Autowired
    PersonService personService;

    //CRUD

    //Create
    @PreAuthorize("hasAuthority('PERSONA_ESCRIBIR')")
    @PostMapping("/save")
    public Person save(@RequestBody Person person){
        return personService.save(person);
    }

    //Read
    @GetMapping("/{id}")
    public Person findById(@PathVariable long id){
        return personService.findById(id);
    }

    //Update
    @PutMapping("/update")
    public Person update(@RequestBody Person person)
    {
        return personService.save(person);
    }

    //Delete
    @PreAuthorize("hasAuthority('PERSONA_BORRAR')")
    @DeleteMapping("/deleteById/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long id){
        personService.deleteById(id);
    }

    @PreAuthorize("hasAuthority('PERSONA_LEER')")
    @GetMapping("/findAll")
    public List<Person> findAll(){
        return personService.findAll();
    }

    @PreAuthorize("hasAuthority('PERSONA_LEER')")
    @GetMapping("/findByName/{term}")
    public List<Person> findByName(@PathVariable String term){
        return personService.findByName(term);
    }

}
