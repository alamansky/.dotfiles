# $1 - download url
download_to_opt() {
	# get file name from url
	local filename="${1##*/}"
	local unpacked=""
	# download the file
	if [[ ${filename:(-4):4} == ".git" ]]; then
		sudo git clone $1 "/opt/${filename:0:-4}"
	# target both .gz and .xz extensions for tarballs
	# newer versions of tar autodetect compression, obviating the -z flag
	elif [[ ${filename:(-7):7} == ".tar."** ]]; then
		sudo wget $1
		# if tarball, unpack
		local content=$(sudo tar -tvf ${filename})
		unpacked=${content##* }
		sudo tar -xvpf ${filename} -C /opt
		rm ${filename}
		# if unpacked content is not a directory, place inside one
		if ! [[ -d "/opt/{$unpacked}" ]] && ! [[ $unpacked =~ / ]]; then
			sudo mkdir -p "/opt/temp"
			sudo mv "/opt/${unpacked}" "/opt/temp"
			sudo mv "/opt/temp" "/opt/${unpacked}"
		fi
		[[ -s "/opt/${unpacked}/${unpacked}" ]] && sudo chmod +x /opt/${unpacked}/${unpacked}
	elif [[ ${filename:(-3):3} == ".gz" ]]; then
		sudo wget $1
		gunzip ${filename}
		sudo mkdir -p "/opt/${filename:0:(-3)}"; sudo mv ${filename:0:(-3)} $_
		[[ -s "/opt/${filename:0:(-3)}/${filename:0:(-3)}" ]] && sudo chmod +x /opt/${filename:0:(-3)}/${filename:0:(-3)}
	else
		sudo wget $1
		# otherwise move file to its own subdirectory in opt
		sudo mkdir -p "/opt/${filename}"; sudo mv $filename $_
		[[ -s "/opt/${filename}/${filename}" ]] && sudo chmod +x /opt/$filename/$filename
	fi
}

