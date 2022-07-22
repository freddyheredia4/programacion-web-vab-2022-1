package yavirac.seguridad.feature.city;

import org.springframework.data.annotation.Id;

import lombok.Data;

@Data
public class City {

    @Id private long id;
    private String name;
    
}
