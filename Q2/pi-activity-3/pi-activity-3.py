################################
# Name: Hayden Pott            #
# Date: Today                  #
# Desc: An insecure calculator #
################################
import tkinter as tk
import json

button_data = {}

with open('buttons.json', 'r') as f: # File called 'buttons.json' contains the data for the buttons as an array of objects
    button_data = json.loads(f.read())

class Main(tk.Frame):
    def __init__(self, parent):
        tk.Frame.__init__(self, parent, bg='white')
        self.setup_gui()
        self.state = 'input'

    def setup_gui(self):
        self.display = tk.Label(self, text='', anchor=tk.E, bg='white', height=2, width=15, font=('Anonymous Pro', 50))
        self.display.grid(row=0, column=0, columnspan=4, sticky=tk.E + tk.W + tk.S + tk.N)
        self.pack(fill=tk.BOTH, expand=1)

        # Add buttons
        for entry in button_data: # Iterate over all button entries in the json
            # Figure out the bg colour based on the row/col - '=' key is blue, rows 1/6 and col 3 coloured grey and the rest is lightgrey
            bg_color = 'blue' if entry['value'] == '=' else 'grey' if entry['row'] in [1, 6] or entry['col'] == 3 else 'lightgrey'
            button = tk.Button(
                    self,
                    bg=bg_color,
                    bd=-1,
                    text=entry['value'],
                    width=2,
                    height=2,
                    font=('Anonymous Pro', 50),
                    command=self.button_command(entry['value'])
            )
            button.grid(
                    row=entry['row'],
                    column=entry['col'],
                    sticky=tk.E + tk.W + tk.S + tk.N,
                    columnspan=2 if entry['value'] in ['=', '0'] else 1 # Both the '0' and '=' keys are double width because I didn't like the empty square
            )

    def button_command(self, value):
        """ Return a function for the button command (This is easier and cleaner than a lamdba imo) """
        def func():
            if value == 'AC':
                self.display.config(text='')
                self.state = 'input'
            elif value == '<-':
                if self.state == 'input':
                    self.display.config(text=self.display.cget('text')[:-1])
            elif value == '=':
                try:
                    result = '' if self.display.cget('text') == '' else str(eval(self.display.cget('text')))
                    result = result if len(result) <= 14 else result[:11] + '...'
                    self.display.config(text=result)
                    self.state = 'output'
                except:
                    self.display.config(text='ERR')
                    self.state = 'error'
            else:
                self.display.config(text=(('' if self.state == 'error' else self.display.cget('text')) + value)[:14])
        return func

window = tk.Tk()
window.title('Calculator')
window.attributes('-type', 'dialog') # Tiling window managers make it difficult to test sized windows :P
p = Main(window)
window.bind('q', lambda _: exit()) # The vim in me is dying
window.mainloop()
