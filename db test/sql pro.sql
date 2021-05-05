
CREATE TABLE  `JobSeeker` (
	`jobseeker_id` INT(10) NOT NULL AUTO_INCREMENT,
	`f_name` VARCHAR(255) NOT NULL,
	`l_name` VARCHAR(255) NOT NULL,
`date_of_birth` DATE,
`phone_number` VARCHAR(255),
`jobseeker_ability` TEXT NOT NULL,
`jobseeker_experience` TEXT NOT NULL,
`email` VARCHAR(255),
`username` VARCHAR(255) NOT NULL ,
`password` VARCHAR(255) NOT NULL,
PRIMARY KEY(jobseeker_id)
);


CREATE TABLE `Resume`(
	`resume_id` INT(10) NOT NULL  UNIQUE AUTO_INCREMENT,
	`resume_info` TEXT NOT NULL,
	`request_job` VARCHAR(255) NOT NULL,
	`date` DATE,
  	`image` VARCHAR(255)  NOT NULL,
  	`upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`resume_jobseeker_id` INT(10),
	PRIMARY KEY(resume_id)
);


CREATE TABLE `Job_position`(
	`job_pos_id` INT(10) NOT NULL  UNIQUE AUTO_INCREMENT,
	`job_pos_name` VARCHAR(255) NOT NULL,
	`job_pos_resume_id` INT(10),
	`job_pos_job_id` INT(10),
	PRIMARY KEY(job_pos_id)
);

CREATE TABLE `Company` (
	`company_id` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`founding_data` DATE NOT NULL,
	`company_info` TEXT NOT NULL,
	`username` VARCHAR(255),
	`password` VARCHAR(255),
	PRIMARY KEY(company_id)
);


CREATE TABLE `Request_info` (
	`req_id` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`req_date` DATE NOT NULL,
	`req_information` TEXT NOT NULL,
	`req_company_id` INT(10) NOT NULL,
	PRIMARY KEY(req_id)
);

CREATE TABLE `Request_job` (
	`req_job_id` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`req_experience` TEXT NOT NULL, 
	`req_ability` TEXT NOT NULL,
	`req_job_req_info_id` INT(10) NOT NULL,
	`req_job_job_id`INT(10) NOT NULL,
	PRIMARY KEY (req_job_id)
);

CREATE TABLE `Interview` (
	`date` DATETIME,
	`inter_request_job_id` INT(10) ,
	`inter_job_pos_id` INT(10) 
);

CREATE TABLE `Job_type` (
	`job_id` INT(10) NOT NULL UNIQUE AUTO_INCREMENT,
	`job_name` VARCHAR(255),
  	`img` VARCHAR(255),
	PRIMARY KEY (job_id)
);

ALTER TABLE `Resume`
ADD CONSTRAINT resume_jobseeker_id_fk
FOREIGN KEY (resume_jobseeker_id)
REFERENCES `JobSeeker` (jobseeker_id);

ALTER TABLE `Job_position`
ADD CONSTRAINT job_pos_resume_id_fk
FOREIGN KEY (job_pos_resume_id)
REFERENCES `Resume` (resume_id),
ADD CONSTRAINT  job_pos_job_id_fk
FOREIGN KEY (job_pos_job_id)
REFERENCES `Job_type` (job_id);

ALTER TABLE `Request_info`
ADD CONSTRAINT req_company_id_fk
FOREIGN KEY (req_company_id)
REFERENCES `Company` (company_id);

ALTER TABLE `Request_job`
ADD CONSTRAINT req_job_req_info_id_fk
FOREIGN KEY (req_job_req_info_id)
REFERENCES `Request_info` (req_id),
ADD CONSTRAINT req_job_job_id_fk
FOREIGN KEY (req_job_job_id)
REFERENCES `Job_type` (job_id);

ALTER TABLE `Interview`
ADD CONSTRAINT inter_request_job_id_fk
FOREIGN KEY (inter_request_job_id)
REFERENCES `Request_job` (req_job_id),
ADD CONSTRAINT inter_job_pos_id_fk
FOREIGN KEY (inter_job_pos_id)
REFERENCES `Job_position` (job_pos_id);


INSERT INTO JobSeeker 
(`f_name`,
`l_name`,
`date_of_birth`,
`phone_number`,
`jobseeker_ability`,
`jobseeker_experience`,
`email`,
`username`,
`password`)


VALUES
('สมหาย','หายไปเลย','1990-01-03','0813241195','ปีนต้นมะพร้าวสูง 10เมตร ตกลงมาไม่ตาย ตกตึกไม่ตาย วิ่ง 800โล ใน 5วัน ได้','ทำมาแล้วรวมๆ 20 ปี','santakub@gmail.com','santakub2544','santalove1234'),

('สมชาย','ชายแท้','1987-05-27','0943254892','ดำน้ำได้1ชั่วโมง วิดพื้น10000ครั้ง วิ่งได้ 1000 กิโล','ทำมาแล้ว 8 ปี','somchai@hotmail.com','somchai123','password'),

('นงพร','เชิดฉาย','1980-11-1','0958554723','ทำงานบ้านได้ทุกอย่าง ทำอาหารอร่อยทั้งอาหารคนอาหารสัตว์ สามารถขับรถได้ทุกประเภท ซ่อมเครื่องใช้ได้ทุกอย่าง พูดภาษาอังกฤษ จีน อีสาน เหนือ ใต้ได้','ทำงานแม่บ้าน Parttime มาแล้ว 10 ปี','super_nongporn@gmail.com','super nongporn','QuartKarvopx507+'),


('ธนชัย','กิติคุณ','1994-04-20','0846574412','ตัดต่อ รูปภาพ วิดีโอ โดย adobe  สร้าง bot Discord ได้  javascript java python c++ ทำเว็บแอปได้ พูด อังกฤษได้','ทำตัดต่อ มาแล้ว 5 ปี ทำ bot discord มาแล้ว 3 ปี ทำเว็บแอปมาแล้ว 5 ปี','thanachai1994@hotmail.com','ThanaChai','Tha7402_'),


('ชาตรี','ยาวนาน','1997-03-01','0995184382','data business, graphic design, maya, blender','ใช้ maya ออกแบบให้กับบริษัทต่างๆมากกว่า 3ปี,เป็นที่ปรึกษาให้บริษัทต่างๆมา 2ปี','chatree@hotmail.com','chatree123','chubuchubu'),

('ปรีชา','ชาไทย','1980-06-07','0943284675','CSS Javascript PHP SQL','ทำมาแล้ว 10 ปี','phecha@gmail.com','phecha321','0943284675'),

('Thongdee','Meechai','1980-01-01','0857649325','Excel, บัญชี,Word','มีประสบการณ์ทำงานบัญชีมาแล้ว 8 ปี','Thongdee@hotmail.com','thongdang123','yellowthong'),

('ธีรวุธ','เปี่ยมสุข','1992-11-17','0861142359','มนุษย์สัมพันธ์ดี, เข้ากับคนง่าย, มีความเป็นผู้นำ, business manager, พูดได้4ภาษา ไทย อังกฤษ สเปน เยอรมัน','ทำงานมาแล้ว 4 ปี','teerawut@hotmail.com','teerawut1412','wuttisak'),

('อานัน','ชัยนัด','1980-05-09','0893245792','Excel Word Photoshop Illustrator After Effects ','ทำมาแล้ว 15 ปี','arnut@hotmail.com','arnut123','123456'),

('การะแม','บินเสียดฟ้า','1995-05-27','0943254892','บัญชี ซ่อมคอม ซ่อมรถ','ไม่เคยทำ','flying_gara@hotmail.com','garamare046','manamine');




INSERT INTO Job_type(`job_name`, img)
VALUES
('Chef','https://anytimechefs.com.au/wp-content/uploads/2018/12/perth-chef-hire.jpg'), 
('Barber','https://i.pinimg.com/originals/bb/c4/2b/bbc42bce17b8960fbc9fda471f7a7c14.jpg'),
('Electrician','https://pro-consigne.org/wp-content/uploads/2020/11/262.jpg'),
('Photographer','https://www.adorama.com/alc/wp-content/uploads/2016/10/shutterstock_479016244_mezz.jpg'),
('Compositor','https://partfy.com/files/categories//dia-mundial-do-compositor-1024x668-1.jpg'),
('Dentist','https://c.files.bbci.co.uk/2291/production/_110894880_gettyimages-1055182908.jpg'),
('Musician','https://cdn.sanity.io/images/7g6d2cj1/production/6b5ebabcc318c675c2e30a4c63895249f391f3e4-1000x604.jpg?q=70&auto=format'),
('Writer','https://www.thebalancecareers.com/thmb/XUmYsfj_Z8YPFyoTzKnoX5oqoJQ=/2000x1383/filters:fill(auto,1)/writer2-172409300-58ae4fbb3df78c345b7c5b62.jpg'),
('Columnist','https://adaymagazine.com/wp-content/uploads/2020/04/Type-B_Featured-2-475x317.jpg'),
('Reporter','https://image.freepik.com/free-photo/reporter-teenager-woman-isolated-wall_1368-79746.jpg'),
('Lawyer','https://www.brokenpipeline.org/wp-content/uploads/2020/06/criminal.jpg'),
('Solicitor','https://cdn.seeklearning.com.au/media/images/career-guide/module/solicitor-module.jpg'),
('Designer','https://pearlandcyclingclub.org/wp-content/uploads/2020/05/%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%B2%E0%B8%99-interior-designer.jpg'),
('Aviator','https://dict.meemodel.com/image_word/3340.jpg'),
('Pilot','https://dict.meemodel.com/image_word/3340.jpg'),
('Journalist','https://img.collegedekhocdn.com/media/img/careers/rsz_journalist.jpg'),
('Shipwright','https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/the-shipwright-weston-westmoreland.jpg'),
('Butcher','https://goohiw.com/wp-content/uploads/2020/06/review-saha-saha-steak-and-butcher-featured.jpg'),
('Gardener','https://www.linku.com.au/wp-content/uploads/2019/11/AdobeStock_117796746-1024x683.jpeg'),
('Programmer','https://vapeshopdeal.com/wp-content/uploads/2020/07/programmer-840x600.jpg'),
('Saleman','https://www.crushpixel.com/big-static16/preview4/asian-saleman-wear-surgical-mask-2428646.jpg'),
('Graphic Design','https://inbound.cipher.co.th/wp-content/uploads/2020/02/graphic-design-1-1024x612.jpg'),
('IT Supporter','https://www.karista.de/uploads/standard_image/file/2599/at_536x402_netzwerkadministrator_jobs.jpg'),
('Delivery Driver','https://i.imgur.com/vbrgrEt.jpg'),
('Creative','https://i.imgur.com/7BHiZ2n.jpg'),
('Product Marketing','https://i.imgur.com/ku73tR4.jpg'),
('Digital Marketing','https://i.imgur.com/IA6LdNg.jpg'),
('MC','https://i.imgur.com/yIxXbHj.jpg'),
('PR Marketing','https://i.imgur.com/e4ijgAr.jpg'),
('Data Scientist','https://i.imgur.com/oArwM6n.jpg'),
('Network Admin','https://i.imgur.com/cogoLSt.jpg'),
('IT Manager','https://i.imgur.com/YeBf0w6.jpg'),
('Mobile Application','https://i.imgur.com/ZfRG4gg.jpg'),
('System Analyst','https://i.imgur.com/xMHaHoM.jpg'),
('Technical Support','https://i.imgur.com/6KG3eJo.jpg'),
('Web Programmer','https://i.imgur.com/Kry2Jup.jpg'),
('Sales Manager','https://i.imgur.com/ClBdwaa.jpg'),
('Call Center','https://i.imgur.com/AYSo6lM.jpg'),
('Customer Service','https://i.imgur.com/EA8ltGt.jpg'),
('Security','https://i.imgur.com/zlz3eSR.jpg'),
('Janitor','https://i.imgur.com/wcRang6.jpg'),
('House Maid','https://i.imgur.com/SeFShro.jpg'),
('ISO','https://i.imgur.com/XEncUmY.png'),
('Maintainer','https://thumbs.dreamstime.com/b/modern-excavator-operator-caucasian-construction-worker-industrial-machinery-modern-excavator-operator-157982864.jpg'),
('Mechanic','https://www.autotrainingcentre.com/wp-content/uploads/2018/10/mechanic-school.jpg'),
('Writer','https://www.thebalancecareers.com/thmb/XUmYsfj_Z8YPFyoTzKnoX5oqoJQ=/2000x1383/filters:fill(auto,1)/writer2-172409300-58ae4fbb3df78c345b7c5b62.jpg'),
('Copywriter','https://www.owlguru.com/wp-content/uploads/wpallimport/files/copy-writers/__(1).jpg'),
('Proofreader','https://fjwp.s3.amazonaws.com/blog/wp-content/uploads/2019/12/01123045/proofreading-1024x512.png'),
('Teacher','https://www.spiritexchange.com/wp-content/uploads/2019/01/black-teacher.jpg'),
('Machine Controller','https://www.ieiworld.com/_upload/news/images/iStock-472059751(1).jpg'),
('IT Security','https://securethoughts.com/wp-content/uploads/2018/11/shutterstock_669226204-e1541411004836.jpg'),
('Surgeon Doctor','https://images.theconversation.com/files/277995/original/file-20190604-69087-6q2xjq.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop'),
('Nurse','https://media.nurse.org/cache/bd/fc/bdfc3a2e49e0f7c7ca3253b33edb6a01@2x.jpg'),
('Dentist','https://www.cochrane.org/sites/default/files/public/styles/social_media/public/uploads/news/young-confident-asian-male-dentist-medical-treatment-to-a-female-patient-at-the-clinic.-dental-clinic-concept-911844046_1257x838_3.jpeg?itok=YzWpwBw8'),
('Medical Assist','https://www.imagine-america.org/wp-content/uploads/2017/03/female-medical-assistant-1024x682-1024x675.jpg'),
('Pharmacist','https://studyworkgermany.com/wp-content/uploads/2019/10/How-to-Become-a-Pharmacist.jpg'),
('Vet','https://now.tufts.edu/sites/default/files/190515_cindy_vet_lg.jpg'),
('Babysitter','https://raisingchildren.net.au/__data/assets/image/0026/56780/babysitters-narrow.jpg'),
('Explorer','https://gapforce.org/our-blog/wp-content/uploads/2019/02/South-America-Explorer1-1024x682.jpg'),
('Tour Operation','https://www.kairosinstitute.in/kairos/banner_images/Kairos_Institute_-_Travel_Agency_and_Tour_Operation_Business_01.jpg'),
('Translator','https://wantedtranslator.com/wp-content/uploads/2017/10/Translation-Companies-Jobs.jpg'),
('Guide','https://media.istockphoto.com/photos/pupils-and-teacher-on-school-field-trip-to-museum-picture-id538358250?k=6&m=538358250&s=612x612&w=0&h=Arg51k0tr6TmyLb-HcapSrdupYUOIgVAAxNlIf_oPFQ='),
('Data Scientist','https://www.simplilearn.com/ice9/free_resources_article_thumb/A-Day-in-the-Life-of-a-Data-Scientist_Banner.jpg'),
('Scientist','https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/12/17/09/scientists.jpg?width=982&height=726&auto=webp&quality=75'),
('Researcher','https://www.kolabtree.com/blog/wp-content/uploads/2020/09/medical-researcher-in-lab-626x336.jpg'),
('Computer Mechanic','https://bleuwire.com/wp-content/uploads/2019/03/computer-repair-services.jpg'),
('Computer Graphic','https://blog.dailylogochallenge.com/wp-content/uploads/2019/02/desinger-on-apple-desktop-1600x1067.jpeg'),
('Web Design','http://openmashup.org/wp-content/uploads/2019/08/5ce7a1aa57f1524d73a26800_1_KodU6ysvLzyVYYe3-urg2g.jpeg'),
('Courier','https://aircouriers.com/content/uploads/2019/08/shutterstock_1245922846-1-1024x683.jpg'),
('Merchandiser','https://www.repsly.com/hubfs/1._Stock_Photos/iStock_%28DO_NOT_USE_AFTER_30_DAYS%29/iStock-535022019-min.jpg'),
('Costume Designer','https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555445885/shape/mentalfloss/istock_000056373346_small.jpg'),
('Web Content Manager ','https://www.careerprofiles.com/wp-content/uploads/2018/08/Web-content-manager-referencing-editorial-calendar-for-site-content-creation-_877_40178071_0_14128468_500.jpg'),
('Jeweler','https://www.sjorg.com/wp-content/uploads/2018/05/SJO-Member-1024x683.jpg'),
('Bartender','https://pyxis.nymag.com/v1/imgs/06d/aaa/27d77ea140005c453f20ba32f5bef05a27-10-giuseppe-gonzalez-2.rsquare.w700.jpg'),
('Waiter','https://www.forketers.com/wp-content/uploads/2018/09/10-Must-Have-Qualities-to-be-a-Great-Waiter.jpg'),
('Barista','https://image.freepik.com/free-photo/beautiful-barista-wearing-brown-apron-holding-hot-coffee-cup-served-customer-with-smili_44344-649.jpg'),
('Tutor','https://thailandcoursehub.com/wp-content/uploads/elementor/thumbs/When-to-Get-a-Math-Tutor-for-Your-Child-onkm2hinq644unjf0cn65nw1c5c1lo6wqmna0hztbg.jpg'),
('Swimming Instructor','https://www.dupageswimmingcenter.com/wp-content/uploads/2017/03/Aurora-IL-Pools.jpg'),
('Accountant','https://www.accountancyage.com/wp-content/uploads/2018/11/accountant-e1572509549660.jpg'),
('Graphic Artist','https://www.freelogoservices.com/blog/wp-content/uploads/digital-graphic-designer.jpg');



INSERT INTO Resume(
`resume_info`,
`request_job`,
`image`,
`date`,
`resume_jobseeker_id`)
VALUES
('ที่อยู่ : 11/11 ต.ปากน้ำ อ.เมือง จ.ระยอง 21000 มีใบขับขื่รถยนต์และจักรยานยนต์ จบปวช.ปากน้ำระยอง',
'Security',
'https://i.imgur.com/FYpbkWY.png',
'2021-02-12',1),


('อยู่ จังหวัดยะลา จบปวส. ปัจจุบันกำลังศึกษาต่อระดับป.ตรีที่สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง',
'Swimming Instructor',
'https://i.imgur.com/alrBjQ0.png',
'2021-03-03',2),

('เกิดที่เชียงใหม่ ปัจจุบันอยู่ที่กรุงเทพฯ',
'แม่บ้าน Part-time',
'https://i.imgur.com/TIQNtkr.png',
'2021-04-13',3),

('อยู่ จังหวัด นนทบุรี จบป.ตรี จากมหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ ปัจจุบันกำลังศึกษาต่อป.โท ที่มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ',
'Web-Designer',
'https://i.imgur.com/phF1Kg0.png',
'2021-01-01',4), 

('อยู่ จังหวัด ปทุมธานี จบป.ตรี จากมหาวิทยาลัยศิลปากร จบป.โท จากมหาวิทยาลัยเชียงใหม่',
'graphic designer',
'https://i.imgur.com/ZR8IuZ7.png',
'2021-01-01',5),
('อยู่ จังหวัด นนทบุรี จบป.ตรี จากมหาวิทยาลัยบูรพา',
'Programmer',
'https://i.imgur.com/ZLWfqam.png',
'2021-03-30',6),
('อยู่ จังหวัด กรุงเทพมหานคร จบป.ตรี จากมหาวิทยาลัยธรรมศาสตร์ จบป.โท จากมหาวิทยาลัยธรรมศาสตร์',
'บัญชี',
'https://i.imgur.com/h02UhhD.png',
'2021-04-30',7),
('อยู่ จังหวัดกรุงเทพมหานคร จบป.ตรี จากมหาวิทยาลัยศรีปทุม ',
'sales man',
'https://i.imgur.com/ErILP6B.png',
'2021-05-07',8),
('อยู่ จังหวัดปทุมธานี กำลังศึกษาป.ตรี ที่มหาวิทยาลัยกรุงเทพฯ',
'Graphic Artist',
'https://i.imgur.com/9LS2rYK.png',
'2022-01-01',9),
('อยู่ จังหวัดนนทบุรี จบป.ตรี จากมหาวิทยาลัยธรรมศาสตร์',
'ช่างเครื่องยนต์',
'https://i.imgur.com/cgXTWqQ.png',
'1990-12-31',10);


INSERT INTO Job_position(`job_pos_name`,`job_pos_resume_id`,`job_pos_job_id`)

VALUES
(
'Security',1,40
),
(
'Teacher',2,78
),
(
'House Maid',3,42
),
(
'Web Design',4,68
),
(
'Graphic Design',5,22
),
(
'Programmer',6,20
),
(
'Accountant',7,79
),
(
'Saleman',8,21
),
(
'Graphic Artist',9,80
),
(
'Mechanic',10,45
);


INSERT INTO Company(`name`,`founding_data`,`company_info`,`username`,`password`) 
VALUES
('บริษัท ทำอนิเมชั่น จำกัด มหาชน','2019-10-01','เราเป็นบริษัททำอนิเมชั่นชั้นนำของประเทศไทยที่ทำ
อนิเมชั่นหลายรูปแบบ เช่น การ์ตูน, โฆษณา, ละคร โดยเรามีเป้าหมายเป็นที่ 1 ไม่ว่าจะเป็นในประเทศหรือต่างประเทศ','animation01','editorwanted01'),

('YGGDRAZIL GROUP PUBLIC COMPANY LIMITED','2006-01-01','We are one of the top Visual Effects (VFX), Animation , VR studio in Bangkok , Thailand. Which provide full post production services and production support for commercials , feature film , And game , cinematic , tv series , VR360. With an extremely talented artists and high-end equipment to deliver work beyond the global success.','YGGDRAZIL_GROUP','HsH066832564362'),

('บริษัท กรรชัยค้าไม้ จำกัด','2001-02-06','ขายไม้ทุกประเภท รับแปรรูป ทำเฟอร์นิเจอร์ไม้ ขายส่ง-ปลีก','กรรชัยค้าไม้','0877741413'),

('บริษัท บีทูเอส จำกัด','2000-05-27','บีทูเอส แหล่งรวมหนังสือทั้งภาษาไทย ภาษาต่างประเทศ สินค้าไลฟ์สไตล์ อุปกรณ์เครื่องเขียน อุปกรณ์ศิลปะและสื่อบันเทิงที่ครบครันที่สุด โดยเน้นแนวคิดของร้าน เป็นศูนย์รวมไลฟ์สไตล์ที่สอดคล้องและตอบโจทย์กับการใช้ชีวิตของลูกค้าในหลายกลุ่มได้เป็นอย่างดี ร้านบีทูเอสจึงคัดสรรสินค้าที่มีความหลากหลายสำหรับใช้ในชีวิตประจำวัน เพื่อเปิดประสบการณ์การช้อปปิ้ง และสนุกกับการเลือกชมสินค้าหลากหลายแบรนด์ดัง และมีดีไซน์ไม่เหมือนใคร','B2S','Q75R58S24t5d'),

('บริษัท กรุงไทยประกันภัย จำกัด','2001-12-20','บริษัทประกันภัย รับทำประกันชั้น1-2-3 ตั้งแต่ประกันสุขภาพยันประกันสุนัขของท่าน','KIS','FF14XIV69420'),

('บริษัท กำชัยความปลอดภัย จำกัด','2005-05-14','บริษัทจัดหาจ้างหน่วยรักษาความปลอดภัย การันตีด้วยรางวัลสิงฆ์รัศมี4ปีซ้อน และเป็นพาร์ทเนอร์กับบริษัทความปลอดภัยชั้นนำต่างๆทั่วโลก เพื่อนำพาความปลอดภัยและความสะดวกสบายต่อลูกค้าทุกเพศทุกวัย','KSecurity','Password?'),

('บริษัท รักพูด จำกัด','1999-01-01','บริษัทนำเข้าและจำหน่ายหนังสือการ์ตูนและของที่ระลึกจากต่างประเทศในราคาที่เป็นมิตรและมีของที่คุณภาพ ตามคำขวัญ”LCเรื่องตอนดังซักพักก็ดอง”','Luckpood','Clover420Xx');


INSERT INTO Request_info(`req_date`,`req_information`,`req_company_id`) 
VALUES
('2019-12-02', 'ต้องการพนักงานประจำฝ่าย Graphic Design วุฒิการศึกษาป.ตรี ', 1),
('2020-01-13', 'ต้องการพนักงานฝ่ายProgrammer วุฒิการศึกษาป.โท', 2),
('2020-01-14', 'ต้องการพนักงานฝ่ายเซลล์ ไม่จำกัดวุฒิ', 3),
('2020-02-01', 'ต้องการผู้จัดการฝ่ายขาย วุฒิการศึกษาป.โท ', 4),
('2020-04-12', 'ต้องการพนักงานฝ่ายCustomer Service วุฒิการศึกษาป.ตรี', 5),
('2020-04-15', 'ต้องการพนักงานฝ่ายรักษาความปลอดภัย ไม่จำกัดวุฒิ', 6),
('2020-05-01', 'ต้องการพนักงานฝ่ายแอพพลิเคชั่นโทรศัพท์ วุฒิป.โท', 7);


INSERT INTO Request_job(`req_experience`,`req_ability`,`req_job_req_info_id`,`req_job_job_id`) 
VALUES
('ไม่มี','ต้องการความสามารถในการตัดต่อวีดีโอ การปั้นโมเดล3มิติ หากมีประสบกาณ์ด้านอนิเมชั่นจะพิจารณาเป็นพิเศษ', 1, 22),
('1ปี','ต้องการความสามารถด้านภาษาC และทักษะด้านการชงกาแฟ(หากมี)', 2, 20),
('1ปี','อัธยาศัยดี มีไฟในการทำงาน พูดค่ะคะถูกต้อง', 3, 29),
('2ปี','ทำงานว่องไว ติดตามงานพนักงานเป็นประจำ มีวุฒิภาวะในอารมณ์', 4, 37),
('1ปี','รักในงาน มีศิลป์ในการพูด หากพูดภาษาอังกฤษได้จะพิจารณาเป็นพิเศษ', 5, 39),
('ไม่มี','ตัดสินใจรวดเร็ว ไม่หลับในเวลางาน ตรงต่อเวลา', 6, 40),
('1ปี','ตรงต่อเวลา มีความรู้ด้านการทำแอพพลิเคชั่นในโทรศัพท์เป็นอย่างดี', 7,33) ;



INSERT INTO Interview(`date`,`inter_request_job_id`,`inter_job_pos_id`) 
VALUES
('2020-01-12 13:00:00','1','5'),
('2020-03-31 13:00:00','2','6'),
('2020-06-01 13:00:00','6','1');