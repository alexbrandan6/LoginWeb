Public Class Usuario
    Public Property NombreUsuario As String

    Public Sub New(ByVal data As Dictionary(Of String, Object))
        NombreUsuario = If(data.ContainsKey("NombreUsuario"), data("NombreUsuario"), Nothing)
    End Sub
End Class
