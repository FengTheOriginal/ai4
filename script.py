import time
import image

command_list = ["ls","cat","grep","cd","man","file","diff","find","wildcards","display"]
patience = 7
blung = image

def helper(question, x):
    if question in command_list:
        if question == "ls":
            print("""ls stands for list
            The basic command lists everthing except for files with a dot at the front e.g .secret, which mean they are hidden. Some modifiers include:
                ls -a: this displays hidden files as well
                ls -t: orders files newest first
                ls -l: this displays the full details for the file such as:
                    the permissions: --> drwxr-x-r- <-- 1 owner group 198202
                    the owner and group: drwxr-x-r- 1 --> owner group <-- 198202
                    the amount of bytes: drwxr-x-r- 1 owner group --> 198202 <--
                ls -S: this displays largest files first
            Some of the commands can be combined, like ls -la which displays the full details of every file including the hidden files""")
            return x
               
        elif question == "cat":
            print("""The cat command displays the contents of the file to the screen
            The syntax for the command is: cat [FILENAME]
            Some useful modifiers are:
                cat -n [FILENAME]: this displays the contents with line numbers on the side
                tac [FILENAME]: this prints the contents in reverse order.""")
            return x
        elif question == "grep":
            print("""grep stands for Global Regular Expression Print
            This command searches for lines in files that match a specified pattern and returns the matching lines. 
            The syntax for the command is: grep [OPTIONS] PATTERN [FILE...]
            Some useful modifiers are:
                -i: Ignore case distinctions in both the pattern and input files.
                -v: Invert the sense of matching, to select non-matching lines.""")
            return x
        elif question == "cd":
            print("""cd stands for Change Directory
            This command is used to change the current working directory.
            The syntax for the command is: cd [DIRECTORY]
            Some examples:
                cd ~ : move to home directory
                cd .. : Move one directory up
                cd /path/to/directory: Move to a specific directory""")
            return x
        elif question == "man":
            print("Why would you use man when you have Ultraman??")
            return x
        elif question == "file":
            print("""The file command determines the file type of a file.
            The syntax for the command is: file [FILENAME]
            It prints out a description of the file type.
            You can also add wildcards to the filename so you can find the different file types
            Example: file *.txt: this searches for all files in the directory with .txt""")
            return x
        elif question == "diff":
            print("""The diff command is used to compare files line by line.
            The syntax for the command is: diff [OPTION]... FILES
            Some useful modifiers are:
                -r: Recursively compare any subdirectories found.
                -q: Output only whether files differ.""")
            return x
        elif question == "find":
            print("""The find command is used to search for files in a directory hierarchy.
            The syntax for the command is: find [OPTIONS] [PATH] [EXPRESSION]
            Some useful modifiers are:
                -name: Search for files by name.
                -type: Search for files by type (regular file, directory, symbolic link, etc.).""")
            return x
        elif question == "wildcards":
            print("""Wildcards are symbols used to represent other characters in a search pattern.
            Some common wildcards are:
                * : Matches zero or more characters.
            Example:
                *.txt: Matches all files with the .txt extension.""")
            return x
        elif question == "display":
            print("I can help you with these commands:")
            print("\n".join(command_list))
            return x
    else:
        evil_patience = evilmode(x)
        return evil_patience

def evilmode(x):
    if x == 7:
        print("I am sorry, I don't understand that command")
    elif x == 6:
        print("Please I don't know this, ask me commands that are in the list I gave you earlier, you can type display to see the list again :)")
    elif x == 5:
        print("Please, I am just a badly coded fake helper, just let it go T_T")
    elif x == 4:
        print("STOP PLEASE")
    elif x == 3:
        print("I am warning you... don't do this")
    elif x == 2:
        print("Please just stop.... please")
    elif x == 1:
        print("I am warning you don't do this, this is your last chance")
    elif x == 0:
        print("This is REALLY your last chance. I am not messing aroung this time, I am being serious")
    elif x == -1:
        time.sleep(1)
        print("Erm, What the fung.")
        time.sleep(1)
        print("Removing C:/Users/Fung/System32")
        time.sleep(2)
        blung.face()
        exit()
    x -= 1
    return x

print("Hello, my name is Ultraman, the command helper")
print("""I can help you with these commands:
    - ls
    - cat
    - grep
    - cd
    - man
    - file
    - diff
    - find
    - wildcards
    """)
print("To redisplay commands type display")
print("To exit just press enter without typing anything in")
print(f"Patience: {patience}")
thing = input("What can I help you with: ")

while thing != "":
    patience = helper(thing, patience)
    print(f"Patience: {patience}")
    thing = input("What else can I help you with: ")
else:
    if patience == 7:
        print("Thank you for using Ultraman for your command explanation, thank you for not making me sad by typing incorrect commands")
        exit()
    else:
        print("Try not to mess up the commands next time :)")
        exit()