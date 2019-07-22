# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    birds.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbhuiyan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 15:50:23 by hbhuiyan          #+#    #+#              #
#    Updated: 2019/04/05 16:43:09 by hbhuiyan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
prog_name=$0
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'
invalid="${RED}Error: Invalid input!"
help_n='Type "./birds --help" or "./birds -h" for a list of all options'
create_n="Creating Environment..."

help_usage() {
		echo "Usage: $prog_name - Follow the simple Instructions!"
		echo "Currently Supported: C, Ruby, Javascript"
		echo ""
		echo "Enter code for corrsponding Project Type when prompeted for Type/Language"
		echo ""
		echo "Code			Project Type"
		echo "c			C Project"
		echo "ruby			Ruby Project Bundle"
		echo "js			JavaScript Project (Vanilla JS)"
		echo ""
}

gitignore() {
	git clone https://github.com/havi-b/gitignore.git
	cat ./gitignore/gitignore > .gitignore
	rm -fr gitignore
}

if [[ ( $@ == "--help") ||  $@ == "-h" ]] 
then 
	help_usage
	exit 0
fi 

read -p 'Create a new project environment? (y/n): ' create_p
if [[ -z "$create_p" ]]
then
	create_p=y
fi
if [ $create_p == y ]
then
	read -p 'Type/Language: ' proj_type
	read -p 'Name: ' name
elif [ $create_p == n ]
then
	echo 'Nothing created! Goodbye!'
	exit 0
else
	echo $invalid
	echo $help_n
	exit 1
fi

echo $create_n
echo ""

if [ $proj_type == c ]
then
	mkdir $name
	cd $name
	gitignore
	mkdir src
	mkdir includes
	read -p 'Do you need Libft? (y/n): ' libft_p
	if [[ -z "$libft_p" ]]
	then
		libft_p=y
	fi
	if [ $libft_p == y ]
	then
		echo 'Fetching Libft...'
		git clone https://github.com/havi-b/libft.git libft
		echo 'Creating Header File...'
		git clone https://github.com/havi-b/libftheader.git
		mv ./libftheader/header.h .
		rm -fr libftheader
	elif [ $libft_p == n ]
	then
		echo 'Libft not fetched!'
		echo 'Creating Header File...'
		git clone https://github.com/havi-b/c_header.git
		mv ./c_header/header.h .
		rm -fr c_header
	else
		echo $invalid
		echo $help_n
		exit 1
	fi
	read -p 'Do you need a Makefile? (y/n): ' makefile_p
	if [[ -z "$makefile_p" ]]
	then
		makefile_p=y
	fi
	if [ $makefile_p == y ] && [ $libft_p == y ]
	then
		echo 'Fetching Makefile...'
		git clone https://github.com/havi-b/libftmakefile.git
		mv ./libftmakefile/Makefile .
		rm -fr libftmakefile
	elif [ $makefile_p == y ] && [ $libft_p == n ]
	then
		echo 'Fetching Makefile...'
		git clone https://github.com/havi-b/c_makefile.git
		mv ./c_makefile/Makefile .
		rm -fr c_makefile
	elif [ $makefile_p == n ]
	then
		echo 'Makefile not created!'
	else
		echo $invalid
		echo $help_n
		exit 1
	fi
	exit 0

elif [ $proj_type == ruby ]
then
	bundle gem $name
	cd $name
	gitignore
	exit 0

elif [ $proj_type == js ]
then
	mkdir $name
	cd $name
	npm init
	touch index.js
	read -p 'create HTML file? (y/n)' html_p
	if [[ -z "$html_p" ]]
	then
		html_p=y
	fi
	if [ $html_p == y ]
	then
		touch index.html
	elif [ $html_p == n ]
	then
		echo ""
	else
		echo $invalid
		echo $help_n
		exit 1
	fi
	read -p 'Initiate Node? (y/n): ' node_p
	if [[ -z "$node_p" ]]
	then
		node_p=y
	fi
	if [ $node_p == y ]
	then
		npm install
		read -p 'Enter Node Modules to Install: ' modules_p
		if [[ -z "$modules_p" ]]
		then
			echo 'No Modules Installed!'
		else
			npm install --save-dev $modules_p
		fi
	elif [ $node_p == n ]
	then
		echo ""
	else
		echo $invalid
		echo $help_n
		exit 1
	fi
	fi
	gitignore
	exit 0
	else
		echo $invalid
		echo $help_n
		exit 1
fi