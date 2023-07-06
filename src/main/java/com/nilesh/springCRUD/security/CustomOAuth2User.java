package com.nilesh.springCRUD.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Map;

public class CustomOAuth2User implements OAuth2User {
    private OAuth2User delegate;

    public CustomOAuth2User(OAuth2User delegate) {
        this.delegate = delegate;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return delegate.getAttributes();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return delegate.getAuthorities();
    }

    @Override
    public String getName() {
        return delegate.getAttribute("name");
    }

    public String getEmail() {
        return delegate.<String>getAttribute("email");
    }
}
