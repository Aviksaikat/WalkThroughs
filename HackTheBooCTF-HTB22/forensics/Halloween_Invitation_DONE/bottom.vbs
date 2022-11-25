Function decode_hex(ByVal arg1 As String) As String
	Dim itetaor As Long
	For itetaor = 1 To Len(arg1) Step 2
		decode_hex = decode_hex & Chr$(Val("&H" & Mid$(arg1, itetaor, 2)))
	Next itetaor
End Function