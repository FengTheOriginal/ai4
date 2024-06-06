from PIL import Image
import os





def duplicate_image(source_path, destination_folder, num_copies):
    image_name = os.path.basename(source_path)
    name, extension = os.path.splitext(image_name)
    for i in range(1, num_copies + 1):
        destination_path = os.path.join(destination_folder, f"{name}_copy_{i}{extension}")
        with Image.open(source_path) as img:
            img.save(destination_path)
# Example usage
source_image_path = '/home/testuser/holder/image.jpg'
destination_dir = '/home/t0476926/AI4/images'
num_copies = 500
duplicate_image(source_image_path, destination_dir, num_copies)
