table 50301 "BL Barcode List"
{
    Caption = 'Barcode List';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Barcode No."; Code[20])
        {
            Caption = 'Barcode Content';

        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';


        }
        field(3; "Barcode Picture"; Blob)
        {
            Caption = 'Picture';
            Subtype = Bitmap;

        }

    }
    keys
    {
        key(PK; "Barcode No.")
        {

        }
    }

}

