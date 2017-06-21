CREATE TABLE [dbo].[Store] (
    [Id] [int] NOT NULL IDENTITY,
    [StoreId] [int] NOT NULL,
    [Name] [nvarchar](300),
    [Address] [nvarchar](300),
    [StoreName] [nvarchar](300),
    CONSTRAINT [PK_dbo.Store] PRIMARY KEY ([Id])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201706210526314_Store', N'Portal.Models.ApplicationDbContext',  0x1F8B0800000000000400ED5D596F1C39927E5F60FF43A19E76171E95248F1B1E439A815AC7B430B6AC71D93DFB66A4322929E13C6AF2704B58EC2FDB87FD49FB1796CC8B4C92C123EF72EBC1862A490683C18FC1201941FEDFFFFCEFC95F9EC260F51D25A91F47A7EBA383C3F50A456EECF9D1C3E93ACFEEFFF076FD973FFFEBBF9C5C7AE1D3EAD73ADF6B920F978CD2D3F56396EDDE6D36A9FB8842273D087D3789D3F83E3B70E370E378F1E6F8F0F04F9BA3A30DC224D698D66A75F2298F323F44C50FFCF33C8E5CB4CB7227F8107B2848ABEF38655B505DDD38214A778E8B4ED7B7719239C1419971BD3A0B7C0733B145C1FD7AE544519C391966F1DD97146DB3248E1EB63BFCC1093E3FEF10CE77EF0429AA587F47B39BB6E2F098B462430BD6A4DC3CCDE2D092E0D1EB4A2C1BBE7827E1AE1BB161C15D620167CFA4D585F04ED767AE8BD2344E7C84A5C6D7F7EE3C48485E4EBC0705155CE28029FD6A55E679D5C001A3E600FF7BB53ACF832C4FD06984F22C21396EF3BBC077FF869E3FC7DF50741AE541C07289F9C469AD0FF8D36D12EF50923D7F42F715EFD7DE7AB56997DBF0059B624C99B249D751F6FA78BDBAC1953B77016A40C0347F9BC509FA2B8A50E264C8BB75B20C2511A1810A310AB573755DE05217B19B87387B5D2BF9F619635C52B19A18236A4249DF0E63721768E7241961B22FD12D965B9E5AD2B871BEFB0F85BC4D585CAF3EA1A0C89D3EFABB72841F48737E6D41FB2A89C34F71009165337FFDEC240F88F4586C5A621BE789DBAD699F896C74AD2A32193448C8A76A8B98B94F3370976B5B81F3983482CBA66C039F57D684930D557BA6CA90455C1FB548E9BC284851410EA6792EC35D103FA3DE6AF102A56EE2EFCAC9B62484ED056CF5AC571F9CA7F7287AC81EB13DF406DB3957FE13F2EA2F15F12F918F8D245C284BF2D135BAC9B09C425DD643CE5C5DD6037A223DC38E65238DC3B06DA17B9852B68A5433BFC9C5286F962EAFD0226D01DBC6D46351DA943A51DF10754EA1199AEC43CD0B25FEFACC0824DFCB5C20D445FE57A8DC63338D3B85CEEC6AC628F42468F28C6A2B0FA9272D1A2719C41D9A8953BCDCD5B6B1CAF65518C2D20602B955B30054642885D3B4B38FCEA988BCA81D5BB5636AE9599A99B874D65FD9A9EBF87BEE1412B845C9C7A869E30572FDD009D6ABDB04FF556DEFBD5DAFB6AE43B8B7B7986F13DFA5D4E3BC58CD5AD2B84ECFDCCCFFDE90F939C6A3CC8926DF23196FBDDE8C62B3657BAD546C56EF75999117F1C32854C574A1D3C1BD2DB8B2037B997084C48B32558DBF01F7272B40F4A558EB438E8A59A1B38704219E81316CCBCE1B7D2A030CDC151CCFEE1A4A03DA348BD79A9D3445AF8DBF97DD3E95A5E024B29D3E72CA972738C97DFE50183785E5A323F60B723C8194BDA90755CE1863AF0F473101B78F181F1D593A3264A9A3D5057130C149CEA03B5DBCEE30DE1AB3DDE992AB7586309351CA7F93AEE29966B2E5930C161D8B651E29772449C55891DE4BE9D22D436B955B177D51B8425D7882BC51AE6D075022EF9D348B865943AB2BBAF293896AC2724EE2E839F4DDF1AB8A539FF4B4E54CA63837D37B245C37275BD417415FEA673FC91E6D0B9EE37C0F71F2AC9023FE7390A9EC1F71F2CD7AFB6080096BB0F30C5EBF1A1E7F0C74C2D4D4A6E1DD84E11E5CD6E341CA639D289F4DC55461F74492A5D72E2DE5D67AD6AA8BBECC5A0B37D33B6F4D76341AAD41CE0F43C538E8B673E6857E9A76437953F605E6D249F52AC86DA7D49B3C644A8D75767011EFF2F49B2D6F5B27FAE05B5B171F90F7310DAD4D8B3824338CA3342E4C75C228C685A987D248A69EA969D9D56268C6366032C8D2C5DD3C59A6AEAB700D9B349B8CC9C67A81596CB20C6AD550FA349B8CC146AFC30C36597A29FC5A8111EA2A9DFFA1713A3F4B7737283BA80B96FAFFF92AC1E47EC323E780A5F86A655C8E4E16C778B23834992C5E1FDDDDBF7EFBE627C77BFDD31FD1EB37D34F1CB2A5E2F1DB312C139DC3CC9B9FC6F598F992E2DE91429AEDEFAF55360A69315580B424CB209026A48687754D75F9D0269C8AF09666250DEA3212EA2AA61E0D35BFE3D66B8CB8C238EC603117E55EAC654964092EDEF70458A33187B116CF3C2F41693A7A3D854446689131C43F274E94EE30503BC0BC29FB02F5D90054ACB4681FF60C4F1B7D79D3759DD2341158A7C8D20583449A69D0750AAD41B64E1153152C2AD729E6FB3EBB1D1E6D059B644E371FE45CC1BD1BE1D3D92C1DC7CC65E8F8C10096BF412DE77174EF2721F57CEABAFB71EBA429367CBD5F9CF451C1FA30A7415BE4E60946F33673C2DDE8B5DD3EC611BAC9C33B3248A6AB6BB0AEF9FC5B7CE5B878CEBA8C48A9DEF4DEC7EEB738CF2E238F4C265F32579C5B0C090CC24E797C7685C18CBCF338A791D8DD6C48A2D2E65E799F078E1F02AE846DE5FBB5CECAEC28497388BB4AF26CC3EECD71754877E8803C5A863BEFD6BD8F1FFCC84CBA755698DD328796D92A9B2DAB849819A7554E98D1228396CF32D7607B3105A886DF8C29C82E7F3766E90B91B9B6728AEE2B630A469E4E8B9A7E75827CE8AA3A8D8642090C3F1A0AB2CB1F0D059BF8F377DF238694C116659D199337CA2FDFFDD48F398EB3A98743AB9953573E8D0E8086CB599AC6AE5F8C029563562B5EA2DD1C6C85AEACEF3128DB0ADE9480DB8FC7834F6646CC3316C19AC7DEC7E8020528432BE23B4222ECCE9DD4753C51DAB8DD5E77861BFF2629C33C9BFF21D48E8706222EF9BE43167A291EDA7E9489E3C88F5C7FE704B672E408194E8144284D957C0AAE1045446DD98AC88417F0462491C1860FAE3775023DD9308836067A11FD660971BE8C06DCE56C3B35AC0526E7063424B569A10C89C512C47504ECD2E0CB28D20E18916DD22E18D2B20B4B2CA797F1612ECA745EC08B42DB57E80BD19C261082433BE5402FE39975A031ACCB4E050F3AA07AC31A6ACCC46886FACF12C48B04701DC5DB055B4248EFF870E62382E55536A1C9FB046EAE6933639CEB5B4BA83311FE7323FE16B8DEC2007D40510DDE01F019221EAA530DF8D16DA3BE68D7346B5AB06BFA759F6C136D78350439F3586B0AB8C9774CCCAF3E9CC7043715E204F0361595092B0BD82DD144614280310DC9A470A147949320DAF40ECC79F06C26BE09D06C2626134658979C79916C03DF6E98559918AA605E23157F7870703430CABAF5E850D0EA06EC05E846494429D4EBAAF052DAE9344EC9A0CB95C4258832076B2730C12D9C004BB0044C2A6703FAE6361EF550525F6ED35983682AE80EA86E72282ECD31E0B07D838E49EB55CA19BA7AC7A0D5C3A9658089696D5756AE2635D7B786CDB3CB208B9805D7F8CAF059C6DEA3E1F9161B08AAB0DB89A777152F53ACF31572DE93095E12E2ACEF78D18F72304C099E9793EA25988F49D1C4CB772F161F9258747D778B81E98321490868EF6A85F64412CFC7A448E2E5BB17B6A224041CEA6E553C38EDEEF6AD04936CBE28A2D0258CD1D8F251162EB0942600232C0993CAE5A1E41301511AFE07F5B83A1690F639133669AED6943184131B5D2A5E26C0934ACE7B627449E235F51DAF32BA7A626A5EA30BE6635234EDA7D1250FD902AD234DFC16637CF111BCD338C3A903C78099B38A041AC7F34D29B1296C39A5484C18002F6E9903A0FA55A63666CF18A4CA75822EE26FDA75A7869B1970F643A8C32AC6D214047CC0E5D2D42117E909A8C32A146C1275D896D80C306D8B64EFD461195A6BDAFF5C9CEDD2E0D90EF09D7E99AB14D70CD86CC96361D0BC2C3A0497C970099488F0BCB82389E849764313E6B38A2B4DAB103D1E2284F81665A207DB7A75D944EBC95CC485091BA4C42E755534D97CE6D44B2F4715DD328739C5C6575345B4C964C169E9F3AC64B5CCA2A1A914A88514A9B92450A1491A1A748356A041937432A2FBC7A270689A864A75F98140A1BDA7A821C22B401541AA243544AB6B020542D5774D6966CB40A0C0A469A85417748AF2E527240B01D5D78E282554ADF92CC8D6F76D28C956B6134796D1A11A55D47E7D8D2967FC7A3AAFFABB042137620015A630C374091D9657239A106DF1D98956885F550B551DEE0AB5130C7895B750A6F98D49CF293C1601566284B6BF4D5B2DD9111F5EB4929D71DB81D053DCE2FB8B6A29AB23FCC07683317E804C65B3BF39F149010B3EFC68274869A4997193F958B331C4CA0797C9EB80CCC15E4286A294D432368A6D829AAF8B6EB26ABD6D256A114BCD787BF96A836324D2B50BA86935DB38A48669B4E1FC6F1C08338172D53D9025CAD42698A3D56CC3700EA6D1D062C686EC1CB23414A09DD48614955A3E830A45F6629228139D177CAB190A3F78A615D02A56474A22107051DD4B8B2905A2F7E686548A5228F61A6A06C1946F9D2A65227A7643FCB77CBB7B49A2E5CC3D8E10E4AFF648AC06ADAF727B0A57792BB38A11DAB3D1531B5B8DC81E0A52C9457E0A0AB4433801ED2113E198736CA4503DA79287DC63146883E033DA431E8293A8818AEE200FD9A336A23C747E8FAD36283C1F9936549B8D0A59281C15193A920DCCDE42915FAE2F8A45EF85D76A90D20F8F6912B8C9A9A736B63A91DDE7AF928B813A51F891F590C954EA04B8985AA2520CFCA19467989C4714D39E6AD8AAD48ADA7B09184E7563069792722A3272CB51B64E85237B59CD84A4FA50402F21992B898D33492FE9708E1F0092EAC60C2EA54AE3EB85247167B07068E825A2B6F3C14053577DB76C734EDEA49D6CB6EE230A9DEAC3C986BC328C7659EE04E5532675C20767B7F3A3879496ACBEACB63BC7C50D39FFC376BD7A0A83283D5D3F66D9EEDD669316A4D383B0B976D98DC38DE3C59BE3C3C33F6D8E8E36614963E3B6A4CD9FEA37356571E23C202E95BC83EAA12B3F49B30B2773EE1C72B3EEB9170AD9A45E01C0C15B5DA578F02F76657D0E5797217FD7CBF2D6A33030152ACE2BDC4232FD168D45C066B5501A97DFBA4EE02492ABD2CFE3200F23D833042E4D1EABB888DDBC3407583AED14738A923B8058B206570419D16EFBC60335A81DE8E17AB69993E5699B6CFD4DA472B2E13A56F0891100C48D6A1E93B688555A9B1DB00BD3B343B18ACE48780661D1150BACA7284B4FE541AAE22F75137F572ED6DAEC3109D38EB6F9F10B1CCF7440AE8C921D66E514C6412BF9BF5DBEFCB2C43E820F2A3B741340CCAEA7402273771644E14BE473936CF9C59CC2DF73A710C52D4A3E461C377C9A39D5DBC4773962D527731AD729F1CFFDCE91A15F7F772AAD38731F46A7C948592A35398971060A53AFA2F33AD3646E5105482BEE59856BA8878F7C5075A174F69020E4C9E9D5698B81EE2026642FBB717A63F1D649248622FD6A4EA9BE7087A5035DC20353E93FC36C1F717F886498CF636AF499A0ABD81134052E44C200B670D171408B55F94DBB7CF9C59CC27B27CD220123F4AB39A562474624C57CB6198C591247CFA1EFF2C3917EB7A0C6DC0CD2A2A6B83104A636FCAA92ECAE5CF34BC0EA9B1D959FFD247B1409559FCD699DE3420F71C2CD7FF4AB8DE2F8479C7CE3D546F96D314A43718E6BAA342012064A032EBAD4B5CBDECC06F45CBD87F10DD130B1BAE1B2E36DE15E05B9A8028A8F1618C943814CFDCD829B7897A7DCE0AFBF59D8314EF4C1E7D463FDCD9CCA07E47D4CC33695FA9B85628C43D2D18EA01A99EF6329C7A93625879EDEBA4DBF33690CE828D0545BB4E2EBEC1586BAF8DCF3C14C7D221E85F6EF9F265CB17B1FC124C03DBF2A50BAB5EB07044FC354EABBC5582AD07D63B3F55919CDD9BD9FA4E50D3A072837CEC8292AE349341FA7B4C8CE3C2F4129774AD97CB46C9164CF807E5E0CC2A8D357779481340C90A6283BD256EA407D4CCC41C6638EB71415CE7430CDA5D820336111F27A355E637071E71D561A3A0AE36072D87EBF0C1D3FE009159F2C699CC7D1BD9F84FC863B9F66B32195A6BFC589F78B9372FB2BED140B4D8BDC3C21BD9739E18ED3B6ED240B2E1FE308E165DA1DB9BAA0C5249BD0891E2051790E8B0DCCDFE22BC7C558BE8CC8A914475D4CB5D8D88CDD6F719E5D461E516A5F326E275192DC81B684673ECDF658EB0A431479E771CEFB6049922D4E9BB14E10A775FA75319A54E2623C8CB15FDEBCD1CFDA07688CA35A87592C142C97C1C2ADFD0AFAD992D6AF4E90CB8855DF170924D009BA0B90CABB56FA0109A001EB1B9C1D7FFBEE7BBC66E7926CFC3CCA327F43DC56562B612CB88E0D8AB66B3474BACD468BEA8FB1D9DCA6077FC4F31B346E4D1E6432522C0C49F93D6C0C171D1904AF83EBACF9945C6163C22B360757D7E94D1E04A7EB7B27489145B379F778112682973C9FA50169F5A5F9DD78C9571EEA2DD7F94226C411BE90455A79CBF32EEB6596F5AA1E6DD8EA7B4E33141E900C07DB7F06E7814FBC1F9A0C1F9CC8BF4769F639FE86A2D3F5F1E1D1F17A7516F84E5A063554CEF8EFF85BEF8CBCF38F5E13EF7CE4851BBEB8BD8F3FA192A65E20F1F027634CE7627F82F50E8F06932B0F4F367CC1130928CBFBB37C22D86208FF15E17EC706A077EB64194A22AAA6D72B823B62C435D8DB28C9B77DE4CB8A3CFC2DF3898165494CE2D8C6B02EDC6C781D79E8E974FD5F45E977ABEBFFE46F13B9F65EAD3E261846EF5687ABFFEEC34E7B05DE9929964C2FD66A577C861325057666314528F88CC2DE62B547270ED673EC1E811D0BB4642F065A6EF62507D17727711F1D7215ADF3F41E450FD9E3E9FAE8CD214BBBB83974C9E3B70BC4454FF7BD0577B9A255F4E7F1E10802943AA0FFB832E4C68411D1D2C1DDB8634CC619EFE75E4DBBC8F5432720C613FE2B2DACA0A3B7584AD856C5C9C7D69C571EF025F5FB207674B38CA4C31AEF9892CA9D6F4F63FFB48AE86ABEB743827357EF2CF8E14C31C6B5BD33370D8D5E4C51CF78A9196633926B67784342C6A8FCE16C38EA9ADE59E6B557BA1D7ACA52105E4CEAD5CE2EAF0FED6717C6AF5D356F1D5ACF31F69ADB1894C0B332FB0AC9D2F95C6935D80A9F7AA20F6BA0336EE9C312665DD407A6CCF8CBD98D585AB2CFA81D7BD168C443E5160F6FAF9852A97CE2FB11A21EF1EDAEFEB7D079FA777B3D537A7E76B70FB90DD1AE5DF4D5A68F8C751DF0BCEEBEEABA51E6B011A71AC0157D6FE5DF38B5F71BC1B553FBA0ABD2DAC7BD1F6BB58F7B3F2AB58F7B4F45C7F8B79B637E1AAD37E63EE2BECC8BD3DA06C64A0776679F42EFC80DAFE3B703E97A9D7049A3C95FC5E757ABEBF44BE4FF33C7099FB1408988591DF3E6A7A114BDDA3DDD4CEEE08B5E6256B9E7B9BE9BEA2A6CA58A215B166DC3B5670FD7ADE8C04D59B40737C63D2BF16DDFDBE9BBF192373DB7EB6F81199DDBD4EED4C39265FCE7FB1036460AE09BBEB76819A95B3877F79E67F6BF3F3BC47CF1A1F24EDF2B5360EE4EAEFCE155CB95B629614C94F1DFEE6E8BB7BDE107D814E17CE107A0D8F2851F96DE2022149DDEBBD39278B9F75B07F2DEED7DCF325BEEECDD4D01EAC86E6BC0D5256734D2255EE57B3B512FCBAA67BCDC0718E8AC9BBB35B94EC890B8899B2143E3152E29A1F4FA365E21EAF1C77136F0ECDC6AC5C0B4E78436841EC94BED762FB5EA1E506D3FD72ECF31CDA3EDECDB8D729EC67A9EDDF02A6413FDBCB27A975D797FB8589DF15DD723BCCBAE0422E92E5B08B25A5BFE84F9EF0776A26FE6E20057BBA32D0D6AA0D7CF9E80AE8F26FE218068A972970849F573C9FD94CDF808ACDE0B060645993836EE26C61C74C7B2126E8B849ADC295DF50C31D4D34DF2EF117F52312E1386B7F075D753A3F1D6E4E9ED7D9988BB0D8F1F620AB641FF52E65FBB37CAA54FD3B6BA7ACEF5EE026CC0D916BE96152F60DD6BF392BBE415F15617D38FBF43CC29AE615F10E254175D4D8BB73194DBE1C1C191D09B1D41BB97AAC80A840BD03ECDC3D0C0FBF64CE7D177A299CEA31F170F04C58DEBF3C24075AFF1D4C68F1E062F3A61543068AFE699160F24766F181B4403036B58EDA1D560093BE80DA069D6E575F8C71C76028D3D691993F4EB0FA01554CF442CD254A08800A250C7510CF36061D2C5841512665F40501C00117AE3988CF3E0604AA3D10E07B35B8D6CACCE57C985D64CDFB5C27AD8EE6B274CB2692184BBC8F8A189A3A04AF3E8C7E0C83278C4C23450672270355EF673981F828B7F418EF9FA03981FAA970C16697E50444C6A7ECC838529CD0F3B24CC6F7EB44343BECA2EFD66CD062E92A4653CF069934F40A52B37340355A9E31C116A5F90187516826E57B7082D9D036CD3AE7CBA43770FD55017402E4E19C92E8EDF1B6554460F40CAA84AFD1195117443FFC29591E469BBBDC1DA5C2BAF999166BCF89A106897ED4BEDEBE025FE027A0168D55B06A223CF7A75D9049FC83C52CBABEC4FD7DE5D8C2150C6B0B4320833225815BBC45355CAE6D354CF663567A4743253B150E6D0545E6632AFB6712353D5DC64D254DEE4B36876E94FA96C779945D7F03297A6666577EBFAD8A263A9C126D442936475D0544D0D741354A88126C96AA0A9BA5EA23BA362F7D03469BFD0644D25EDFD3BA19E76B2B4AA747783B2722633AD8C4E116085340B5C297D1D565771798F8A585BF55D564595A421CC6C2308C499345905E0AB8B2210F8C95E84039F432D34BB9EAA16B1CAAEAAF2A8ABAD16FA36755736ABB2EE2A8FBAEECAAEE7EB6EBF18631C51B962CAA9E62A3808A46DE9A9E6C3F2B14793E90DA20951126DBFB638EC4425C4FCA985A40E11849AC2CED27C736453EFB244C2769D9570E09DE571C5D4078D3D4527C4506924A68EB9EA8B0350D0ACF924485A6A120D2B96C6E4B3930EE0E1AF8984903713B03A9722322828452D31A35096B1875F37C1771097367842222CBB800BF0B88F699AFDCC36B17ED278FA4B8464131B006C4333ED8216274B138FA14C26C08A95183B3459E27D2D69B1CE47BBC532BFB02C5886168D933656EA65ACD60C260D5E760FF3AEB4EAF68ADEB6038D6A6B21759934651EA3B26952EB593AA4B6E777414A15066E70F46936ED0955A3552FBFF6D7DE1336972A1555732107BA4154D6F8CD9538B9499AAB7385931E83B05B58AD079FCB0445B3A18D30E1D96819A50E42903A6349C4A077DA1A70640B7B674561785BAC4FB355235BE79734D0C81EBFB980638D6C741BB8E0A8CF22D9D1CAA71902BFB5AF2820BF4A1D5C284A1D6FE42C3294A6EF2ED201C450EF87EA8520F388181D1BAD7D5F011B55EAE042A90E13F432911CDC8F2E9221E709E121F426ED6453EEA3571FF04FE1C1F393CDA73C2257C996BF2E50EA3F5012E421F708B9AD33EA26CF75741FD747E51C477516E13193CCF19CCC394B32FFDE71339C4C16AF7EF4B05E15377392D17687BCEBE8639EEDF20C3719857741EB4A4B72E4AEAAFF6423F07CF2B17824381DA209984D9FDCBEFB31FA39F703AFE1FB4A72EB2340829CE55777B692BECCC8DDAD0FCF0DA59B3832245489AF7141F88CB0AAC2C4D28FD1D621AF10D9F386E1F71E3D38EE33BDE31322A2EF88B6D84F2E7CE72171C2B4A241CBE39F18C35EF8F4E7FF07761DBA96C84F0100 , N'6.1.3-40302')

