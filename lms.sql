create table lms.login(login_id varchar(20) primary key,user_type varchar(20),password varchar(20)); 

create table lms.department(dept_code varchar(5) primary key,dept_name varchar(20),permitted_no_of_leaves bigint,no_of_employees bigint,no_of_working_days bigint); 

create table lms.payroll(payroll_id varchar(5),month_year varchar(20),effect_on_payroll bigint,salary bigint,tax bigint,payment_id varchar(5),payment_type varchar(20),primary key(payroll_id)); 

create table lms.city_state(city varchar(20) primary key,state varchar(20)); 

create table lms.pincode_city(pincode bigint(6) primary key,city varchar(20),foreign key(city) references lms.city_state(city)); 

create table lms.desg(designation varchar(20) not null,job_code varchar(5) not null,primary key(designation,job_code)); 

create table lms.employee(emp_id varchar(5),first_name varchar(20),middle_name varchar(20),last_name varchar(20),gender varchar(1),job_code varchar(5),dob date,door_no bigint,street_name varchar(20),marital_status varchar(1),no_of_days_worked bigint,dept_code varchar(5),pincode bigint(6),payroll_id varchar(5),dept_name varchar(20),designation varchar(20),login_id varchar(20),primary key(emp_id),foreign key (pincode) references pincode_city(pincode),foreign key (payroll_id) references lms.payroll(payroll_id), foreign key (dept_code) references lms.department(dept_code),foreign key (login_id) references lms.login(login_id)); 

create table lms.emp_join(emp_id varchar(5) unique not null,dept_code varchar(5) not null,hire_date date,join_date date,branch_name varchar(20),foreign key(dept_code) references lms.department(dept_code),foreign key(emp_id) references lms.employee(emp_id));

create table lms.emp_pay(emp_id varchar(5) unique not null,payroll_id varchar(5),salary_per_hour bigint,no_of_hours bigint,foreign key(emp_id) references lms.employee(emp_id),foreign key(payroll_id) references lms.payroll(payroll_id)); 

create table lms.emp_sys(emp_id varchar(5) unique not null,user_type varchar(20) not null,system_code varchar(5),manager_id varchar(5),foreign key(emp_id) references lms.employee(emp_id)); 

create table lms.main_table(emp_id varchar(5) not null,leave_id varchar(5),month_year varchar(20),mail_id varchar(20),phone_no bigint(10),primary key(leave_id,month_year),foreign key(emp_id) references lms.employee(emp_id)); 

create table lms.emp_phone(emp_id varchar(5),phone_no bigint(10),unique(emp_id,phone_no),foreign key(emp_id) references lms.employee (emp_id)); 

create table lms.emp_mail(emp_id varchar(5),mail_id varchar(20),unique(emp_id,mail_id),foreign key(emp_id) references lms.employee (emp_id)); 

create table lms.pay_ins(payroll_id varchar(5),dept_code varchar(5),insurance_id varchar(5),insurance_type varchar(20),unique(payroll_id,dept_code),foreign key(payroll_id) references lms.payroll(payroll_id),foreign key(dept_code) references lms.department(dept_code)); 

create table lms.leave_type_details(leave_type_code varchar(5),leave_type varchar(20),leave_pay bigint,primary key(leave_type_code,leave_type)); 

create table lms.leave_history(emp_id varchar(5),month_year varchar(20),leaves_approved bigint,leaves_rejected bigint,leaves_taken bigint,unique(emp_id,month_year),foreign key(emp_id) references lms.employee(emp_id)); 

create table lms.leave_details(leave_id varchar(5),leave_type varchar(20),start_date date,end_date date,reason varchar(30),status varchar(20),admin_feedback varchar(30),date_of_feedback date,primary key(leave_id)); 

create table lms.dept_leave(dept_code varchar(5) not null,month_year varchar(20),no_of_employees_on_leave bigint,unique(dept_code,month_year),foreign key(dept_code) references lms.department(dept_code));







insert into lms.department values('FI101','Finance',5,20,25);
insert into lms.department values('AM101','Administration',2,15,28);
insert into lms.department values('HR101','HR',3,15,27);
insert into lms.department values('PR101','Production',5,20,25);
insert into lms.department values('MR101','Marketing',5,20,25);

insert into lms.desg values('Programmer','P111');
insert into lms.desg values('Manager','M111');
insert into lms.desg values('System admin','S111');
insert into lms.desg values('Developer','D111');
insert into lms.desg values('Executive','E111');

