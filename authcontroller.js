const sql=require('../models/db');

exports.login=(req, res)=>{
    let user=req.body;
    let message="";
    if(user.email==="ravi.tambade@transflower.in" && user.password==="ibm"){
        message="Welcome "+ user.email;
    }
    else{
        message="Invalid User";
    }
    res.send(message);
};

exports.register= async (req, res)=>{
    const userPayload = req.body
    
    // add validation
    if(!userPayload.username || !userPayload.password){
        res.status(400).json({success: false, message: 'Username or password is missing!'})
        return
    }

    //save in db
    let command="INSERT INTO registration() values(" + userPayload.fname+"','"+ userPayload.email ;
    const saveRes = await new Promise((resolve, reject) => {
        sql.query(command,(err, rows, fields)=>{
            resolve(rows)
        })
    })

    res.status(200).json({success: true, data: saveRes, message: 'Successfully registered!'})


    //return response
    // res.send("new user registrations...")
}