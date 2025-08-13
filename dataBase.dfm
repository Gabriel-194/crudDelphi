object DataModule1: TDataModule1
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM aluno')
    Left = 100
    Top = 60
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Database=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=pg')
    Left = 220
    Top = 70
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\gabri\Downloads\lib\lib\libpq.dll'
    Left = 360
    Top = 70
  end
end
