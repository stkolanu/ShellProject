#! /bin/sh
xsel -bc
#To store the path
path="~"
# to store the copy file path
fil=""
#to get the copy file name
filname=""
echo "enter the output directory path:\n"

# Reading the target folder path from user.
read path
end=$((SECONDS+30))
#We used seconds to limit the execution time i.e if the program is idle for 30 second it will terminate automatically
while [ $SECONDS -lt $end ];
do
#Accessing clip board contents
fil=$(xclip -selection clipboard -o)
#Reversing the path cutting the file name and reversing it after that
filname=$(echo $fil | rev | cut -d"/" -f1 | rev)
# checking whether the file name exists int the target folder or not to prevent duplication
if [ -e "$path/$filname" ]; then
echo "file already exists"
else
# if not present then copy to target folder
cp -R $fil $path
#Printing selected file path and copy path
echo $fil
echo $path
fi
printf "$(xclip -o clipboard)\n" | >> files.txt
#To clear the clip board contents
xsel -bc
sleep 2
done

#Pressing ctrl + c to exit the program