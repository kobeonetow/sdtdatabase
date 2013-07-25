INSERT INTO account(id,username,password,status) VALUES (1,'jianxing',MD5('jianxingshundeqiche'),'A');
SELECT setval('account_id_seq',1);


COPY groups (id, name) FROM stdin;
1	administrator
2	部门职位管理
3	人事档案管理
4	人事合同管理
5	人事调动管理
6	人事数据移植
7	账号创建进组
8	用户组创建权限添加
\.
SELECT setval('groups_id_seq',8);

COPY accountgroup (id, accountid, groupid) FROM stdin;
1	1	1
\.
SELECT setval('accountgroup_id_seq',1);

--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY action (id, name, description) FROM stdin;
1	score_system	积分系统
2	score_home_view	积分查看
3	score_detail_view	积分记录_详细查看
4	score_detail_remove_record	积分记录_删除
5	score_fileupload_uploaditems	上传积分条例
6	score_fileupload_uploadscores	上传积分
7	score_items_view	积分条例_查看
8	score_items_create	积分条例_创建
9	score_items_edit	积分条例_修改
10	score_items_givescore	积分条例_打分
11	score_sheet_view	分表查看
12	score_sheet_create	分表创建
13	score_sheet_remove	分表删除
14	score_sheet_rm_st	分表条例删除
15	score_sheet_add_st	分表条例添加
16	account_system	帐号管理系统
17	account_createaccount	创建帐号
18	account_creategroup	创建用户组
19	account_assigngroup	添加帐号到组
20	account_removeaccount	删除帐号
21	account_resignaccount	辞退帐号
22	account_removegroup	删除用户组
23	account_viewaccountgroups	查看帐号加入的群组
24	account_viewgroupactions	查看用户组权限
25	account_removegroupfromuser	移除用户用户组
26	account_assignactiontogroup	添加组权限
27	employee_system	人事系统
28	employee_view	档案查看
29	employee_edit	档案修改
30	employee_rm	档案删除
31	employee_add_contract	添加合同
32	employee_view_detail	详细档案查看
33	employee_data_migrate	数据移植
34	employee_datafile_upload	数据文件上传
35	employee_idcheck_file_upload	检查ID文件
36	employee_resign	辞退员工
37	employee_view_contract	查看合同
38	employee_edit_contract	修改合同
39	employee_rm_contract	删除合同
40	employee_dept_view	查看部门
41	employee_dept_add	添加部门
42	employee_dept_rm	删除部门
43	employee_data_download	员工数据下载
44	employee_driver_data_download	驾驶员数据下载
45	employee_coor_data_download	调动数据下载
46	employee_coor_view	查看调动
47	employee_coor_add	添加调动47	employee_coor_add	添加调动
48	employee_property_list_view	属性列别查看
49	employee_property_list_add	添加属性
50	employee_property_list_rm	删除属性
51	employee_idcards_view	证件查看
52	employee_idcards_add	添加证件
53	employee_idcards_rm	删除证件
54	employee_pos_view	查看职位
55	employee_pos_add	添加职位
56	employee_pos_rm	删除职位
57	score_rank_group_view	排位组查看
58	score_rank_group_edit	排位组修改
59	score_voucher_view	奖券查看
60	score_voucher_management	奖券管理
61	employment_system	招聘系统
62	employment_home_view	招聘主页
63	employment_request_view	增补申请页
64	employment_request_create	新建增补表
65	employment_application_create	报名
66	employment_driverexam	驾驶员考试
67	employment_apply_exam	报名考试
68	employment_application_edit	修改报名
69	employment_request_edit	增补修改
70	employment_driverexam_edit	考试修改
71	employment_application_idcard_setting	证件设置
72	employee_idcards_file_upload	证件图片上传
73	employee_coor_edit	修改调动
\.
SELECT setval('action_id_seq',73);

--
-- Data for Name: actiongroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY actiongroup (id, action, groupid) FROM stdin;
13	employee_system	2
14	employee_dept_view	2
15	employee_dept_add	2
16	employee_dept_rm	2
17	employee_pos_view	2
18	employee_pos_add	2
19	employee_pos_rm	2
44	account_system	7
45	account_createaccount	7
46	account_assigngroup	7
47	account_removeaccount	7
48	account_viewaccountgroups	7
49	account_viewgroupactions	7
50	account_removegroupfromuser	7
60	account_system	8
61	account_creategroup	8
62	account_removegroup	8
63	account_viewgroupactions	8
64	account_assignactiontogroup	8
65	employee_system	3
66	employee_view	3
67	employee_edit	3
68	employee_rm	3
69	employee_view_detail	3
70	employee_idcheck_file_upload	3
71	employee_resign	3
72	employee_data_download	3
73	employee_driver_data_download	3
74	employee_coor_data_download	3
75	employee_property_list_view	3
76	employee_property_list_add	3
77	employee_property_list_rm	3
78	employee_idcards_view	3
79	employee_idcards_add	3
80	employee_idcards_rm	3
81	employee_system	4
82	employee_view	4
83	employee_add_contract	4
84	employee_view_contract	4
85	employee_edit_contract	4
86	employee_rm_contract	4
87	employee_system	5
88	employee_view	5
89	employee_coor_view	5
90	employee_coor_add	5
91	employee_system	6
92	employee_view	6
93	employee_data_migrate	6
94	employee_datafile_upload	6
\.
SELECT setval('actiongroup_id_seq',94);

