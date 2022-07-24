	clear
	echo "Student login
	"
	echo "Enter your USN: "
	read usn
	
	lgin=`grep -i ^$usn studloginpg | cut -d ":" -f1`
	if [ "$lgin" = "$usn" ]
	then 
	echo ""
		echo "Enter password : "		
		stty -echo
		read pswd 
		stty echo
		passwd=`grep -i $pswd studloginpg | cut -d ":" -f2` 
		if [ "$passwd" = "$pswd" ]
		then
		clear
			while :
	do
	echo "Hello $usn"
		echo "  
			1) Attendance
			2) Marks
			3) Tasks/Assignments
			4) Notice
			5) Time Table 
			6) Personal Details
			7) Back to main menu
			    "
		echo -n "Enter your choice: "
		read studchoice
		case $studchoice in
			1)clear
			echo "Attendance details: "
			echo ""
			for i in me5c cns5c dbms5c atc5c python5c unix5c
			do	
			echo -n "$i	" 
			cat $i/attendance | grep "$usn" 
			echo ""
			done
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;; 
			
			2) clear
			echo "Marks Details"
			echo ""
			echo "Subject		USN		Name	IA-1	IA-2	IA-3	Average"
			for i in me5c cns5c dbms5c atc5c python5c unix5c
			do	
			echo -n "$i	" 
			cat $i/studmarks | grep "$usn" 
			echo ""
			done
			
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			
			3) clear
			echo "Assignment details"
			for i in atc5c dbms5c python5c cns5c me5c unix5c
			do
			cat $i/assignment | cut -d ":" -f2 
			echo "\n"
			done			  
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			
			4) clear
			echo ""
			cat notice | cut -d ":" -f2 
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			
			5) clear
			echo "Timetable"
			echo ""
			echo "	     8:30-9:30	  9:30-10:30  11-12  12-1	1-2	2-3"
			day=`date | cut -d " " -f1`
			tt=`grep "$day" timetable`
			echo "$tt"
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			
			6) clear
			echo "Personal Details"
			echo ""
			echo "USN		Name		Sem	Sec	Fee status"
			cat details | grep "^$usn" 
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			 ;;
			 
			7) clear
			break ;;
			*) echo " Incorrect choice " ;;
		esac			
	done
		
		
		else
			echo "Wrong password "
		fi 
		
	else
		echo "Usn does not exist"
	fi	
	