insert into lms.leave_type_details values('EL101','Earned leave',500);
insert into lms.leave_type_details values('CL101','Casual leave',300);
insert into lms.leave_type_details values('ML101','Medical leave',1000);
insert into lms.leave_type_details values('HL101','Half-pay leave',2000);
insert into lms.leave_type_details values('MT101','Maternity leave',2000);
insert into lms.leave_type_details values('MA101','Marriage leave',500);
insert into lms.leave_type_details values('VL101','Vacation leave',300);
insert into lms.leave_type_details values('SL101','Sabbatical leave',1000);
insert into lms.leave_type_details values('LL101','Lockdown leave',300);

insert into lms.city_state values('Coimbatore','Tamilnadu');
insert into lms.city_state values('Chennai','Tamilnadu');
insert into lms.city_state values('Bangalore','Karnataka');
insert into lms.city_state values('Hyderabad','Telangana');
insert into lms.city_state values('Kochi','Kerala');

insert into lms.pincode_city values(641024,'Coimbatore');
insert into lms.pincode_city values(600018,'Chennai');
insert into lms.pincode_city values(560025,'Bangalore');
insert into lms.pincode_city values(500040,'Hyderabad');
insert into lms.pincode_city values(682011,'Kochi');



INSERT INTO lms.login VALUES ("CB.EN.U4CSE19131","Meenaksshi","EMPLOYEE");
INSERT INTO lms.login VALUES ("CB.EN.U4CSE19142","Harinya_Devi","EMPLOYEE");
INSERT INTO lms.login VALUES ("CB.EN.U4CSE19144","Sangeerthana","EMPLOYEE");
INSERT INTO lms.login VALUES ("CB.EN.U4CSE19118","Sri_Kavya","EMPLOYEE");

UPDATE lms.login SET User_Type = "HR_MANAGER" WHERE login_id = "CB.EN.U4CSE19131";
UPDATE lms.login SET User_Type = "HR_MANAGER" WHERE login_id = "CB.EN.U4CSE19142";
UPDATE lms.login SET User_Type = "HR_MANAGER" WHERE login_id = "CB.EN.U4CSE19144";
UPDATE lms.login SET User_Type = "HR_MANAGER" WHERE login_id = "CB.EN.U4CSE19118";


insert into lms.login values("CB.EN.U4CSE19101",'ramchandra_dasha','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19102",'armaan_malik','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19103",'arijit_singh','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19104",'sonu_nigam','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19105",'honey_singh','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19106",'ankit_tiwari','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19107",'rahat_khan','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19108",'neha_kakkar','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19109",'jonita_gandhi','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19110",'alka_yagnik','EMPLOYEE');
insert into lms.login values("CB.EN.U4CSE19111",'shasha_tirupati','EMPLOYEE');


insert into lms.payroll values('RC101','Jan-2020',2000,25000,10000,'JR111','cash');
insert into lms.payroll values('AR101','Jan-2020',1000,30000,10000,'JA111','cheque');
insert into lms.payroll values('AS101','Jan-2020',500,28000,10000,'JA112','deposit');
insert into lms.payroll values('SN101','Jan-2020',1000,35000,12000,'JS111','gpay');
insert into lms.payroll values('HS101','Jan-2020',1500,40000,15000,'JH111','credit');
insert into lms.payroll values('AT101','Jan-2020',2500,50000,20000,'JA113','cash');
insert into lms.payroll values('RK101','Jan-2020',3000,43000,20000,'JR112','gpay');
insert into lms.payroll values('NK101','Jan-2020',3200,22000,10000,'JN111','deposit');
insert into lms.payroll values('JG101','Jan-2020',1000,42000,20000,'JJ111','cheque');
insert into lms.payroll values('AY101','Jan-2020',1300,44000,20000,'JA114','credit');
insert into lms.payroll values('ST101','Jan-2020',1200,45000,20000,'JS112','gpay');
insert into lms.payroll values('AY101','Jan-2020',1300,44000,20000,'JA114','credit');