COPY department (id, name, remark) FROM stdin;
2	公司	\N
3	维修分厂	\N
4	顺汽公交二分公司	\N
5	站场改造项目组	\N
6	人力资源部	\N
7	长途分公司	\N
8	行政部	\N
9	客运总站	\N
10	顺汽公交一分公司	\N
11	陈村客运站	\N
12	财务部	\N
13	采购部	\N
14	安技稽查部	\N
15	广告分公司	\N
16	市场经营部	\N
17	公交分公司	\N
18	包车租赁分公司	\N
19	油料供应部	\N
20	胎管部	\N
21	顺汽公交	\N
22	客运总站 	\N
23	第一公交分公司	\N
24	顺汽公交 	\N
25	公交一	\N
26	公交三	\N
27	长途	\N
28	公交二	\N
29	第一公交	\N
30	包车租赁	\N
31	油料部	\N
32		\N
\.
SELECT setval('department_id_seq',32);

COPY "position" (id, name, remark) FROM stdin;
2	董事长	\N
3	总经理	\N
4	常务副总经理	\N
5	副总经理	\N
6	副经理兼营运主任	\N
7	组长	\N
8	招聘助理	\N
9	统计员	\N
10	总务管理	\N
11	开放站场管理副主任	\N
12	公交车队长	\N
13	副厂长	\N
14	调度兼车管	\N
15	行政财务专员	\N
16	会计员	\N
17	副经理	\N
18	采购员	\N
19	安全员	\N
20	安全主任	\N
21	经理	\N
22	IT副主任	\N
23	主任	\N
24	质监员	\N
25	开放站场管理主任	\N
26	总出纳	\N
27	车间主任	\N
28	配件、油料管理	\N
29	行政后勤管理主任	\N
30	业务员	\N
31	后勤管理	\N
32	出纳员	\N
33	长途车队长	\N
34	结算员	\N
35	结算员兼监钞组长	\N
36	组员	\N
37	水电工主管	\N
38	客运业务副主任	\N
39	调度员	\N
40	总经理助理	\N
41	车管员	\N
42	常务副总经理助理	\N
43	办公室副主任	\N
44	统计组长	\N
45	车检管理员	\N
46	仓库副主任	\N
47	事故处理员	\N
48	监控副主任	\N
49	运调员	\N
50	租赁调度员	\N
51	运调主任	\N
52	驾驶员档案管理	\N
53	长途副车队长	\N
54	采购副主任	\N
55	公交驾驶员	\N
56	经理助理兼安全主任	\N
57	送检员	\N
58	调度兼统计	\N
59	设备技术员	\N
60	信息管理员	\N
61	检验员	\N
62	燃油供应主任	\N
63	人事管理	\N
64	车间副主任	\N
65	劳动人事管理主任	\N
66	薪酬福利管理	\N
67	客服副主任	\N
68	胎管员	\N
69	文秘及企业文化管理	\N
70	采购跟单	\N
71	监钞员	\N
72	董事长秘书	\N
73	工资管理	\N
74	计算机维护	\N
75	培训专员	\N
76	运调副主任	\N
77	安全管理副主任	\N
78	商务车驾驶员	\N
79	维修车间主任	\N
80	站场管理员	\N
81	行政助理	\N
82	招聘专员	\N
83	调度班长	\N
84	水电工	\N
85	油车驾驶员	\N
86	服务员	\N
87	长途驾驶员	\N
88	大巴驾驶员	\N
89	录像监控员	\N
90	总经办文秘员	\N
91	录像收盘员	\N
92	点钞员	\N
93	收钞员	\N
94	加油员	\N
95	维修工	\N
96	文具仓管员	\N
97	机修工	\N
98	冷电工	\N
99	胎工	\N
100	维修学徒工	\N
101	实习仓管员	\N
102	站场指挥员	\N
103	客运助理	\N
104	GPS监控组长	\N
105	客服接待员	\N
106	GPS监控员	\N
107	胎工学徒	\N
108	仓管员	\N
109	清洁员	\N
110	站务员	\N
111	录像监控组长	\N
112	乘务员	\N
113	胎管员兼统计	\N
114	车辆卫生监督员	\N
115	保安员	\N
116	水工	\N
117	水电工班长	\N
118	仓库主任助理	\N
119	仓库主管	\N
120	胎工班长	\N
121	技术员	\N
122	冷电副班长	\N
123	机修副班长	\N
124	沙板喷漆工	\N
125	维修副班长	\N
126	沙板喷漆副班长	\N
127	维修班长	\N
128	车检员	\N
129	车检组长	\N
130	收钞管理	\N
131	加油员 	\N
132	加油管理组长	\N
133	客运业务员	\N
134	车辆档案管理员	\N
135	售后服务追踪专员	\N
136	维修电工班长	\N
137	机修班长	\N
138	沙板喷漆班长 	\N
139	汽车技术管理	\N
140	档案管理员	\N
141	客服实习生	\N
142	监控员	\N
143	维修电工	\N
144	长途运调员	\N
145	长途安全主任	\N
146	企业顾问兼驾驶培训筹建办主任	\N
\.


