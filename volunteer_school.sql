DROP TABLE child cascade constraints;
DROP TABLE referring_org cascade constraints;
DROP TABLE school cascade constraints;
DROP TABLE volunteer cascade constraints;
DROP TABLE place cascade constraints;
DROP TABLE course cascade constraints;
DROP TABLE special_need cascade constraints;
DROP TABLE course_times;
DROP TABLE ref_ph_nums cascade constraints;
DROP TABLE parent cascade constraints;
DROP TABLE teaches;
DROP TABLE cared_for_by;
DROP TABLE attends;


CREATE TABLE place
(pname    VARCHAR2(15)       PRIMARY KEY,
num_seat INT
);

INSERT INTO place VALUES
('North Wing', 20);
INSERT INTO place VALUES
('East Wing', 15);
INSERT INTO place VALUES
('West Wing', 25);
INSERT INTO place VALUES
('Room A', 12);
INSERT INTO place VALUES
('Room B', 12);
INSERT INTO place VALUES
('Room C', 12);
INSERT INTO place VALUES
('Atrium', 35);


CREATE TABLE course
(course_name VARCHAR2(40)    NOT NULL,
course_id   INT             PRIMARY KEY,
fee         NUMBER(8,2),    
numstudents INT,
plocation   VARCHAR(15)
CONSTRAINT plocation_cnst REFERENCES place(pname) DISABLE
);

INSERT INTO course VALUES
('Robotics',1000,20,20, 'North Wing');
INSERT INTO course VALUES
('CodeClub',1001,0,12, 'Room A');
INSERT INTO course VALUES
('CodeClub',1002,0,12, 'Room B');
INSERT INTO course VALUES
('CodeClub',1003,0,12, 'Room C');
INSERT INTO course VALUES
('CodeClub',1004,0,12, 'East Wing');
INSERT INTO course VALUES
('Web Design',1005,25,25, 'West Wing');
INSERT INTO course VALUES
('Video Editing',1006,30,12, 'Room A');
INSERT INTO course VALUES
('Game Design and Programming',1007,12,35, 'Atrium');
INSERT INTO course VALUES
('Digital Art',1008,24,12, 'Atrium');
INSERT INTO course VALUES
('CodeClub',1009,0,12, 'East Wing');


CREATE TABLE course_times
(cid INT  REFERENCES course(course_id),
ctime    DATE
);