insert into lms.employee values('P1101','Ram','Chandra','Anand','M','P111','1990-01-01',20,'Ayodhya Street','Y',25,'PR101',641024,'RC101','Production','Programmer','CB.EN.U4CSE19101');
insert into lms.employee values('E1101','Armaan','B','Malik','M','E111','1992-06-02',65,'Brigade Road','N',26,'MR101',600018,'AR101','Marketing','Executive','CB.EN.U4CSE19102');
insert into lms.employee values('S1101','Arijit','Sanu','Singh','M','S111','1989-03-26',118,'Chickpet Street','Y',25,'AM101',560025,'AS101','Administration','System admin','CB.EN.U4CSE19103');
insert into lms.employee values('D1101','Sonu','T','Nigam','M','D111','1985-04-11',78,'Avenue Street','N',24,'HR101',500040,'SN101','HR','Developer','CB.EN.U4CSE19104');
insert into lms.employee values('M1101','Honey','Yo','Singh','M','M111','1992-11-30',12,'Residency Road','Y',28,'AM101',682011,'HS101','Administration','Manager','CB.EN.U4CSE19105');
insert into lms.employee values('E1102','Ankit','T','Tiwari','M','E111','1990-12-15',37,'Abids Street','N',30,'FI101',641024,'AT101','Finance','Executive','CB.EN.U4CSE19106');
insert into lms.employee values('E1103','Rahat','Fateh','Khan','M','E111','1989-08-19',28,'Nizam Avenue','Y',28,'MR101',600018,'RK101','Marketing','Executive','CB.EN.U4CSE19107');
insert into lms.employee values('A1102','Neha','A','Kakkar','F','M111','1993-02-23',113,'Shree Avenue','N',29,'AM101',560025,'NK101','Administration','Manager','CB.EN.U4CSE19108');
insert into lms.employee values('H1101','Jonita','P','Gandhi','F','D111','1988-02-05',145,'Infopark Layout','Y',22,'HR101',500040,'JG101','HR','Developer','CB.EN.U4CSE19109');
insert into lms.employee values('E1104','Alka','Yag','Yagnik','F','E111','1987-06-18',87,'Prince Layout','N',28,'FI101',682011,'AY101','Finance','Executive','CB.EN.U4CSE19110');


insert into lms.pay_ins values('RC101','PR101','IR101','Health');
insert into lms.pay_ins values('AR101','MR101','IA101','Property');
insert into lms.pay_ins values('AS101','AM101','IA102','Travel');
insert into lms.pay_ins values('SN101','HR101','IS101','Vehicle');
insert into lms.pay_ins values('HS101','AM101','IH101','Rent');
insert into lms.pay_ins values('AT101','FI101','IA103','Health');
insert into lms.pay_ins values('RK101','MR101','IR101','Property');
insert into lms.pay_ins values('NK101','AM101','IN101','Travel');
insert into lms.pay_ins values('JG101','HR101','IJ101','Vehicle');
insert into lms.pay_ins values('AY101','FI101','IA104','Rent');

insert into lms.emp_phone values('P1101',9876549309);
insert into lms.emp_phone values('E1101',7596038277);
insert into lms.emp_phone values('S1101',8495739937);
insert into lms.emp_phone values('D1101',9503857428);
insert into lms.emp_phone values('M1101',9744264889);
insert into lms.emp_phone values('E1102',7496392578);
insert into lms.emp_phone values('E1103',9218742900);
insert into lms.emp_phone values('A1102',9173527950);
insert into lms.emp_phone values('H1101',9485628890);
insert into lms.emp_phone values('E1104',7492929184);

insert into lms.emp_mail values('P1101','ramchadra@gmail.com');
insert into lms.emp_mail values('E1101','armaan@gmail.com');
insert into lms.emp_mail values('S1101','arijit@gmail.com');
insert into lms.emp_mail values('D1101','sonunigam@gmail.com');
insert into lms.emp_mail values('M1101','honey@gmail.com');
insert into lms.emp_mail values('E1102','ankit@gmail.com');
insert into lms.emp_mail values('E1103','rahatkhan@gmail.com');
insert into lms.emp_mail values('A1102','neha@gmail.com');
insert into lms.emp_mail values('H1101','jonita@gmail.com');
insert into lms.emp_mail values('E1104','alka@gmail.com');

insert into lms.emp_join values('P1101','PR101','2005-01-01','2005-01-10','Cbe');
insert into lms.emp_join values('E1101','MR101','2005-01-02','2005-02-11','Blr');
insert into lms.emp_join values('S1101','AM101','2005-01-02','2005-01-03','Blr');
insert into lms.emp_join values('D1101','HR101','2005-01-04','2005-01-10','Kochi');
insert into lms.emp_join values('M1101','AM101','2005-01-01','2005-01-11','Che');
insert into lms.emp_join values('E1102','FI101','2005-01-04','2005-01-12','Hyd');
insert into lms.emp_join values('E1103','MR101','2005-01-03','2005-01-14','Cbe');
insert into lms.emp_join values('A1102','AM101','2005-01-02','2005-01-15','Blr');
insert into lms.emp_join values('H1101','HR101','2005-01-05','2005-01-10','Che');
insert into lms.emp_join values('E1104','FI101','2005-01-06','2005-01-12','Kochi');

