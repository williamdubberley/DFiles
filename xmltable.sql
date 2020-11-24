SELECT      X.INTERNALID, 
            XMT."ITEM_INTERNALID", 
            XMT."NAME",
            XMT."DESCRIPTION",
            XMT."CLASS",
            XMT."QUANTITY",
            XMT."AMOUNT",
            XMT."RATE", 
            XMT."COSTESTIMATE",
            XMT."COSTESTIMATETYPE"
            FROM NS_SALESORDER X,
            XMLTABLE ( '/itemList/item' PASSING XMLTYPE (X.ITEMLIST)
                        COLUMNS 
                        "ITEM_INTERNALID"   VARCHAR2(10) PATH 'item/@internalId', 
                        "NAME"              VARCHAR(50)  PATH 'item/name',
                        "DESCRIPTION"       VARCHAR(100) PATH 'description',
                        "CLASS"             VARCHAR(100) PATH 'class/name',
                        "QUANTITY"          NUMBER(8, 2) PATH 'quantity', 
                        "RATE"              NUMBER(8, 2) PATH 'rate', 
                        "AMOUNT"            NUMBER(8, 2) PATH 'amount', 
                        "COSTESTIMATE"      NUMBER(8, 2) PATH 'costEstimate',
                        "COSTESTIMATETYPE"  VARCHAR(25)  PATH 'costEstimateType'
            )XMT
            ;