# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boar.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: havi <havi@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/22 15:38:49 by hbhuiyan          #+#    #+#              #
#    Updated: 2019/03/22 22:24:13 by havi             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
if (($EUID != 0)); then
	echo "You must be root user!"
else
    cd ~/Desktop
    git clone https://github.com/havi-b/hercules_boar.git boar
    cd boar
    YEAR=$(date | awk '{print $6}')
    echo "open boar.html" | at -t $YEAR'12210842'
fi