package yavirac.seguridad.auth.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/authority")
@CrossOrigin({"*"})
public class AuthorityController {
    
    @Autowired
    AuthorityService authorityService;

    @GetMapping("/findByName/{term}")
    public List<Authority> findByName(@PathVariable String term){
        return authorityService.findByName(term);
    }

    @GetMapping("/findById/{id}")
    public Authority findById(@PathVariable long id){
        return authorityService.findById(id);
    }
}
