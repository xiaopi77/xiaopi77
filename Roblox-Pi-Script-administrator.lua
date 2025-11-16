return {
    -- 作者 (等级4)
    AUTHOR = {
        level = 4,
        users = {
            "shdhudgwu",    
            123456789,     
            "作者HWID"     
        }
    },
    
    -- 高级管理员 (等级3) - 可以用用户名 或 UserID 或 HWID 中的任意一个验证
    HIGH = {
        level = 3,
        users = {
            "高级管理员1",   
            987654321,      
            "高级HWID1"    
        }
    },
    
    -- 中级管理员 (等级2) - 可以用用户名或UserID验证
    MEDIUM = {
        level = 2,
        users = {"中级管理员1", 555555555} -- 可以用用户名或UserID
    },
    
    -- 低级管理员 (等级1) - 可以用用户名或UserID验证
    LOW = {
        level = 1,
        users = {"低级管理员1", 444444444} -- 可以用用户名或UserID
    }
}
