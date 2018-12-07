package com.jk.model;

public class login {
    private String  loginId;
    private String  loginName;
    private String  loginPwd;
    private String  fullName;
    private Integer fullSex;
    private String  fullPhoto;
    private String  fullPhone;
    private String  confirmPassword;
    private Integer inviteCode;
    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Integer getFullSex() {
        return fullSex;
    }

    public void setFullSex(Integer fullSex) {
        this.fullSex = fullSex;
    }

    public String getFullPhoto() {
        return fullPhoto;
    }

    public void setFullPhoto(String fullPhoto) {
        this.fullPhoto = fullPhoto;
    }

    public String getFullPhone() {
        return fullPhone;
    }

    public void setFullPhone(String fullPhone) {
        this.fullPhone = fullPhone;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public Integer getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(Integer inviteCode) {
        this.inviteCode = inviteCode;
    }
}
