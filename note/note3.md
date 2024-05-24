# 버전 관리
  - 파일의 변화를 시간에 따라 저장했다가 나중에 특정 시점의 버전으로       다시 꺼내 올수 있는 시스템
  - 협업
  - 툴 : 깃

# 깃
  - 데이터 저장 방식: 스냅샷
  - 오프라인
    -if 빈 -> 텍스트 입력 -> 빈 파일
    - 키(key) - 벨류(value)
    - 키는 고유하다.
    - 벨류 (텍스트)

  -깃 상태
    -수정
    -커밋 : 저장
    -스테이지 : 스냅샷 찍어서 커밋할 준비가 된 상태

    -수정
    -스테이징 -> 커밋

    -깃 커밋 순서:
      상태 체크 -> (수정) -> 스테이징 -> 커밋

  1) 버전 체크
    git --version
      * git -v --version

  2) 사용자 정보 설정하기
    - name
    -email
    -옵션 --global : 전체 시스템에 영향을 준다.
      - 프로젝트마다 다른 이름을 사용하고 싶을 경우는 옵션을 제외함

    - core.editor
      -vi 빠져나올 떄는 : q + enter

    -git help <프로그램 명>

# 디렉터리
  - 우리가 말하는 "폴더"
  - 트리구조를 가진

  - 하위 디렉터리 (child) - animals > mammals
  - 상위 디렉터리 (parent) - mammals > animals
  - 형제 디렉터리 (sibling) - mammals , reptile

  - /로 구분함
    animals/mammals/cow.txt

    <디렉터리 /.../ 파일명>
  - / : 루트 디렉터리

  - 절대경로: 루트에서부터 시작
  - 상대경로: 현재 기준
    - 나의 현재 위치가 mammals이다. 근데 위로 가고싶다.
  1) 절대경로 : /....../mammals
  2) 상대경로 :
        .. : 부모 디렉터리 -> cd..
        . : 현재 디렉터리

  - cd : change directory

  - pwd , cd
  - .. .
  - mkdir

Q. new_dir로 이동해서 디렉터리 "dir2" 만들어보기
mkdir new_dir
cd new_dir
mkdir dir2

  3) 깃 초기화
  git init : .git에 모든 변경사항(스냅샷)이 저장이된다.

  4) 상태 체크
  git status

    깃이 모르는 파일일 경우
    untracked -> 'add' -> tracked

    add -> commit

    -git add <파일>

1. 알파벳 중복없이 정렬해서 출력하는 코드
cut -f1 grades | sort | uniq
sort grades | cut -f1 | uniq
cut -c1 grades | sort | uniq

2. sort -n : string -> num
  1, 11, 111, 2 -> 문자
  1, 2, 11, 111 -> 숫자
  sort grades | cut -f1 | uniq -c | sort -n(숫자로 인식시키기)

3. git
- 여러 파일을 한꺼번에 스테이징하기
 git add .
- git commit -> txt
 git commit -m "your msg"
- 매 수업에 커밋으로 파일을 저장하는 연습하기