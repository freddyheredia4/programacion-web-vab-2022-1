package yavirac.seguridad.feature.city;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityService {
    
    @Autowired
    CityRepository cityRepository;

    public List<City> findAll(){
        return cityRepository.findAll();
    }

    public City findById(long id){
        return cityRepository.findById(id).orElse(new City());
    }
}
