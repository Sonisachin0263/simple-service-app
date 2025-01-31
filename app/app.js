const express = require('express');
const moment = require('moment-timezone');
const app = express();

app.get('/', (req, res) => {
    const currentTime = moment().tz('Asia/Kolkata').format('YYYY-MM-DD HH:mm:ss');
    let visitorIp = req.ip;
    if (visitorIp.startsWith('::ffff:')) {
        visitorIp = visitorIp.replace('::ffff:', '');
    }
    res.json({
        timestamp: currentTime,
        ip: visitorIp      
    });
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(` Hey! Simple Time Service is running on ${PORT}`);
});


