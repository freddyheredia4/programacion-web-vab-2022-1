package yavirac.seguridad.feature.person;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonService {

    @Autowired
    PersonRepository personRepository;

    //CRUD = Create, Read, Update, Delete

    public Person save(Person person){

        return personRepository.save(person);
    }

    public Person findById(long id){
        return personRepository.findById(id).orElse(new Person());
    }

    public Person update(Person person){
        return personRepository.save(person);
    }

    public void deleteById(long id){
        personRepository.deleteById(id);
    }

    public List<Person> findAll(){
        return personRepository.findAll();
    }

    public List<Person> findByName(String term){
        return personRepository.findByNameLikeIgnoreCase(term+"%");
    }
    
}
