clear
t=999
while [ $t -ne 0 ]; do
    echo "\n1.create database"
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
        echo "\nenter rollno. of student"
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
        echo "\nenter rollno. of student"
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
        echo "\nEnter roll number"
        read rn
        rn="$rn"
        echo "delete $rn"
        grep ^$rn student
        if [ $? -ne 0 ]; then
            echo "record for roll no. does not exist"
        else
            grep -v $rn student >>tmp
            cp tmp student
            echo "\ndeletion complete"
        fi
        ;;
    5)
        echo ” enter roll number ”
        read rn1
        grep ^$rn1 student
        if [ $? -ne 0 ]; then
            echo "record for roll number does not exist"
        else
            echo "\nenter rollno. of student"
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
            var=$(grep -n ^$rn1 student | cut -c 1)
            echo $var
            var1=$(expr $var - 1)
            head -$var1 student >tmp
            echo $record >>tmp
            var3=$(wc -l <student)
            var2=$(expr $var3 - $var)
            tail -$var2 student >>tmp
            cp tmp student
            echo " Record edited successfully"
        fi
        ;;
    6)
        echo "\nEnter roll number"
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
