#   -------------------------------
#   1.  FILE AND FOLDER MANAGEMENT
#   -------------------------------
# Replace standard man with fzm
# alias man='fzm'
#
# # Quick access to examples
# alias mane='fzm -e'
#
# # Keep original man command
# alias oman='/usr/bin/man'

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='truncate -s 1m ./1MB.dat'    # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='truncate -s 5m ./5MB.dat'    # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='truncate -s 10m ./10MB.dat' # make10mb:     Creates a file of 10mb size (all zeros)
# alias cd='z'
# alias cdi='zi'
alias bat='batcat --color=always'
alias ff='fastfetch'
alias ffa='fastfetch --config all'
alias c='clear'
alias e='exit'
alias fzf='fzf --preview "batcat --color=always {}"'
alias gbh='echo "goodbye h4ck3r5" | figlet | lolcat'
#   -------------------------------
#  2. SAVE COPYING
#   -------------------------------

alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -rv'
alias groups='groups | xargs -n1 | sort'
alias hidden='ls -A | grep "^\."'

# Better copying
alias cpv='rsync -avh --info=progress2'

#   -------------------------------
# 3. CD
#   -------------------------------

# cd
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias ..4="cd ../../../../"

#   -------------------------------
# 4. COLOR
#   -------------------------------
alias cmatrix='cmatrix -r'

#colorize output
alias env='grc env'
alias w='grc w'
alias who='grc who'
alias free='free -h'
alias ifconfig='grc ifconfig'
alias whois='grc whois'

#git add all files, commit and push
alias gitup='git add .; git commit -m "updated"; git push'

#   ---------------------------
# 5.  SEARCHING
#   ---------------------------
alias fd='fdfind '
alias qfind="find . -name " # qfind:    Quickly search for file
alias grep='grep --color=always'

#   ---------------------------
# 6.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   ---------------------------
#  7.  NETWORKING
#   ---------------------------
alias hostadapter='sudo modprobe vboxnetadp' # Virtualbox command to setup host only hostadapter
alias netCons='lsof -i'                      # netCons:      Show all open TCP/IP sockets
alias lsock='sudo lsof -i -P'                # lsock:        Display open sockets
alias lsockU='sudo lsof -nP | grep UDP'      # lsockU:       Display only open UDP sockets
alias lsockT='sudo lsof -nP | grep TCP'      # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN' # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'           # showBlocked:  All ipfw rules inc/ blocked IPs
alias ipInfo0='ifconfig getpacket en0'       # ipInfo0:      Get info on connections for en0
alias ipInfo1='ifconfig getpacket wlan0'     # ipInfo1:      Get info on connections for wlan0
alias myip='curl ip-api.com'
alias pserv='python -m http.server 8000'

#   ---------------------------------------
#  8.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='mount -uw /' # mountReadWrite:   For use when booted into single-user
alias showpath='echo $PATH | sed "s/:/\n/g" | sort'
alias bittype="grep -qP '^flags\s*:.*\blm\b' /proc/cpuinfo && echo 64-bit || echo 32-bit"
#   ---------------------------------------
#  9.  DATE & TIME MANAGEMENT
#   ---------------------------------------

alias bdate="date '+%a, %b %d %Y %T %Z'"
alias cal3='cal -3'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'
alias epochtime='date +%s'
alias mytime='date +%H:%M:%S'
alias secconvert='date -d@1234567890'
alias stamp='date "+%Y%m%d%a%H%M"'
alias timestamp='date "+%Y%m%dT%H%M%S"'
alias today='date +"%A, %B %-d, %Y"'
alias weeknum='date +%V'

#   ---------------------------------------
#  10.  WEB DEVELOPMENT
#   ---------------------------------------

alias editHosts='sudo edit /etc/hosts' # editHosts:        Edit /etc/hosts file

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'    # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'         # apacheRestart:    Restart Apache
alias herr='tail /var/log/httpd/error_log'            # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log" # Apachelogs:       Shows apache error logs

#   ---------------------------------------
#  11.  OTHER ALIASES
#   ---------------------------------------
# Download YouTube playlist videos in separate directory indexed by video order in a playlist
alias ydlp='yt-dlp -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'

# Download all playlists of YouTube channel/user keeping each playlist in separate directory:
alias ydlc='yt-dlp -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'

# Outputs List of Loadable Modules (llm) for current kernel
alias lload="find /lib/modules/$(uname -r) -type f -name '*.ko*'"

