# Programa que imprime una imagen transformada en el bitmap display y lo convierte en una imagen din�mica.
		.data
		
image:			.word	0xff000000 0xff000000 0xff000000 0xfff699fb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffed8ef7 0xffee8ff7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffe483f3 0xff000000 0xffe585f4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffdb79ef 0xff000000 0xff000000 0xffdd7bf0 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffd16deb 0xff000000 0xff000000 0xff000000 0xffd470ec 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc863e7 0xff000000 0xff000000 0xff000000 0xff000000 0xffcb66e8 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffbf58e3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc35ce4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb64edf 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffba52e1 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffac42db 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb148dd 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa438d7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa93ed9 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9a2dd3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa034d5 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9122cf 0xff000000 0xff000000 0xff000000 0xff9425d0 0xff9426d0 0xff9527d1 0xff9527d1 0xff9628d1 0xff9729d1 0xff972ad2 0xff982ad2 0xff000000 0xff000000 0xff000000 0xff000000 0xff8717ca 0xff000000 0xff000000 0xff8919cb 0xff8a1acb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7f0dc7 0xff000000 0xff800ec7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7501c2 0xff7602c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7400c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 
dinamic_image:	.word

		.text
		# Imprimimos imagen
		la a0, image	#Direccion de imagen
		li a1, 16		# Alto
		li a2, 16		# Ancho
		li a3, 100		# Coordenada x
		li a4, 100		# Coordenada y
		jal IMAGE
				
		# Conversion a imagen din�mica
		la a0, dinamic_image	# Direccion a memoria
		li a1, 100				# Coordenada x
		li a2,100				# Coordenada y
		li a3, 116				# Coordenada x final
		li a4, 116				# Coordenada y final
		jal NEW_IMAGE
		
		# Mover hacia la derecha
		la a0, dinamic_image	# ID
		li a1, 0 				# Direccion
		li a2, 100				# Distancia
		li a3, 3				# Velocidad
		jal SHIFT
		
		# Mover hacia abajo
		la a0, dinamic_image	# ID
		li a1, 1 				# Direccion
		li a2, 50				# Distancia
		li a3, 3				# Velocidad
		jal SHIFT
		
		# Mover hacia la izquierda 
		la a0, dinamic_image	# ID
		li a1, 2 				# Direccion
		li a2, 100				# Distancia
		li a3, 3				# Velocidad
		jal SHIFT
			
		# Eliminar imagen
		la a0, dinamic_image 	# ID
		jal REMOVE
	
		# Fin de programa
		li a7,10
		ecall

