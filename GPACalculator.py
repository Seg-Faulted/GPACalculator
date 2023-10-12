import tkinter as tk

class GPAApp:
    def __init__(self, root):
        self.root = root
        root.title("GPA Calculator")
        root.geometry("600x500")
        root.resizable(False, False)

        self.create_widgets()

    def create_widgets(self):
        tk.Label(self.root, text="GPA Calculator", font=("Times", 21)).place(x=190, y=0, width=219, height=64)

        self.num_classes_entry = tk.Entry(self.root, font=("Times", 10))
        self.num_classes_entry.insert(0, "# of classes")
        self.num_classes_entry.place(x=370, y=110, width=100, height=30)
        self.num_classes_entry.bind("<FocusIn>", self.on_entry_click)
        self.num_classes_entry.bind("<FocusOut>", self.on_focusout)

        tk.Label(self.root, text="How Many Classes?", font=("Times", 13)).place(x=210, y=100, width=166, height=36)

        self.grades_entry = tk.Entry(self.root, font=("Times", 10))
        self.grades_entry.insert(0, "Grades (No Decimals)")
        self.grades_entry.place(x=370, y=150, width=75, height=30)
        self.grades_entry.bind("<FocusIn>", self.on_entry_click)
        self.grades_entry.bind("<FocusOut>", self.on_focusout)

        tk.Label(self.root, text="Enter Grades, followed by a comma for each grade", font=("Times", 10)).place(x=230, y=150, width=130, height=38)

        self.calculate_button = tk.Button(self.root, text="Get GPA", command=self.calculate_gpa, font=("Times", 10), bg="#00a2ff", fg="#000000")
        self.calculate_button.place(x=290, y=200, width=70, height=25)

        self.result_label = tk.Label(self.root, text="", font=("Times", 10))
        self.result_label.place(x=190, y=230, width=220, height=25)

    def on_entry_click(self, event):
        entry = event.widget
        if entry.get() in ["# of classes", "Grades (No Decimals)"]:
            entry.delete(0, tk.END)  # Delete default text
            entry.config(fg="black")  # Change text color to black

    def on_focusout(self, event):
        entry = event.widget
        if not entry.get():
            entry.insert(0, "# of classes" if entry == self.num_classes_entry else "Grades (No Decimals)")
            entry.config(fg="grey")  # Change text color back to grey

    def calculate_gpa(self):
        num_classes = int(self.num_classes_entry.get())
        grades_input = self.grades_entry.get()
        my_list = grades_input.split(",")
        grades = [int(grade) for grade in my_list]

        # Calculate the GPA using the user's input
        gpa = sum(grades) / len(grades)

        self.result_label.config(text=f"Your GPA is: {gpa:.2f}")

if __name__ == "__main__":
    root = tk.Tk()
    app = GPAApp(root)
    root.mainloop()
