4) 문서 편집기
  - vi, vim, emacs, notepad++, ...
  - vi : visual editor
    - vim : vi improved(업그레이드 버전 ex) 정규표현식, ...)
  - 프롬프트에서 파일 을 직접 편집할 수 있게 해주는 툴
  - 특징
  - 화면 단위 편집기
  - 유닉스 계열에서 가장 많이 사용함
  - 텍스트 편집 기능만 제공함
  - 'less'
  - 모드 : 일반 모드 <-> 입력모드 <-> 명령모드
    - ESC로 모드 전환
    - 명령모드 : 파일 저장, 덮어쓸건지, 빠져나갈건지 등
    => vi로 파일 열기 -> 입력모드 -> ESC -> 빠져나가기
    - 입력모드(인자x)
    - i: 현 커서에서 입력
    - a: 현 커서 한 칸 뒤에서 입력
    - o: 한 줄 추가 후 입력
    - 명령모드
    :wq! + enter

  - 파일 아무거나 열어서 수정하고 저장하고 나오기

  - set -o vi (한번만)
    - vim 라인에서 엔터

  - 깃 초기화 -> 깃 시작

5) 패턴 매칭

  - 프롬프트에서 셸, 프로그램이 작동한다.
    grep Linux sample.txt
  - 프롬프트는 우리가 명령ㅇ르 실행하는 곳
  - 셸은 사용자와 리눅스 운영체제를 연결해주는 매개체
    리눅스 - 셸, 프롬프트 - 사용자
  - 셸의 역할은 명령 실행, 와일드카드, 파이프라인 처리한다.

grep Linux *.txt
*.txt -> sample.txt, a.txt, ....
  - 셸이 패턴매칭을 처리하여 결과물을 프로그램에 보낸다.
    - head xxx | grep | ....

  - *
    - zero or more (0개 이상)
    - *.txt : .txt, animals.txt, a.txtt
    - 0개 이상의 연속열과 일치하는

  -?
    - 1개 매칭
      ch1 ch2 ch3 ... ch100
      grep Linux chapter? # 한 자리수만 매칭

  - [ ]
    - 대괄호 안에 열거되어 있는 것 중 일치하는 문자열 1개 있을 때
      grep Linux ch[12345] # 12(x) 123(x)
      grep Linux ch [1-5]

Q1. 짝수로 끝나는 모든 파일 (chxxx)
 grep Linux ch*[24680]

Q2. 대문자로 시작하고, 언더스코어 포함되어 있는 파이썬 파일 매칭
 ([a-z] 모든 소문자 [A-Z] 모든 대문자 .py)

 ls [A-Z]*_.py # name_lee.py  (x)
 grep Linux ch[A-Z]*_*.py  (o)
=> 둘의 차이

Q3. /etc 디렉터리 안에 파일 확장자가 .conf인 파일 목록 조회하기
 ls /etc/*.conf

  - 와일드 카드 주의점 : 매칭되는 파일이 없으면 에러
   ls *.doc
  - 디렉토리 경로, 파일명

6) 변수 평가
  - "평가" : 변수를 리터럴 값으로 치환하여 값을 평가함

  $VAR - 이미 지정된 변수
  $var - 사용자가 지정하는 변수
   ls $var
    -> var=./notes/w3.txt
    ls ./notes/w3.txt

  - HOME - 루트 디렉터리
  - $USER - 사용자망


  - echo 변수랑 텍스트 같이 출력가능
  - printenv '$'없어도 출력해줌

  - 변수 설정하기
  name=lee
  - 공백 없어야 함
  - 변수=값
  - 변수를 사용하려면 앞에 "$변수명"

 Q. age라는 변수에 자신의 나이를 담고 "내 나이는 ...살이다" 변수를 이용해서 출력한다.
  age = 22
  echo My age is $age

  - dir1=$HOME/notes/chapter1/
  $dir1
  - cd $dir1


7) 패턴과 변수
  mammals
   ㄴ lizard.txt
   ㄴ snake.txt
   ㄴ .....txt
  reptiles

   mv <from> <to>
 Q1. 변수에 담아서 이동시키려면?
 dir1=mammals/*.txt
 mv $dir1 reptiles

 dir1="lizard.txt snake.txt"
 mv $dir1 reptiles  (x) (" "안의 내용 하나로 인식)

 Q2. 패턴매칭으로 이동시키려면?
  -> mv mammals/*txt reptiles

8) alias
  - 단축이름 별명으로 설정하기
  - alias uniqc="uniq -c"
  uniqc | ...
  -removeall="rm -r"

  - shadowing
  alias grep="grep Linux *.txt"
  alias ls="ls-l"

  -alias
  -unalias uniqc