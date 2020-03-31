import PyPDF2

with open('water.pdf','rb') as pdf:
    read_pdf = PyPDF2.PdfFileReader(pdf)
    print(read_pdf.numPages)