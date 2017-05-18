drop table IF EXISTS course;
drop table IF EXISTS employee;
drop table IF EXISTS teacher;


CREATE TABLE IF NOT EXISTS employee (
    id              SERIAL PRIMARY KEY,
    first_name      TEXT,
    last_name       TEXT,
    title           TEXT,
    department      TEXT,
    address         TEXT,
    city            TEXT,
    state           TEXT,
    zip             TEXT,
    dob             DATE,
    phone           TEXT,
    mobile_phone    TEXT,
    email           TEXT,
    pic             TEXT,
    registration    TIMESTAMP default current_timestamp,
    last_update     TIMESTAMP default current_timestamp
  );

CREATE TABLE IF NOT EXISTS teacher (
    id              SERIAL PRIMARY KEY,
    first_name      TEXT,
    last_name       TEXT,
    address         TEXT,
    city            TEXT,
    state           TEXT,
    zip             TEXT,
    title           TEXT,
    phone           TEXT,
    mobile_phone    TEXT,
    email           TEXT,
    pic             TEXT
  );



CREATE TABLE IF NOT EXISTS course (
    id              SERIAL PRIMARY KEY,
    code            TEXT,
    name            TEXT,
    credits         integer,
    period_id       integer,
    teacher_id      integer REFERENCES teacher(id) ON DELETE CASCADE
  );



