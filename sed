# sed is often used for replacing text in a file
# sed 's/hello/hey/g' file.txt
# 's/hello/hey/g' can be a regex.

# To replace all occurrences of "day" with "night" and write to stdout:
sed 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" within <file>:
sed -i 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

# To remove leading spaces:
sed -i -r 's/^\s+//g' <file>

# To remove empty lines and print results to stdout:
sed '/^$/d' <file>

# To replace newlines in multiple lines:
sed ':a;N;$!ba;s/\n//g' <file>

# To insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

# To add a line after a matching pattern:
sed '/happily ever after/a\The end.'

# Delete 3rd line:
printf '1\n2\n3\n4\n5' | sed 3d

# Delete lines matching /bye/:
printf 'hello\nhey\ngoodbye\nbye\nhow are you\nare you john' | sed /bye/d

# Print lines 3-5:
printf '1\n2\n3\n4\n5\n6\n7\n8' | sed -n 3,5p

# Print 5th line:
# -n suppresses output so only what you print with 'p' gets printed
printf '1\n2\n3\n4\n5\n6\n7\n8' | sed -n 5p

# Only print changed lines:
printf 'hello\nfoo\nbaz\nbar' | sed -n s/foo/hi/p

# Append 'sooo' after lines containing 'is'
printf 'it\nis\ncool\nyo' | sed '/is/a sooo'