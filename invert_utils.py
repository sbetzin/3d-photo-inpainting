import cv2
import os

def invert_grayscale_image(image_path):
    # Bild laden
    img = cv2.imread(image_path)
    print(f'shape={img.shape}')

    # Neuen Bildpfad erstellen
    dir_path, file_name = os.path.split(image_path)
    file_base, file_ext = os.path.splitext(file_name)
    inverted_file_name = f"{file_base}_orig{file_ext}"
    inverted_image_path = os.path.join(dir_path, inverted_file_name)
    # Invertiertes Bild speichern

    print (inverted_image_path)
    cv2.imwrite(inverted_image_path, img)

    # Bild invertieren
    inverted_img = 255 - img

    # Invertiertes Bild speichern (überschreibt das Originalbild)
    cv2.imwrite(image_path, inverted_img)
    print ("Done inverting")


