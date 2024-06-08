PhoneBook="phonebook.txt"

# 종료 코드
Invalid_arg=1
Invalid_num=2

# 지역번호와 해당 지역 매핑
declare -A Area_Codes
Area_Codes=(
  ["02"]="서울"
  ["031"]="부산"
  ["032"]="인천"
  ["033"]="대전"
  ["034"]="광주"
)

# 전화번호 추가 및 정렬
add_sort_phone() {
    echo "$1 $2 $3" >> "$PhoneBook"
    sort -o "$PhoneBook" "$PhoneBook"
}

# 입력값 유효성 검사
if [[ $# -ne 2 ]]; then
    echo "잘못된 입력값입니다. 이름과 전화번호를 입력하세요."
    exit $Invalid_arg
fi

name=$1
Phone_number=$2

# 전화번호 유효성 검사
if [[ ! "$Phone_number" =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
    echo "전화번호 형식이 잘못되었습니다. 올바른 형식: 000-0000-0000"
    exit $Invalid_num
fi

# 지역번호 추출
Area_Code=${Phone_number%%-*}

# 지역 확인
Area=${Area_Codes[$Area_Code]}
if [[ -z "$Area" ]]; then
    echo "알 수 없는 지역번호입니다."
    exit $Invalid_num
fi

# 이름 검색
Result=$(grep "^$name " "$PhoneBook")

if [[ -n "$Result" ]]; then
    Existing_Phone=$(echo "$Result" | awk '{print $2}')
    if [[ "$Existing_Phone" == "$Phone_number" ]]; then
        echo "동일한 전화번호가 이미 존재합니다."
        exit 0
    else
        add_and_sort_phonebook "$name" "$Phone_number" "$Area"
        echo "전화번호가 업데이트되었습니다."
        exit 0
    fi
else
    add_and_sort_phonebook "$name" "$Phone_number" "$Area"
    echo "새로운 전화번호가 추가되었습니다."
    exit 0
fi