package yavirac.seguridad.feature.person;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface PersonRepository extends CrudRepository<Person, Long> {
    
    List<Person> findAll();
    List<Person> findByNameLikeIgnoreCase(String term);
}
