package yavirac.seguridad.feature.person;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    @DeleteMapping("/deleteById/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long id){
        personService.deleteById(id);
    }

}
