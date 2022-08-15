package yavirac.seguridad.auth.security;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;

@Data
@Table("auth\".\"authorities")
public class Authority {

    @Id
    @Column("authority_id")
    private long authorityId;
    private String name;
    private boolean enabled;
    
}