SELECT setval('position_id_seq',146);



INSERT INTO qualification(name) VALUES('中技');
INSERT INTO qualification(name) VALUES('初中毕业');
INSERT INTO qualification(name) VALUES('大学大专');
INSERT INTO qualification(name) VALUES('初小');
INSERT INTO qualification(name) VALUES('高小');
INSERT INTO qualification(name) VALUES('大学本科');
INSERT INTO qualification(name) VALUES('中专毕业');
INSERT INTO qualification(name) VALUES('本科');
INSERT INTO qualification(name) VALUES('高中毕业');
INSERT INTO qualification(name) VALUES('职高');
INSERT INTO qualification(name) VALUES('大专');
INSERT INTO qualification(name) VALUES('中专');
INSERT INTO qualification(name) VALUES('职中');
INSERT INTO qualification(name) VALUES('大专毕业');
INSERT INTO qualification(name) VALUES('研究生');
INSERT INTO qualification(name) VALUES('其它');
INSERT INTO qualification(name) VALUES('本科毕业');
INSERT INTO qualification(name) VALUES('高技');
INSERT INTO qualification(name) VALUES('小学毕业');


INSERT INTO ethnic(name) VALUES('汉族');
INSERT INTO ethnic(name) VALUES('仡佬族');
INSERT INTO ethnic(name) VALUES('回族');
INSERT INTO ethnic(name) VALUES('土家');
INSERT INTO ethnic(name) VALUES('土家族');
INSERT INTO ethnic(name) VALUES('壮族');
INSERT INTO ethnic(name) VALUES('侗族');
INSERT INTO ethnic(name) VALUES('苗族');
INSERT INTO ethnic(name) VALUES('黎族');
INSERT INTO ethnic(name) VALUES('瑶族');
INSERT INTO ethnic(name) VALUES('畲族');
INSERT INTO ethnic(name) VALUES('满族');
INSERT INTO ethnic(name) VALUES('蒙古族');


