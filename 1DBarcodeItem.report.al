report 50600 "1D Item BarCodes"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = '1D Item Barcodes';
    RDLCLayout = '1D ItemBarcodes.rdl';
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
            column(Codabar; EncodeTextCodabar)
            {
            }
            column(Code128; EncodeTextCode128)
            {
            }
            column(Code39; EncodeTextCode39)
            {
            }
            column(Code93; EncodeTextCode93)
            {
            }
            column(Interleaved2of5; EncodeTextInterleaved2of5)
            {
            }
            column(MSI; EncodeTextMSI)
            {
            }
            trigger OnAfterGetRecord()
            begin
                GenerateCodabar();
                GenerateCode128();
                GenerateCode39();
                GenerateCode93();
                GenerateInterleaved2of5();
                GenerateInterMSI();
            end;
        }
    }
    local procedure GenerateCodabar()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Codabar;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextCodabar := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GenerateCode128()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Code128;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextCode128 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GenerateCode39()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Code39;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextCode39 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GenerateCode93()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Code93;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextCode93 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GenerateInterleaved2of5()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Interleaved2of5;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextInterleaved2of5 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GenerateInterMSI()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::MSI;
        BarcodeString := "BL Barcode List"."Barcode No.";
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodeTextMSI := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    var
        EncodeTextCodabar: Text;
        EncodeTextCode128: Text;
        EncodeTextCode39: Text;
        EncodeTextCode93: Text;
        EncodeTextInterleaved2of5: Text;
        EncodeTextMSI: Text;
}