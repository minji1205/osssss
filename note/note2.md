# grep
  - matching
  - 대소문자 구분함
  - 라인 전체를 출력한다.

Q. The가 있는 txt파일을 전체 조회하라: *
ex) grep The *.txt

- -v : 조건 문자열이 없는 라인 출력
  ex) grep -v The animals.txt

Q. /usr/lib에 포함된 하위 디렉터리 개수 알아내기
ls -l /usr/lib | wc -

Q. /usr/lib 에 포함된 앞에가 d인 디렉터리 개수 알아내기
-> ls -l /usr/lib | cut -c1 | grep d | wc -l

# sort
  - 정렬 , 오름차순 (abcde....)
  - -r (reversed)
  - 숫자 정렬 (-n)
  sort -n -r sample.txt
  sort -nr sample.txt

Q1. animals.txt 3번째 필드가 숫자 => 오름차순 정렬해서 출력
-> cut -f3 animals.txt | sort -n

Q2. 최소값 , 최댓값 출력하기
max-> cut -f3 animals.txt | sort -r | head -n1
min-> cut -f3 animals.txt | sort -n | head -n1

Q3./etc/passwd 디렉터리에서 사용자 이름 정렬하여 추출하기
->head /etc/passwd | cut -d: -f1 | sort -n

cut -d : -f1 /etc/passwd | sort

Q4.사용자 중 root가 있는지 확인하기
-> head /etc/passwd | cut -d: -f1 | grep root

-w 인자 -> "root"


Q5. ls , head
l

# letters  내용 조회하기

# uniq
  - 중복된 문자열을 제거해서 보여주되 , 인접한 중복 문자열만

Q. 성적표 (grades 파일) 에서 가장 빈번하지 않은 등급부터 출력 하기.
 -> uniq -c grades.txt | sort -nr | head -n1

 /*cut -f1 grades | sort | uniq -c | sort -n
 uniq grades | sort -r | cut -f1
 uniq -c grades | sort -nr
 sort -r grades | cut -f1 | uniq -c | head -n1
*/
aaaaccccbbbaaa

sort -> uniq
aaaaaaabbbbcccc ->abc
위아래 두개는 다름
uniq -> sort
acba -> aabc