INSERT INTO course_times VALUES
(1000, TO_DATE('July-16-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-23-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-30-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('August-6-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('August-13-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('August-20-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-13-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-13-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-13-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));
INSERT INTO course_times VALUES
(1000, TO_DATE('July-13-2016 14:00', 'MONTH-DD-YYYY HH24:MI'));



CREATE TABLE referring_org
(rname VARCHAR2(25) PRIMARY KEY,
address VARCHAR2(30),
is_gov INT);

INSERT INTO referring_org VALUES
('Work and Income', '129 Hillside Road', 0);
INSERT INTO referring_org VALUES
('Special Services', '500 Edgar Road', 1);
INSERT INTO referring_org VALUES
('Social Services', '339 Rollings Road', 0);
INSERT INTO referring_org VALUES
('Health Services', '339 Rollings Road', 0);



CREATE TABLE ref_ph_nums
(rname    VARCHAR2(25)       NOT NULL
CONSTRAINT rname_cnst REFERENCES referring_org(rname) DISABLE,
ph_num   VARCHAR2(10)       UNIQUE
);

INSERT INTO ref_ph_nums VALUES
('Work and Income', '08005900');
INSERT INTO ref_ph_nums VALUES
('Special Services', '083562123');
INSERT INTO ref_ph_nums VALUES
('Social Services', '013567213');
INSERT INTO ref_ph_nums VALUES
('Health Services', '093135672');


CREATE TABLE school
(sname    VARCHAR2(15)       PRIMARY KEY,
address  VARCHAR2(30),
ph_num   VARCHAR2(10)
);

INSERT INTO school VALUES
('Otago High', 'High St Dunedin', '0800123456');
INSERT INTO school VALUES
('Hogwarts', 'Kings St Dunedin', '0814562156');
INSERT INTO school VALUES
('O School', 'Forth St Dunedin', '096321456');

CREATE TABLE volunteer
(vid         INT         PRIMARY KEY,
fname    VARCHAR2(15) NOT NULL,
minit    CHAR,
lname    VARCHAR2(15) NOT NULL,
ph_num      VARCHAR2(10)    UNIQUE
);

INSERT INTO volunteer VALUES
(12223987, 'John', 'M', 'Smith', '0210987328');
INSERT INTO volunteer VALUES
(63252217, 'Dick', 'L', 'Smith', '0525157328');
INSERT INTO volunteer VALUES
(140394987, 'Jate', 'A', 'Li', '056781328');



CREATE TABLE child
(cid         INT             PRIMARY KEY,
fname    VARCHAR2(15) NOT NULL,
minit    CHAR,
lname    VARCHAR2(15) NOT NULL,
bdate       DATE,
address     VARCHAR2(30),
year_level  INT,
gender      CHAR,
ref_name    VARCHAR2(25)
CONSTRAINT ref_name_cnst REFERENCES referring_org(rname) DISABLE,
sname       VARCHAR(15)
CONSTRAINT sname_cnst REFERENCES school(sname) DISABLE,
vid         INT              NOT NULL
CONSTRAINT vid_cnst REFERENCES volunteer(vid) DISABLE
);


INSERT INTO child VALUES
('1','Rose', 'M', 'Ahn', TO_DATE('09-06-2005', 'DD-MM-YYYY'),'123 High St Dunedin', 7, 'F', 'Work and Income',
'Otago High',12223987);
INSERT INTO child VALUES
('2','Mark', 'J', 'Cullen', TO_DATE('10-03-2005', 'DD-MM-YYYY'),'29 Great King St Dunedin', 7, 'M', 'Social Services', 'O School', 12223987);
INSERT INTO child VALUES
('3','Jason', 'R', 'Roberts', TO_DATE('14-05-2009', 'DD-MM-YYYY'),'10 Filleul St Dunedin', 8, 'M', 'Health Services', 'Hogwarts', 12223987);
INSERT INTO child VALUES
('4','Jeff', 'R', 'Oldman', TO_DATE('14-05-2007', 'DD-MM-YYYY'),'9 Filleul St Dunedin', 8, 'M', 'Health Services', 'Hogwarts',140394987);



CREATE TABLE parent
(fname    VARCHAR2(15) NOT NULL,
minit    CHAR,
lname    VARCHAR2(15) NOT NULL,
phone_number VARCHAR2(12) PRIMARY KEY,
child_id    INT              NOT NULL
CONSTRAINT child_id_cnst REFERENCES child(cid) DISABLE
);

Insert INTO parent VALUES
('Richie', 'K', 'Ahn','0227850999', 1);
Insert INTO parent VALUES
('Anne', 'K', 'Ahn','0227857999', 2);
Insert INTO parent VALUES
('Sakura', 'J', 'Yamada','0217857999', 1);

CREATE TABLE special_need
(sn_name  VARCHAR2(15),
note     VARCHAR2(160),
child_id INT                REFERENCES child(cid),
PRIMARY KEY(child_id, sn_name)
);

INSERT INTO special_need VALUES
('Dyslexia', 'Be gentle', 1);

CREATE TABLE cared_for_by
(
child_id INT                REFERENCES child(cid),
parent_number VARCHAR2(12)         REFERENCES parent(phone_number),
PRIMARY KEY(child_id, parent_number)
);

CREATE TABLE teaches
(
vid   INT REFERENCES volunteer(vid),
course_id INT REFERENCES course(course_id),
PRIMARY KEY(vid, course_id)
);

CREATE TABLE attends
(
attends_child_id INT REFERENCES child(cid),
attends_course_id INT REFERENCES course(course_id),
PRIMARY KEY(attends_child_id)
);

INSERT INTO attends VALUES
(1, 1000);
INSERT INTO attends VALUES
(2, 1000);



ALTER TABLE child ENABLE constraint ref_name_cnst;
ALTER TABLE child ENABLE constraint sname_cnst;
ALTER TABLE child ENABLE constraint vid_cnst;
ALTER TABLE course ENABLE constraint plocation_cnst;
ALTER TABLE ref_ph_nums ENABLE CONSTRAINT rname_cnst;
ALTER TABLE parent ENABLE CONSTRAINT child_id_cnst;


COMMIT;

        
