package yavirac.seguridad.auth.security;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class UserService implements UserDetailsService {
    
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleService roleService;

    //Create and update
    public User save(User entity){
        return userRepository.save(entity);
    }

    //Read
    public User findById(long id){
        return userRepository.findById(id).orElseThrow();
    }

    //Delete 
    public void deleteById(long id){
        userRepository.deleteById(id);
    }

    public List<User> findAll(){
        return userRepository.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
        return this.getUserAuthoritiesByUsername(username);
    }

    public User getUserAuthoritiesByUsername(String username)
    {
        User user = userRepository.findByUsername(username);
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();

        for (UserRole userRole : user.getRoles())
        {
            List<String> authorities = roleService.getAuthoritiesByRolid(userRole.getRoleId());
            for (String authorityName : authorities)
            {
                grantedAuthorities.add(new SimpleGrantedAuthority(authorityName));
            }
        }
        user.setAuthorities(grantedAuthorities);
        return user;
    }
    
}
