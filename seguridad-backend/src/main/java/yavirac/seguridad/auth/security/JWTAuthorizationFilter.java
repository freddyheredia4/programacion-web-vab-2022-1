package yavirac.seguridad.auth.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import yavirac.edu.ec.billingbackend.auth.domain.User;
import yavirac.edu.ec.billingbackend.auth.service.UserService;

public class JWTAuthorizationFilter  extends BasicAuthenticationFilter {

    private UserService userService;
    public JWTAuthorizationFilter(AuthenticationManager authenticationManager, UserService userService) {
        super(authenticationManager);
        this.userService = userService;
        //TODO Auto-generated constructor stub
    }
    public JWTAuthorizationFilter(AuthenticationManager authenticationManager, AuthenticationEntryPoint authenticationEntryPoint) {
        super(authenticationManager, authenticationEntryPoint);
    }
    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String header=request.getHeader(JWTUtil.TOKEN_HEADER);
        // Filtra aquellos sin token (tal vez acceso sin autorización)
        if(header==null||!header.startsWith(JWTUtil.TOKEN_PREFIX)){
            chain.doFilter(request,response);
            return;
        }
        UsernamePasswordAuthenticationToken authentication = getAuthentication(header);
        // Establece la información de autenticación del usuario y jwtToken genera UsernamePasswordAuthenticationToken
        SecurityContextHolder.getContext().setAuthentication(authentication);
        chain.doFilter(request, response);
    }

    private UsernamePasswordAuthenticationToken getAuthentication(String header) {
        String token = header.replace(JWTUtil.TOKEN_PREFIX, "");
        String username = JWTUtil.getUsername(token);
        
        User usuario = userService.getUserAuthoritiesByUsername(username);
        
        if (username != null) {
            return new UsernamePasswordAuthenticationToken(username, null,usuario.getAuthorities()
            );
        }
        return null;
    }
}