#  ---------------------------------------------------------------------------

alias perm='stat --printf "%a %n \n "' # perm: Show permission of target in number
alias 000='chmod 000'                  # ---------- (nobody)
alias 640='chmod 640'                  # -rw-r----- (user: rw, group: r)
alias 644='chmod 644'                  # -rw-r--r-- (user: rw, group: r, other: r)
alias 755='chmod 755'                  # -rwxr-xr-x (user: rwx, group: rx, other: rx)
alias 775='chmod 775'                  # -rwxrwxr-x (user: rwx, group: rwx, other: rx)
alias mx='chmod a+x'                   # ---x--x--x (user: --x, group: --x, other: --x)
alias ux='chmod u+x'                   # ---x------ (user: --x, group: -, other: -)

#-----------------------------------------------------------------------
# 12.  GENERAL_TOOLS
#-----------------------------------------------------------------------
# update
alias refresh='clean && update && gspb && gitup && sudo reboot'
alias update='sudo nala update && sudo nala full-upgrade -y && brew update && brew upgrade && flatpak upgrade && snap refresh && ble-update && tldr --update && sudo update-grub && sudo update-initramfs -u -k all && sudo updatedb -v;figlet "machine is updated !"|lolcat'
alias kup='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'

#clean
alias clean='sudo nala autopurge && sudo nala autoremove && sudo nala clean && echo "" > ~/.bash_history && history -c && atuin search --delete-it-all && rm -rf ~/.cache/mozilla/'

# clear history & atuin database
alias clearhistory='echo "" > ~/.bash_history && history -c && atuin search --delete-it-all'

# a better ls
alias ls='eza --icons --git --group-directories-first'
alias ll='eza -l --icons --git --header --group-directories-first'
alias llog='eza -l --icons --git --header -og --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lsa='eza -a --icons --git --group-directories-first'
alias lla='eza -la --icons --git --header --group-directories-first'
alias llaog='eza -la --icons --git --header -og --group-directories-first'
alias lta='eza -a --tree --level=2 --icons'

# color ip command
alias ip='ip -c'

# record your screen asciinema
alias trec='asciinema rec '
alias tplay='asciinema play '

# ai  assistant
# alias aid='ollama run deepseek-coder-v2'
# alias aidr1='ollama run deepseek-r1:1.5b'
# alias aidr2='ollama run deepseek-r1:7b'
# alias ait='tgpt'
# alias aih='ollama run hacker:latest'
# alias aid='ollama run dev:latest'

# cheat sheet
alias cheat='tldr'

#zathura for pdf's
alias pdf='zathura'

# renaming - replace current extension
alias rnx='for i in *; do mv $i ${i%.*}.txt; done'

alias less='less -FSRXc'                         # Preferred 'less' implementation
alias wget='wget -c'                             # Preferred 'wget' implementation (resume download)
alias c='clear'                                  # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'              # path:         Echo all executable Paths
alias show_options='shopt'                       # Show_options: display bash options settings
alias fix_stty='stty sane'                       # fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'                 # fix_term:     Reset the conosle.  Similar to the reset command
alias cic='bind "set completion-ignore-case on"' # cic:          Make tab-completion case-insensitive
alias src='source ~/.bashrc'                     # src:          Reload .bashrc file

#alias python='python3'

#-------------------------------------------------------------------------
# 13. DOCKER_ALIASES
#-------------------------------------------------------------------------
alias dbl='docker build'
alias dcin='docker container inspect'
alias dcls='docker container ls'
alias dclsa='docker container ls -a'
alias dib='docker image build'
alias dii='docker image inspect'
alias dils='docker image ls'
alias dipu='docker image push'
alias dirm='docker image rm'
alias dit='docker image tag'
alias dlo='docker container logs'
alias dnc='docker network create'
alias dncn='docker network connect'
alias dndcn='docker network disconnect'
alias dni='docker network inspect'
alias dnls='docker network ls'
alias dnrm='docker network rm'
alias dpo='docker container port'
alias dpu='docker pull'
alias dr='docker container run'
alias drit='docker container run -it'
alias drm='docker container rm'
alias 'drm!'='docker container rm -f'
alias dst='docker container start'
alias drs='docker container restart'
alias dsta='docker stop $(docker ps -q)'
alias dstp='docker container stop'
alias dtop='docker top'
alias dvi='docker volume inspect'
alias dvls='docker volume ls'
alias dvprune='docker volume prune'
alias dxc='docker container exec'
alias dxcit='docker container exec -it'