INSERT INTO employee (first_name, last_name, address, city, state, zip, dob, phone, mobile_phone, email, pic, registration, title, department) VALUES
('Camila', 'Martinez', '18 Henry st', 'Cambridge', 'MA', '01742', '1995/09/07', '617-985-6955', '617-666-5555', 'cmartinez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/camila_martinez.jpg', '2012/07/14','Kidemli Uzman','RYM'),
('Cassandra', 'Bowman', '56 Broad st', 'San Francisco', 'CA', '01742', '1994/12/08', '781-458-8541', '617-987-6543', 'cbowman@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/cassandra_bowman.jpg', '2012/07/14','Uzman Yard','UGM'),
('Catherine', 'Hansen', '52 Elm st', 'Boston', 'MA', '01742', '1993/01/02', '404-986-356', '857-584-654', 'chansen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/catherine_hansen.jpg', '2012/07/14','Uzman Yard','SIM'),
('Cindy', 'Curtis', '101 Massachusetts Avenue', 'Seattle', 'WA', '01742', '1995/02/27', '212-854-6354', '212-963-8521', 'ccurtis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/cindy_curtis.jpg', '2012/07/14','Uzman Yard','UGM'),
('Claire', 'Chapman', '3 Oak st', 'Chicago', 'IL', '01742', '1996/03/24', '508-987-6541', '508-852-3222', 'cchapman@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/claire_chapman.jpg', '2012/07/14','Uzman','UGM'),
('Claudia', 'Leonard', '56 Chestnut st', 'Burlington', 'VT', '01742', '1992/04/18', '415-985-9632', '415-987-6655', 'cleonard@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/claudia_leonard.jpg', '2012/07/14','Uzman','RYM'),
('Diego', 'Costa', '24 Belmont st', 'Houston', 'TX', '01742', '1993/05/20', '521-988-2255', '521-886-6688', 'dcosta@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/diego_costa.jpg', '2012/07/14','Uzman Yard','UGM'),
('Elsa', 'Olson', '85 Boylston st', 'Fort Lauderdale', 'FL', '01742', '1995/06/01', '234-996-7412', '234-852-9632', 'eolson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/elsa_olson.jpg', '2012/07/14','Uzman Yard','UGM'),
('Finn', 'Cunningham', '47 Main st', 'Tampa', 'FL', '01742', '1996/07/24', '643-258-8521', '643-965-6322', 'fcunningham@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/finn_cunningham.jpg', '2012/07/14','Uzman Yard','UGM'),
('Greg', 'Matthews', '18 Nevada st', 'Denver', 'CO', '01742', '1995/08/11', '412-985-2241', '412-963-8547', 'gmatthews@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/greg_matthews.jpg', '2012/07/14','Kidemli Uzman','SIM'),
('Hector', 'Reyes', '147 California st', 'Providence', 'RI', '01742', '1994/09/29', '507-854-9632', '507-525-6363', 'hreyes@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/hector_reyes.jpg', '2012/07/14','Kidemli Uzman','RYM'),
('James', 'Alexander', '28 Trapelo Road st', 'Hartford', 'CT', '01742', '1993/10/21', '593-968-7468', '593-691-3791', 'jalexander@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/james_alexander.jpg', '2012/07/14','Uzman','UGM'),
('Jens', 'Henderson', '123 Washington st', 'Los Angeles', 'CA', '01742', '1992/11/03', '603-873-9562', '603-253-6548', 'jhenderson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jens_henderson.jpg', '2012/07/14','Uzman','UGM'),
('John', 'Bailey', '85 Concord Ave', 'San Diego', 'CA', '01742', '1993/12/31', '752-961-1212', '752-623-6741', 'jbailey@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/john_bailey.jpg', '2012/07/14','Kidemli Uzman','UGM'),
('Jonathan', 'Rogers', '85 Boylston st', 'Detroit', 'MI', '01742', '1992/01/02', '803-256-9617', '803-625-5544', 'jrogers@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jonathan_rogers.jpg', '2012/07/14','Uzman Yard','UGM'),
('Justin', 'Scott', '458 Federal st', 'Columbus', 'OH', '01742', '1993/02/04', '241-854-3591', '241-632-8246', 'jscott@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/justin_scott.jpg', '2012/07/14','Kidemli Uzman','UGM'),
('Linda', 'Lewis', '145 Gloucester st', 'Endicott', 'NY', '01742', '1994/03/15', '331-658-3254', '331-586-9637', 'llewis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/linda_lewis.jpg', '2012/07/14','Uzman','UGM'),
('Lori', 'Anderson', '523 Arlington st', 'Atlanta', 'GA', '01742', '1995/04/22', '498-683-1754', '498-685-6322', 'landerson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/lori_anderson.jpg', '2012/07/14','Uzman','UGM'),
('Luisa', 'Vasquez', '28 Clarendon st', 'New Orleans', 'LA', '01742', '1996/05/14', '578-963-5214', '578-641-8799', 'lvasquez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/luisa_vasquez.jpg', '2012/07/14','Uzman Yard','RYM'),
('Lynn', 'Martin', '78 Exeter st', 'Madison', 'WI', '01742', '1992/06/20', '603-963-8855', '603-256-8741', 'lmartin@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/lynn_martin.jpg', '2012/07/14','Kidemli Uzman','RYM'),
('Mark', 'Davis', '54 Fairfield st', 'Boston', 'MA', '01742', '1993/07/18', '752-634-8799', '752-967-2511', 'mdavis@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/mark_davis.jpg', '2012/07/14','Uzman','SIM'),
('Peter', 'Jacobson', '47 Market st', 'Des Moines', 'IA', '01742', '1994/08/23', '821-635-4411', '821-635-5741', 'pjacobson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/peter_jacobson.jpg', '2012/07/14','Uzman Yard','SIM'),
('Phil', 'Harris', '125 Davis st', 'Boston', 'MA', '01742', '1995/09/01', '285-325-6431', '285-635-5877', 'pharris@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/phil_harris.jpg', '2012/07/14','Uzman','RYM'),
('Rebecca', 'Gutierrez', '85 Walnut st', 'Portland', 'OR', '01742', '1996/10/10', '352-658-9741', '352-981-8462', 'rgutierrez@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/rebecca_gutierrez.jpg', '2012/07/14','Uzman','SIM'),
('Robert', 'Wilson', '145 Lexington st', 'Newark', 'NJ', '01742', '1992/11/24', '475-658-9988', '475-958-6714', 'rwilson@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/robert_wilson.jpg', '2012/07/14','Uzman Yard','SIM'),
('Sophie', 'Miller', '21 Webster st', 'Las Vegas', 'NV', '01742', '1993/12/08', '518-983-5473', '518-472-3255', 'smiller@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/sophie_miller.jpg', '2012/07/14','Uzman','SIM'),
('Tammy', 'Robinson', '56 Summer st', 'Boston', 'MA', '01742', '1994/01/16', '678-256-3796', '678-354-2282', 'ogreen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/tammy_robinson.jpg', '2012/07/14','Uzman Yard','SIM'),
('Valerie', 'Johnston', '24 Powels st', 'Cambridge', 'MA', '01742', '1995/02/19', '708-654-3214', '708-685-3522', 'vjohnston@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/valerie_johnston.jpg', '2012/07/14', 'Servis Yoneticisi', 'UGM');

