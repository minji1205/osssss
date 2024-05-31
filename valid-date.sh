1. 월을 대문자로 변환
cap_month() {
case $1 in
    january)   echo "January" ;;
    february)  echo "February" ;;
    march)     echo "March" ;;
    april)     echo "April" ;;
    may)       echo "May" ;;
    june)      echo "June" ;;
    july)      echo "July" ;;
    august)    echo "August" ;;
    september) echo "September" ;;
    october)   echo "October" ;;
    november)  echo "November" ;;
    december)  echo "December" ;;
    *)         echo "Invalid Month" ;;
esac
}

2. 
cap_month() {
    case $1 in
        jan*|1)  echo "Jan" ;;
        feb*|2)  echo "Feb" ;;
        mar*|3)  echo "Mar" ;;
        apr*|4)  echo "Apr" ;;
        may*|5)   echo "May" ;;
        jun*|6)  echo "Jun" ;;
        jul*|7)  echo "Jul" ;;
        aug*|8)  echo "Aug" ;;
        sep*|9)  echo "Sep" ;;
        oct*|10) echo "Oct" ;;
        nov*|11) echo "Nov" ;;
        dec*|12) echo "Dec" ;;
        *)       echo "Invalid Month" ;;
    esac
}

3. 윤년인지 판별할 것
leap_year() {
  year = $1
  if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
    return 366;
  }
  else {
    return 365;
  }
}

4. 각 달의 일 수 설정
month_days() {
  month=$1
  year=$2
  case $month in
      1|3|5|7|8|10|12) days=31 ;;
      4|6|9|11)        days=30 ;;
      2)
          if leap_year $year; then
              days=29
          else
              days=28
          fi
          ;;
      *) days=-1 ;;
  esac
  echo $days
}

5. 인수가 3개가 아닐 경우 종료
if [ "$#" -ne 2 ]; then
  echo "인수의 개수가 올바르지 않습니다."
  exit 1
fi