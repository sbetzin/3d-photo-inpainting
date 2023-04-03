import cv2

def invert_grayscale_image(image_path):
    # Bild laden
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)

    # Bild invertieren
    inverted_img = 255 - img

    # Invertiertes Bild speichern (überschreibt das Originalbild)
    cv2.imwrite(image_path, inverted_img)