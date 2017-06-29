﻿CREATE TABLE [dbo].[DepartmentWork] (
    [Id] [int] NOT NULL IDENTITY,
    [RegisterUserId] [int] NOT NULL,
    [RegisterEmployeeId] [int] NOT NULL,
    [RegisterDate] [datetime] NOT NULL,
    [CloseDate] [datetime] NOT NULL,
    [FromWhom] [nvarchar](150),
    [RegisterDescription] [nvarchar](max),
    [CloseUserId] [int] NOT NULL,
    [CloseEmployeeId] [int] NOT NULL,
    [CloseDescription] [nvarchar](max),
    CONSTRAINT [PK_dbo.DepartmentWork] PRIMARY KEY ([Id])
)
CREATE INDEX [IX_RegisterEmployeeId] ON [dbo].[DepartmentWork]([RegisterEmployeeId])
CREATE INDEX [IX_CloseEmployeeId] ON [dbo].[DepartmentWork]([CloseEmployeeId])
ALTER TABLE [dbo].[DepartmentWork] ADD CONSTRAINT [FK_dbo.DepartmentWork_dbo.Employee_CloseEmployeeId] FOREIGN KEY ([CloseEmployeeId]) REFERENCES [dbo].[Employee] ([Id])
ALTER TABLE [dbo].[DepartmentWork] ADD CONSTRAINT [FK_dbo.DepartmentWork_dbo.Employee_RegisterEmployeeId] FOREIGN KEY ([RegisterEmployeeId]) REFERENCES [dbo].[Employee] ([Id])
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201706210815172_DepartmentWork', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5D596F1C39927E5F60FF43A19E66071E9524AF1B1E439A815AC7B430D63196DDBD6F462A939212CEA3260FB785C5FEB27DD89FB47F61C83C9924834726F3285B0F365449321811FC180C1E41FEFFFFFEDFD15FBF85C1EA2B4A523F8E8ED7077BFBEB158ADCD8F3A3C7E3759E3DFCE9EDFAAF7FF9F77F3B3AF7C26FAB5FEB7CAF493E5C324A8FD74F59B67DB7D9A4EE130A9D742FF4DD244EE3876CCF8DC38DE3C59BC3FDFD3F6F0E0E36089358635AABD5D1873CCAFC10153FF0CFD33872D136CB9DE02AF6509056DF71CA5D417575ED8428DD3A2E3A5EDFC649E6047B65C6F5EA24F01DCCC41D0A1ED62B278AE2CCC9308BEF3EA5E82E4BE2E8F16E8B3F38C1C7E72DC2F91E9C204515EBEFDAECBA52EC1F1229366DC19A949BA7591C1A123C785DA965C316EFA5DC75A336ACB873ACE0EC99485D28EF787DE2BA284DE3C447586B6C7DEF4E8384E465D4BB5750C125F6A8D2AF56659E570D1C306AF6F0BF57ABD33CC8F2041D4728CF1292E336BF0F7CF7EFE8F963FC0545C7511E043497984F9CD6F9803FDD26F11625D9F307F450F17EE9AD579B6EB90D5BB02946952945BA8CB2D787EBD535AEDCB90F5003024AFCBB2C4ED0DF5084122743DEAD93652889080D54A891AB9DA9EB0C973A8BDD3CC4D9EB5AC9B78F18E3828AE5C42855134A6A39B4C99DA1AD936484C9A144EFB0DEF2D490C6B5F3D57F2CF4ADC3E27AF5010545EEF4C9DF963D7C4F98F37307DA17491C7E8803882C9DF9F347277944A4C562DD1277719EB8FD44FB4874A392AAC8A42110974F260B9F798818B8C99552E03C3A4230D9A432B07945221C6D5AB3A76B0C69C40D318B2D9D1703C91B486B96E73CDC06F1331A6C16CF50EA26FEB61C6C4B42D85FC05ECF7A75E57C7B8FA2C7EC09FB436FB09F73E17F435EFDA522FE29F2B193840B65493EBA45D7E9965398CBBACBE99BCBBA434F6467E8BEAC657128B60D6C0F55CAD4902AC637B11AC562A9F27212290B980A53F745A12875A25A10794E4E0C45765BE34289BF212302C9F73216707591FF2526F750CFE24E6133FBBA31123B09BA3CA3FACA36EDA48170824EDC434C9CE2E5AE52C62ADB67AE0B0B050472CB4601A8882D83D3C839C4E654445ECC8EA9D9D1F5F40CDD4C5C3A1B6EECE475FC23770A0DDCA2E4266A643C43AE1F3AC17A759BE0BFAAE5BDB7EBD59DEB10EECD3DE6DBC4775BEA715ECC660D695CA6276EE67F6DC8FC1CE35EE64493AF918C375F6F7AB1DEB4BD362A26B3F7BACCC893783B0655325CA86CF0600FAE6CC0412E1C21F1624C65FDCFE2FA640588A1146B7BC850D12B74F29820C43230866FD97BA14FE68081AB82E3F95DB62CA08958ACD5EC6529062DFCBDACF6C93C052711ADF4915DBE3CC149EEF355E1DC149E8F8AD82FC8F13852E6AE1E5439E58CBDDE1FC505BC7BC2F8E8C9D281264B3DBD2E8883097672ACAE74B1B6437B69CC74A54B6CD629C2544621FF4DBA8CE73693299FA4B3A8582CF308B9234932C68AF44146B75D323436B975D11783CBD58507C86BE9DCD6821179EFA45964670E2DAFE8C24F26AA09EB3989A3E7D077C7AF2A4E7DD2D286239964DF4C7D22E1B2D9D96ACF22A84BFDEC27D99369C1539CEF314E9E257AC47F5A19CA7E8B932FC6CB0716062C6BFB19AC7DD5DCFEB0B4C3D4D4A6E05D87E1015CD6FD41C8639D281E4DF9546EF5449065D02A6DCBADF1A855177D19B516EEA6F75E9AECE9341A839CED86927ED06FE5CC0BFD34ED87F2A6EC0BCC8583EA45909B0EA9D77948951A6BEFE02CDEE6E91753DEEE9CE8CA37F62EAE90779386C6AE451C9211C6913A17BA366114E742F784D248AE9EAE6BD9D76368FA36E03288D2F9D53C51A6BEB370059B6D3611938DF702B3D864B1EAD5B4F4DB6C22061BBB0E33D864B1B4005AC27EC0222821F062FAB9BA3EA0473FC5453EA52819BAAB51D3B27500B2A647ECF0E033EBA7419C222B94488FF8ED290E25C6DECE8CBC915FEB20E89B7D2B234CA1271B682808D98242D97A5A7AE8398B072D66470EC5CA2531329F9902A2654C3E9F644D5390D9D4EAB33D53470CBE0C28099B55250C977FD020519B3A52956C88B86A22934ED2ED35CAF6EA82E570F17C916072BF63FEF6688AAF56DAE5DA61E5100F2BFB3AC3CAEB83FB87D76FDFFCE478AF7FFA4FF4FACDF4438CC87A1DBE1D63FAAA3A55F9E6A7718F5512A3269EE8D2EDFDB9CAD6829D4FE5F02DC86205D284947D58D754970FED7A1CDAA8B31281FAF484EE50375D6FA8F91DB75E6DC4156E640F07BB28F7E2570BC20F71F1A15E8FC262DA595238F1BC04A5E9E8F5141A1941226D887F4C9C28DD62A0F6807953F605EAB301A898B0B56D38701637FA1A58DFC5AC464460314B94CE3924C24C5617B3DA1A4413043E55C2A29D69C0C9768B7B5BC12619D3F53B395370E77AF8743E4BCF3E731E3A7E60C1F3D7A8E5348E1EFC246C8FC7F65D22BF75D2143BBEDE2F4EFA647FB1811D1A919B2718CD7799136E47AFEDF6298ED0751EDE934E325D5DD69AE6E3EFF185E3E231EB3C22A506D37B1FBB5FE23C3B8F3C32987CCA5C7E6CD12460859DF28CC5050633F24EE3BCBDAEA39F0F494CDADC33EFD3C0F143E0BC79D7F87EAEB352DB0EC21CFCD683389BDD0D1CA60EE1360E9047C970EFC5BDF7F1A31FE969B7CE0AB35BE650325B65335E87C4C4F438AD72C28C1619947C96B9ACADC514A0B2BF1853905DFE6ACCD22722732DE514CD57069E8D3C9C1635FDEA04B9EDAA7AF586C208D8EF0D05D9E5F786824DFCF9ABEF11474A6389B2CE8CC96BE517AF7EAAFB1CC3D9D4DDA123E6D4954F6303A0EE7292A6B1EB17BD40767AB71354D715077BA12BE3CB6E4A59C1EB74B0FCB83FF86464C43C6315AC59ECDD44672840195A910386240CFBD4495DC7E3B58DE5F6FA33DC1C821532CCB2F947AE76DC351089DBF21D32D14B71D7F6A38CEF477EE4FA5B2730D52343487308244A69AA64537085282266CB54453ABC80D7E6F10C367C30ADA952E8D18642B436D08B10694388B36514E02E47DBA961CD313937A021AD4D0B65482D8620266496085FCA90F6C088689176C19016DD6A6538BC8C0F735EA7F3029E57DAAE429F0BF9D781101CFF2F067A79E9850A349A75999960AB1D6A30AC2161264633D47E86205E2480EBAB1EFA608BBBF7617C38B3D74688AB6CEEAFD8257033A2CD8C71A66D0DA17EDB5E033337E26F813B9034D0071455E01D009F26E2A13AE5801FDD371A8A768558D3825DD1AEBBE49B28EFE08020A77F21470BB8C9574CF4EFC79DC705D755E204F0D655950E2B0B582D5184EA4380D18DDB6FE1D26E514E8268DD8B92E7C1B39EFA2640B39E9A7418A18FE4CC8B6413F8F6C3ACCCC590DDF8A065E2F7F7F60E2CA3AC5F8BDA82563F602FC0360AAE1D805A5D760741DBE86D30AB46934B890B10A50FD65E6082259C004BB006742AA7A3BEE7761ED55092DF80D6DB82282AE80FA87E7A286E56D3E0B07BCD9A8EF432E30CDDCFA621B53DB30C3031ADEF4AEB55A7E6FA6AC979561944D72A80737CE91D0B94BFD7DEE162B08020BB9B61E2E15DC6CB14F37C899E77648017DC83A16E78FE1CA5354C71272F27B54B301F93A289D5EF4E4C3E041796A89B9BBFBDC41A92B85B4FFA7AA10391C4F231299258FDEE98AF28B8C341EDD7C82E74100D4FE575367D3C28C96D10532FFB0C74C3604926F5C9E0A6D36183BBE56409E8E5AEEED084157C8FC70818062F01D9451843C24C8F64A80D7538115DE0340B9E05177240A892DDCED102A97B47CC244BE1923B41048CB5377D8CB28C046B690284C29AD002A5F0628F8980280CC6865A5C1E99DDB63915C4AE6F3DA511DD134F8165BC4C8027999E77640A2C889E5737BC6C581E88A979A7C0301F93A26937A7C0E2005A70AEAA88A6A5A6C2EC7D0AD31C4D9687F1022367159739CE3964A9C6A698594B55A2C300788DD61C0055AFF92923A8B5412A5DB551C55F4FBB0AA8E066069C7D17E6B08A78D705011BFEBE3473C8C4DD03E6B00ACC9DC41C763536034CBB2AD93973585E74A0DBFECCAD074B8367F7BA85E9A7B95275CD80CD8E3E1606CDF3A24170990C9740090FCFB37B9288BE89EECBC37C5651FE691530CD428410BF43197F9E78BD3A6F62A745013BDC800D52A2A7BA329A743E7DEAE5997319DD32873EC5E6E4BC8C6893C980D3320245CA6A99454153AA50032DB6EE1247A54D52D068B7CB381A6D924A47ED6E1EAF9C364D5B2BE58AB74433650605BDEA6A1B8E4C778D52418435A83282ADD15510AD2E81E50855DF15A5A925088E0295A6A0525DBFCCB7173BC01928A8BE544AAAA16A0E6940B6BE4D494AB6F2C518B2944D5698B6EE03CC5439999D834338BBC3B7F615138D1A4003CC8D587D2E861057C3BB245DF599A996BB9D40AE54F96506909CE07506620945238936E939954723C0488DD072BAAED4821576FBAA15ACB49B768481EAE69F60976B591EBF0DCA0D4670033A157913FAC427052CF8F6BB99228571C4DA22B391C463A8950D1D16D701B99783940CC5A0CA75AC15B90A89AF8A5D3592DEB412B98A85D30273FD2A431F05DA350B97EC88AD1D304909AD39FE6B87394E605C556FE4F23A3509D5EB88AD19AC47090D4D8E4CC8CEA14B4D059A69CDA6AAE4FAB1AA14D1A3A9BC4E54314E1D3124514E9414D0AC58454AA01070923EC88A4915A28ED5814C8A5429E6166A06C5144139729DF0713B10FF9DC89D419AE884EA8CA304F1C39D02AF411989D21DC265B128B46184D680D4D4C63623A2B742657A11EFAA0272703BAA0374C26D9B8E8D94D6CEC9F4218E070064E0220206E8830B01D030D183CC87E8CD41992D519D6F07CC81E484BBB00F889642F5494F657B81970E95FA939FB096C9099EB1B6A245F050F5388A143D9CC7EB4E759AB72390E43C2F2543B5E42D518CE4F82D4547B08C3E5829E2077C78B5A8CF967604929E2EA5440297DAD5D4C61ED4446F06C9F4A2D1BB24A72307E864AA410D78FC4230B0699CF293EECC33E7FC2879AA6E2B1BDCE467F280EE540B635D4B528748EBB099543A198ECC75351392EAAD29B5864407A4A4123147A406698739CE0420A916C6BA962A8BAF5692E0908EC1319D412AEA1EA9B13474D5F7D737A73F9AB4A3CD9DFB8442A7FA70B4C1595CB4CD7227289F4BAB13AE9CEDD68F1ED3B664F56575B7755C2CC8E99FEED6AB6F6110A5C7EBA72CDBBEDB6CD28274BA17364F3BB871B871BC7873B8BFFFE7CDC1C1262C696CDC8EB6D9B32A4D4D599C388F8849C555634E2FFC24CDCE9CCCB977C8EDFDA75EC865139E7501B67FEB2AF9E32C7C53D6BBC17519F277BD38D479780EA6D2AAF3024B4886DF4258046C9970A571F93BD7099C44F01CCB691CE461049F77824B9307B1CE62372FDD019A4E37459FA2E09E419AACC635845AB4BB111F400DF2B010B89EBBCCC9F2B44BB6FEC65339DA300DCBE267C30188E9D52C264D112BF5367B6017A6678662199D91F00CC2A22F16E8F3CF343DD9B968197FA99BF8DB72C9A0CB1E95306D6F9B1FBFC026610FE48A289961564C611CB492FFBBE5CB2F4B6C2378BBBC473301C4CC5A0A2432776341143E453E33C8965FF429FC23770A55DCA2E42662B861D3F4A9DE26BECB10AB3EE9D3B84CC9A9F3AF0C99F6EB0F67D28A931F766C9A8894A151139318A7A350F54A1AAF374DEAA67680B4E42E77B886BAFB883B551F4A278F09429E985E9DB618E85A712107F98DD33B8BB74E227014DBAFFA94EA4BFD683AD0457F3095E123CCDD136E0F9E0CF5794C8B3E1374252B82BAC0854868C0162E3A0E68B129BFEE962FBFE85378EFA459C461A4FDAA4FA95891E149519F4D3A6396C4D173E8BB6C776CBF1B50A36E1FEB5093DC4A0653B33FAB24AB2B97EC14B0FA6646E5673FC99E7842D5677D5AA7B8D0639C30E35FFBD5C470947B9C5DB321DEF79CCD68484E13E81A0D888486D1808B2E75EEB233A3417BBA6380F30DD1D0F1BAE1B2E32DE15E04396F028A8F0618C9438E4CFDCD809B789BA74CE7AFBF19F8314E74E533E6B1FEA64FE50A793769D8A5527F33308C71481ADAE14C23F57D2CE338D5A2A4EDE1ADDFF03BFBD4A768061BD31F1121A3299098C03806A43E615447AAD394D83473AA1054756E26545327764E4CB74C31E8E6E4B41A4F8EFA6CE0172771F8DB53CC989EF66B0F39A17D03610643A9450DDF4930A40735B9F2665555EB404AE05317635CA07306BA36A513426E6E51E4C5E77636676A13FE9CC5F0F66922F2FBB7114C02DC501074DC1E96BABA8EB36356802B3A676BB3F2C282FEED242CAFD13840B9717A4E51194BA2F938E574EFC4F312943247209A8F8612091624DBCF8B41587BA2B43FCA401A1A4893941D699FC6521B13EF883A8ECB4E43252775619A4B99E0CC8445E848BDF6020673B54A8F650C1585713069B7DDCF43C70F5842C527431AA771F4E02721BB9BC7A699AC76A7E9EF71E2FDE2A4CCE26D37C5C0D222374F48EB654EB865AC6D37C980CBA73842D779784F6EE7E9304927F4A20768549CC36077E4F7F8C2713196CF23B2E5CD50E7530D764D62F74B9C67E791478CDAA78CD9A61024F7A02DE0994D33DD33BFC01045DE699CB3073C05C9064759B04DE087F5F6EB622CA9207EC18EB35F5E2E35CCDB07688C635AED4C160A96CBFB30BA33F0E6B321AD5F9D201711ABBE2F12486084451F2095D7890D03124003B637383BFEF6D5F758CBCE24991C222BCBFC1D31EBE49D84B1E03A3628BA7117D0FA317D21827A9198CEAD7BAA80849580CEADCE8BB25A86852229BEBA94E2A22783E00DAABD2D9F942BEC4C78C5CEC3EA32BDCE83E078FDE0042932109B8DBDE161C285E0B0591A90565F9ADF4D084E15FED289CB297442A26C0A5DA455280E1B0F536659AFEADE86BDBEE73443E11EC9B077F7CFE034F0C9D1AA26C39513F90F28CD3EC65F5074BC3EDC3F385CAF4E02DF49CB88A92AD2E71D7B51AC56E8CFC16B12FA83BC70C316370F202254D2D40B04E143A48FA9E2778EB0DD61D150A344764BF0D1862D782400657945A44F145B74E1BF21DCEED801F46E9D2C4349D49AE9F58AE08E38710DF63652F2DD009CB2220F7FCB7CE2601912139C9AA558E72E03BE8C3CF4ED78FDDF45E977ABCBFF622FCCBAF45EAD6E120CA377ABFDD5FF0C61A73B03EFCD144D66106B759C0FC58994023DB2E822147C796867B13AA011ADB51CBD4660C6425B7210039D1DA89283E8AB93B84F0EB9BDDDF9F61E458FD9D3F1FAE0CD3E4DBBB86C7BC9FDB70FC4F9309A9D057739A395B4E7E1FE080A1446B77CBF3A64FA8416D1327A46BB6174FA191B44530DBBC8F5432720CE13FE2B2DBCA083B7584BD857C5C987C69C57E13525F587207654A38CA0C19AA37725957BDF9CC6EE59153E8E6567BB04130BD35BF1F65C312A6EA637370D8D414CB561374237CCA427D791369A84B451F9DDF9706DDC4B6F9DD7212F66E8294B4178D1A95739BABCDE371F5DA8A019D9B8B56F3CC6985B6E6D50022FB1ED2A24CBC816A9D760AAFC36CCC5AE834EC5BCD8254CC7BF58A64C1DC635EBB16DC921BD76EC49A3160F55CC0DBCBCA24BA50AB81946A80DB7E936F51F42E7DB7F98DB99F258797FFF905910EDDB449F4DDA48DBD689636876D6D68D32868D38D400712E3BABFF266266580FAE2366ACCE4AEB009A61ACD50134C3A8D40134030D1D153CA38FF969ACDE98EB88BB322E4EEB1BF49874F101323B6B79D8181BDD9D0798527F04F31406CDE3BBC13803F7B0A8509C8194DA481CBB1EB53018C78227D709C6E90F0F2EFEC60C1B4CF141C0E023768CD5A46D34E01898294C86185B876F2D3988AA76234293BF8ACFAF5697E9A7C8FF678E133E62859286A31D93373FD9F20EE5312D7A7A075FCEE5B38AC355D4CDD4ED53FA5AC5BDA12CDAED04035BB896A2073765D101DC68B7AC2020666747DE26B4A6BF4D359DB6696DF6D6311876C952413743086B23050868D959B48CD42C4C8CCC40D7E6C79BBCE8AF58C8425A76CA1598BB91AB201AD91A47D795D0264A057DF49FC07743682CF8DF4C008D058A9D001ABBF4ACA8908F94E94F4B101A336CF1880D89197A00A21303D3DF1568A35F4C1DB8BAE48C4EBA2014656707EA6579F554688C95A580363666FC2933105BA2870C452889A0C4AD2C54447B86A8C61FC399E5D1B9238565DA73421B420F1517C19F2912BF14CCBDC92178AA997EA7AA14977D6E9ACE719507994FFC3BCC2016868B9BB989CE508032B4221B62E4FCDEA993BA8EC72B9C4491687007F1C472F247AE020C5F444EDAF80EF176D22C717C3E5CE936F123D7DF3A81542F4C294DFB4C846CE8B329983A8A48EF1788AC539DF6EB1B479BA62AA601540AEA44E26803913497290469ABCDBD275FA4FD38B02BE45D36E0EA33AC4B831A785470474037C4127F17403434B94B842419D54DCD9FAEB1191F81E5B96FA853948963E36E62CC41AF3E48E1B648A889235984ED5C67055ABA49FE11F12754E33261780B3FC031351A2B56D84895DD1C88FB758FEF62083641FF52C65FF1DC57C31B041CAE39E7BB0BF001679BF81A56BC80796FF346B119EEDAE78BA9266E3FFE8098933C0CB320C4C96EC79B166F6318B7FDBDBD03AE357B8276274D91110817607DEA23C0D4054750E335411C74E3B51F170F04C91B30F3C240F6D2C2D4CE8F1A062F3661543028EFF39A160F24E0D78E0FA2808131AC76D06B30841DF42AE134F3F23A666C0E3FA10D58EB3893EDD7EFC02AC81EAE5AA4ABD02202085D1FC730CC83854927134648987D02D1E20008EB1DC7659C0707533A8D66385890D74802FCBA21478B5EB6602213C5235699B4F3B645F9CE195FA3F2E9A739D0C5063BBE006C7701A6F39CDC2418A3A30D3F0BDEF1A09AB413984837683761127871017B227EDAC45120A678EBCC3ACC34DEEED20D359C085C4D9CD01C13282E48A920477DFD0E2650B2079C1639816A1131E9046A1E2C4C3906992161F66187096EFB2C7AEB849EF830B1709DE90F9B36F9005406A3402350953ACE2107E5C359A38E42D0A33206C1F173806DDAB59BFED0DD4133D407908B3346A2F77276C61895F14F9031AA52BF4763043D4CB470632478D17767B036D7CC6B66A4694FBE2604DA79F72D9F7A1D8B7D7787035AF584137F1471BD3A6FC2E74467EACB177C8ED7DE7D8C215046E1753270232258153DC593554AE753544F67D567A43C262B63A1CCA1A8BCCCA45F6D73105656739349517993CF40ECF244B854EE328B4AF03297A2666973ABDAD8A0615B878DABA54D12D5D1A62A6A68B771B81ADA24510D6DAAAA95DABD1DBE79DA3461BBB4C9DA0D522EC84A1AA5CC206F98328FA2CEEE9A2157633759285EBABD4659397AEA56D60E4B60856D16B8D23A8FBAE2F2F629BEB6EABBA88A2A4941985ABAE0885369A20AC007AE79F0B10E060F4136875C69662D554D9CA54D55E591575B2D2E98D45DF9C9D2BAAB3CF2BAABB9045B77F7713EED38F415554E363EC2A1735DEF52360697EF6AEB0CA9104D8812EF6F76D561A62A2E525AAE24796035240AED19B0E28886FB65A9846E3A23E5C0ABD9E3AA69081A07AA8E8B3C55684C1EA93A1407A0A269978DD3B4D00DB3AB96C6CD34D30E1017A5881F138B0978BA4B511914CA27D7985600E0D8DDAF9FE27BA84B197226509659981AB8C54889663EB24D6C9F14F1510225994454014BDF945CD0846869EAD1D4C904583152630F9105312B028955912D1D96D9C96CC13234519D5458616C86DC32E808BCEC16660310E4F2F2310A967AB5B192FA0C9AA273F6A26152791EDFA6B567575E4A13062EAA0C11BB6D0999D0D03E9E1DEB3DA1B8AD5191890B1D3BB662B2C617577A3458DA99554789ADF76C7AD58FE922C2B5BCC1CAE04EB2AAF5213FFCBA832A111CBC146841753C53B835472F7116CC7713240A80164A3B54DAC4C14A101E1014A8417D90D0A2E5E7D6568BC2F0B2E910B1653D407556CE12E8C7171738EC25B2FE1AC7C2E4FBE3B43567D33481DF5977E6905FA55A578AD407D03AC064CB13E8AF520B6AA8D7CBD54A109DD2191D1B9D7D010E1B55AA75A5549B4D6A9D080E938CAE129BE3447D676F738EA1493BDA94FB2CD507FC338B13E7115DC51E0AD2E2EBD1E6431E910BDACB5F6728F51F5B1247986684DCCEB98926CF65F410D7C737188EEA2CCCCDC65728733C27734E92CC7F70DC0C2793C50D3F7A5CAF8AFBAE496FBB47DE65749367DB3CC322A3F03EE85C144D8E81C8EA3FDA703C1FDD14EF4FA53644C06CFAE44EFB9BE8E7DC0FBC86EF0BC15DCA000972BEA4BA099DB465466E447F7C6E285DC79126A14A7DCDB1988F089B2A4C2CBD89EE1CF220A8396F187EEFD1A3E33EB737674344D40DD155FBD199EF3C264E985634DAF2F827C6B0177EFBCBBF00214C7A80396E0100 , N'6.1.3-40302')
