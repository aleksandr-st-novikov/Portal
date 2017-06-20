CREATE TABLE [dbo].[Store] (
    [Id] [int] NOT NULL IDENTITY,
    [StoreId] [int] NOT NULL,
    [Name] [nvarchar](max),
    [Address] [nvarchar](max),
    CONSTRAINT [PK_dbo.Store] PRIMARY KEY ([Id])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201706201219520_Store', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5D596F1C39927E5F60FF43A19E76171E95248F1B1E439A815AC7B430B6AC71D93DFB6650999494701E3579B8252CF697EDC3FEA4FD0B4BE6C924193CF22EB71E6CA892643018FC180C9211E4FFFDCFFF9EFCE529F057DF719C785178BA3E3A385CAF70E844AE173E9CAEB3F4FE0F6FD77FF9F3BFFECBC9A51B3CAD7EADF2BDA6F948C930395D3FA6E9EEDD6693388F3840C941E039719444F7E98113051BE4469BE3C3C33F6D8E8E36989058135AABD5C9A72C4CBD00E73FC8CFF32874F02ECD90FF2172B19F94DF49CA36A7BABA41014E76C8C1A7EBDB284E917F50645CAFCE7C0F1126B6D8BF5FAF501846294A098BEFBE24789BC651F8B0DD910FC8FFFCBCC324DF3DF2135CB2FEAEC96EDA8AC363DA8A4D53B022E564491A0596048F5E9762D9F0C53B09775D8B8D08EE9208387DA6ADCE8577BA3E731C9C2451EC612235BEBE77E77E4CF372E23DC8A99012074CE957AB22CFAB1A0E043507E4DFABD579E6A7598C4F439CA531CD719BDDF99EF337FCFC39FA86C3D330F37D964BC227496B7D209F6EE36887E3F4F913BE2F79BF76D7AB4DBBDC862F581763CA144DBA0ED3D7C7EBD50DA91CDDF9B80601D3FC6D1AC5F8AF38C4314AB17B8BD214C721A58173310AB573755D905217919305247B552BFDF699605C52B19A18236A4A49DF0E6372177887E29432D997E896C82D4B2C69DCA0EFDE432E6F1316D7AB4FD8CF73278FDEAE18E107D29C5F5BD0BE8AA3E053E44364D9CC5F3FA3F801D31E8B4C4B6CA32C76BA35ED33958DAE557926830609F9546D1133F76906E9726D2B481E934670D9946DE0F3CA9A70B269D49EA9326411D7472D36745E14A4A82007D33C97C1CE8F9E716FB578811327F676C5645B1022F602B17AD6AB0FE8E93D0E1FD247620FBD2176CE95F784DDEA4B49FC4BE8112389144AE36C748D6E322CA75097D590335797D5809E48CFB063D948E3306C5BE81EA694AD22D5CC6F7231CA9BA5CB2BB4485BC0B631D5589436A54AD437449D53688626FB50F34281BF3E3302CDF732170875D1FF152AF7D84CE34EA133BB9A310A3D099A3CA3DACA43EA498BC6490671876692143773B46D2CB37D1586B0B481406ED52C0015194AE1D4EDECA3734A222F6AC756ED985A7A966626299DF65776EA3AFE9EA15C02B738FE18D66DBCC08E17207FBDBA8DC95FE5F6DEDBF56AEB20CABDBDC57C1B7B4E433DCAF2D5AC258DEBE4CC49BDEF35999F2332CA5038F91EC978EBF57A149B2DDB2BA562B37AAFCA8CBC881F46A12AA60B9D0EEE6DC1151DD8CB84A3245E94A96AFC0DB83F5902A22FC54A1F7254CC0A9D3DC418F30C8C615B76DEE8531960E0AEE07876D7501AD0A659BCD6ECA4297A6DFCBDECF6A92C0514CB76FAE8295F169324E7F9436EDCE4968F8ED82F18B902297B530FAA9C31C65E1F8E62026E1F093E3AB27464C85247AB0BE26082939C4177BA78DD61BC3566BBD32557EB0C6126A394FF3A5DC57393C9964F3A58742C1679A4DCD1241563797A2FA5DB6C195AABDCAAE88BC215EA2213E48D726D3B8012798F92341C660DADAEE8CA8B27AA89C8398EC2E7C073C6AF2A4A3CDAD3963399E2DC4CEF91705D9F6C35BE08FA523F7B71FA685BF09CE47B88E267851CC99F834C65FF88E26FD6DB07034C58839D67F0FAD5F0F863A013A6BA360DEF260CF7E0B21A0F521EAB44F96C2AA60ABB27922CBD76691B6EAD67ADAAE8CBACB57033BDF3D66447A3D11AE4FC30548C836E3B676EE025493794D7655F602E9D54AFFCCC764ABDC902A6D458670717D12E4BBED9F2B645E107CFDABAF880DD8F49606D5A44019D6190D2B830D509A31817A61E4A23997AA6A665578BA11EDB80C9204B1777F36499BAAEC2356C36D9644CD6D60BCC629D6550ABA6A1DF64933158EB7598C13A4B2F855F29304A5DA5F33FD44EE767C9EE06A70755C142FF3F5FC584DC6F64E41CB0145FAD8CCB3593C531992C0E4D268BD74777F7AFDFBEF909B9AF7FFA237EFD66FA8943B6543C7E3B8665A2739879F3D3B81E335F12D23B5248B3FDFDB5CCD6405A4C15202DC93208A429A9E1615D515D3EB429A722BCA5596983BA8C84AA8AA94743C5EFB8F51A232E370E3B58CC79B9176B591259428AF73D01D668CC61B6A2CE5C37C64932703DC6C0FB1CA330D911F874005F5DF605801DBA7598C546BEFE69FAB067D0D8E88B8EAEAB87BA89C0EA41962E9809D24C83AE1E9A1A64AB073155C1A272F560BE1BB3DB91D196B349675AF341CE15DCBB113E9D25D171CC5C06C8F307B0C70D6A398FC27B2F0E1A7FA4AE7B12B728498839EAFE8292C7D127C62D76B298A0799BA260377A6DB78F51886FB2E08E0E92E9EA1AAC6B3EFF165D2187CC5997212DD59BDEFBC8F91665E965E8D2C9E44BEA88738B218141D8290EB5AE0898B17B1E654D7C7437CB8EAAB4B9D7C3E73EF202C0C1AFAD7CBF5659997D1E690E71AF479E6DD81D33AE0EE9BE199047CB70E73DB4F7D183179A49B7CA0AB35BE4D0325B66B365951233E3B4CC09339A67D0F259E41A6C872407D5F05B2439D9E5EF912C7D2132D7064BDE7D85A7FFC8D3695ED3AFC8CF86AEAAD368C895C0F0A32127BBFCD190B3493E7FF75C6A48196C1C56990979A3FCF23D49FD98E3389B7A38B49A3975E5D3E80068B89C2549E478F92850B94BB5A218DACD2156E8CAFA7681A2ADE0FD05A4FD643C787466243C1311AC79EC7D0C2FB08F53BCA21E1D34EEED1C250E7245699376BBDD19AEBD8EA40CF36CFE87503B191A983ACA7B882EF41232B4BD3015C791173ADE0EF9B672E408194E81542875957C0AA91087546DD98AC88417F09E2291C19A0FAE3775023DD9308836063A1FD56C0271BE8C06DCC56C3B35AC0526E7063424B569A10C89C512C4555CEAD2E0CB28D20E18916DD22E18D2B26B442CA797F1612ECA745EC08B42DB57E80B3196261082032EE5402FA28C75A031ACCB4E050F3AA07AC31A6ACCC46886FACF12C48B0470155BDB055B42A0EDF870166E37905659070CEF13B8B9A6CD8C71AE6F2DA1CEC4DDCF8DF85BE0D20903F40145357807C0678878A84E35E047B78DFAA25DD3AC69C1AEE9D77DB24DB441CF10E4CC23A01BC04DBE63627E21E13C26B8A9102780B7A9A84C5859C06E89263612028C69A0640397E6887212449BDE4C390F9ECDC437019ACDC464C208EB92332F926DE0DB0DB32A134315626BA4E20F0F0E8E064659B71E1D0A5ADD80BD00DD2889F3847A5D15F4D9747A133D64D0E54AE212449983B51398E0164E802558022695B36176731B8F7A28A9AF9CE9AC4134157407543739E457D91870D8BED7C6A4F52AE50C5D8863D0EAE1D432C0C4B4B62B2B57939AABBBBCE6D96590C5B1826B7C65502B63EF3541F3161B08AA60D889A777152F53ACF31572DE93095E1278ACEF78D18F72304C099E9793EA25988F49D1C4CB772F161F9208717D778BE1E28321490833EF6A85F64412CFC7A448E2E5BB17B6A224301BEA6E559476D3DDEDBB0226D97C51C4864B186B22BE4759B8C0529A008CB0244C2A9707784F044469F81FD4E3EA58C0A6CF99B04973B5A68C219CD8E852F132019E5472DE13A34B12AFA9EF7895D1D51353F31A5D301F93A2693F8D2E79C816681D69E2B718E38B8FE09DC6194E1D3806CC9C6524D0389E6F4A894D61CB294562C200789DCA1C00D5AF32B5317BC62055AE1374117FD3AE3B35DCCC80B31F421D963196A620E0032E97A60EB9484F401D96A16093A8C3B6C46680695B247BA70E8BD05AD3FEE7E26C9706CF7680EFF4CB5CA5B866C0664B1E0B83E665DE21A44C4A4AE05884E7C51D4DC44FB21B9A089F655C695286E8F110A1C4B738153DD8D6ABCB3A5A4FE6222E4CD8202576A9ABA2C9E633A75E7839AAE81639CC29D6BE9A2AA275260B4E0B9F6725AB45160D4DA5402DA4D8984B0295264943A3D9A0156834493A1935FBC7A2709A340D95F2F20381427B4F51438457802A828D92D4102D2FEF130895DF35A5992D03810293A6A1525E9B29CA979F902C04545D3BA29450B9E6B3205BDDB7A1245BDA4E1C5946876A5451FB4D34A69CF19BE6BCEAEF12845C8B015498C20CD32574585E8D6842B4C567275A217E552D5475B82BD44E30E055DE4299E637263DA7F05804588911DAFE366DB564477C78D14A76C66D07424F718BAF22AAA5AC8EF003DB0DC6F8013295CDFEE6C427052CF81CA39D20A59166C64DE663CDC6102B1F5C26AF0332077B09198A5252CBD828B6096ABE2EBAC9AAF5B695A8452C35E3EDE5AB0D8E9148D72EA0A6D56CE3901AA6D186F3BF7120CC04CA55F76C9528539B608E56B30DC3399846438B191BB273C8D2508076521B52546AF90C2A14D93B46A24C745EF0AD6628FCE0995640AB581D298940C045752F2DA61488DE9B1B52294AA1D86BA8190453BC40AA9489E8D90DF1DFF2EDEE25899633F7384290BFA523B11AB4BECAED295CE5ADCC2A4668CF464F6D6C35227BBE472517F92928D00EE104B4874C8463CEB191D2E839953CE41EA3401B049FD11EF2109C440D54740779C89E9A11E5A1F37B6CB541E1F9C8B4A1DC6C54C842E1A8C8D0916C60F6168AFC727D512C7A2FBC5683947E784C93C04D4E3DB5B1D589EC3E7F955C0CD489C28FAC874CA65227C0C5D4129562E00FA53CC3E43CA298F694C356A556D4DE4BC070AA1A33B894945391915B8EB2752A1CD9CB6A26245587027A09C95C496C9C497A498773FC00905435667029951A5F2F24893B838543432F11B59D0F069ABAAABB65EB73F23AED64B3751E7180CA0F271BFAF62FDEA519F28BA74CAA840F68B7F3C287A429597E596D77C8210D39FFC376BD7A0AFC30395D3FA6E9EEDD6693E4A49383A0BE76D989820D72A3CDF1E1E19F3647479BA0A0B1715AD2E64FF5EB9AD228460F984BA5AF93BA387FB0FE02A5E80ED19B75CFDD40C826F50A000EDEAA2AC5837FB12BAB73B8AA0CFDBB5A96B71E8581A934E2BC222DA4D36FDE580C6C560BA549F9AD837C144BAE4A3F8FFC2C0861CF10B8347DACE22272B2C21C60E9B453CC294AEE0062C91A5C116444BBED1B0FD4A076A087EBD9A628CD9236D9EA9B48E564C375ACE0132300881BD53C266D11ABB4363B6017A6678762159D91F00CC2A22B16584F51969ECA8354C55FE2C4DEAE58ACB5D96312A61D6DF3E317389EE9805C19253BCCCA298C8356FA7FBB7CF165897D041F5476E82680985D4F8144E6EE2C88C297D0E326D9E28B3985BF672817C52D8E3F861C377C9A39D5DBD8733862E527731AD709F5CFFDCE9169BEFEEE545A7EE63E8C4E9391B2546A7212E30C14A65E45E775A6C9DCA20A9056DCB30AD7500D1FF9A0EA42E9EC21C6D895D3ABD21603DD414CC85E76E3F4C6E22D8A258662F3D59C5275E10E4B07BA8407A6D27F86D93E92FE10C9309FC7D4E8334157B123680A5C8884016CE1A2E38096A8F29B76F9E28B3985F72849430123CD57734AF98E8C488AF96C3318D3380A9F03CFE18763F3DD821A7333488B9AE2C61098DAF0AB4ABABB72CD2F01CB6F76547EF6E2F45124547E36A7754E0A3D443137FF355F6D14C73FA2F81BAF368A6F8B511A8A735C53A5019130501A70D1A5AE5DF6663668CED57B18DF100D13AB1B2E3BDE16EE959F892A20FF6881912C10C854DF2CB8897659C20DFEEA9B851D83C20F1EA71EAB6FE6543E60F76312B4A954DF2C146314D08E46826A64BE8FA51CA7DA941C7A7AEB36FDCEA431A0A340536DD18AAFB35718EAE273CF0733F5897814DABF7FEA70C5EE7D049300F7FCCA40E9D6AE1F103C0D53A9EE1663A940F78DCDD667453467F77E929637E81CA0DC382327AF8C27517F9CD2223B73DD1827DC2965FD7131A8681CB5BA2303A461800E45D991B63F2DFB4565D7315E6EBC75A7708083692EC56E98098B90A7AAF1BA808B15EFB03AD051180793C3F6FB65803C9F27947FB2A4711E85F75E1CF09BE47C9ACD265292FC16C5EE2F28E1F644DA2916FA1E3B594C7B2F45C18ED3FAED240B2E1FA31093A5D51DBD6EA0C5249BD0891E2051790E8B4DC7DFA22BE4102C5F86F42489A32EA65A6C4646CEB7284B2F43972AB52F29B7FB2749EE405BC2339F667B147545208ADDF328E3FDA624C91627C44427889641F375319A54E2163C8C815EDC96D1CF4207688CA35A8731F073968B00DFD61E43F3D992D6AFC8CF64C4CAEF8B0412E8B8DC0548C5FD28FD8004D080F50DC94EBE7DF75C5EB3734936BE194599BF616EFBA99530165CC70645DB9D193A9166233CF547CF6C6ED3C33AEAAD0D1AB7268F2819291686A4FCEE34868B8E0C8257B875D67C4AAE8831E1E61B7AABEBE426F3FDD3F53DF2136CD16CDEA55D8489E0D9CE67A9415A7EA97FD79EEDA55779CBDD3D9709755ECF6591941EEEBC9B799165BDAA461BB1FA9E9314070734C3C1F69FFEB9EF518F853AC307147AF738493F47DF7078BA3E3E3C3A5EAFCE7C0F25452042E940FF8EBFA9CEC8A3FEE835F5A8C76EB0E18BDBFBE5532A49E2FA12AF7C3AC6746EF12744EFF06830B9A6F064C3173C9180B2B8F3CAA382CD87F05F31E9776200BAB7284D711C366A7ABDA2B8A3465C8DBD8D927CDBAFBDA8C825DF528F1A5896C424CE680CEBC26D84D7A18B9F4ED7FF95977EB7BAFE4FFE06906BF7D5EA634C60F46E75B8FAEF3EECB457E09D9962C9F462AD729F673851526067165384824F1FEC2D567B74E2603DC7EE11D8B1D094ECC540CB35BEE020FC8E62E711D1EB63D1D37B1C3EA48FA7EBA337872CEDFCB6CF258FDF2E1017BDD3F716DCC58A56D19FC787230850EA34FEE3CA901B1346440BA774E38E311967BC6F7A39ED62C70B904F8D27F257925B41476F899488AD4A928FAD392FBDD60BEAF77E8474B38CA4C36A8F9682CA9D674F63FFB48AE81EBEB743827331EF2CF8E14C31C61DBD3337358D5E4C35DEEC5233CC6624570EEC86848C51F9C3D9708D3B796799579EE476E8294A417831A9573BBBBC3EB49F5D185F74D5BC75683DC7D86B6E6350024FC1EC2B240B8771A5D5602BFCC67B7C58039D71251F9630EB563E3065C6C7CD6EC43625FB8CDAB1178D463C94AEECF0F68A2995D28FBD1FA1C68BBDDDD5FF16A0A77FB7D73385B76677FB90DB10EDDA455F6DFAC858D7014FE2EEABAE1B650E1B71AA01DCC7F756FEB5237ABF115C39A20FBA2AADFCD2FBB156F9A5F7A352F9A5F754748C4FBA39E6A7D17A63EE23EECBBC38AD6D60AC746017F429F48EDCF03A7E3B90AED70997369AFE957F7EB5BA4EBE84DE3F3392F09908948A98D5316F7E1A4AD1AB5DCACDE40EBEC22566957B8BEBBBA9AAC256AA04B245D1365C7BF670D58A0EDC14457B7063DCB3127FF4BD9DBE6BCF76D3733BB351D9C9F0AE7DA8AD6919771DE02CBEB7DD0788ACAF31C0F99FF73C44FFFD1906E6AB0195BBF85ECDCD737772E9A0AE5A3FB4E77663A28C437577E3B8ED9E3E80B2E49CD307A0D8724E1F96DE202214BDD0BBD392B89DF75B98F1EEE67D0F175BFEE5DDE7E6C6B3DCD6A2AA4ACE68354BDCBCF776A25E9699CDB89D0F30D059BFF3F14C378DDFB61932346EDA92124A376CE3259B1E7F1C6703CFCEAD560C4C7B4E6843E8913C776EF7DCA9EE15D2F69BE7F21CD3BC7CCE3E8028E769AC37CE0DEF1336D1CF2BABC7CD9597708BD5195F183DC2E3E64A20D2EEB28520ABB5E5EF80FF7E60273A4B2E0E70957FD8D2A006BAE1EC09E8FA68E21F0288962A77899054BF39DC4FD98C8FC0F2D15D6050148963E36E62CC4117152BE1B648A8C9BDC4556FF9423D5D27FF1EF12715E33261780BDF193D351A6F4DDEAFDE9789B8DBF0F821A6601BF42F65FEB57BE85BFABE6BABABE75CEF2EC0069C6DE16B59F102D6BD36CFA14B9EE26E7571F3F1778839C55DE60B429CEAE6A969F13686723B3C3838127AB32368F7521559817001DA477CBF1E0443F3D832D379CDC7C50341716DF9BC30505D0E3CB5F1A387C18B4E18150CDABB72A6C5030DA61BC606D1C0C01A567B683558C20E7A48679A7579158F31879DD00483B48CC9E6EB0FA015546F2D2CD25468100184858EA318E6C1C2A48B092B24CCBE8068700084CC8D6332CE8383298D463B1CCC6E35B2C1335F25374C337DD78AB361BBAF9D30C9A685107F22E3A7491C05559A9733064796C14B10A691331381ABF6B29FC3FC105CFC7372CCD71FC0FC503D2DB048F3A341C4A4E6C73C5898D2FCB043C2FCE6473B34E4ABEC166ED66CE022495AC6039F36F90454B872433350993ACE11A1F64987516721E8BA738B58CF39C036EDCAA73B74F7500D7501E4E29491EC26F7BD514645F400A48CCAD41F51194157E62F5C1949DE87DB1BACCDB5F29A1969C68BAF098176D9BE65BE0A5EE26F841780563E2E203AF2AC579775F089CC23B5B85BFE74EDDE450402450C4B2B8330238255B14B3C55A56C3E4DF56C5673460A2733150B450E4DE54526F36A6B373255CD75264DE5753E8B6617FE94CA761759740D2F72696A5676B7AE8F2D3AB631D8845A9A24591D4DAAA686661354A8A14992D5D0A4EA7AA9D91915BBA74993F64B93ACA9A4BD7F27D4D34E965695EC6E705ACC64A69535530458619305AEB4796255577171B189585BF95D564599A421CC6C2308C499345905E033882210F8C95E84039F432D34BB9E2A17B1CAAE2AF3A8AB2D17FA36759736ABB2EE328FBAEED2AEE7EB6E3FE1621C51B962CAA9E62A3808A46DE9A9E6C3E2F54593E90DA20951126DBFB638EC4425C4FCA985A40E11849AC2CED27C736453EFB244C2769D9570E09DE571C5D4078D3D4527C4506924A68EB9EA8B0350D0ACF924485A6A120D2B96DAE4B3930EE0E1AF8984903713B03A9722322828452D31A35096B1875F37C1771097367842222CBB800BF0B88F699AFDCC36B17ED278FA4B8464131B006C4333ED8216274B138FA14C26C08A95183B3459E27D2D69B1CE47BBC532BFB0CC5986168D933656EA65ACD60C260D5E760FF3AEB4EAF68ADEB6038D6A6B21759934651EA3B26952EB593AA4B6E777410A15066E70F46976D313AA46AB9E62EDAFBD276C6EA35454CD851CE8065159E33757E2E42669AECE154E7A0CC26E61B55E602E1214CD8636C284779C65943A0841EA8C251183DE696BC0912DEC9DE585E16DB13ECD568D6C9D5FD240237BFCE6028E35B2D16DE082A33E8B64472B9F6608FCD6BEA280FC327570A12875BC91B3C8509ABEBB48071043B51FAA1702F8B6FD98D868EDFB02AFDB0F2F94F230412F13C9C1FDE82219729E105E26AFD34E36C53E7AF981FC145E203FD97CCA427A956CF1EB0227DE434382BEAC1E62A775465DE7B90EEFA3EAA89CE3A8CA22BC2E922217A5E82C4EBD7BE4A424992E5EBDF061BDCA6FE6A4A3ED0EBBD7E1C72CDD652969320EEEFCD69596F4C85D55FFC946E0F9E463FE6A6F324413089B1EBD7DF763F873E6F96ECDF795E4D64780043DCB2FEF6CA57D99D2BB5B1F9E6B4A37516848A8145FED82F01913554588251FC32DA2CF02D9F346E0F71E3F20E7B9B9E31322A2EF88B6D84F2E3CF410A320296934E5C94F82613778FAF3FF0386EEFB69A34E0100 , N'6.1.3-40302')