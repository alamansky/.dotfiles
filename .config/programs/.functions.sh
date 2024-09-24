# $1 - download url
download_to_opt() {
	# get file name from url
	local filename="${1##*/}"
	local unpacked=""
	# download the file
	if [[ ${filename:(-4):4} == ".git" ]]; then
		sudo git clone $1 "/opt/${filename:0:-4}"
	elif [[ ${filename:(-7):7} == ".tar.gz" ]]; then
		wget $1
		# if tarball, unpack
		local content=$(sudo tar -ztvf ${filename})
		unpacked=${content##* }
		sudo tar -xvpzf ${filename} -C /opt
		rm ${filename}
		if ! [[ -d "/opt/{$unpacked}" ]]; then
			sudo mkdir -p "/opt/temp"
			sudo mv "/opt/${unpacked}" "/opt/temp"
			sudo mv "/opt/temp" "/opt/${unpacked}"
		fi
		[[ -s "/opt/${unpacked}/${unpacked}" ]] && sudo chmod +x /opt/${unpacked}/${unpacked}
	elif [[ ${filename:(-3):3} == ".gz" ]]; then
		wget $1
		gunzip ${filename}
		sudo mkdir -p "/opt/${filename:0:(-3)}"; sudo mv ${filename:0:(-3)} $_
		[[ -s "/opt/${filename:0:(-3)}/${filename:0:(-3)}" ]] && sudo chmod +x /opt/${filename:0:(-3)}/${filename:0:(-3)}
	else
		wget $1
		# otherwise move file to its own subdirectory in opt
		sudo mkdir -p "/opt/${filename}"; sudo mv $filename $_
		[[ -s "/opt/${filename}/${filename}" ]] && sudo chmod +x /opt/$filename/$filename
	fi
}

