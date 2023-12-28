# zift-remover

## <ins>Description</ins>

**A bash script that removes ziftly** ( overwrites the actual data with random data before removing it ) **everything in that directories in the current directory and its subdirectories.**

* * *

## <ins>How To Use It?</ins>

You can literally execute the bash script with `bash ~/remover.sh` command after you move script file to the home directory . But the bash script removes that directory where you executed at. So you need to execute where you want to get removed.

By the way you can create an alias for this bash script. Here is the step by step how you can do it:

1.  Clone this repository on your machine.
2.  Move **remover.sh** to the anywhere you want (I'm assuming you've move it in the **home** for now.).
3.  `nano ~/.bashrc`
4.  Add an alias. `alias ziftremover='sudo bash ~/remover.sh'` then save it bashrc.

> (In fact, sudo permission is not required for this operation, but since it is a serious and irreversible operation, it is useful to get confirmation with a password)

5.  `exec bash` this command executes bashrc. So your new alias now can be usable.
6.  Done! Now you can wipe out entire home directory :) No I'm just kidding. Be careful with this script. None of us want to delete data we didn't want to delete.

* * *

## <ins>How It Works?</ins>

This script finds all files in the current directory and its subdirectories and deletes them using the `shred` command. Also it not just delete files. Directories are deleting too.

The shred command is used in Linux to securely delete files by **overwriting their contents with random data**. It is designed to make the original data of a file **hard to recover**, even with the use of advanced hardware probing techniques. This is in contrast to normal file deletion operations, which only remove the pointers to the file data, leaving the actual data on the hard drive until it gets overwritten by new data.

**Note**: Every write operation, including those performed by shred, decreases the lifespan of an SSD by using up some of the SSD's limited write cycles. shred is particularly bad in this regard because it overwrites the file multiple times. So If you do not want to shorten the life of your ssd, it is better to delete only the files that you do not want to leave traces when deleting with this command.