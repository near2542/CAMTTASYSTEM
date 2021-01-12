require('dotenv').config();
const express = require('express')
const app = express();
const mysql = require('mysql2')
const PORT = process.env.PORT || 4000

const config = require('./db/config')
const { Sequelize } = require('sequelize');
const main = async ()=>
{

const connection = await mysql.createConnection({
    ...config
})

const jwt = require('jsonwebtoken')

app.set('view engine','ejs');
app.use(express.json())
app.use(express.urlencoded({extended:false}))
app.use(express.static(__dirname + '/public'));


//////////////////////////////// NON USED YET //////////////////////////////////
const sequelize = new Sequelize(process.env.DB_NAME,process.env.DB_USER,process.env.DB_PASSWORD,{
    dialect:'mysql'
})

try{
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
}
catch(err)
{
    console.log(err)
}
///////////////////////// NON USED YET /////////////////////////////////
connection.query('SELECT 1+1 as result',(err,result,fields)=>
{
    if(err) console.log(err)
    else console.log(result);
})

const register = require('./router/register')
app.use('/register',register)

app.get('/login',async(req,res)=>
{
    res.render('login.ejs');
})

app.post('/login',async(req,res)=>
{
    res.render 
})


app.listen(PORT,()=>console.log(`running on ${PORT}`))

}

main()