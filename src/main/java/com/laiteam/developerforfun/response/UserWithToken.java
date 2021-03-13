package com.laiteam.developerforfun.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.laiteam.developerforfun.user.User;
import lombok.Getter;

import java.sql.Timestamp;

@Getter
public class UserWithToken {
    private Long id;
    private String username;
    private String email;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Timestamp createDate;
    private boolean isActive;
    private String token;

    public UserWithToken(User user, String token) {
        this.email = user.getEmail();
        this.username = user.getUsername();
        this.id = user.getId();
        this.createDate = user.getCreateDate();
        this.isActive = user.isActive();
        this.token = token;
    }

}
