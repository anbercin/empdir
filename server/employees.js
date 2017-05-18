"use strict";

let db = require('./pghelper');

let findAll = (req, res, next) => {
    let name = req.query.name;
    let params = [];
    let sql;
    if (name) {
        sql = `
            SELECT id, first_name, last_name, dob, title, department, phone, mobile_phone, email, pic, city, state FROM employee
            WHERE lower(first_name) || ' ' || lower(last_name) LIKE $1 ORDER BY last_name, first_name LIMIT 20`;
        params.push("%" + name.toLowerCase() + "%");
    } else {
        sql = `SELECT id, first_name, last_name, dob, title, department, phone, mobile_phone, email, pic, city, state FROM employee ORDER BY last_update DESC LIMIT 20`;
    }
    db.query(sql, params)
        .then(result => res.json(result))
        .catch(next);
};

let findByName = (req, res, next) => {
    let name = req.params.name;
    let sql;
    sql = `
        SELECT id, first_name, last_name, dob, title, department, phone, mobile_phone, email, pic, city, state FROM employee
        WHERE lower(first_name) || ' ' || lower(last_name) LIKE $1 ORDER BY last_name, first_name LIMIT 20`;
    params.push("%" + name.toLowerCase() + "%");
    db.query(sql, params)
        .then(result => res.json(result))
        .catch(next);
};

let findById = (req, res, next) => {
    let id = req.params.id;
    let sql = "SELECT * FROM employee WHERE id=$1";
    db.query(sql, [parseInt(id)])
        .then(employees =>  res.json(employees[0]))
        .catch(next);
};

let createItem = (req, res, next) => {
    let employee = req.body;
    let sql = `
        INSERT INTO employee
            (first_name, last_name, address, city, state, zip, dob, phone, mobile_phone, email, pic)
        VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)
        RETURNING id`;
    db.query(sql, [employee.first_name, employee.last_name, employee.address, employee.city, employee.state, employee.zip,
                   employee.dob, employee.phone, employee.mobile_phone, employee.email, employee.pic])
        .then(result => {
            console.log(result);
            res.json(result[0])
        })
        .catch(next);
};

let updateItem = (req, res, next) => {
    let employee = req.body;
    let sql = `UPDATE employee SET first_name=$1, last_name=$2, address=$3, city=$4, state=$5, zip=$6, dob=$7, phone=$8,
                mobile_phone=$9, email=$10, pic=$11, last_update=current_timestamp WHERE id=$12`;
    db.query(sql, [employee.first_name, employee.last_name, employee.address, employee.city, employee.state, employee.zip,
        employee.dob, employee.phone, employee.mobile_phone, employee.email, employee.pic, employee.id])
        .then(() => res.send({result: 'ok'}))
        .catch(next);
};

let deleteItem = (req, res, next) => {
    let employeeId = req.params.id;
    db.query('DELETE FROM employee WHERE id=$1', [employeeId], true)
        .then(() =>res.send({result: 'ok'}))
        .catch(next);
};

exports.findAll = findAll;
exports.findByName = findByName;
exports.findById = findById;
exports.createItem = createItem;
exports.updateItem = updateItem;
exports.deleteItem = deleteItem;