INSERT INTO teacher (first_name, last_name, address, city, state, zip, title, phone, mobile_phone, email, pic) VALUES
('Tanya', 'Sharma', '18 Henry st', 'Cambridge', 'MA', '01742', 'PHD', '617-985-6955', '617-666-5555', 'tsharma@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/tanya_sharma.jpg'),
('Miriam', 'Aupont', '56 Broad st', 'Cambridge', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'maupont@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/miriam_aupont.jpg'),
('Jonathan', 'Bradley', '52 Elm st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'jbradley@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/jonathan_bradley.jpg'),
('Anup', 'Gupta', '101 Massachusetts Avenue', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'agupta@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/anup_gupta.jpg'),
('Kenneth', 'Sato', '3 Oak st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ksato@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/kenneth_sato.jpg'),
('James', 'Kennedy', '56 Chestnut st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'jkennedy@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/james_kennedy.jpg'),
('Amy', 'Taylor', '24 Belmont st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ataylor@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/amy_taylor.jpg'),
('Olivia', 'Green', '85 Boylston st', 'Boston', 'MA', '01742', 'PHD', '617-123-4567', '617-987-6543', 'ogreen@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/olivia_green.jpg'),
('Michael', 'Jones', '184 Gloucester st', 'Cambridge', 'MA', '01742', 'PHD', '617-985-6955', '617-666-5555', 'mjones@fakemail.com', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/people/michael_jones.jpg');

INSERT INTO course (code, name, teacher_id, period_id, credits) VALUES
('CS101', 'Introduction to Computing', 1, 1, 4),
('CS101', 'Introduction to Computing', 1, 2, 4),
('CS101', 'Introduction to Computing', 2, 3, 4),
('CS101', 'Introduction to Computing', 2, 4, 4),
('CS103', 'Introduction to Internet Technologies and Web Programming', 3, 3, 4),
('CS103', 'Introduction to Internet Technologies and Web Programming', 3, 4, 4),
('CS105', 'Introduction to Databases and Data Mining', 4, 1, 4),
('CS105', 'Introduction to Databases and Data Mining', 4, 2, 4),
('CS118', 'Introduction to React', 6, 1, 4),
('CS118', 'Introduction to React', 6, 2, 4),
('CS118', 'Introduction to React', 6, 3, 4),
('CS118', 'Introduction to React', 6, 4, 4),
('CS119', 'Introduction to Lightning Design System', 7, 1, 4),
('CS119', 'Introduction to Lightning Design System', 7, 2, 4),
('CS119', 'Introduction to Lightning Design System', 7, 3, 4),
('CS119', 'Introduction to Lightning Design System', 7, 4, 4),
('CS125', 'Introduction to Flux', 8, 3, 4),
('CS125', 'Introduction to Flux', 8, 4, 4),
('CS120', 'Introduction to Cloud Computing', 9, 1, 4),
('CS120', 'Introduction to Cloud Computing', 9, 2, 4),
('CS120', 'Introduction to Cloud Computing', 9, 3, 4),
('CS120', 'Introduction to Cloud Computing', 9, 4, 4),
('CS121', 'Introduction to Salesforce', 1, 1, 4),
('CS121', 'Introduction to Salesforce', 1, 2, 4);
