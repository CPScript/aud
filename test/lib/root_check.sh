# taken from another script
root_check() {
  echo "Checking..."
  sleep 1
  clear
  
  if [ "$(id -u)" != "0" ]; then
      echo "You must be rooted."
      echo "Please check your operating systems documentation to learn how to root your device"
      exit 1
  fi
  echo "Rooted, Thank you for such. Continuing"
  sleep 1
}

root_check
