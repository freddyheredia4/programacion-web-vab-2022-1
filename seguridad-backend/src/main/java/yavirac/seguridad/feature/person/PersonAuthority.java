package yavirac.seguridad.feature.person;

import org.springframework.data.annotation.Id;

import lombok.Data;

@Data
public class PersonAuthority {
    
    @Id private long id;
    private Long personId;
    private Long authorityId;

}
