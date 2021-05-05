const express = require('express')
const app = express()
const cors = require('cors')
app.use(cors())



const homeRouter = require('./routes/home')
const postRouter = require('./routes/postjob')
const userRouter = require('./routes/user')

app.use(homeRouter.router)
app.use(postRouter.router)
app.use(userRouter.router)




app.listen(3000, () => {
  console.log('Example app listening at http://localhost:3000/home`')
  console.log('Example app listening at http://localhost:3000/postjob/`')
  console.log('Example app listening at http://localhost:3000/user/`')
})