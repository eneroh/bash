# bash\
history | awk '{print $2}' | sort | uniq -c | sort -nr | head -10
Displays the top 10 most used bash terminal commands
