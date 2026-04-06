const express = require('express')
const app = express()
const port = 4000
let nombre = 'jose'

app.get('/ingeneirodelpoli', (req, res) => {
  res.send(`Hello ${nombre} World!`)
})

app.listen(port, () => {
  console.log(`el servidoresta prendidio  y corriendo en el puerto ${port}`)
})
