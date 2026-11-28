from pypdf import PdfReader

pdf = PdfReader(r"./02-training-project/01-phase/02-planning/06-architecture/01-learning-guide/Guia_Aprendizaje_Diseno.pdf")

with open("Guia_G2_extraida.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(page.extract_text() or "" for page in pdf.pages))

print("PDF extracted successfully.")
