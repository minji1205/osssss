# 변수
  - 선언
    var="contents"
    var=kim
    var="kim lee hong"
    - 공백이 없어야 한다.
    - 데이터 타입이 없음. 모두 문자열로 인식된다.
  - 사용
    echo $var
    - 셸이 값을 치환한다.
    echo kim
    - [a-zA-Z_0-9]*

## 할당
- 프로그램 이름도 변수로 받을 수 있다.
  command=wc
  oip=-c
  $command $op animals.txt

- 다른 변수도 새 변수로 할당할 수 있다.
  var2=$var
  echo $var2

- 선언하지 않은 변수  : null값이 설정됨 (오류 나지 않음)
  - 명령 라인에 넣어도 무시됨

## null
var=
var=""
var=''

var=' ' # 공백 1개

# 변수 활용하기
- file=grades -> grades1
- fil=grades1
- '${변수}' 구조
- ${file}1

Q. grades -> grades1 이름 변경하기
    mv $file ${file}1
  mv $file $file1

## substring cncnfgkrl
- animals.txt -> animal.md
- ${var:start:size}
- ${var:10:4} # start:end

## $(( 변수 )) 구조
- 수학 연산을 가능하게 하는 구조
- 숫자인 문자열이 들어왔을 때, 숫자로 인식함

Q. 5를 변수에 담고 활용해서 15를 변수에 담아보라.
A. five=5
   fifteen=$((five*3))

- $(( ten = ten + 1))
- 초깃값 0

-비교연산
  $(( ten > 0 )) # 1 == True, 0 == False

Q. 임의의 수 num이 2의 배수인지 확인하는 코드 작성하기.
A. num=4
   echo $(( num%2==0 ))

## $( ) 표현
- 명령의 결과값을 변수에 담고 싶을 대
  result=$( cat /etc/passwd | cut -d: -f1)

# 스트립트 파일 작성하기
- 파일 확장자는 .sh or none
- 1) 파일을 실행가능한 상태로 바꾼다.
  2) 실행하기
- shebang 달기

# 인수

## 위치 인수 (positional argument)
- $n (-9)
- 외부에서 인수를 받아와서 사용할 때
- ${10} : 10 이상일 때 

## $#
- 총 인수 개수
- 큰 따음표로 인수 감싸는 습관 들여야 함

Q. 디렉토리를 인수로 받아서, 파일과 디렉토리의 개수를 세는 스크립트 짜기 (스크립트 짜기 : vi count)

'''sh
파일명: count

-출력-
현재 위치: ...
파일 ...개, 폴더 ....개입니다.
'''

test case 1: .
test case 2: *