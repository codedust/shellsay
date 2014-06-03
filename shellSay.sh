##
## shellSay - a simple script that adds vocal cords to your shell :)
##
## Usage: say text [lang]
##
## Examples:
## say "Hello World"
## say "Hallo Welt" de
##

urlencode() {
  urltoencode="$(echo "$1" | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | cut -c 3-)"
  echo "${urltoencode%???}"
}

say() {
  if [ -z $2 ]; then lang="en"; else lang="$2"; fi
  curl --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0" --url "http://translate.google.de/translate_tts?tl=$lang&q="$(urlencode "$1")"" -o googlevoice.mp3
  play googlevoice.mp3
}
