# Functions

# format and display a csv file in the terminal
# https://explainshell.com/explain?cmd=column+-s+-t
# $1 - name of CSV file
csv() {
	column -s, -t < $1
}

# extract the contents of a .tar archive file to a directory
# https://explainshell.com/explain?cmd=tar+-xvpzf+tarballName.tar.gz+-C+%2Frecovery%2Fdir
# $1 - name of tarball file to unpack, e.g. "application.tar.gz"
# $2 - output directory
unpack-tarball() {
	tar -xvpzf $1 -C $2
}

# collect one or many directories in a .tar archive file
# https://explainshell.com/explain?cmd=tar+-cvpzf+backup.tar.gz+--exclude%3D%2Fdir%2Fto%2Fexclude+%2Fdir%2Fto%2Fbackup
# $1 - name of tarball file to pack, e.g. "application.tar.gz"
# $2 thru $n - directories to archive
pack-tarball() {
	tar -cvpzf $1 "${@:2}"
}

# use GNU Privacy Guard to encrypt a file using the key associated with the email address specified by the $EMAIL global env variable
# $1 - path of file to encrypt
encrypt() {
	gpg -r $EMAIL -e $1
}

# use GNU Privacy Guard to decrypt a file with any available key
# $1 - path of file to decrypt
# $2 - name of output file
decrypt() {
	gpg -o $2 -d $1
}

# read file contents, escape quotes, and write to a new file
# $1 - path to input file
# $2 - path to output file
escape-quotes() {
	sed s/\"/'\\\"'/g $1 > $2
}

# read file contents, unescape quotes, and write to a new file
# $1 - path to input file
# $2 - path to output file
unescape-quotes() {
	sed s/'\\\"'/\"/g $1 > $2
}

# pretty-print JSON with python
# $1 - path to input file
# $2 - path to output file
format-json() {
	python3 -m json.tool $1 $2
}

# add a new SSH key
# $1 - path to ssh key, e.g. ~/.ssh/id_rsa_something
add-ssh-key() {
	chmod 600 $1
	eval "$(ssh-agent -s)"
	ssh-add $1
}

# copy resources from a remote machine to a local machine
# https://explainshell.com/explain?cmd=rsync+-chavzP+--stats+user%40remote.host%3A%2Fpath%2Fto%2Fcopy+%2Fpath%2Fto%2Flocal%2Fstorage
# note: path args should be quoted
# $1 - login info to remote machine: <user>@<domain>
# $2 - remote path of resource (copy from)
# $3 - local path of resource (copy to)
copy-from-remote() {
	rsync -chavzP --stats $1:$2 $3
}

# copy resources from a local machine to a remote machine
# https://explainshell.com/explain?cmd=rsync+-chavzP+--stats+%2Fpath%2Fto%2Flocal%2Fstorage+user%40remote.host%3A%2Fpath%2Fto%2Fcopy
# $1 - local path of resource (copy from)
# $2 - login info to remote machine: <user>@domain>
# $3 - remote path of resource (copy to)
copy-to-remote() {
	rsync -chavzP --stats $1 $2:$3
}