#-------------------------------------------------------------------------
# 14. CTF's
#-------------------------------------------------------------------------
#ssh
alias sshwar='ssh -i $HOME/.ssh/warmachine h4ck3r@localhost -p 3030'
alias sshpwn='ssh -i $HOME/.ssh/pwn.college hacker@dojo.pwn.college'
alias htbvpn='sudo openvpn $HOME/CTFs/htb/academy-regular.ovpn'
#-------------------------------------------------------------------------
#ssh connect

#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
# 15. H4CK3R_TOOLS
#-----------------------------------------------------------------------
#mproxy
alias mproxy='curl --proxy http://127.0.0.1:8080 '

#nmap
alias nmap2xml='nmap -sS -T4 -A -sC -oX nmap.xml'
alias xml2html='xsltproc -o nmap.html nmap-bootstrap.xsl nmap.xml'

#dnscan
#alias dnscan='/home/h4ck3r/h4ck3r_setup/tools/dnscan/dnscan.py'

#subbrute
#alias subbrute='/home/h4ck3r/h4ck3r_setup/tools/subbrute/subbrute.py'

#dirsearch
#alias dirsearch='/home/h4ck3r/h4ck3r_setup/tools/dirsearch/dirsearch.py'

#RouterHunterBR
#alias rhunter='php /home/h4ck3r/h4ck3r_setup/tools/RouterHunterBR/RouterHunterBR.php'

#-----------------------------------------------------------------------
# cryptography
#-----------------------------------------------------------------------
alias openssl_encrypt='openssl enc -aes-256-ctr -pbkdf2 -e -a -in /dev/stdin -out encrypted_file.txt'
alias openssl_decrypt='openssl enc -aes-256-ctr -pbkdf2 -d -a -in /dev/stdin -out decrypted_file.txt'

# rot13
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
# rot13.5 (rot18)
alias rot18="tr 'A-Za-z0-9' 'N-ZA-Mn-za-m5-90-4'"
# rot47
alias rot47="tr '\!-~' 'P-~\!-O'"

# gtfo lookup
alias wads='gtfoblookup wadcoms search'
alias wadl='gtfoblookup wadcoms list'
alias hijacks='gtfoblookup hijacklibs search'
alias hijackl='gtfoblookup hijacklibs list'
alias gtfobs='gtfoblookup gtfobins search'
alias gtfobl='gtfoblookup gtfobins list'

# aliases for grc(1)

alias gon='grc --colour=on '

GRC="/home/linuxbrew/.linuxbrew/bin/grc"
if tty -s && [ -n "$TERM" ] && [ "$TERM" != dumb ] && [ -n "$GRC" ]; then
  alias colourify="$GRC -es"
  alias blkid='colourify blkid'
  alias configure='colourify ./configure'
  alias df='colourify df'
  alias diff='colourify diff'
  alias docker='colourify docker'
  alias docker-compose='colourify docker-compose'
  alias docker-machine='colourify docker-machine'
  alias du='colourify du'
  #    alias env='colourify env'
  alias free='colourify free'
  alias fdisk='colourify fdisk'
  alias findmnt='colourify findmnt'
  alias make='colourify make'
  alias gcc='colourify gcc'
  alias g++='colourify g++'
  alias id='colourify id'
  alias ip='colourify ip'
  alias iptables='colourify iptables'
  alias as='colourify as'
  alias gas='colourify gas'
  alias journalctl='colourify journalctl'
  alias kubectl='colourify kubectl'
  alias ld='colourify ld'
  alias stat='colourify stat'
  #alias ls='colourify ls'
  alias lsof='colourify lsof'
  alias lsblk='colourify lsblk'
  alias lspci='colourify lspci'
  alias netstat='colourify netstat'
  alias ping='colourify ping'
  alias ss='colourify ss'
  alias traceroute='colourify traceroute'
  alias traceroute6='colourify traceroute6'
  alias head='colourify head'
  alias tail='colourify tail'
  alias dig='colourify dig'
  alias mount='colourify mount'
  alias ps='colourify ps'
  alias mtr='colourify mtr'
  alias semanage='colourify semanage'
  alias getsebool='colourify getsebool'
  alias ifconfig='colourify ifconfig'
  alias nmap='colourify nmap'
  alias curl='colourify curl'
  alias sockstat='colourify sockstat'
  alias less='colourify less'

fi

# ==============================================
# CTF, Pentesting & SysAdmin Aliases
# ==============================================

