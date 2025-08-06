object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM aluno')
    Left = 80
    Top = 48
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Database=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=pg')
    Left = 176
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabriel kuchma\Documents\Embarcadero\Studio\Projects\cr' +
      'udDelphi\lib\libpq.dll'
    Left = 288
    Top = 56
  end
end
