clear
while :
do
echo " "
echo "		Welcome to Student Task Management System		"	
echo ""
echo " Enter the mode :  "
echo " 1) Student View "
echo " 2) Teacher View "
echo " 3) Admin View " 
echo " 4) Exit " 
echo "" 
echo -n Enter your choice : 
read mode

case $mode in
	1) sh mainstudent.sh ;;
	2) sh mainteacher.sh ;;
	3) sh mainadmin.sh ;;
	4) exit ;;
	*) echo Incorrect choice ;;
	
esac 
done

