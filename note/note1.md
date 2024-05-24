# shell 셸
  - 리눅스 커널과 사용자를 연결해주는 인터페이스
  - 사용자의 입력을 읽고, 해석하고, 프로그램 실행
  - "셸 스트렙트" : 일련의 명령행을 한 파일에 담아놓음
  - 리눅스 운영체제의 표준인 bash (bourne again shell)

# 문법
  <프로그램 명> <내용>
  echo : 셸 명령, 내장명령, 프로그램
    - 화면에 출력하는 명령

  변수를 내용에 넣을 수 있다.
    - 스페이스 주의
    - " " 사용가능, 스페이스 없으면 없이도 됨
    - 변수 사용시 => \$ 기호 사용
    - 내장된 변수 존재, 이것들은 대문자로 지정 

# 명령의 특징 
  - 한 프로그램이 한 가지 일만 한다. 
  - 명령의 조합을 잘 해야 한다. 

# 명령 (command)
  - 프로그램 그 자체
  - 단순명령 (simple command) : 프로그램 + 내용
    ex) ls-1 /bin
  - 결합명령 (combined command) : 프로그램 + 옵션 + 내용 "순서에 주의"
    ex) ls-l /bin |less
      - 프로그램 구체화 역할
      - '-h'
  - ls : list
  - change directory 

$ ls - l 

# 파이프
  - |
  - 명령행 | 명령행
  - less
  - 이전 명령행의 출력 값을 다음 명령행의 입력값으로 보내는 역할
  'echo $PATH | less'
  - 파이프라인 : 파이프라인으로 연결한 명령

- wc , head , cut , grep , sort  , uniq

# 입력
  - stdin : standard input/in. 표준 입력
  - 프롬프트를 통해서 입력되는 입력스트림

# 출력
  -stdout : standard output/out. 표준 출력
  -출력 스트림

Q . /bin 하위 디렉토리를 라인별로 출력하라.
A. ls -l /bin

# wc
  - 파일 내용의 줄 (line) 수 , 단어(word) 수 , 문자(character)수     출력하는 명령

  - 명령인자
  -w
  -l
  -c

ex2) txt 단어 몇 글자인지 세기
-> wc -w one.txt

ex3) /bin  파일+디렉터리 개수 새기
-> ls-l/bin | wc -l

# head
  - 파일의 n번째 줄 내용을 화면에 출력하는 명령
  -n :
    head -n3
    (default = 10)
  - 파일이 90줄 -n100

ex1) 이 파일의 1번째 줄 단어 수 , 글
-> head -n1 one.txt | wc -w -c
-> head -n1 one.txt | wc -wc

ex2) /bin 파일 중에서 앞에 5개만 출력하기
-> ls /bin | head -n5

# cut
  - 파일의 내용 중에서 특정 열만 출력하는 명령
  - 범위 지정 방법:
    -\t : -f
    james \t 34
    f1        f2

    cut -f1 name.txt

    - 3 , 5 ,6
    cut -f3,5,6
    - 4-5
    cut -f4-5

# 1번째 필드 조회하는데 1번째 줄만 출력하기
-> cut -f1 animals.txt | head -n1

-c :char

#animal.txt 1필드의 1번째 단어의 마지막 글자 출력 


cut animals.txt -f1 | rev | cut -c1

cut animals.txt -f1 |head -n1 | rev | cut -c1
animals.txt 4번째 필드: Lutz, Mark에서
Lutz만 출력하기 (모든 last name만 가져오기)
cut -f4 animals.txt | head -n1 | cut -d, -f1