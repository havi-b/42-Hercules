# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mares.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: havi <havi@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/22 15:28:03 by hbhuiyan          #+#    #+#              #
#    Updated: 2019/04/22 23:10:57 by havi             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

killprocess() {
    sleep 5
    pkill -1 podargos ruins lampon xanthos yes crap -bash eurystheus
    pkill -6 podargos ruins lampon xanthos yes crap -bash eurystheus
}

./manger &
killprocess
rm -fr crap*

./TheKing/mares &
sleep 5
KILLIT=`ps -j | grep mares | awk '{print $4}' | head -1`
pkill -1 -g $KILLIT
pkill -6 -g $KILLIT