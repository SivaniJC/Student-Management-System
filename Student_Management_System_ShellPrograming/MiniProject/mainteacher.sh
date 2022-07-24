	clear 
	echo "Teacher Login  
	"
	echo "Enter your login: "
	read ln
	
	lgin=`grep -i ^$ln tchloginpg | cut -d ":" -f1`
	if [ "$lgin" = "$ln" ]
	then 
		echo "Enter password : "
		stty -echo
		read pswd 
		stty echo
		
		passwd=`grep -i $pswd tchloginpg | cut -d ":" -f2` 
		if [ "$passwd" = "$pswd" ]
		then	
		clear
	while :
	do
	
		echo  "Hello $ln" 
		echo "
		1) Marks
		2) Assignments
		3) Attendance
		4) Notice
		5) Back to main menu 
		  "
		echo -n "Enter your choice: "
		read tchchoice
	
	
		case $tchchoice in
			1)clear
			while :
			do
			
				echo "
				1) Insert marks
				2) View marks
				3) View particular student marks
				4) Modify marks
				5) Delete marks
				6) Back to main menu
				   "
				echo -n "Enter your choice: "
				read mch
				
			case $mch in
				1)clear
				echo "Enter details "
				echo "Enter rollnumber of student "
				read rn
				echo "Enter name of student "
				read nm
				echo "Enter marks in 1 IA "
				read fia
				echo "Enter marks in 2 IA "
				read sia
				echo "Enter marks in 3 IA "
				read tia
				
				sum=`expr $fia + $sia + $tia`
				avg=`expr $sum / 3`
	
				echo "$rn	$nm	$fia	$sia	$tia	$avg" >> $ln/studmarks  
				
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
			echo ""
			echo "Student marks details"
			cat $ln/studmarks
			
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			 ;;
			
			3)  clear
			echo "Enter roll number"
			read rn
			echo "Result"
			grep ^$rn  $ln/studmarks 
			
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			
			4)clear 
			 echo "Enter roll number"
			read rn1
			grep ^$rn1 $ln/studmarks
			if [ $? -ne 0 ] 
			then
			echo "record for roll number does not exist"
			else
			echo "Enter rollno. of student"
			read rn
			echo "enter name of student"
			read nm
			echo "enter marks of firat ia"
			read fia
			echo "enter marks of second ia"
			read sia
			echo "enter marks of third ia"
			read tia
			
			sum=`expr $fia+$sia+$tia`
			avg=`expr $sum / 3`
			
			record="$rn	$nm	$fia	$sia	$tia	$avg"
			var=`grep -n ^$rn1 $ln/studmarks | cut -c 1`
			
			var1=`expr $var - 1`
			head -$var1 $ln/studmarks>tmp
			echo $record>>tmp
			var3=`wc -l < $ln/studmarks`
			var2=`expr $var3 - $var`
			tail -$var2 $ln/studmarks >>tmp
			cp tmp $ln/studmarks
			echo " Record edited successfully"
			fi
			
			
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;

			
			5)clear  
			echo "Enter roll number"
			read rn
			rn="$rn"
			echo "Delete $rn"
			grep ^$rn  $ln/studmarks
			if [ $? -ne 0 ]
			then echo "Record for roll no. does not exist"
			else grep -v ^$rn  $ln/studmarks > tmp
			mv tmp  $ln/studmarks
			echo "Deletion complete"
			fi  
			
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
			break ;;
			
			esac  
			done 
			;;
			
			
			2) clear
			while :
			do
			echo " 
			1) Enter Assignment 
			2) View Assignments
			3) Delete Assignment
			4) Back to main menu
			  "
			echo -n "Enter your choice : "
			read agnch
			
			
			case $agnch in
				1)
				count=`grep "$ln" extra | cut -d ":" -f2`
				
				echo "Enter assignment $count details: " 
				read assign
								
				echo "$count:$assign" >>  $ln/assignment 
				
				echo "" 
				
				count=`expr $count + 1`
				
				var=`grep -n ^$ln extra | cut -c 1`
				
				var1=`expr $var - 1`
				head -$var1 extra>tmp
				echo "$ln:$count">>tmp
				var3=`wc -l < extra`
				var2=`expr $var3 - $var`
				tail -$var2 extra >>tmp
				cp tmp extra
				
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
				;;
				
				2) clear
				cat  $ln/assignment
				
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
				 cat $ln/assignment
			echo "Enter assignment number to be deleted "
			read rn
			rn="$rn"
			echo "Delete $rn"
			grep ^$rn  $ln/assignment
			if [ $? -ne 0 ]
			then echo "Record for roll no. does not exist"
			else grep -v ^$rn  $ln/assignment > tmp
			mv tmp  $ln/assignment
			echo "Deletion complete"
			fi  
			 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
				 ;;
				 4) clear
				 break  ;;
				 *) echo Incorrect choice ;;
				 esac
			
			done 
			 ;;
			 
			 3) clear 
			 while :
			 do
			 echo "
			 1) Enter Attendance
			 2) View Attendance
			 3) Delete attendance
			 4) Back to Mainmenu"
			 echo -n "Enter your choice: "
			 read attch
			 
			 case $attch in
			 1)clear
			 echo "Enter usn :"
			 read us
			 echo "Attendance details: "
			 echo "\nEnter total classes :"
			 read totc
			 echo "\nEnter number of classes attended :"
			 read tota
			 
			 att=`expr $tota \* 100 `
			 attp=`expr $att / $totc`
			 echo "\nAttendance : $attp"%"" 
			 echo "$us	$attp"%"" >>  $ln/attendance 
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
			 cat $ln/attendance 
			 
			 echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
			;;
			 
			 3)clear
			echo "Enter USN"
			read rn
			rn="$rn"
			echo "Delete $rn"
			grep ^$rn  $ln/attendance
			if [ $? -ne 0 ]
			then echo "Record for roll no. does not exist"
			else grep -v ^$rn  $ln/attendance > tmp
			mv tmp  $ln/attendance
			echo "Deletion complete"
			fi  
			
			echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
				 ;;
			 
			 4)clear 
			 break ;;
			 *) echo "Incorrect choice"
			 esac
			 done
			 ;;
			 
			4)clear 
			while :
			do
			echo "
			1) Enter notice 
			2) View notice
			3) Delete notice
			4) Back to main menu
			"
			echo -n "Enter your choice: "
			read noch
			
			case $noch in
				1)clear 
				count=`grep "notice" extra | cut -d ":" -f2`
				
				echo "Enter notice $count details: " 
				read noti
								
				echo "$count:$noti" >>  notice 
				
				echo "" 
				
				count=`expr $count + 1`
				
				var=`grep -n ^notice extra | cut -c 1`
				
				var1=`expr $var - 1`
				head -$var1 extra>tmp
				echo "notice:$count">>tmp
				var3=`wc -l < extra`
				var2=`expr $var3 - $var`
				tail -$var2 extra >>tmp
				cp tmp extra
				
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
				;;
				
				2) clear 
				cat  notice
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
				 cat notice
				 echo -n "\nEnter notice number to be deleted: "
				 read num
				 var=`grep -n ^$num notice | cut -c 1`				
				var1=`expr $var - 1`
				head -$var1 notice>tmp
				
				var3=`wc -l < notice`
				var2=`expr $var3 - $var`
				tail -$var2 notice >>tmp
				cp tmp notice
				 		 
				 echo "Notice deleted" 
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
				break  ;;
			esac
			
			done
			
			
			 ;;
			 
			5) clear
			break   ;;
			
			*) echo Incorrect choice ;; 
	
			esac	
			done 
			
			else
			echo "Wrong password "
		fi 
		
	else
		echo "Login does not exist"
	fi	
