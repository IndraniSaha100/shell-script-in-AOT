#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.
insert(){
    read -p "Enter name" name
    read -p "Enter roll" roll
    read -p "Enter marks" marks
    
    echo "$name $roll $marks" >> X.txt
    echo "Record inserted successfully"
}
update(){
    echo "Enter roll to update"
    read r 
    tempfile=$(mktemp)
    updated=0
    
    while IFS read -r line 
    do
        curr_roll=$( echo "$line" | cut -d '|' f2)
        if [ "$r" -eq "$curr_roll"]; then
            echo "Previous entry $line"
            read -p "Enter new name " new_name
            read -p "Enter new marks" new_marks
            
            updated=1
            echo "$new_name $r $new_marks" >> tempfile
        else
            echo "$line " >> tempfile
        fi
        if [ $updated == 1 ];then
            mv $tempfile X.txt
            echo "Record inserted successfully"
        fi
        rm $tempfile
    done < X.txt
}

delete(){
    echo "Enter roll to update"
    read r 
    tempfile=$(mktemp)
    updated=0
    
    while IFS read -r line 
    do
        curr_roll=$( echo "$line" | cut -d '|' f2)
        if [ "$r" -eq "$curr_roll"]; then
            echo "This entry goes for delete: $line"
            echo "deleted successfully"
            updated=1
        else
            echo "$line " >> tempfile
        fi
        if [ $updated == 1 ];then
            mv $tempfile X.txt
        fi
        rm $tempfile
    done < X.txt
}
display(){
    if [ ! -s X.txt ];then
        echo "no records found"
    else
        echo "Record>>>>"
        cat X.txt
    fi
}


while true
do 
    echo "1 for insertion"
    echo "2 for updation"
    echo "3 for deletion"
    echo "4 for displaying"
    echo "Exit for 5"
    echo "Enter your choice among 1,2,3,4,5"
    read choice
    case $choice in
        1) insert ;;
        2) update ;;
        3) delete ;;
        4) display ;;
        5) exit ;;
        *) echo "Invalid option please try again"
    esac
done


