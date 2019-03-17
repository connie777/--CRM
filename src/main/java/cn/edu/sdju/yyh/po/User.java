package cn.edu.sdju.yyh.po;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
/**
 * 用户持久化类
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer user_id;      //用户id 
	private String user_code;     //用户账号
	private String user_name;     //用户姓名
	private String user_password; //用户密码
    private String user_phone;    //用户手机
    private Integer user_state;   //用户状态
    private Integer user_level; //用户级别 1为高管 2为销售主管 3为销售
    private String user_position;
    private String user_department;
    private String user_email;
    private String user_avatar;
    private MultipartFile avatar_file;

    public Integer getUser_level() {
        return user_level;
    }

    public void setUser_level(Integer user_level) {
        this.user_level = user_level;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public Integer getUser_state() {
		return user_state;
	}

	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}

    public String getUser_position() {
        return user_position;
    }

    public void setUser_position(String user_position) {
        this.user_position = user_position;
    }

    public String getUser_department() {
        return user_department;
    }

    public void setUser_department(String user_department) {
        this.user_department = user_department;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }

    public MultipartFile getAvatar_file() {
        return avatar_file;
    }

    public void setAvatar_file(MultipartFile avatar_file) {
        this.avatar_file = avatar_file;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_code='" + user_code + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_state=" + user_state +
                ", user_level=" + user_level +
                ", user_position='" + user_position + '\'' +
                ", user_department='" + user_department + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_avatar='" + user_avatar + '\'' +
                ", avatar_file=" + avatar_file +
                '}';
    }
}
