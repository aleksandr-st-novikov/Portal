﻿ALTER TABLE [dbo].[DepartmentWork] ADD [DepartmentId] [int] NOT NULL DEFAULT 0
ALTER TABLE [dbo].[DepartmentWork] ALTER COLUMN [RegisterUserId] [nvarchar](max) NULL
ALTER TABLE [dbo].[DepartmentWork] ALTER COLUMN [CloseUserId] [nvarchar](max) NULL
CREATE INDEX [IX_DepartmentId] ON [dbo].[DepartmentWork]([DepartmentId])
ALTER TABLE [dbo].[DepartmentWork] ADD CONSTRAINT [FK_dbo.DepartmentWork_dbo.Department_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]) ON DELETE CASCADE
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201706220729158_DepartmentWork1', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5D596F1C39927E5F60FF43A19E66071E9524AF1B1E439A815AC7B430D63196DDBD6F462A939212CEA3260FB785C5FEB27DD89FB47F61C83C9924834726F3285B0F36544932180C7E0C068F08FEFFFFFEDFD15FBF85C1EA2B4A523F8E8ED7077BFBEB158ADCD8F3A3C7E3759E3DFCE9EDFAAF7FF9F77F3B3AF7C26FAB5FEB7CAF493E5C324A8FD74F59B67DB7D9A4EE130A9D742FF4DD244EE3876CCF8DC38DE3C59BC3FDFD3F6F0E0E36089358635AABD5D1873CCAFC10153FF0CFD33872D136CB9DE02AF6509056DF71CA5D417575ED8428DD3A2E3A5EDFC649E6047B65C6F5EA24F01DCCC41D0A1ED62B278AE2CCC9308BEF3EA5E82E4BE2E8F16E8B3F38C1C7E72DC2F91E9C204515EBEFDAECBAADD83F24ADD8B4056B526E9E66716848F0E07525960D5BBC9770D78DD8B0E0CEB180B367D2EA4278C7EB13D745691A273EC25263EB7B771A24242F23DEBD820A2EB147957EB52AF3BC6AE08051B387FFBD5A9DE6419627E838427996901CB7F97DE0BB7F47CF1FE32F283A8EF220A0B9C47CE2B4CE07FCE93689B728C99E3FA0878AF74B6FBDDA74CB6DD8824D31AA4CD9A4CB287B7DB85E5DE3CA9DFB003520A09A7F97C509FA1B8A50E264C8BB75B20C2511A1810A3172B533759DE15267B19B87387B5D2BF9F611635C50B19C18256A4249DD0E6D726768EB2419617228D13B2CB73C35A471ED7CF51F0B79EBB0B85E7D4041913B7DF2B7E508DF13E6FCDC81F64512871FE200224B67FEFCD1491E11E9B158B7C45D9C276EBFA67D24B251B5AAC8A4D1202E9FAC2D7CE621CDC05DAE6C05CEA3D308269BB40D6C5E51138E36ADDAD3558634E286A8C596CE8B82E415A435CD731E6E83F8190D568B672875137F5B4EB625216C2F60AB67BDBA72BEBD47D163F684EDA137D8CEB9F0BF21AFFE5211FF14F9D848C285B2241F5DA3EB0CCB29D4653DE4F4D5653DA027D233F458D6D23814DB06BA872A65AA4815F39B588CE266A9F2722D5216306D4C3D16854DA913D50D91E7E49AA1C86E6B5E28F137644620F95EE602AE2EF2BF44E51EEA69DC2974665F3346A227419367545BD9A69E34689C6010F768264EF17257D9C62ADB676E080B1B08E496CD0250115B0AA769E7109D531179513BA66A47D7D233343371E96CB8B293D7F18FDC2924708B929BA869E31972FDD009D6ABDB04FF556DEFBD5DAFEE5C87706F6E31DF26BEDB528FF362356B48E3323D7133FF6B43E6E7188F32279A7C8F64BCF57A338AF596EDB5523159BDD765465EC4DB51A892E942A583075B7065070E32E1088917652A1B7F16F7272B400CA558EB43868A5EA193C704219681316CCBDE1B7D32030CDC151CCFEEB2A5014D9AC56ACD5E9A62D0C6DFCB6E9FCC527012D14E1F39E5CB139CE43E5F15C64D61F9A888FD821C8F23656EEA419553C6D8EBFD514CC0BB278C8F9E2C1D68B2D4D3EA823898E024C7EA4E17AB3BB4B7C64C77BAC46A9D224C6514F2DFA4CB786E3399F249068B8AC5328F903B922463AC481FA474DB2D4363955B177D51B85C5D7882BC96AE6D2D2891F74E9A4576D6D0F28A2EFC64A29AB09C93387A0E7D77FCAAE2D4273D6D389349CECDD437122E9B93ADF62E82BAD4CF7E923D99163CC5F91EE3E4592247FCA795A9ECB738F962BC7D6061C2B2769EC1EA57CDE30F4B274C4D6D0ADE75181EC0653D1E843CD689E2D9944FE5764F045906EDD2B6DC1ACF5A75D197596BE1667AEFADC99E46A331C8D961281907FD76CEBCD04FD37E286FCABEC05C38A95E04B9E9947A9D8754A9B1CE0ECEE26D9E7E31E5EDCE89AE7C63EBE20A793769686C5AC42199611CA971A1AB1346312E746F288D64EAE99A967D2D86666C032683289DDFCD1365EABB0A57B0D9661331D9582F308B4D16AB564D4BBFCD2662B0D1EB30834D164B1BA025EC076C8212022FAA9FABEB037AF4535CE4538A92B6DED116477575B6EE48D6F488AA1E7CADFD3488536485121934BF3DC5A1449E7616ED4DFBB5EE8ABED9B7320915729A0830455DB6D05276B096A8EC703FE05231A8C13B1251ECA412A5F7992920DA56E5F349F65805992DEF003075A9B6DC994C2AD6074CEFACFAD2E19E2F03B681CDAA6A09977FD0645B4F19A42AD9547BD578789DA4DB6B94EDD505CB69F7F922C1E47EC7FCEDD1145FADB4CBB5D3F3219E9EF775A6E7D707F70FAFDFBEF9C9F15EFFF49FE8F59BE9A76A918A3F7C3BC63680EA76EA9B9FC6BD9E4A34BF78C380EEEFCF55B616EC7C2A876F41162B9026A4ECC3BAA6BA7C68D793F5469D9534A8CF4850DA03238D869ADF71EBD5465C618EF758A814E55ED62702374E5C7CA8DDA7D09876B6664E3C2F41693A7A3D854446689136C43F264E946E31507BC0BC29FB02F5D90054AC6ADB3E1CB8D41D7D2FB1EF22A26922B07E10A57306893093D54DC1B606D102814F95B068671970B2DDE2D156B049E674FD41CE14DCB9113E9DCDD273CC9C878E1F58B0FC356A398DA3073F09DB6BC67D8F1A6E9D34C586AFF78B933E8DBEDD7287DC3CC168BECB9C703B7A6DB74F7184AEF3F09E0C92E9EAB2D6351F7F8F2F1C17CF59E711293598DEFBD8FD12E7D979E491C9E453E6F2738B26012BEC9477552E309891771AE76DD8937E3624516973AFBC4F03C70F817BFB5DE5FBB9CE4A1DDF0873F04738E26C760FC2983A84C761401E25C3BD3725DFC78F7EA427DD3A2BCC6E9943C96C95CD781F1213D3E3B4CA09335A6450F259E6B2B6175380CAFE664C4176F9BB314B5F88CCB59553745FE9C037FAA912AEE95727C86D57D56B34144AC0FE6828C82E7F34146CE2CF5F7D8F18521A5B9475664C5E2BBF78F7533DE618CEA61E0E9D664E5DF9343A001A2E27691ABB7E310A64B7A03BCE89DDE6602B74651C34A86C2B189608B71F8F079FCC8C98672C82358BBD9BE80C0528432B725193B8B39F3AA9EB78BCB471BBBDFE0C379789850CB36CFE91AB1D0F0D44FCDF7C872CF4523CB4FD28E3C7911FB9FED6094CE5C810D29C0289509A2AD9145C218A88DA3215910E2F60F8419EC1860FA63755023DDA5088D6067AE16A6E0871B68C02DCE56C3B35AC3926E7063424B569A10C89C510C484CC12E14B29D21E18116DD22E18D2A2E86086D3CBF830E7653A2FE079A1ED2AF4B9D0093A1082E32888815E060F518146B32E33156C75400D8635D49889D10CF59F21881709E03A64461F6C71F133C687331B7E435C65DDA89D0237D3B49931CEF4AD21D46FDB703A7323FE168825A5813EA0A802EF00F834110FD52907FCE8B6D150B42B9A352DD815FDBA4BB6893296090439FDC0262DE026DF31D18F333C8F09AE2BC409E0AD2B2A1D5616B05BA2087900014637FE410B97F688721244EB069C9E07CF7AE29B00CD7A62D26184BE92332F924DE0DB0FB33213431639434BC5EFEFED1D584659BF1EB505AD7EC05E806E14846F807A5D16CBA1EDF4D62958A3CBA5C40588D2076B2F30C12D9C004BB004742AA7BDE7E7361ED550924792EBAD411415F407543F391411EA3438EC86ABD369BD4C394371EE345A6D4F2D034C4C6BBBD272D5A9B90ED139CF2E83283C05B8C697C6AAA0ECBD36168EC106822CC6C5C4D3BB8C9729D6F91239EFC8042F8827A2EE78FE1EA5354C71372F27D54B301F93A28995EF4E2C3E04815FD4DDCD4781B186242E7A4C5F2B742092583E2645122BDF1DB31505B127D4768D2C1085687A2AC302F5B1A024512CA6DEF6196886C12D99D42683BB4E870D2ECECB12D06BB43F0E46211901B77DADB7C5C17616D34FD9673B62FFA902CD6882098E3A330272C19035BBA874A1C64C8F61A80F753811C5649B05CF82F03110AA64B1645A2075231A4D72702389602360AC8D4B33CAA6272CA509100A4B420B94C23034130151183A00EA71791C81B6CFA9900BFADA531A7F60E20D1B192F13E04926E71D99B005B11ED41D2F9B9607626ADE0D1B988F49D1B49B1B3662776F706745E1FB4D6DDCB0D13FA6B9482F773A0766CECA8B789C5BF352894DB10F2415890E0360D0B73900AADEA156FAFB6B8354BAC7A88A1630ED9EB5829B1970F65DA8C32A3E832E08D8600D4B53874C9408401D566EE493A8C3AEC466806957243BA70ECBB01CBAFDCFC4E8581A3CBBC141A65FE64AC53503363BF2581834CF8B0EC165325C02253C3CCFEE4922FA268AEE88F9AC6252A4957B3F0B1142FC0E65FCEDF7F5EABCF1F417B99771133648895EEACA68D2F9F4A9971E1232BA650E7D8A8D9F878C6893C980D3D25F4ACA6A994541532A500329B6E61247A54D52D0680F77391A6D924A46EDD9332F9C364D5B2AE58EB74432650605BD2A101347A6BB47A920C22A5419C156E92A8856218B3942D57745696A0B82A340A529A854C1C2F9FE6227380301D521D0A412AAD6900664EBD85F52B2952DC690A574B242B5759F5DA7CAC9F41CEC70DC9DBEB503A234620015303763F5096322AE863749BAE233132D174B432E5479E80DA89D60F00D710B45338936E939854723C0488CD076BA6EAB053BECF6452BD869371D0803C5CD450F5048591E6D006C37186F0090A9C89AD0273E296021F77543410ABDDEB59BCCFABD8F2156D6D15D5C07645E0E1232E4312D97B1969F35D47C95A7B551EB4D2B918B58B82C3097AFD25157205D6519B8D9BA9EA974A335E77F5D4FD32994ABEA656C5EA6268EA59D666BBA96528D8616472664E790A5A600CDA466535472F958158AE8A9645E262A8FBC4E33243E79542BA055B18A944020E0227D9016930A44ED5906A914A950CC35D40C82295CC8E432E1BDCC20FE3B7E668324D1712C1B4708E2E77A055683D26FAA3B85CB3CA768C508ED01A9A98DAD46442F04CBE4223E5505DAC19DA80E9009776C3A36525A3D279387D87B056803E7BF32401E9CC38A868A1EA43E442F7BCA7489CA1B035007127F0CE118106D85EA939E4AF772AF8A2A2567684C43BE00566436A13E52DD30570B4E7E295DD64CF05ABA152182F7D0C7C19EE8654C5E76AA0BD09D0649AE40536DA84E09248291DC58A6E8084E1E060B45FC42172F16F575DC4E83A41772A92681A7136A6A638F3BD1A36032B9688C2EC985D2013299CA0E005EB711D8021A1723A5971998AB91547BAA612BB307E4D71881E15437C6BA94A436A4D6FD3C69EB64383297D54C48AA4FF3D41212DD2993B688B95536483ACC0D3000497563AC4BA9D2F86A2109EE3519DC6C1A24A2EE2D244B5357FD40457361A6493BDADCB94F2874AA0F471B9CC545DB2C7782F23DC43AE1CAD96EFDE8316D4B565F56775BC7C50D39FDD3DD7AF52D0CA2F478FD9465DB779B4D5A904EF7C2E6ED16370E378E176F0EF7F7FFBC3938D884258D8DDB91367BBDA7A9298B13E71131A9B86ACCE9859FA4D9999339F70E799EE3D40BB96CC2EB41C089795D257F0388EFCAFA00BD2E43FEAEF7D33A2F4BC2545A715EE01692E9B7682C024E99B8D2B8FC9DEB044E22786FE9340EF23082AF88C1A5C98B7767B19B97E6004DA79BA24F5110489426AB1167548B76D74906A841EE4903D7739739599E76C9D6DF782A471BA66359FC6C380031A39AC5A42962A5D6660FECC2F4CC502CA333129E4158F4C5027D659CA627BB4A2EE32F75137F5BEEB274D9A312A61D6DF3E3173857ED815C112533CC8A298C8356F27FB77CF965897D04DF30E8D14D0031B39E0289CCDD5910854F91CF4CB2E5177D0AFFC89D4214B728B989186ED8347DAAB789EF32C4AA4FFA342E537251FF2B43A6FDFAC3A9B4E2B28C1D9D262265A8D4C424C6192854BD92CEEB4D937A8A01202D79AC01AEA11E3EE241D587D2C963829027A657A72D06BA564CC84176E3F4C6E2AD93080CC5F6AB3EA53A6A274D078AE40953193EC3DC3DE1FEE0C9509FC7D4E8334157B223A80B5C8884066CE1A2E38016ABF2EB6EF9F28B3E85F74E9A451C46DAAFFA948A1D199E14F5D9643066491C3D87BECB0EC7F6BB01352ABC60879A24EC204CCDFEAA92ECAE5CB24BC0EA9B19959FFD247BE209559FF5699DE2428F71C2CC7FED5713C5519E7176D586F8DC7336A521B980A1AB3420121A4A032EBAD4B5CBCECC06ED859801C6374443C7EA86CB8EB7857B11E4BC0A283E1A60240F3932F537036EE26D9E3283BFFE6660C738D195CFA8C7FA9B3E952BE4DDA461974AFDCD4031C621E96887538DD4F7B194E3549B92B6A7B77ED3EFEC4B9FA21B6C2C7F44848C96406202E32890FA8651EDDC4F5362D3CCA94250D509E6A8A64EF49C986E996230CCC9053F9E1CF5D9C02E4EE2F0B7A798513DEDD71EED84CE0D84190C5B2DEAF84E82213DA8CB95A19355BD0309814F9D42F9CDA4AEA09B0BBA5AAAE3C76FAEA3E4C5E7365F67EA13FEE6C6F0FE69C222F4EF23980478442150053D747F1513B5A3A88038A9B3F5591935A27F3F09CB6B740E506E9C915354C692683E4EB9803CF1BC04A5CCA58AE6A3618B045B9CEDE7C520ACBDA3DA1F65200D0DA449CA8E74F263A98F89BD455DF06517B692BBBF30CDA52C9966C22274495F7B4B84896FD363634445611C4CDAEDF7F3D0F1039650F1C990C6691C3DF849C89E0FB26926FBE769FA7B9C78BF3829B31DDC4D31D0B4C8CD13D27B99136E196DDB4D32E0F2298ED0751EDE9310491D26E9845EF400898A73189CB7FC1E5F382EC6F279440ED119EA7CAAC1394CEC7E89F3EC3CF28852FB9431071F82E41EB4053CB369A6A7F01718A2C83B8D73F6CAA820D9E0720CD609FCB4DE7E5D8C26157844D831F6CB085FC3AC7D80C638AAD5CE62A160B90C4AD25DD3379F0D69FDEA04B98858F57D9140027D36FA00A98CE9360C48000D58DFE0ECF8DB57DF63353B9364722DAD2CF377C4ECBC7712C682EBD8A0E87A72403BD274540AF5B6339D5BF79E027154018D5B9D47A8B5140B45521C3F96E2A227836018DBDE9A4FCA153626BCE22C6375995EE74170BC7E70821419349BF5E6E161C239F5B0591A90565F9ADF8D534FE550D3F1F4296442FC760A59A495730FEB61536659AFEAD186ADBEE73443E11EC9B077F7CFE034F0C965AD26C39513F90F28CD3EC65F5074BC3EDC3F385CAF4E02DF494B1FACCA77E81D1BAD57CB99E8E0357126425EB8618B9BBB24112A69EA0502872432C6541E414758EFB068A851220BD57CB4610B1E094059C6E9F489608B21FC3784FB1D1B80DEAD936528895A35BD5E11DC1123AEC1DE464ABEEBD25356E4E16F994F0C2C4362827BB814EB5C44E6CBC843DF8ED7FF5D947EB7BAFC2F366AD9A5F76A75936018BD5BEDAFFE67083BDD15786FA668328358AB3D87284EA414E8994517A1E0F34F3B8BD5019D68ADE7E83D023316DA928318E89C69951C445F9DC47D7248087DE7DB7B143D664FC7EB8337FB34ED22E2F992C76F1F88F38E393B0BEE72452BE9CFC3FD110428F497F97E65C88C092DA2A53F8E76C7E88C33D62DA79A7691EB874E408C27FC575A5841076FB194B0AD8A930F8D39AF1C764AEA0F41ECA8661941873597F94A2AF7BE398DDDD32ABC67CCCE0E09C6BBA6B7E0ED996294274E6F6E1A1A83986A1D79846698C948AE7D77340969A3F2BBB3E15A4F9ADE32AF9D68CCD0539682F0A253AF727679BD6F3EBB506E38B2796BDF788E31D7DCDAA0049EC3DB554896BE3252ABC154F8ADE38C5D039DF2A2B14B98F6A8B14C99BADE6B3662DB924346EDD88B462D1E2A2F1E787B45974AE5C2338C50EBC0D3EDEA3F84CEB7FF30D733E545F5FEF621B321DAB78B3E9BF491B6AE137BE5ECACAE1B650E1B71AA013C677656FE8D0FCEB0115CFBE0585D95D62E39C358AB5D728651A95D72062A3ACA1D471FF3D368BD31F71177655E9CD636E8B1E8E25D6E7656F3B05E3B16A67E91BB8E5937F214062DE8BB7E3E030FB3282F9F81945A271FBBA6B5D0CFC742BF76FC7C6CD1EB0F12A6F82084F05E4116DA37C3B994B62E835D73A6D06462A41FBEB564B7AAE44B1A4DFE2A3EBF5A5DA69F22FF9F394EF8887B95C898B697DEFC645BE662571B3DB983AF2AF359C55E34EA6E128F702DD49645BB781DD8C3752B7A7053161DC08D76CF0AFC7476D620683C7E74EF200C5F4D6A9D41D7AE2176C952BE4043086B2305F0B3D959B48CD42D8CEBCE4043EBC75B53E96FA4C83C6D76CA1498BB932BDF1ED9D64BD794D0264AF9A2F4DF57E87AF658B06E19BF1E0B143B7E3D76E9591121EFC0D39F96C06367D89E16EBA933F45E46C735A7BF29D03AE5981A7075C9198D748187CCCE4ED4CBB2EA298F1D2B1B09ADCB8E31B95EC810B8BCE82143E1E12228712BF360D15E21AAF1C770667976EEB4C232ED39A10DA18772D7E0AF3A895F91E61E1F113CE34D3FC85536977D8A9CCE719507994FEC3BCC206E0CE7CE73139DA100656845CEE9C8B5C25327751D8F1738716ED1E00EE289E5E48F5C0518BE885C00F21D62EDA459E2F8BC17D56DE247AEBF7502A95C98529AFA9934B2A1CFA660EA2822A35FD0649DEAB49F1939DA3455311DA01250C741481B88A4BB4C21486B6DB6A3CBB41F0776457B970DB8FA6AEDD2A006DE60DC11D00DD1C4DF05100D55EE122149667553F5A7AB6CC64760791D1D1A1465E2D8B89B1873D0F31652B82D126A62071B613FD759819E6E927F44FC09C5B84C18DEC22F8D4C8DC68A15D681663727E27EC3E3BB98824DD0BF94F957BCF6D5B00601836BCEF5EE026CC0D916BE86152F60DDDB3CC66C86BBF69D66AA8BDB8F3F20E6242FE02C0871B2A07DD3E26D0CE5B6BFB777C0F5664FD0EEA42A3202E102B44F7D33998ABB04755EE35B42775EFB71F140903C76332F0C644F4A4C6DFCA861F0A21346058332CCD8B478207EC8766C10050C8C61B583568321ECA0E717A75997D7AE6C73D809AD1F5DC7986CBF7E075A41F642D7224D8516118047FD388A611E2C4CBA983042C2EC0B88160780B7F13826E33C3898D26834C3C182AC46E277D8F57B5AF4B605E330299EB1CAA49DD72DCA07DDF81A956F5CCD81AE1DDA899D1B5ED39A313D00B6005B864117EBD8FBA2BE24F85AB8FAD2799571128CD1BEAC9F058FD7505DDA717BA53BB49B3009BC387750113F6DE22810533CF0671D661A0FD6E93AB24E04AEC60B6D8EE539E7025790A3BE7E07F39AECD5B2454E692D22265D9ECF838529E7203324CC3EED30AE939F450FFCD0CB6AC6D3B2B3B866D3269F804A57276806AA52C7B942A37C2D6ED459087A49C920F4C21C609B7667B03F7477500DF501E4E29491E891A89D5146A5771DA48CAAD4EF511941AF712D5C19099EB1DE19ACCDB5F29A1969DA8BAF098176DE7DC0AADE25651F9BE28056BD5BC65F745DAFCE1BE74C91C746F96CD5F1DABB8F31044A1FCF4E066E4604ABA29778B24AE97C8AEAE9ACFA8C9497B0652C943914959799F4AB6DAE59CB6A6E32292A6FF21934BBF43790B6BBCCA26A78994B51B3B4BB557D6CD0B1ADC1C6D5D22689EA68531535B487845C0D6D92A8863655D54BEDC921DF3D6D9AB05FDA64ED0E293764259D526690774C9947516777CF90ABB19B2C6C5EBABD4659397BEA56D64E4B60856D16B8D23A8FBAE232B6195F5BF55D544595A4204C6D5D70C4A9345105E0ABEE3CF858038387209B432E34B39EAA16CED2AEAAF2C8ABAD36174CEAAEEC6469DD551E79DDD55A82ADBBFB22A576948315554E363FC28E995DEB523607978FC9EB4CA9104D88126F6F76C561262ACE0F5F2E24B9DB3ED414DA32609B239AEE972512BAEB8C8403EF668F2BA621681C283ACEAF592131B91FF4501C8082A64D364ED24233CCAE581A33D34C3A80D79DC23B51DC4CC0D25D8AC8204751B9C4B4DC4BC71E7EFD04DF435C4A874681B0CC9C20C12346AA69E633DBC4FA49E17D27109289BF1EB0F54DB50B5A102D4D3C9A3299002B4662ECD164814794A0C52ABFA90ECBEC62B660195AA84EDA58A1E78F5C33E83478D93DCCBAB7C8DBCB7BC0581AD5C642EA33698ABC3844D3A4D2DBC3A6B667775E4A15066EAA0C6976DB13B24643E77876B4F784CD6D958AACB9D0A5762B2A6BFCE64A2F9E4B07B3EAA2BAF5914DEFFA314344B897375818BA069EF452B5C5B13EA328B84BBD6A81C8EF01EF203A047750055250DD54159E52D2BBBD05F3DD048900A03DE30E953671B010847725056250DFA9B43830B86DE6A230BC833CA4D9B211A0BA366809F4E33717B8F7269A08356EC8C9AF0AD0131B9BA609FCCE163C87FC2AD5BA50A4E690D65D2E5B46517F915A10437D74A01682E8C2D2E8D8E81C9170D8A852AD0BA53A7753CB4470AF667491D89C27EAE0D8CD958E26ED68531E39551FF0CF2C4E9C4774157B28488BAF479B0F79445E42287F9DA1D47F6C491C619A11723B57489A3C97D1435CDF646138AAB33021C4AF50E6784EE69C2499FFE0B8194E26FB3C7EF4B85E1581E5C968BB47DE65749367DB3CC34D46E17DD089C84E6EC4C8EA3FDA703C1FDD14AFCDA5369A80D9F4C9E31137D1CFB91F780DDF1782A0E5000972D5A67A7280F465469E1E787C6E285DC79126A14A7CCD0DA18F08AB2A4C2CBD89EE1CF220B0396F187EEFD1A3E33EB721EA2122EA8EE88AFDE8CC771E13274C2B1A6D79FC1363D80BBFFDE55FC61D0F1EB4770100 , N'6.1.3-40302')

