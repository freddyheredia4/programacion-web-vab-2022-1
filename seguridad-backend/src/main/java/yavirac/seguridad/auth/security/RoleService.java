package yavirac.seguridad.auth.security;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleService {
    
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    AuthorityService authorityService;

    //Create and Update
    public Role save(Role role){
        return roleRepository.save(role);
    }
    //Read
    public Role findById(long id){
        return roleRepository.findById(id).orElseThrow();
    }
    //Delete
    public void deleteById(long id){
        roleRepository.deleteById(id);
    }

    public List<Role> findAll(){
        return roleRepository.findAll();
    }

    public List<String> getAuthoritiesByRolid(long rolId)
    {
        List<String> authorityNames = new ArrayList<>();
        List<Authority> autorities = authorityService.findByRoleid(rolId);
        for (Authority authority : autorities)
        {
            authorityNames.add(authority.getName());
        }
        return authorityNames;
    }

}
