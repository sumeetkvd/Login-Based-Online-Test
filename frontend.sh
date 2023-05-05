#!/bin/bash

# --- GLOBAL VAR DECLARATION START ---
	
USER_DB="./users.db"

# --- GLOBAL VAR DECLARATION OVER ---

# --- main_screen def start ---

main_screen () {
	
	echo "Please Choose the Options:"
	echo "1. Sign In"
	echo "2. Sign Up"
	echo "3. Exit"
	
	read -p"Choice :" USER_OPTION 	
	
		
	if (($USER_OPTION  == 1)) || (($USER_OPTION  == 2)) || (($USER_OPTION  == 3))
	 then
		case $USER_OPTION in
			1)
				#echo "Sign In"
				sign_in
			;;
			
			2)
				#echo "Sign Up"
				sign_up
			;;
			3)
				exit
			;;
		esac
				
	else
				
		echo " "
		echo "Warning: Please Choose Relevant Option."
		echo  "Redirecting..."
		
		while sleep 3; do
			clear
			break
		done
		
		main_screen
	fi
}

# --- main_screen def over ---

# --- sign_up def start ---

sign_up () {
	
	
	if [[ -f "$USER_DB" ]]
	then 
		while sleep 3; do
			clear
			break
		done
		
		echo "My Command Line Test"
		echo "Sign Up Screen"
		echo ""
		read -p "Please choose your Username: " USER_NAME
		touch temp_users.db			#creating temporary username file
		cut -d= -f1 users.db > temp_users.db
						
		if grep -Fxq "$USER_NAME" temp_users.db 
		  then
			
			echo "The $USER_NAME already exists. Please Choose another username"
			echo "Redirecting..."
			sign_up
			
		else
			read_password
		fi
		rm -rf temp_users.db      #deleting temporary username file
	
	else
		touch users.db
		echo "File Created"
	fi
	
	
}

# --- sign_up def End ---

# --- read_password def start ---
read_password () {

			read -p "Please Enter the Password: " USER_PASS1
			read -p "Please Re-enter the Password: " USER_PASS2
			
			if [[ $USER_PASS2 == $USER_PASS1 ]]
			 then 
			 	echo "Sign-Up Successful !"
			 	echo "$USER_NAME=$USER_PASS1" >> users.db
			 else 
			 	
			 	echo "."
			 	echo "."
			 	echo "Password Does not match. Please Try Again..."
			 	read_password
			 fi

}
# --- read_password def End ---



# --- sign_In_Screen def Start ---

sign_in_screen () {
	
	while sleep 3; do
		clear
		break
	done
	
	echo "Please Choose the Options:"
	echo "1. Take Test"
	echo "2. View Your Test"
	echo "3. Exit"
	
	read -p"Choice :" USER_OPTION_SIGNIN 
	
	if (( $USER_OPTION_SIGNIN == 1)) || (($USER_OPTION_SIGNIN == 2)) || (($USER_OPTION_SIGNIN  == 3 ))
	 then
		case $USER_OPTION_SIGNIN in
			1)
				echo "TAKE TEST"
				
			;;
			
			2)
				echo "VIEW TEST"
				
			;;
			3)
				exit
			;;
		esac
	fi
}

# --- sign_In_Screen def End ---

# --- sign_In def Start ---

sign_in () {

	sign_in_screen

}


# --- sign_In def End ---

#Function Calling
main_screen