INSERT INTO workertype(name) VALUES('机械助师');
INSERT INTO workertype(name) VALUES('中级汽车维修电工/初级工具钳工');
INSERT INTO workertype(name) VALUES('初级汽车维修钣金油漆工/中级汽车维修工/焊接与热切割作业');
INSERT INTO workertype(name) VALUES('初级汽车维修工');
INSERT INTO workertype(name) VALUES('注册安全主任');
INSERT INTO workertype(name) VALUES('中级汽车维修工/中级汽车维修电工/初级计算机办公软件应用');
INSERT INTO workertype(name) VALUES('中级汽车维修钣金工');
INSERT INTO workertype(name) VALUES('助理经济师');
INSERT INTO workertype(name) VALUES('高级汽车维修技师/汽车维修质量总检验员');
INSERT INTO workertype(name) VALUES('初级汽车维修工/仓库保管工');
INSERT INTO workertype(name) VALUES('机械助理工程师');
INSERT INTO workertype(name) VALUES('中级汽车维修电工');
INSERT INTO workertype(name) VALUES('政工师');
INSERT INTO workertype(name) VALUES('中级汽车焊工/中级汽车维修钣金工');
INSERT INTO workertype(name) VALUES('技术员');
INSERT INTO workertype(name) VALUES('助理经济师及助理政工师');
INSERT INTO workertype(name) VALUES('汽车维修电工');
INSERT INTO workertype(name) VALUES('会计师');
INSERT INTO workertype(name) VALUES('汽车助理工程师');
INSERT INTO workertype(name) VALUES('中级汽车焊装工/高级汽车维修工');
INSERT INTO workertype(name) VALUES('机械助理工程师/初级安全主任');
INSERT INTO workertype(name) VALUES('汽车维修工程师/注册安全工程师');
INSERT INTO workertype(name) VALUES('汽车运用工程师');
INSERT INTO workertype(name) VALUES('初级汽车维修钣金油漆工');
INSERT INTO workertype(name) VALUES('助理电子商务师');
INSERT INTO workertype(name) VALUES('中级汽车维修钳工/高级汽车维修工');
INSERT INTO workertype(name) VALUES('高级汽车钣金工/初级气电焊');
INSERT INTO workertype(name) VALUES('汽车维修技师/高级汽车维修工');
INSERT INTO workertype(name) VALUES('初级安全主任');
INSERT INTO workertype(name) VALUES('高级汽车驾驶员');
INSERT INTO workertype(name) VALUES('助理政工师');
INSERT INTO workertype(name) VALUES('中级汽车维修电工/初级机修钳工/中级汽车空调维修');
INSERT INTO workertype(name) VALUES('中级汽车维修工/驾驶操作教练员/汽车驾驶技师');
INSERT INTO workertype(name) VALUES('助理人力资源管理师/初级会计/初级统计');
INSERT INTO workertype(name) VALUES('会计员');
INSERT INTO workertype(name) VALUES('会计从业资格证');
INSERT INTO workertype(name) VALUES('高级汽车维修钣金工');
INSERT INTO workertype(name) VALUES('初级公路运输');
INSERT INTO workertype(name) VALUES('中级汽车维修工');
INSERT INTO workertype(name) VALUES('汽车维修技师');
INSERT INTO workertype(name) VALUES('汽车维修工');
INSERT INTO workertype(name) VALUES('政工师及助理经济师');
INSERT INTO workertype(name) VALUES('助理会计师');
INSERT INTO workertype(name) VALUES('国际商务跟单员');
INSERT INTO workertype(name) VALUES('中级人力资源');
INSERT INTO workertype(name) VALUES('技术员/初级安全主任');
INSERT INTO workertype(name) VALUES('中级汽车维修钣金工/焊接与热切割作业');
INSERT INTO workertype(name) VALUES('初级安全主任/中级汽车运输调度员');
INSERT INTO workertype(name) VALUES('助理电子商务师/助理人力资源管理师');
INSERT INTO workertype(name) VALUES('中级汽车维修电工/中级汽车空调维修工');
INSERT INTO workertype(name) VALUES('高级汽车维修工');
INSERT INTO workertype(name) VALUES('中级汽车维修电工/高级汽车维修工');
INSERT INTO workertype(name) VALUES('电工进网作业许可证');
INSERT INTO workertype(name) VALUES('中级油泵油嘴装试工/高级汽车维修工');
INSERT INTO workertype(name) VALUES('统计员');
INSERT INTO workertype(name) VALUES('初级油泵油嘴校验');
INSERT INTO workertype(name) VALUES('管');
INSERT INTO workertype(name) VALUES('高级汽车维修电工');
INSERT INTO workertype(name) VALUES('初级会计');
INSERT INTO workertype(name) VALUES('助理政工师/会计员');
INSERT INTO workertype(name) VALUES('企业人力资源管理师');
INSERT INTO workertype(name) VALUES('中级汽车维修漆工');
INSERT INTO workertype(name) VALUES('中级维修电工');
INSERT INTO workertype(name) VALUES('中级汽车电气与制冷/高级汽车维修工');


INSERT INTO fixoptions(id,name,content) VALUES(1,'政治面貌','群众,无党派,团员,民革党员,共产党员,民主党员,中共党员');
INSERT INTO fixoptions(id,name,content) VALUES(2,'户籍类型','省外城镇,省内城镇,省外农村,省内农村,外市农村');
INSERT INTO fixoptions(id,name,content) VALUES(3,'职级','非管,高管,中管,管,退伍军人');
INSERT INTO fixoptions(id,name,content) VALUES(4,'婚姻状况','再婚,离婚,已婚,未婚,离异');
INSERT INTO fixoptions(id,name,content) VALUES(5,'合同类型','正式,试用,临时');
INSERT INTO fixoptions(id,name,content) VALUES(6,'调度类型','升迁,调动,离职,复职');
INSERT INTO fixoptions(id,name,content) VALUES(7,'证件类型','驾驶证,从业资格证,服务资格证');.
INSERT INTO fixoptions(id,name,content) VALUES(8,'特殊身份','无,退伍军人,国家干部');
INSERT INTO fixoptions(id,name,content) VALUES(9,'所属镇街','容桂,大良,陈村兼北滘,杏坛,跨区,龙江,均安,陈村,勒流,北滘');
SELECT setval('fixoptions_id_seq',9);
