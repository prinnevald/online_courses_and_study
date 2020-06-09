from tkinter import *
from tkinter import ttk

def main():
    
    # creating a window
    # setting title and
    # setting the window size
    
    window = Tk()
    window.title("TEST GUI")
    window.geometry("500x300")
    
    # creating the label (text) with according font settings
    # matching the position of the label in the grid layout
    
    label = Label(window, text = "Hello!", font = ("Arial Bold", 16))
    label.grid(column = 0, row = 0)
    
    # prepare the command for when the button is pressed

    def clicked():
        label.configure(text = "Click!")
    
    # doing the same stuff for the button
    
    button = Button(window, text="Press", command = clicked)
    button.grid(column = 1, row = 0)
    
    ###########################################
    #             ATTENTION                   #
    # do not mix the .pack() with the .grid() #
    # command. This will NOT compile properly #
    ###########################################
    
    def clickedColor():
        label.configure(text = "Yayyyy")
    
    # we even can change the color and text color
    # of the buttons as well
    
    buttonColor = Button(window, text="Me Too", bg = "gray",
                                 fg = "black", command = clickedColor)
    
    buttonColor.grid(column = 2, row = 0)
    
    # label to test fields
    
    Flabel = Label(window, text = "Test input",
                           font = ("Arial Bold", 16))
    
    Flabel.grid(column = 0, row = 1)
    
    # entry widget is used to make an input field
    # in your program.
    
    field = Entry(window, width = 40)
    field.grid(column = 0, row = 2)
    
    def Fclick():
        res = "Welcome to " + field.get()
        Flabel.configure(text = res)
    
    # make a button to accept changes
    
    Fbutton = Button(window, text = "Enter", command = Fclick)
    Fbutton.grid(column = 1, row = 2)
    
    # combobox is a dropdown menu
    # current changes the defalut selected
    # element in the combobox until changed
    # by the user.
    
    combo = ttk.Combobox(window)
    combo["values"] = (1, 2, 3, 4, 5, "Text")
    combo.current(3)
    combo.grid(column = 0, row = 3)
    
    # of course, combobox has the .get() method to
    # get the current value of the box
    
    ###########################################
    #             ATTENTION                   #
    # to use the Combobox you need to import  #
    # the ttk package SPECIFICALLY. this is   #
    # just how tkinter works. Sadly.          #
    ###########################################
    
    # Checkbutton is a checkbutton. That's it.
    # first of all we need to create a specific tkinter variable
    # which will hold the check state. Then we proceed to creating
    # the checkbutton itself
    
    checkState = BooleanVar()
    checkState.set(True)
    
    check = Checkbutton(window, text = "Select", var = checkState)
    check.grid(column = 1, row = 3)
    
    # start the window and loop it
    # waiting for actions

    window.mainloop()


if __name__ == "__main__":
    main()
