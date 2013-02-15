Option Strict On
Option Explicit On

Imports System.Collections.Generic

Public Interface DataCache

    Sub load()

    Function getArraylist() As ArrayList

    Function getObject() As Object

End Interface
