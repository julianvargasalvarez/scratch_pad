Module Module1

    Sub Main()
        Dim a() = {Function(x) x + 1, Function(x) x * x, Function(x) x / 2}
        For Each f In a
            Console.WriteLine(f(3))
        Next
        Console.ReadKey()
    End Sub
End Module
