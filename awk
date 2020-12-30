# awk is a tiny programming language for manipulating columns of data
# Many unix commands print column of text. Being able to get the column you want
# with awk is great.
# Basic awk program structure:
# BEGIN { ... }
# CONDITION { action }
# CONDITION { action }
# END { ... }

# Extract a column of text with awk
printf '1 2 3\n4 5 6\n7 8 9' | awk '{print $2}'

# Print every line over 2 characters
printf '123\n2\n345\n45\n567\n6\n7\n8\n9' | awk 'length($0) > 2'

# To sum integers from a file or stdin, one integer per line:
printf '1\n2\n3\n' | awk '{ sum += $1} END {print sum}'

# To use a specific character as separator to sum integers from a file or stdin:
printf '1:2:3' | awk -F ":" '{print $1+$2+$3}'

# To print a multiplication table:
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'

# To specify an output separator character:
printf '1 2 3' | awk 'BEGIN {OFS=":"}; {print $1,$2,$3}'
