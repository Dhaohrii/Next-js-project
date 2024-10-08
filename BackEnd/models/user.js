const db=require("../Database/db");
const bcrypt =require("bcrypt");
const { error } = require("console");
const {z}=require("zod");
const { password } = require("../Database/config");

module.exports={
userValidation:z.object({
    fullname:z.string().min(3,"Please Enter a Valid Full Name"),
    email:z.string().email("invalid Email"),
    password:z.string().min(8,"Password must be at least 8 characters"),
    phonenumber:z.string().min(8,"Please enter a valid Number").optional(),
    role: z.enum(['user', 'shopOwner', 'admin']),
    photo: z.string().optional(),
}),
login:z.object({
email:z.string().email("invalid Email"),
password:z.string().min(8,"Password must be at least 8 characters")
}),
getUserByEmail:function(email,callback){
const sql="SELECT * FROM `user` WHERE email=?";
db.query(sql,email,(err,results)=>{
    if(err){
        return callback(err,null)
    }
    return callback(null,results)
})
},   
getUserById:function (id){
  return new Promise((resolve, reject) => {
    const sql = "SELECT * FROM `user` WHERE id=?";
    db.query(sql, [id], (err, results) => {
      if (err) {
        return reject(err);
      }
      resolve(results[0]); // Assuming 'results' is an array and you want the first item
    });
  });
},

// Method to add a new user to the database
addUser(userData, callback) {
    const { fullname, email, password, phonenumber, role, photo } = userData;
    const query = 'INSERT INTO user (fullname, email, password, phonenumber, role, photo) VALUES (?, ?, ?, ?, ?, ?)';
    const params = [fullname, email, password, phonenumber, role, photo];

    db.query(query, params, (err, results) => {
      if (err) {
        console.error('Error adding user to database:', err.message);
        callback(err, null);
        return;
      }
      console.log('User added to database successfully:', results);
      callback(null, results);
    });
  },

  updateUser(id, user, callback) {
    const { fullname,email,password,phonenumber,photo } = user;
    const query = 'UPDATE user SET fullname = ?, email = ?, password = ?, phonenumber = ?, photo = ? WHERE id = ?';
    const params = [fullname,email,password,phonenumber,photo,id];
  
    db.query(query, params, (err, results, fields) => {
      if (err) {
        console.error(`Error updating user with ID ${id}:`, err.message);
        callback(err, null);
        return;
      }
      console.log(`user with ID ${id} updated successfully:`, results);
      callback(null, results);
    });
  },
  getById(id, callback) {
    const query = 'SELECT * FROM user WHERE id = ?';
    db.query(query, [id], (err, results) => {
      if (err) {
        console.error(`Error fetching user by ID ${id}:`, err.message);
        callback(err, null);
        return;
      }
      console.log(`user fetched by ID ${id} successfully:`, results);
      callback(null, results);
    });
  }
}