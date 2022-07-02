# ---------------- MAIN ---------------------------------------------
# Nombre: Dinamic_Image.asm
# Funcion: Programa que imprime una imagen transformada en el bitmap display y lo convierte en una imagen dinámica. 
# Una vez como imagen dinámica se vuelve a imprimir en pantalla llamando a su ID
# Requiere:
# - IMAGE.s
# - COORD.s
# - NEW_IMAGE.s
# - RESIZE_IMAGE.s
# - RESIZE_PIXEL.s
# Display: 512x512, 0x10040000 (pixel 1x1)
# Ayuda:
# - Impresión de Imagenes: Help(7)
# - Escalado de Imágenes: Help(8)
# - Creacion de imágenes dinámicas: Help (11)
# -------------------------------------------------------------------


		.data
		
image:			.word	0xff000000 0xff000000 0xff000000 0xfff699fb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffed8ef7 0xffee8ff7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffe483f3 0xff000000 0xffe585f4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffdb79ef 0xff000000 0xff000000 0xffdd7bf0 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffd16deb 0xff000000 0xff000000 0xff000000 0xffd470ec 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc863e7 0xff000000 0xff000000 0xff000000 0xff000000 0xffcb66e8 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffbf58e3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc35ce4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb64edf 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffba52e1 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffac42db 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb148dd 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa438d7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa93ed9 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9a2dd3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa034d5 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9122cf 0xff000000 0xff000000 0xff000000 0xff9425d0 0xff9426d0 0xff9527d1 0xff9527d1 0xff9628d1 0xff9729d1 0xff972ad2 0xff982ad2 0xff000000 0xff000000 0xff000000 0xff000000 0xff8717ca 0xff000000 0xff000000 0xff8919cb 0xff8a1acb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7f0dc7 0xff000000 0xff800ec7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7501c2 0xff7602c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7400c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 
scaled_image:	.word	# Direccion de nueva Imagen Dinámica
		.text
		# Imprimir transformacion
		la a0, image		# Imagen a cargar
		li a1, 16			# Ancho
		li a2, 16			# Alto
		li a3, 0			# Coordenada x
		li a4, 0			# Coordenada y
		li a5, 2			# Escala
		jal RESIZE_IMAGE
		
		# Conversion a imagen dinámica
		la a0, scaled_image		# Direccion en memoria
		li a1, 0					# Coordenada x
		li a2,0					# Coordenada y
		li a3, 32					# Ancho
		li a4, 32					# Alto
		jal NEW_IMAGE			
		
		
		la t0, scaled_image		# Direccion de Imagen Dinámica (ID)
		
		# Impresión de Imágenes dinámicas
		addi a0,t0,16		# Direccion de Bitmap
		lh a1, 12(t0)		# Direccion Ancho
		lh a2, 14(t0)		# Direccion Alto
		li a3, 100			# Coordenada X
		li a4, 100			# Coordenada Y
		jal IMAGE
				
		# Fin de programa
		li a7,10
		ecall
		
