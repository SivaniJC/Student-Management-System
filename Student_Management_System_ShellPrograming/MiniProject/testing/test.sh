clear
t=999
while [ $t -ne 0 ]; do
    echo "1.create database"
    echo "2.view database"
    echo "3.Insert record"
    echo "4.Delete record"
    echo "5.Modify record"
    echo "6. View record of a particular student"
    echo "7.exit"
    echo "Enter your choice"
    read choice
    case $choice in
    1)
        echo "enter rollno. of student"
        read rn
        echo "enter name of student"
        read nm
        echo "enter marks of UNIX"
        read un
        echo "enter marks of DBMS"
        read db
        echo "enter marks of ATC"
        read atc
        record="$rn $nm $un $db $atc"
        echo $record >student
        ;;
    2)
        echo "show Database of student"
        cat student
        ;;
    3)
        echo "enter rollno. of student"
        read rn
        echo "enter name of student"
        read nm
        echo "enter marks of UNIX"
        read un
        echo "enter marks of DBMS"
        read db
        echo "enter marks of ATC"
        read atc
        record="$rn $nm $un $db $atc"
        echo $record >>student
        ;;
    4)
        echo "Enter roll number"
        read rn
        rn="$rn"
        echo "delete $rn"
        grep ^$rn student
        if [ $? -ne 0 ]; then
            echo "record for roll no. does not exist"
        else
            grep -v ^$rn student >tmp
            mv tmp stud
            echo "deletion complete"
        fi
        ;;
    5)
        echo ” enter roll number ”
        read rn1
        grep ^$rn1 stud
        if [ $? -ne 0 ]; then
            echo "record for roll number does not exist"
        else
            echo "enter rollno. of student"
            read rn
            echo "enter name of student"
            read nm
            echo "enter marks of UNIX"
            read un
            echo "enter marks of DBMS"
            read db
            echo "enter marks of ATC"
            read atc
            record=”$rn $nm $un $db $atc ”
            var=$(grep -n ^$rn1 stud | cut -d : -f1)
            echo $var
            var1=$(expr $var – 1)
            head -$var1 student >temp
            echo $record >>temp
            var3=$(wc -l >temp)
            cp temp stud
        fi
        ;;
    6)
        echo "Enter roll number"
        read rn
        echo "result"
        grep ^$rn student
        ;;
    7)
        t=0
        ;;
    *) echo "Enter right choice" ;;
    esac
done
