'-----------------------------------------------------
' Nombre del Procedimiento: crearCarpetaPorMateria
' Autor: Mariela Montaldo 
' Fecha de Creación: 2022
' Descripción: Esta macro crea una estructura de carpetas
'              en el sistema de archivos. Se genera una
'              carpeta por cada materia a cursar, y dentro
'              de cada materia, una carpeta por cada clase
'              de esa materia.
'-----------------------------------------------------

Sub crearCarpetaPorMateria()
Dim materia As Integer    ' Nro de fila de la materia en columna B
Dim clase As Integer      ' Itera las filas con nombres de materias en la columna B (B4 a B8)
Dim nroMateria As Integer ' Itera las fechas de las clases (van desde H2 a H20)
Dim ruta As String        ' Almacena la carpeta donde se van a crear las subcarpetas por materia y clase

ruta = Range("B36") + "\"

If Dir(ruta, vbDirectory) = "" Then
    MsgBox Prompt:="La carpeta contenedora especificada (celda B36) no existe.", Title:="Error"
Else
    nroMateria = 8
    For materia = 4 To 8
        MkDir ruta & Range("B" & materia)
        For clase = 2 To 20
            Dim aux As String
            Dim prueba As String ' Almacena la letra de la columna de las fechas de clases correspondientes a esa materia
            ' Extrae el nro de columna almacenado en nroMateria y lo guarda en la variable prueba
            ' Ejemplo: Si nroMateria = 8 entonces prueba = H
            prueba = Split(Split(Columns(nroMateria).Address, "$")(1), ":")(0)
            If StrComp(Range(prueba & clase), "FALSO", vbTextCompare) <> 0 Then
                ' aux construye la ruta completa de la carpeta para esa materia y fecha de clases
                aux = ruta & Range("B" & materia) & "\" & Format(Range(prueba & clase), "YYYYMMDD")
                ' Genero la carpeta de la clase - El nombre de la carpeta es la fecha de la clase
                MkDir aux
            End If
        Next clase
        nroMateria = nroMateria + 1
    Next materia
End If
MsgBox Prompt:="Estructura de carpetas generadas correctamente.", Title:="¡Todo listo!"
End Sub