# ==============================================
# SAFETY NETS & SYSTEM ALIASES
# ==============================================
alias ln='ln -i'               # Confirm before overwrite
alias mkdir='mkdir -pv'        # Create parent dirs and verbose
alias df='df -h'               # Human readable disk usage
alias du='du -ch'              # Human readable total size
alias free='free -h'           # Human readable memory
alias grep='grep --color=auto' # Color grep output
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias h='history' # Short history
alias j='jobs -l' # Jobs with PIDs

# ==============================================
# NETWORK & PORT SCANNING
# ==============================================
alias ipa='ip -c a'                                                                   # Color IP addresses
alias ipr='ip route show'                                                             # Show routing table
alias ports='netstat -tulanp'                                                         # Show listening ports
alias nmap-fast='nmap -F -T5 --open'                                                  # Fast scan
alias nmap-full='nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53' # Full scan
alias nmap-os='nmap -O --osscan-guess'                                                # OS detection
alias nmap-ping='nmap -sn'                                                            # Ping sweep
alias nmap-vuln='nmap --script vuln'                                                  # Vulnerability scan
alias nmap-smb='nmap -p 445 --script=smb*'                                            # SMB scripts
alias netdiscover-scan='netdiscover -r'                                               # ARP discovery

# ==============================================
# WEB APPLICATION TESTING
# ==============================================
alias gobuster-dir='gobuster dir -w /usr/share/wordlists/dirb/common.txt -t 50'
alias gobuster-vhost='gobuster vhost -w /usr/share/wordlists/dirb/common.txt -t 50'
alias nikto-scan='nikto -h' # Basic Nikto scan
alias wfuzz-scan='wfuzz -c -z file,/usr/share/wordlists/dirb/common.txt --hc 404'
alias sqlmap-auto='sqlmap --batch --random-agent --level=3'
alias burp='java -jar /usr/share/burpsuite/burpsuite.jar &'
alias ffuf-scan='ffuf -w /usr/share/wordlists/dirb/common.txt -u' # Requires URL parameter

# ==============================================
# PASSWORD ATTACKS
# ==============================================
alias john-basic='john --format=raw-md5' # Basic John
alias hashcat-basic='hashcat -m 0 -a 0'  # Basic Hashcat (needs files)
alias rockyou='john --wordlist=/usr/share/wordlists/rockyou.txt'
alias hydra-ssh='hydra -L /usr/share/wordlists/common_users.txt -P /usr/share/wordlists/rockyou.txt ssh://'

# ==============================================
# PRIVILEGE ESCALATION
# ==============================================
alias linpeas='curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh'
alias winpeas='curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat'
alias lse='cd /usr/share/linux-exploit-suggester && ./linux-exploit-suggester.pl'
alias pspy='curl -L https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64 -o /tmp/pspy64 && chmod +x /tmp/pspy64'

# ==============================================
# WIRELESS TESTING
# ==============================================
alias airodump='sudo airodump-ng -w capture --output-format pcap,csv -K 1'
alias aireplay-deauth='sudo aireplay-ng --deauth 10 -a' # Needs BSSID
alias airgeddon='sudo bash /usr/share/airgeddon/airgeddon.sh'

# ==============================================
# METASPLOIT FRAMEWORK
# ==============================================
alias msfconsole='msfconsole -q'                # Quiet startup
alias msfrpc='msfrpcd -U msf -P password -f -S' # RPC daemon
alias msfvenom-list='msfvenom -l'               # List payloads/encoders/etc

# ==============================================
# SMB / WINDOWS ENUMERATION
# ==============================================
alias smb-enum='enum4linux -a'            # Full SMB enumeration
alias smb-client='smbclient -L'           # List shares
alias smb-map='smbmap -H'                 # SMB share mapping
alias crackmapexec-smb='crackmapexec smb' # CME for SMB

# ==============================================
# DNS ENUMERATION
# ==============================================
alias dns-enum='dnsenum --enum'   # Basic DNS enumeration
alias dnsrecon-scan='dnsrecon -d' # Needs domain
alias dig-all='dig any'           # ALL records

# ==============================================
# SNMP ENUMERATION
# ==============================================
alias snmp-check='snmp-check' # SNMP enumeration
alias onesixtyone-scan='onesixtyone -c /usr/share/wordlists/snmp-strings.txt'

