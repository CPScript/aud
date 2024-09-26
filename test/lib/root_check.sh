root_check() {
  echo "Checking..."
  sleep 1
  clear
  
  if [ "$(id -u)" != "0" ]; then
      echo "You must be rooted."
      echo "Please check your operating system's documentation to learn how to root your device"
      sleep 10
      exit 1
  fi
  echo "Rooted, Thank you for such. Continuing"
  sleep 1
}

root_check
