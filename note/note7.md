  - 정규 표현식 ###
   - grep
   - ed
   - sed ###

# 정규표현식
  - 와일드카드와 혼동하지 말것
    * ? ... chapter*.txt (2장)
  - 패턴 매칭할 때 사용한다.
  -
  ## 마침표
    - any single character
    - r. # ro, rk, rc, ....
    - .x. # xxx. oxo, ....
    - [a-zA-Z]

  ## ^ (caret)
    -  라인의 처음
    - [^] # not
    - [^a-z] # 소문자가 아닌

  ## $ (dollar)
      - 라인의 끝
      - '^$' #빈 줄
  
  ## [리스트]
    - [a-z]
    - [a-np-z] # o를 제외한 모든 소문자
    - [a-n][p-z]
    - grep '[Tt]he' animals.txt
    - grep -i 'the' animals.txt
  
  ## *
    - zero or more
    - x* # x......
    - 앞글자 한정
    - x 시작하는 단어
      x*(x)
      xx*(o)

  ##  \+
    - 1개 이상
      x\+

  ## \?
    - zero or one

  ## \{i,j\}
    - j :
    - i,
    - ,j
    - x\{10\} #10번
    - x\{1,10\}
    - x\{10,\}

  ## \(regex\)
    - back referencing이 가능하다.
    - '^\(.\)\1' # 동일한 알파벳 2개로 시작하는 라인
    *aa... ll...
    - abba
    - '\(a\)\(b\)2\1'

  ## regex1 \| regex2
    - regex1 or regex2


  Q.
  1) a-f까지 매칭
  2) b나 ab 매칭
  3) 2번 + aaaaaab 매칭
  4) 모든 글자 매칭
  5) #으로 시작하는 문장 매칭
  6) \로 끝나는 문장 매칭
  7) 대문자로 시작하지 않는 문장 매칭
  8) 빈줄이 아닌 모든 줄 매칭
  9) cookie나 cake이 포함된 줄 매칭
  10) w. 매칭

  1. grep [a-f]
  2. grep 'b\|ab'
  3. grep 'b\|ab \|a*b'
  4. grep '^'
  5. grep ^#
  6. grep \$
  7. grep [^A-Z]\
  8. grep [^'^ $']
  9. grep 'cookie \| cake'
  10. grep 'w.'

  ## 확장
    [a-zA-Z0-9_] \w
    \W (not)
    \b  : word boundary (앞뒤) h,o
    \b<regex>\b
      \< 앞 \> 뒤
  
    \B ell
    \s whitespace (space , tab)
    \s

  # ed
    - 텍스트 에디터
    - line-oriented text editor
    - 인터렉티브형
    - format : ed file
  
    - 치환 (a -> b)하라
      [address][명령][정규식][flags]
      1,$s/a/b/
      p
  
      1,$s/[a-z]//g # global (flag)
  
      1,$s[AEIOUaeiou]//g #대문자 포함
  
  
    Q. 모음 지우기
    => 정규표현식 연습 가능함

    - ctrl+d

  # sed
    - stream editor
    - 표준 입출력 사용 가능 ,파이프라인 사용 가능
    - 인터렉티브(x)
    - 단위: 라인


  Q.animals.txt에서 python -> PYTHON 변경후 파일 전체 동일한 이름으로 저장하기
  - 아는 프로그램으로

  '''sh
  tr python PYTHON > animals.txt

  cat animals.txt | tr python PYTHON > animals.txt

  tr 'python' 'PYTHON' animals.txt > animals.txt (x)  
  ; tmp ; mv tmp animals.txt

  sed -i 's/python/PYTHON/g' animals.txt

## sed 실행하기
  - format : sed <script><input_file> #> <out_file>
  - ex) "hello -> world" file
  - sed 's/hello/world/g' file
  - sed -i 's/hello/world/g' file
  - sed 's/hello/world/g' file < file
  - cat file | sed 's/hello/world/g' #파이프라인으로 받을 수 있다.

  1) -i option
    - 동일한 파일에 저장한다. (in-place)
    - 임시파일을 따로 저장하고 싶을 때 -iE # fileE

  2) -n option
    - p 와 같이 사용하여 출력 범위를 지정한다.
    - sed -n '2p' file
    - 5~10줄 출력하기
     sed -n '5,10p' file # ,가 range
  
    - python이 있는 라인만 출력해줘
      sed -n '/python/p' file
  
    - ; 으로 여러 정규식 연결 가능
      sed -n '1p ; $p' fileA fileB fileC
      cat fileA fileB fileC | sed -n '1p ; $p'
  3) -e -f
    -e : expression
    -f : file
    sed -e '1p ; $p' -f file
    - 옵션이 없으면 1번째가 정규표현식, 2번째가 입력파일
  
  sed <option> <script> <input_file> # full format

## script
  - format : <address> <cmd> <options>
    '2p'
    - address : 2
    - cmd : p
    - 5,10p
    - '3d

Q. input_file 에서 python으로 시작하는 라인 삭제하고 , hello -> world로 변경한 뒤 out_file에 저장 하라.
  sed '/^python/d ; s/hello/world/g' input_file > out_file
  sed -e '/^python/d' -e 's/hello/world/g' input_file > out_file

Q.
1) 5번째 줄 삭제
2) python, Python 포함 줄 삭제
3) 처음 10개 줄 중에 2번 실행
4) 각 줄에 첫 3글자 삭제

s'/python/g'

- p, d, s, q (quit)

1) cmd 's'
  - format : s/regex/replacement/flag
  - g
  - p : 해당부분 프린트
  - i : 대소문자 구분 없음

  Q. image.jpg.1 , image.jpg.2 , image.jpg.3
    >> image1.jpg , image2.jpg , image3.jpg

    sed s/\(\)//g

2) address
  - 범위 지정
    '2p'
    sed '160s/a/b/'
    sed '/apples/s///' #apple이 있는 부분에서 뭔가를 하는
    sed '/apple/!s///' # ! : not

    sed '160,2s/a/b' #160만 수행하고 끝
    $
    1,$~2 # step==2

 # 스크립트 작성
    - 파일에 커맨드라인 입력
    - 모드 변경한다.
      chmod + x file
      실행
      name
      ./name

    - 주석 #로 단다.
      - 라인 단위.
