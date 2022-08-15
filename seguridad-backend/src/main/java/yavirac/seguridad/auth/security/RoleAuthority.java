package yavirac.seguridad.auth.security;


import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;

@Data
@Table("auth\".\"roles_authorities")
public class RoleAuthority {

    @Id
    @Column("role_authority_id")
    private long id;
    @Column("role_id")
    private long roleId;
    @Column("authority_id")
    private long authorityId;

}
