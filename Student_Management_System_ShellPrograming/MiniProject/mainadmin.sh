	clear
	while :
	do
	   echo Hello Admin 
	   echo "
	   1) Student login
	   2) Teacher login
	   3) Student details 
	   4) Timetable
	   5) Back to main menu
	    "
	   echo -n "Enter your choice : "
	   read admchoice
	   
	   case $admchoice in
	   	1) clear
	   	while :
	   	do
	   	echo "
	   	1) Create student login
	   	2) View student logins
	   	3) Delete student login
	   	4) Back to main menu
	   	"
	   	echo -n "Enter your choice: "
	   	read asch
	   	
	   		case $asch in
	   		1) echo "Student login Creation "
	   		echo " "
	   		echo "Enter student usn : "
	   		read usn 
	   		
	   		echo "Enter password : "
	   		read passwd
	   		
	   		echo "$usn:$passwd" >> studloginpg
	   		
	   		
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
	   		cat studloginpg 
	   		
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
	   		echo "Student login deletion"
	   		echo " "
	   		echo "Enter student usn : "
	   		read usn
	   		
	   		echo "Login deleted "
	   		
	   		grep -v $usn studloginpg > temp
	   		mv temp studloginpg 
	   		
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
	   		break ;;
	   		esac
	   	
	   	
	   	done ;;
	   	 	
	   		   	
	   	2) clear
	   	while :
	   	do
	   	echo "
	   	1) Create teacher login
	   	2) View teacher logins
	   	3) Delete teacher login
	   	4) Back to main menu
	   	"
	   	echo -n "Enter your choice: "
	   	read atch
	   		
	   		case $atch in
	   		1) echo "Teacher login Creation "
	   		echo " "
	   		echo "Enter teacher login : "
	   		read lgn
	   		
	   		echo "Enter password : "
	   		read tpasswd
	   		
	   		echo "$lgn:$tpasswd" >> tchloginpg
	   		
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
	   		cat tchloginpg 
	   		
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
	   		echo "Teacher login deletion"
	   		echo " "
	   		echo "Enter teacher login : "
	   		read lgn
	   		
	   		echo "Login deleted "
	   		
	   		grep -v $lgn tchloginpg > temp
	   		mv temp tchloginpg 
	   		
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
	   		break ;;
	   		esac
	   	
	   	
	   	done ;;
	   	 	 	
	   		   		
	   		
	   	3) clear
	   	while :
	   	do
	   	echo "
	   	1) Enter student details
	   	2) View student details
	   	3) Delete student details
	   	4) Back to main menu
	   	"
	   	echo -n "Enter your choice: "
	   	read stde
	   	
	   	case $stde in	
	   	   	
	   	1)clear
	   	echo "
	   	Enter student details :
	   	"
	   	echo "Enter usn : "
	   	read usn
	   	echo "Enter name : "
	   	read nm
	   	echo "Enter sem : "
	   	read sem
	   	echo "Enter sec : "
	   	read sec
	   	echo "Enter fees status : "
	   	read fee
	   	
	   	echo "$usn	$nm	$sem	$sec	$fee" >> details	
	   	 	   		   	 	
	   	echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi ;;
			
		2)clear		
		cat details
		echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
		
		;;		
		
		3)clear
		echo "Enter roll number"
			read rn
			rn="$rn"
			echo "Delete $rn details"
			grep ^$rn  details/$rn
			if [ $? -ne 0 ]
			then echo "Record for roll no. does not exist"
			else grep -v ^$rn  details/$rn > tmp
			mv tmp  details/$rn
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
			
			esac
		done 
	   	;;
	   	
	   	4) clear
	   	while :
	   	do
	   	echo "
	   	1) View Timetable
	   	2) Modify Timetable
	   	3) Back to main menu " 
	   	echo -n "Enter your choice: "
	   	read ttch
	   	
	   	case $ttch in 
	   	1) cat timetable 
	   	echo "" 
			echo -n "Press enter key to go back "
			read key
			
			if [ $key==13 ]
			then 
			clear
			continue
			fi
	   	;;
	   	2) gedit timetable ;;
	   	3)clear 
	   	break ;;
	   	*) echo "Incorrect choice" ;;
	   	esac
	   	done
	   	;;	   	  	
	   		   	
	   	5) clear
	   	break ;;
	   esac
	   done
