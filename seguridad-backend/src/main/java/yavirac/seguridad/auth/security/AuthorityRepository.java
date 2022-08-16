package yavirac.seguridad.auth.security;


import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;



public interface AuthorityRepository extends CrudRepository<Authority, Long> {
 
    List<Authority> findAll();

    @Query(
    "select a.* from auth.authorities a " +
    "join auth.roles_authorities ra on (a.authority_id = ra.authority_id) "+
    "where ra.role_id =:rolid"
    )
    List<Authority> findByRoleId(@Param("rolid") long rolid);

    List<Authority> findByNameIgnoreCaseLike(String term);

}

