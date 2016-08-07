create table `tab_films` (
	`film_idx` double ,
	`genre_code` varchar (24),
	`film_poster` varchar (768),
	`film_name` varchar (768),
	`film_release_date` varchar (768),
	`film_close_date` varchar (768),
	`film_director` varchar (384),
	`film_cast` varchar (768),
	`films_class` varchar (12),
	`film_synopsys` blob ,
	`remark` varchar (12288)
); 
insert into `tab_films` (`film_idx`, `genre_code`, `film_poster`, `film_name`, `film_release_date`, `film_close_date`, `film_director`, `film_cast`, `films_class`, `film_synopsys`, `remark`) values('1','G006','Dear Lena.jpg','레나','2016-05-26','2016-07-14','김도원','박기림(레나), 김재만(순구)','12','“제가 아저씨한테 고마워한다는 거 꼭 기억해주세요”\n\n새로운 삶을 꿈꾸며 한국을 찾아온 레나는 시골에서 녹차 농사를 짓는 노총각 순구를 만난다.\n레나는 자신을 진심으로 아껴주는 순구의 자상함에 서서히 마음을 열기 시작하고, 순구 역시 항상 밝은 미소를 보여주는 그녀에 대한 애정이 점점 커져간다.\n  \n하지만, 말할 수 없는 비밀을 간직한 레나는 늘 고마운 순구에게 미안함이 쌓여만 가고, 마음의 상처가 있는 순구는 레나가 시골 생활에 지쳐 불현듯 떠나 버릴까 불안해한다. \n서로의 진심을 모른 채 그 둘 사이에는 오해만 점차 쌓여가는데…\n \n따뜻한 봄날의 선물 같은 사랑이 찾아옵니다!','');
insert into `tab_films` (`film_idx`, `genre_code`, `film_poster`, `film_name`, `film_release_date`, `film_close_date`, `film_director`, `film_cast`, `films_class`, `film_synopsys`, `remark`) values('2','G004','THE WORLD OF US.jpg','우리들','2016-06-16','2016-07-27','윤가은','최수인(선), 설혜인(지아), 이서연(보라)','0','언제나 혼자인 외톨이 선은 모두가 떠나고 홀로 교실에 남아있던 방학식 날, 전학생 지아를 만난다. 서로의 비밀을 나누며 순식간에 세상 누구보다 친한 사이가 된 선과 지아는 생애 가장 반짝이는 여름을 보내는데, 개학 후 학교에서 만난 지아는 어쩐 일인지 선에게 차가운 얼굴을 하고 있다. \n  \n선을 따돌리는 보라의 편에 서서 선을 외면하는 지아와 다시 혼자가 되고 싶지 않은 선. \n어떻게든 관계를 회복해보려 노력하던 선은 결국 지아의 비밀을 폭로해버리고 마는데... \n  \n선과 지아. \n우리는 다시 \'우리\'가 될 수 있을까?','');
insert into `tab_films` (`film_idx`, `genre_code`, `film_poster`, `film_name`, `film_release_date`, `film_close_date`, `film_director`, `film_cast`, `films_class`, `film_synopsys`, `remark`) values('3','G003','Where am I.jpg','소녀와 여자','2016-06-16','2016-07-27','김효정','엘리자 구티, 아니타 쾀보카','15','지금 이 순간에도 계속되는 목숨 건 소녀들의 성인식 \n논란 속의 여성성기절제(Female Genital Mutilation)를 말하다! \n  \n\"여자가 되기 위해선 전통을 따라야 해요\" \n할례를 경험한 14세 소녀의 이야기 \n할례를 받은 \'아니타\'는 모든 마을 사람들의 축하를 받으며 집으로 향한다. \n그녀의 아버지는 드디어 딸을 결혼시킬 수 있게 되었다며 좋아한다. \n그렇게 한 소녀는 여자가 되었다. \n  \n\"저는 꿈이 있어요. 아직 결혼하고 싶지 않아요\" \n여성성기절제를 피해 도망친 17세 소녀의 이야기 \n가족들의 강요를 피해 \'엘리자\'는 할례 반대 캠프로 도망쳤다. \n집에 돌아가면 여성성기절제를 받아야 하는 그녀는 캠프가 끝나도 갈 곳이 없다. \n그렇게 그녀는 소녀로 남았다.','');
insert into `tab_films` (`film_idx`, `genre_code`, `film_poster`, `film_name`, `film_release_date`, `film_close_date`, `film_director`, `film_cast`, `films_class`, `film_synopsys`, `remark`) values('4','G013','500 Days OF Summer.jpg','500일의 썸머','2016-06-30','2016-07-27','마크 웹','조셉 고든 레빗(톰), 주이 디샤넬(썸머)','15','“우연은 우주의 이치다!”\n자신의 인생을 바꿔줄 운명적 사랑을 기다리는 순수 청년 ‘톰’, \n어느 날 회사에 새로운 비서로 나타난 ‘썸머’를 처음 보는 순간 대책 없이 사랑에 빠져든다. \n \n“나는 진지하고 싶지 않아!”\n구속 받기 싫어하고 혼자만의 삶을 즐기는 자유로운 여자 ‘썸머’,\n누군가의 여자이기를 거부하는 ‘썸머’는 ‘톰’과 친구도, 애인도 아닌 애매한 관계를 이어간다.\n \n“저기… 우리는 무슨 관계야?”\n‘썸머’를 평생 함께 할 천생연분이라 확신하는 ‘톰’. \n하지만 어딘지 어긋나고 삐걱대는 두 사람\n이제 둘 관계의 변화를 위한 선택이 필요한 순간이 다가오는데…','');
insert into `tab_films` (`film_idx`, `genre_code`, `film_poster`, `film_name`, `film_release_date`, `film_close_date`, `film_director`, `film_cast`, `films_class`, `film_synopsys`, `remark`) values('5','G004','Maborosi.jpg','환상의 빛','2016-07-07','2016-07-27','고레에다 히로카즈','에스미 마키코(유미코), 나이토 타카시(타미오), 아사노 타다노부(이쿠오)','15','영화 역사상 가장 아름다운 데뷔작! \n고레에다 히로카즈 감독 첫 장편 연출작 <환상의 빛> \n  \n학창 시절 행방불명 된 할머니의 기억으로부터 자유롭지 못한 ‘유미코’는 동네에서 함께 자란 ‘이쿠오’와의 결혼 후 갓 태어난 아기를 돌보며 소소한 행복 속에 살고 있다. 하지만 여느 때와 다름없었던 어느 날, ‘이쿠오’의 자살은 평화롭던 ‘유미코’의 일상을 산산조각 낸다. 세월이 흘러 무뎌진 상처를 안고 재혼하게 된 그녀는 문득문득 일상을 파고드는 ‘이쿠오’의 기억으로 괴로워하는데…','');
