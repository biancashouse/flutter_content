#export HOME=/Users/ianw

echo "running bash profile scripts..."

#
# common profile for all my macs; includes several other profile.***.sh files
#
#-----------------
editz() {
	vi $HOME/.zshrc
	. $HOME/.zshrc
}
#-----------------
editp() {
	vi $HOME/my/g.shell/profile.sh
	. $HOME/my/g.shell/profile.sh
}
#-------------------------------------
fpg() {
	flutter pub get
}
fbios() {
	flutter build ios
}
#-------------------------------------
# https://developers.google.com/android/guides/client-auth
# setting up firebase dynamic links
#------------
create-release-keystore() {
	keytool -genkey -v -keystore ~/release.keystore.jks -storepass godsavethequeen -alias androidreleasekey -keypass godsavethequeen -keyalg RSA -keysize 2048 -validity 10000
}
#------------
get-debug-digital-fingerprint() {
	keytool -exportcert -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore -store-pass android -keypass android
}
#------------
get-release-digital-fingerprint() {
	keytool -exportcert -list -v -keystore ./release.keystore -alias androidreleasekey -storepass godsavethequeen -keypass godsavethequeen
}
#-----------------
nginx() {
	sudo brew services $1  nginx
}
#-----------------
studio() {
	nohup /Installed/android-studio/bin/studio.sh &
}
#-----------------
eclipse() {
	nohup ~/eclipse/jee-photon/eclipse/eclipse.exe &
}
#-----------------
docker-help() {
	echo '===  docker commands  =========================================================='
	echo d-i-h
	echo d-i
	echo d-c-h
	echo d-c-a
	echo d-c-ids
	echo d-c-q
	echo d-c-rm-all
}
#-----------------
d-i-h() {
	echo '===  docker images --help  ====================================================='
	$DOCKER_CLI images --help
}
#-----------------
d-r() {
	echo '===  docker run -d ' $1 ' ======================================================'
	$DOCKER_CLI run -d $1
	export CONTAINER_ID=$($DOCKER_CLI container ls | grep $1 | awk '{print $1}')
	echo $1 'is container id ' $CONTAINER_ID
}
#me nginx-----------------
nginx-up() {
	echo '===  docker run -d --name nginx  ==============================================='
	$DOCKER_CLI run -d -t --rm --name nginx -p 8080:80 nginx:alpine
	export NGINX_CONTAINER_ID=$($DOCKER_CLI container ls | grep nginx | awk '{print $1}')
	echo nginx 'is container id ' $NGINX_CONTAINER_ID
}
nginx-down() {
	$DOCKER_CLI stop $NGINX_CONTAINER_ID
	$DOCKER_CLI container rm $NGINX_CONTAINER_ID
}
nginx-bash() {
	echo '===  docker container exec -i -t nginx /bin/bash'
	$DOCKER_CLI container exec -i -t $NGINX_CONTAINER_ID /bin/bash
}
#-----------------
d-s() {
	echo '===  docker stop ' $1 '=========================================================='
	export CONTAINER_ID=$($DOCKER_CLI container ls | grep $1 | awk '{print $1}')
	echo $1 'is container id ' $CONTAINER_ID
	$DOCKER_CLI stop $CONTAINER_ID
}
#-----------------
d-r-s() {
	echo '===  docker restart ' $1 '======================================================='
	$DOCKER_CLI restart $1
}
#-----------------
d-i() {
	echo '===  docker images  ============================================================'
	$DOCKER_CLI images
}
#-----------------
d-c-h() {
	echo '===  docker container --help  =================================================='
	$DOCKER_CLI container --help
}
#-----------------
d-c-a() {
	echo '====  docker container ls -a  =================================================='
	$DOCKER_CLI container ls -a
}
#-----------------
d-c-ids() {
	echo '====  docker container ls -q  ===========  show all container ids =============='
	$DOCKER_CLI container ls -q
}
#-----------------
d-c-q() {
	d-c-ids
}
#-----------------
d-c-rm-all() {
	echo '===  remove all containers  ===================================================='
	$DOCKER_CLI container rm -f $($DOCKER_CLI container ls -a -q)
}
#-----------------
webdev-serve() {
	c ~/my/code/e.html.delivery/g.html-delivery
	nohup ant -f build.html.delivery.xml local-gc-run &
	c src/main/webapp
	webdev serve web:8887
}
#-----------------
rfind() {
	find . -type f -exec grep -l $1 {} \;
}
#--------------
del-metadata-folders() {
	find . -name ".metadata" -exec rm -rf {} \;
}
#------------
del-target-folders() {
	find . -name "target" -exec rm -rf {} -exec rm -rf .metadata \;
}
#------------
m2-fix() {
  find ~/my/m2/repository -name "*lastUpdated*" -exec rm -fv {} \;
}
#-----------------
remove-ds-store() {
	find . -name *.DS_Store -type f -exec rm {} \;
}
#-----------------
edit-mvn() {
	vi $HOME/my/g.shell/profile.mvn.sh
	. $HOME/my/g.shell/profile.sh
}
#-----------------
my() {
	if [ $# -gt 0 ]
		then
			c $HOME/my/$1* 
		else
			c $HOME/my
		fi
}
#-----------------
dev() {
	c $HOME/dev
}
#-----------------
w() {
	if [ $# -gt 0 ]
		then
			c $HOME/my/w/w.$1* 
		else
			c $HOME/my/w
		fi
}
# --------------------------------------------------------------------------------
# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
	#case `uname -n` in
		#biancashouse.com|mini|mini.biancashouse.com)
			#export COLOUR=$COLOR_LIGHT_RED
		#;;
		#maxi|maxi.biancashouse.com)
			#export COLOUR=$COLOR_BLUE
		#;;
		#air|air.biancashouse.com)
			#export COLOUR=$COLOR_GREEN
		#;;
	#esac
LS_COLORS='di=0;33' ; export LS_COLORS

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

#-----------------------------------
c() {
  p="$*"
  cd "$p"
  #
  # Define default prompt to <username>@<hostname>:<path><"($|#) ">
  # and print '#' for user "root" and '$' for normal users.
  #
  echo
  PS1="`pwd`>"
  #PS1='${LOGNAME}@$(hostname):$(
  #  [[ "$LOGNAME" = "root" ]] && printf "${PWD/${HOME}/~}# " ||
  #  printf "${PWD/${HOME}/~}\$ ")'
	#PS1=$COLOUR'\]\u@\h\[\033[00m\] \[\033[01;33m\]\w `__git_ps1` \[\033[00m\]\n \[\033[01;36m\]\$ \[\033[00m\]'
	ls -p
}
#-----------------------------------
export EXINIT="set ts=2 sw=2 ai"
set -o vi
export TMPDIR=/tmp
#-----------------
# compare directories
diffdirs() {
  #diff -Naur $1 $2 more verbose version
	diff -qr $1 $2
}
diffdirsremote() {
	rsync -rvnc --delete $1 $2
}
#-----------------
#alias t='stty rows 50,9999 && stty columns 120,256 && tail -f $CATALINA_HOME/logs/cat*.log.`date +%Y%m%d`'
alias t='stty rows 50,9999 && stty columns 120,256 && tail -f $CATALINA_HOME/logs/cat*out'
alias ce='w && c w.liferay.ce'
#-----------------
mykill() {
	ps -ef | grep -v grep | grep $1 | tr -s " " | cut -f3 -d " " | sudo xargs kill -9
}
#-----------------
j() {
	ps -ef | grep java | grep -v grep
}
#-----------------
kj() {
	mykill java
}
#-----------------
export SENDGRID_API_KEY='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'
#-----------------
jic() {
	if [ ! -d ~/JIC ]
	then
		mkdir ~/JIC
	fi
	for f in $*
	do
		echo $f 'archived to ~/JIC'
		mv $f ~/JIC
	done
}
#-----------------
play-sound() {
	for sf in /System/Library/Sounds/*
	do
		echo $sf
		afplay $sf
	done
}
#-----------------
tink() {
	afplay /System/Library/Sounds/tink.aiff
}
#-----------------
searchJars() {
  if [ $# -ge 2 ]
	then
		className=$1
		shift
		searchRoot=$1
		echo "Searching for class  " $className " under " $searchRoot
		echo "---------------------------------------------------------"
		# create the 2 line awk file on the fly to save needinga separate file
		echo '/^JARFILE BEGIN/ {jarname=$3}' > searchJars.awk
		echo '!/^JARFILE/ && !/^$/ {print jarname, " ::: ", $0}' >> searchJars.awk
		# do a jar -t for every jar found
		for f in `find $searchRoot -name "*.jar" -print`
		do
			echo > searchJars.tmp
			echo JARFILE BEGIN $f >> searchJars.tmp
			cat $f| jar -t >> searchJars.tmp
			echo JARFILE END $f >> searchJars.tmp
			echo >> searchJars.tmp
			cat searchJars.tmp | awk -f searchJars.awk | grep $className
		done
	else
		echo "USAGE: $0 <class> <directory root>"
	fi
	#rm -f searchJars.tmp searchJars.awk
}
#-----------------
gc() {
  # can use /dev/null on cygwin
	# can use /dev/null on mks
	NULL=Nul:
	if [ $# -ge 3 ]
	then
		if [ $1 = "-x" ]
		then
			flag=$1
			shift
		fi
		s1=$1
		shift
		s2=$1
		shift
		echo "Changing $s1 to $s2 in the following file"
		echo "-----------------------------------------------------"
		for f in $*
		do
			if grep $s1 $f > $NULL;
			then
				if [ $flag = "-x" ]
				then
					perl -i.bak -p -e "s.$s1.$s2.g;" $f
				else
					perl -i.bak -p -e "s/$s1/$s2/g;" $f
				fi
				echo $f
			fi
		done
	else
		echo "USAGE: gc <s1> <s2> <file(s)>"
	fi
}
#-----------------
finder-show() {
  defaults write com.apple.Finder AppleShowAllFiles YES
}	
#-----------------
finder-hide() {
  defaults write com.apple.Finder AppleShowAllFiles NO
}	
#-----------------
hosts() {
  sudo vi /etc/hosts
}
#-----------------
flutter-watch_and-generate() {
  flutter packages pub run build_runner clean
  flutter packages pub run build_runner watch --delete-conflicting-outputs
}
#------------------------
br() {
  dart run build_runner build --delete-conflicting-outputs
}
#------------------------
flowcharter() {
	c /Users/ianw/my/code/as/flowcharter
}
#------------------------
flowcharter-api() {
	c /Users/ianw/my/code/e/flowcharter-api
}
#------------------------
buildtool() {
	java -jar /Installed/bundletool/build/libs/bundletool.jar build-apks --bundle=!/my/code/as/flowcharter/build/app/outputs/bundle/app.aab --output=flowcharter.apks
}
#------------------------
# https://github.com/Genymobile/scrcpy
record-android-video() {
	echo "record-sim-video: dum args: $#"
  if [ $# -ge 1 ]
	then
		echo 'recording video to $1.mp4...'
		rm $1.mp4
		scrcpy -t -Nr $1.mp4
		echo 'finished.'
	else
		echo 'must specify the filename !'
	fi
}
#------------------------
# https://sarunw.com/posts/take-screenshot-and-record-video-in-ios-simulator/
record-sim-video() {
	echo "record-sim-video: dum args: $#"
  if [ $# -ge 1 ]
	then
		echo 'recording video to $1.mov...'
		rm $1.mov
		xcrun simctl io booted recordVideo --codec=h264 $1.mov
		echo 'finished.'
	else
		echo 'must specify the filename !'
	fi
}
#---------------------------
# convert prores video to webm
convert-to-webm() {
	echo "convert-to-webm: dum args: $#"
  if [ $# -ge 1 ]
		/usr/local/bin/ffmpeg -i "$1.prores.mp4" -c:v libvpx-vp9 "$1.webm"
	then
		echo 'converting video $1.prores..mp4 to webm ...'
		echo 'finished.'
		rm -f "$1.prores.mp4"
	else
		echo 'must specify the filename (before .prores.mp4)!'
	fi
}
#---------------------------
# compress hevc to mp4
compress-hevc-to-mp4() {
	echo "compress-hevc-to-mp4: dum args: $#"
  if [ $# -ge 1 ]
		/usr/local/bin/ffmpeg -i "$1.mp4" -c:v libx265 "$1.hevc.mp4"
	then
		echo 'converting video $1.mp4 to mp4 ...'
		echo 'finished.'
		rm -f "$1.mp4"
	else
		echo 'must specify the filename (before .mp4)!'
	fi
}
#---------------------------
# increment the flutter build number
increment-build() {
	#c ~/my/code/as/flowcharter

	# Find and increment the version number in pubspec.yaml+ and web index.html
	perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml
	export version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`
	echo
	echo
	echo "version is now $version"
	echo
	echo

	# replace in index.html as well
	rm -f web/index.html.jic
	cp web/index.html web/index.html.jic
	sed "s/.*version:.*/version: $version/" web/index.html.jic > web/index.html
}


#export NODEJS_HOME=/Installed/node-v8.11.3-linux-x64
export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export JAVA_HOME=$JDK_HOME/jre
export JRE_HOME=$JDK_HOME/jre
export GWT_SDK=/Installed/gwt-2.8.2
export GAE_SDK=/Installed/appengine-java-sdk-1.9.64
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/my/gcp-service-account-keys/flowchart-studio-60c1ccd2ae87.json
export GOOGLE_CLOUD_SDK_HOME=/Installed/google-cloud-sdk
export ANT_HOME=/usr/share/ant
export M2_HOME=/usr/share/maven
export ANT_HOME=/Installed/apache-ant-1.9.6
#export M2_HOME=/Installed/apache-maven-3.5.0
export M2_REPO=$HOME/my/m2/repository
export MAVEN_OPTS="-Xms1024m -Xmx4096m -Djava.home=$JRE_HOME"
export FLUTTER_HOME=/Installed/flutter
export DART_SDK_HOME=/usr/local/opt/dart/libexec
#export DART_SDK_HOME=/Installed/flutter/bin/cache/dart-sdk

#
# don't duplicate PATH entries
#
if [[ $PATH = *"flutter"* ]]; then
  echo "flutter already added!";
else
	export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$PATH:$NODEJS_HOME/bin:~/.pub-cache/bin
	#export PATH=$DART_SDK_HOME/bin:$PATH
fi

c .

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$GOOGLE_CLOUD_SDK_HOME/path.bash.inc' ]; then . '$GOOGLe_CLOUD_SDK/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$GOOGLE_CLOUD_SDK_HOME/completion.bash.inc' ]; then . '$GOOGLe_CLOUD_SDK/completion.bash.inc'; fi

# gcloud
export PATH=$PATH:$GOOGLE_CLOUD_SDK_HOME/bin

#just in case running from within eclipse
#export PATH=/Library/Java/Home/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#include android sdk tools in path
export PATH=$PATH:/Users/ianw/Library/Android/sdk/tools/

# add grpc proto compiler to path and dart protoc plugin
export PATH=$PATH:/Installed/protoc-3.11.4-osx-x86_64/bin:$HOME/.pub-cache/bin

export PATH=$FLUTTER_HOME/bin:$PATH
#---------------------- fvm -------------------------
export PATH=/Users/ianw/fvm/versions/3.16.1/bin:$PATH
#----------------------

# objectify use
export DATASTORE_EMULATOR_HOST=localhost:8081
datastore-emulator() {
	nohup gcloud beta emulators datastore start --host-port=localhost:8081 &
	nohup google-cloud-gui &
}
generate-openapi-json() {
	mvn clean package endpoints-framework:openApiDocs
}
tail-api-server() {
	gcloud app logs tail -s default
}
calc-push-size() {
	if [ $# -ne 1 ]; then
	  echo "Usage: calc-push-size.sh <commit hash>" 1>&2
	  exit 1
	fi

	HASH=$1

	ITEM_LIST="`git diff-tree -r -c -M -C --no-commit-id $HASH`"
	BLOB_HASH_LIST="`echo "$ITEM_LIST" | awk '{ print $4 }'`"
	SIZE_LIST="`echo "$BLOB_HASH_LIST" | git cat-file --batch-check | grep "blob" | awk '{ print $3}'`"
	COMMIT_SIZE="`echo "$SIZE_LIST" | awk '{ sum += $1 } END { print sum }'`"
	echo "$COMMIT_SIZE"
}
#---------------------------------
create-cloud-repo() {
	gcloud source repos create $1
}
#---------------------------------
run-web() {
	c build/web
	python3 -m http.server
	c ../..
}
#--------------------------------
flutter-clean() {
	echo "Flutter Clean Recursive (by jeroen-meijer on GitHub Gist)"
	echo "Looking for projects... (may take a while)"

	find . -name "pubspec.yaml" -exec $SHELL -c '
    echo "Done. Cleaning all projects."
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "Cleaning ${DIR}..."
        (cd "$DIR" && flutter clean >/dev/null 2>&1)
    done
    echo "DONE!"
' {} +
}
#--------------------------------

#sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
#sudo xcodebuild -runFirstLaunch
#sudo xcodebuild -license

echo "current path is: " $PATH
