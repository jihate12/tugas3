#!/bin/bash
pilih=
until [ "$pilih" = "0" ];
do
	echo ""
	echo "PROGRAM MENU"
	echo "1 - Permainan"
	echo "2 - Latihan"
	echo ""
	echo "0 - exit program"
	echo ""
	echo -n "enter Masukan pilihan : "
	read pilih
	echo ""
	case $pilih in
		1 )
			until  [ "$pilih" = "2" ];
			do
				clear
				echo ""
				echo "1 - Tebak Angka"
				echo "2 - Menu Utama"
				echo ""
				echo -n "Masukan Pilihan : "
				read pilih
				echo ""
				case $pilih in
					1 )
						until [ "$pilih" = "11" ];
						do
							angka=$(( $RANDOM%10 ))
							for (( i=1; i<= 3; i++ ))
							do
								echo ""
								echo "Kesempatan Ke-$i"
								echo "Masukan Tebakan (0-9) : "
								read tebak
								echo ""
								if [ "$tebak" -gt "$angka" ]; then
									echo "Tebakanmu Telalu Tinggi"
									echo "Silahkan Tebak Lagi"
									sleep 1
								elif [ "$tebak" -lt "$angka" ]; then
									echo "Tebakan Terlalu Rendah"
									echo "Silahkan Tebak Lagi"
									sleep 1
								else
									echo "Tebakanmu Benar"
									# echo "Silahkan Tebak Lagi"
									i=4
									sleep 1
								fi
								if [ "$i" -eq "3" ]; then
									clear
									echo "GAME OVER"
									echo "Game Selesai, Sihlakan Kembali Ke Menu Utama"
									sleep 1
								fi
							done
							echo "Tekan y Untuk coba lagi"
							read pilih
							case $pilih in
								"y" | "Y" )
									echo "Coba lagi"
									pilih="12"
								;;
								* ) pilih="11"
								;;
							esac
						done
					;;
					2 ) echo "bye..";;
					* ) echo "Pilih 1 atau 2"
						sleep 1
					;;
				esac
			done	
		;;					
		2 )
			until [ "$pilih" = "3" ];
			do
				clear
				echo ""
				echo "1 - Chessboard"
				echo "2 -  Onyamuk"
				echo "3 - Menu Utama"
				echo ""
				echo -n "Masukan Pilihan : "
				read pilih
				echo ""
				case $pilih in
					1 )
						pilihan=
						until [ "$pilih" = "11" ]
						do
							clear
							for ((i=1;i<= 8; i++))
							do
								for ((j=1;j<= 8; j++))
								do
									total=$(($i+$j))
									temp=$(($total%2))
									if [ $temp -eq 0 ]; then
										echo -e -n "\033[47m $j "
									else
										echo -e -n "\033[40m $j "
										sleep 0.1
									fi
								done
								echo ""
							done
							echo -e -n "\033[0m"
							echo ""
							echo "Tekan y Untuk coba lagi"
							read pilih
							case $pilih in
								"y" | "Y" )
									echo "Coba lagi"
									pilih="12"
								;;
								* ) pilih="11"
								;;
							esac
						done
					;;
					2 )
						pilihan=
						until [ "$pilih" = "11" ];
						do
							echo -en "\033[0m"
							clear
							warna=( 41 43 45 44 46 47 42 )
							for (( i=0; i <= 6; i++ ))
							do
								tput cup 10 0
								for (( j=1; j<= 20; j++ ))
								do
									echo -en "\033[${warna[i]}m "
									sleep 0.03
								done

								for (( j=10; j<= 20; j++ ))
								do
									tput cup $j 20
									echo -en "\033[s"
									echo -en "\033[${warna[i]}m "
								done

								for (( j=20; j>= 1; j-- ))
								do
									tput cup 20 $j
									echo -en "\033[s"
									echo -en "\033[${warna[i]}m "
									sleep 0.03
								done

								for (( j=20; j>= 12; j-- ))
								do
									tput cup $j 0
									echo -en "\033[s"
									echo -en "\033[${warna[i]}m "
									sleep 0.03
								done
							done
							echo -en "\033[0m"
							echo "Tekan y Untuk coba lagi"
							read pilih
							case $pilih in
								"y" | "Y" )
									echo "Coba lagi"
									pilih="12"
								;;
								* ) pilih="11"
								;;
							esac
						done
					;;
					3 ) echo "Bye.." ;;
					* ) echo "Pilih 1-3" ;;
				esac
			done	
		;;			
		0 ) echo "bye.." ;;
		* ) echo "ketikan 1, 2, atau 0"
	esac
done