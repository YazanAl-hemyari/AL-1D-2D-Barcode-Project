report 50100 "2D Barcode Item"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Barcode Items';
    RDLCLayout = '2D ItemBarcodes.rdl';
    dataset
    {
        dataitem("BL Barcode List"; "BL Barcode List")
        {
            DataItemTableView = sorting("Barcode No.");
            RequestFilterFields = "Barcode No.";
            RequestFilterHeading = 'Barcodes Items';
            column(No_; "Barcode No.")
            {
            }
            column(Description; Description)
            {
            }

            column(Aztec; Aztec)
            {
            }
            column(DataMatrix; DataMatrix)
            {
            }
            column(MaxiCode; MaxiCode)
            {
            }
            column(PDF417; PDF417)
            {
            }
            column(QRCode; QRCode)
            {
            }
            trigger OnAfterGetRecord()
            begin
                GenerateAztec();
                GenerateDataMatrix();
                GenerateMaxiCode();
                GeneratePDF417();
                GenerateQRCode();
            end;
        }
    }
    local procedure GenerateAztec()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::Aztec;
        BarcodeString := "BL Barcode List"."Barcode No.";
        Aztec := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
    end;

    local procedure GenerateDataMatrix()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"Data Matrix";
        BarcodeString := "BL Barcode List"."Barcode No.";
        DataMatrix := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
    end;

    local procedure GenerateMaxiCode()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"Maxi Code";
        BarcodeString := "BL Barcode List"."Barcode No.";
        MaxiCode := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
    end;

    local procedure GeneratePDF417()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::PDF417;
        BarcodeString := "BL Barcode List"."Barcode No.";
        PDF417 := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
    end;

    local procedure GenerateQRCode()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
        BarcodeString := "BL Barcode List"."Barcode No.";
        QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
    end;

    var
        Aztec: Text;
        DataMatrix: Text;
        MaxiCode: Text;
        PDF417: Text;
        QRCode: Text;
}