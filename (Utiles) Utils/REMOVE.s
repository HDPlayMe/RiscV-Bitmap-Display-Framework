# ---------------- SUBRUTINA ---------------------------------------------
# Nombre: REMOVE.s
# Funcion: Subrutina que elimina una imagen din�mica del display
# Requiere: 
# RECTANGLE.s
# Argumentos:
# a0: ID de imagen
# Ayuda: Help(12)
# -----------------------------------------------------------------------

# ---------------- CONSTANTES  --------------------------------------
			.eqv REMOVE_COLOR 0		# Color de Eliminado
			
# ---------------- PROGRAMA PRINCIPAL  ------------------------------
			.globl REMOVE

REMOVE:

		.text
		#-- Comienzo subruina
		addi sp, sp, -4
		sw ra, 0(sp)
		
		mv t0,a0		 # Copiamos direccion de ID
		
		# Borramos datos inestables
		li a0,0
		li a1,0
		li a2, 0		
		li a3, 0
		
		# Colocamos un rectangulo negro encima de la imagen
		lh a0, 8(t0)	 # Coordenada X
		lh a1, 10(t0)    # Coordenada Y
		lh a2, 12(t0)	# Ancho
		lh a3, 14(t0)	# Alto
		li a4,REMOVE_COLOR		# (Negro)
		jal RECTANGLE
		
		lw ra, 0(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 4
		ret
		
