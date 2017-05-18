var express = require('express'),
    bodyParser = require('body-parser'),
    compression = require('compression'),
    jwt = require('express-jwt'),
    cors = require('cors'),
    helmet = require('helmet'),
    employees = require('./server/employees'),
    courses = require('./server/courses'),
    teachers = require('./server/teachers'),
    sqlinit = require('./server/sqlinit'),
    app = express();

app.set('port', process.env.PORT || 5000);

app.use(bodyParser.json());
app.use(compression());
app.use(cors());
app.use(helmet());


app.use('/', express.static(__dirname + '/www'));
app.use(function(req, res, next) {
      res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
          next();
});

// Authentication middleware provided by express-jwt.
// This middleware will check incoming requests for a valid
// JWT on any routes that it is applied to.
const authCheck = jwt({
  secret: 'KmpbppNhrNebeNH-_-luI2UgfiiWv9d62rgbmBSHu_OiTIHXpQCpQmv8l8RK9S6D',
  audience: 'ICz2gh633mo05wuaONGZuS3L2byNvPkw'
});


app.get('/employees', authCheck, employees.findAll);
app.get('/employees/:name', authCheck, employees.findByName);
app.get('/employees/:id', employees.findById);
app.post('/employees', employees.createItem);
app.put('/employees', employees.updateItem);
app.delete('/employees/:id', employees.deleteItem);

app.get('/courses', courses.findAll);
app.get('/courses/:id', courses.findById);
//app.get('/courses/:id/enrollments', enrollments.findByCourse);
app.post('/courses', courses.createItem);
app.put('/courses', courses.updateItem);
app.delete('/courses/:id', courses.deleteItem);

app.get('/teachers', teachers.findAll);
app.get('/teachers/:id', teachers.findById);
app.get('/teachers/:id/courses', courses.findByTeacher);
app.post('/teachers', teachers.createItem);
app.put('/teachers', teachers.updateItem);
app.delete('/teachers/:id', teachers.deleteItem);


app.use(function(err, req, res, next) {
    console.error(err.stack);
    res.status(500).send(err);
});

app.listen(app.get('port'), function () {
    console.log('Express server listening on port ' + app.get('port'));
});
