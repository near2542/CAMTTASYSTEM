const router = require('express').Router()


router.get('/',async(req,res)=>
{
    res.send('on register');
})


router.get('/test',async(req,res)=>
{
    res.send('on register');
})


module.exports = router;