insert into lms.emp_pay values('P1101','RC101',2000,10);
insert into lms.emp_pay values('E1101','AR101',1000,8);
insert into lms.emp_pay values('S1101','AS101',500,8);
insert into lms.emp_pay values('D1101','SN101',1000,10);
insert into lms.emp_pay values('M1101','HS101',1500,11);
insert into lms.emp_pay values('E1102','AT101',2500,10);
insert into lms.emp_pay values('E1103','RK101',3000,7);
insert into lms.emp_pay values('A1102','NK101',3200,8);
insert into lms.emp_pay values('H1101','JG101',1000,10);
insert into lms.emp_pay values('E1104','AY101',1300,11);

insert into lms.emp_sys values('P1101','emp','S111','M1101');
insert into lms.emp_sys values('E1101','emp','S112','A1102');
insert into lms.emp_sys values('S1101','admin','S113','M1101');
insert into lms.emp_sys values('D1101','HR','S114','A1102');
insert into lms.emp_sys values('M1101','admin','S115','M1101');
insert into lms.emp_sys values('E1102','emp','S116','A1102');
insert into lms.emp_sys values('E1103','emp','S117','M1101');
insert into lms.emp_sys values('A1102','admin','S118','A1102');
insert into lms.emp_sys values('H1101','HR','S119','M1101');
insert into lms.emp_sys values('E1104','emp','S110','M1101');

insert into lms.dept_leave values('FI101','Jan-2020',4);
insert into lms.dept_leave values('AM101','Jan-2020',3);
insert into lms.dept_leave values('HR101','Jan-2020',5);
insert into lms.dept_leave values('PR101','Jan-2020',2);
insert into lms.dept_leave values('MR101','Jan-2020',4);


insert into lms.leave_details values('LEE01','Earned leave','2020-01-25','2020-01-27','Family function','Accepted','Reason valid','2020-01-24');
insert into lms.leave_details values('LCH01','Casual leave','2020-01-15','2020-01-16','Break from work','Accepted','Reason valid','2020-01-14');
insert into lms.leave_details values('LMD01','Medical leave','2020-01-03','2020-01-06','Health issues','Accepted','Reason valid','2020-01-03');
insert into lms.leave_details values('LVE02','Vacation leave','2020-01-10','2020-01-20','Foreign Vacation','Not accepted','Long break','2020-01-09');
insert into lms.leave_details values('LLP01','Lockdown leave','2020-01-07','2020-01-27','Lockdown in residing area','Not accepted','Work from home granted','2020-01-08');
insert into lms.leave_details values('LMH01','Marriage leave','2020-01-22','2020-01-25','Marriage','Accepted','Reason valid','2020-01-20');
insert into lms.leave_details values('LME04','Medical leave','2020-01-11','2020-01-23','Health reasons','Accepted','Reason valid','2020-01-10');


insert into lms.leave_history values('P1101','Jan-2020',2,0,2);
insert into lms.leave_history values('E1101','Jan-2020',3,1,4);
insert into lms.leave_history values('S1101','Jan-2020',5,0,5);
insert into lms.leave_history values('D1101','Jan-2020',1,0,1);
insert into lms.leave_history values('M1101','Jan-2020',3,2,5);
insert into lms.leave_history values('E1102','Jan-2020',1,1,2);
insert into lms.leave_history values('E1103','Jan-2020',3,0,3);
insert into lms.leave_history values('A1102','Jan-2020',0,0,0);
insert into lms.leave_history values('H1101','Jan-2020',0,1,1);
insert into lms.leave_history values('E1104','Jan-2020',2,2,4);


insert into lms.main_table values('E1101','LEE01','Jan-2020','armaan@gmail.com',7596038277);
insert into lms.main_table values('H1101','LCH01','Jan-2020','jonita@gmail.com',9485628890);
insert into lms.main_table values('D1101','LMD01','Jan-2020','sonunigam@gmail.com',9503857428);
insert into lms.main_table values('E1102','LVE02','Jan-2020','ankit@gmail.com',7496392578);
insert into lms.main_table values('P1101','LLP01','Jan-2020','ramchadra@gmail.com',9876549309);
insert into lms.main_table values('H1101','LMH01','Jan-2020','jonita@gmail.com',9485628890);
insert into lms.main_table values('E1104','LME04','Jan-2020','alka@gmail.com',7492929184);

select * from lms.emp_phone;
