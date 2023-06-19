
package dto;

public class UserDTO {

    public UserDTO() {
    }

    public UserDTO(String name, String mail, String mobileNo, String password, String userType) {
        this.name = name;
        this.mail = mail;
        this.mobileNo = mobileNo;
        this.password = password;
        this.userType = userType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public UserDTO(String userid, String password) {
        this.mail = userid;
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    private String name;
    private String mail;
    private String mobileNo;
    private String password;
    private String userType;
    
}