# ==============================================
# QUICK SERVICE CHECKS
# ==============================================
alias ftp-anon='ftp -n'     # Anonymous FTP check
alias smtp-test='nc -nv'    # SMTP banner grab
alias rpc-enum='rpcinfo -p' # RPC enumeration

# ==============================================
# PAYLOAD GENERATION
# ==============================================
alias msfvenom-exe='msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST= LPORT= -f exe -o'
alias msfvenom-elf='msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST= LPORT= -f elf -o'
alias msfvenom-apk='msfvenom -p android/meterpreter/reverse_tcp LHOST= LPORT= -o'

# ==============================================
# TOOL UPDATES
# ==============================================
alias update-kali='sudo apt update && sudo apt full-upgrade -y'
alias update-wordlists='sudo /usr/share/wordlists/update-wordlists.sh'
alias update-tools='sudo apt update && sudo apt install kali-linux-everything -y'

# ==============================================
# FILE TRANSFER SHORTCUTS
# ==============================================
alias http-server='python3 -m http.server 8080'
alias ftp-server='python3 -m pyftpdlib -p 2121 -w'
alias smb-server='impacket-smbserver -smb2supp share .'

# ==============================================
# PROXY & ANONYMITY
# ==============================================
alias start-proxy='service tor start && proxychains -q'
alias check-tor='curl --socks5-hostname 127.0.0.1:9050 https://check.torproject.org'

# ==============================================
# GIT & VERSION CONTROL
# ==============================================
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph'

# ==============================================
# PROCESS MANAGEMENT
# ==============================================
alias ps-aux='ps auxf'
alias ps-grep='ps aux | grep -v grep | grep -i'
alias kill9='kill -9'       # Force kill
alias pkill-name='pkill -f' # Kill by name

# ==============================================
# FILE ANALYSIS
# ==============================================
alias strings-all='strings -a' # All strings in file
alias file-check='file'        # File type
alias hexdump='xxd'            # Hex dump
alias base64-decode='base64 -d'
alias base64-encode='base64'

# ==============================================
# ARCHIVE & COMPRESSION
# ==============================================
alias tar-extract='tar -xvf'
alias tar-create='tar -cvf'
alias zip-create='zip -r'
alias unzip-all='unzip'
alias gz-extract='tar -xzvf'

# ==============================================
# MONITORING & LOGS
# ==============================================
alias tail-auth='tail -f /var/log/auth.log' # Authentication logs
alias tail-syslog='tail -f /var/log/syslog' # System logs
alias log-apache='tail -f /var/log/apache2/access.log'

# ==============================================
# QUICK SERVICE RESTARTS
# ==============================================
alias restart-apache='systemctl restart apache2'
alias restart-ssh='systemctl restart ssh'
alias restart-mysql='systemctl restart mysql'

# ==============================================
# CUSTOM CTF HELPERS
# ==============================================
alias rot13='tr "A-Za-z" "N-ZA-Mn-za-m"' # ROT13 decoder
alias caesar='python3 -c "import sys; shift=int(sys.argv[1]); print(open(sys.argv[2]).read().translate(str.maketrans('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'[shift:]+'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'[:shift])))"'
alias xor='python3 -c "import sys; data=open(sys.argv[2],\"rb\").read(); key=int(sys.argv[1]); print(bytes([b ^ key for b in data]))"'

alias steg-extract='steghide extract -sf' # Steghide extraction
alias binwalk-all='binwalk -e'            # Binwalk extraction
alias exiftool-all='exiftool'             # Full metadata

# ==============================================
# PORT FORWARDING & TUNNELING
# ==============================================
alias ssh-forward='ssh -L' # Local port forward
alias ssh-reverse='ssh -R' # Remote port forward
alias socat-listener='socat TCP-LISTEN:'
alias chisel-client='chisel client' # Needs server IP

# ==============================================
# DOCKER & CONTAINERS
# ==============================================
alias docker-ps='docker ps -a'
alias docker-stop-all='docker stop $(docker ps -aq)'
alias docker-rm-all='docker rm $(docker ps -aq)'
alias docker-logs='docker logs -f'

# ==============================================
# NOTES & ORGANIZATION
# ==============================================
alias note='vim /root/notes/$(date +%Y%m%d).md'
alias evidence='cd /root/evidence && ls -la'

# ==============================================
# FUN & MISCELLANEOUS
# ==============================================
alias matrix='cmatrix -r'
alias starwars='telnet towel.blinkenlights.nl'
alias themes='kitty +kitten themes'
