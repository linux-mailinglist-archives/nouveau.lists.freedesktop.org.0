Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E23456B57
	for <lists+nouveau@lfdr.de>; Fri, 19 Nov 2021 09:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467D76ED1B;
	Fri, 19 Nov 2021 08:10:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4036ED1B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 08:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1cgHJVbUZSR0jA1F+bliwyGR/uKc57cwEMlGqfjjgCqeeR7tPqDVVvkC76c1gIfVzMJnHGmlhFxuUwFLMG5QOBF9uDJq+9sdSB13yhYRDZBfHYBqRVygfh9jYCdXAvVQop6oYpVHhncy1u2qAi8ToWW7PWkAgt8ZYmA1YCjsrvE7XIsxfh2sdWm/1RSRhjgMRKEjQesr3K5rqb8lN3iLmy5l0gReQvTlzvLaU2SEmjlCalyOhCrF6HzQxxJ02um2NXjcvp7w8sa2a0JRxEsJ0IHa47mb4Xj8wvyjuWZ96kKSXxqPU5jO864oe38ugU5b+o/974ZfDupcIhBHAmYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shn1VqnrZst04ABCb2Or62eGxdxFwY31660aq8+qJk4=;
 b=V18aJBQZc0NMExCx6Wl+tgomIVN6+a1AjSdSlgki6U6TVkCV+LGW09PaCMrzcmqG4qz3vuzGZSyoZgdyotAl65/4RacB2c7YGoHVa5j7yYWAvrnY9kTyCoaIqHEL1tbNakpjECvCMayGX7RBd8KtYAsKH3HQkGL48OcFgpsgxR+BRMu6lpsZrOez5FxwgrdS8KKxAFlkQsfisGe7LLbMUXQYIdad3ELB3e5/RBoPbMiNdevO3iuNA3Vw0EXcNzhdrAoKrex/QKIrJNZppBkGI/YGdnQ6BvBz4TZwRP5p7E8isJXn3PmEFc5IlqCxHJK1KBr4FXUz2YxGrclV6bjYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=urv.cat; dmarc=pass action=none header.from=urv.cat; dkim=pass
 header.d=urv.cat; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rovira.onmicrosoft.com; s=selector2-rovira-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shn1VqnrZst04ABCb2Or62eGxdxFwY31660aq8+qJk4=;
 b=CgOLnj8Z36HRCl/gnrn1fR9zSmlGcmuOnoJvEj3tX0gJS6/2+UCLnAL4McEvthHz88iGvmHMXYSGMsCoi0RTYVf2wBebp8z4zldqliH8mL6MWbi6+Vb0grdR8MO0UkNEJWi/8yfREw9giBeFsy37wRnYlIkt88Mmn1huCg/V05M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=urv.cat;
Received: from VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:65::11) by VI1PR01MB3774.eurprd01.prod.exchangelabs.com
 (2603:10a6:802:64::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 08:10:28 +0000
Received: from VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 ([fe80::ac20:c842:53ae:2039]) by VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 ([fe80::ac20:c842:53ae:2039%3]) with mapi id 15.20.4690.027; Fri, 19 Nov 2021
 08:10:28 +0000
To: Karol Herbst <kherbst@redhat.com>
References: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
 <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
From: dmanye <dmanye@urv.cat>
Message-ID: <3f418b50-e731-ff71-dc93-b065f9be8389@urv.cat>
Date: Fri, 19 Nov 2021 09:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
In-Reply-To: <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: es_CU
X-ClientProxiedBy: HE1P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::11)
 To VI1PR01MB4335.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:65::11)
MIME-Version: 1.0
Received: from [10.21.102.202] (193.147.222.245) by
 HE1P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 08:10:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b0fb664-696c-4a82-2216-08d9ab340c2d
X-MS-TrafficTypeDiagnostic: VI1PR01MB3774:
X-Microsoft-Antispam-PRVS: <VI1PR01MB37749179E51458E17EC60F49FD9C9@VI1PR01MB3774.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPHqbUb9ysrx08IcAoz67CJWjz4w5jIPKGVUX0iabsEij/JvVqG3XuE3sLMyTB6sn9EyUzBV9n/ZA3Q/lcTtOmUUBVjjWs6Vkdo2yet6ZaHZyFx07xPeqiIY4hqYGdtULnnFQ9/XwsfnDcpDLFxbTTA2oPv1cEX2jOlSw7qBJry+najaDMB4OPXcQn6jPfKgKowa0/uqVXd6c0nxRG/7jo75n0Eyi3jCHSqIQrSwLFTf7tKSd5zCUygOHlmeEuhZFk6so/J+2/OCSVd9/QHmGnmmHopRpADvMnyYErn3C+6rf5wv+3ezfQ1gcOxKA+QA8IOBL0g4302j8CgqGLvlVClZaXwJx3Bq0l5i4EDZ8i/ScLSKITIOK1nTGlPCqIiuKH7k8vSYyutEd1qI2/FCrGTqc3U/vMzpHjFgKg+9T9wRx+5sFsoGdlCg9TegUcHn3ghXpFchNv1US1QywcQIehX9qqCcEvET1xKfWNKswTYlmOMGL/QhwIFpnpi8dpn6k9lvk4I3I3Kf4VBWmfOvDy9ENUZW7aloYUs1qQqC/ut+yx3zaDIvdG98XKL7Nygoh0U6bpwjRGfNieMxm5MnqWlkhMKEF53gA4EMXeQKl4ciLIroDzB5zYLQRyqPoFECTS5ilzI0dEhDJmZbP9ckf98ZCGaTwrsfCmNFnbPWHibu5jgRwYbvODZZWy1m0gwb2fsR8dh8TPKSoI5Ss+lsNVBE0eJzGwkxMZ1H2gHbEyjrBKeMZPfz+u+za1XXTvkSvT8SZoEqFhGL3VM9+zQ4sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR01MB4335.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(366004)(38350700002)(38100700002)(26005)(2616005)(52116002)(36756003)(66556008)(6486002)(956004)(4326008)(31686004)(8936002)(66476007)(16576012)(66946007)(83380400001)(2906002)(8676002)(316002)(5660300002)(186003)(31696002)(6916009)(508600001)(786003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2pBcjZXR25JTjhBaWloV1Zxa1drUzJtalJaVjN0Yk9hbndkYTh5YWN6ZDNB?=
 =?utf-8?B?bVY2M1lzU1RoTFNhUHA1OTZPTkNmS2h1c1pRNlEycUwrcmNDdkIzeVF3T3Zh?=
 =?utf-8?B?OFhkUlpIeWRUbjlWY3VNN2JQMEx6Ukx4L0VRQVZKdGlEZ2gzSWJWN2VybVU4?=
 =?utf-8?B?T2FMZFU1NTRHOUNvTVV5MGFSb3JOMlBWTi9FQ3ZjOGExdU1GNFV1aU8rZG5B?=
 =?utf-8?B?M2tlK3VrT0x2b2Q3K3BYYkVFWlRWeFhmRzYzS0xibmV3d29tMzVNaVV6U0Jp?=
 =?utf-8?B?M2oxRTN4SFJXTHdGSlhYQ3dheSs5NlZpZzNBdFd1YktmUjFtQXJjeEVCSU42?=
 =?utf-8?B?ck9EM0VwelBkdnZJVnYzMDNmVUdjallEVnpCOGRjbTYyRWdZOXpNNFQ0d3ls?=
 =?utf-8?B?cnlsd2QzTGlGUVZMYW94THFTRlhwV2sxTm5QZ1o3c2R4eU5jazh0MzVWV3Jt?=
 =?utf-8?B?cmplaTNkaUU4UnlwWHNIdjBGeFp5cVY0Ui9QT213UTVoRi85ZGhaVkpZNUd0?=
 =?utf-8?B?UnlUbWdsZUg5MnNYMzR3Y2hDK2ZvNU9UQlBZS05RaEIraFgzQW1vQ3Vndm1r?=
 =?utf-8?B?bG5aQ3lieks5Z1hGNlk5c2lYYzFDdmJQZDJ4RURNWmNVV2FVeEFnS2JyeTR6?=
 =?utf-8?B?Wm1LcGcwUGsvRVpoWGpNVkcvSm44UHI1L1hLbGRROWN1TDFJeGw5MVY2ZERS?=
 =?utf-8?B?d3VjUm9GRmQrOXdqMjZnTlE3c0w5UGZaRW12NUtsSUh4TytIK1UxMjhoT21Y?=
 =?utf-8?B?ZXRhZWtza0ViTUcxVzVyOXd0WDA1ZEZCV2p4blZ5TzBGaEpqNzFka2k3d1RL?=
 =?utf-8?B?WERpbFQxbWszbzl6elRVMVRDbmV2bC9NN2UwSldxMnluL1grSmhWdVZjWTNt?=
 =?utf-8?B?VUd6bHFmK3lpK2VhYytZdk1NdU9vTlJETTd0SFVvdWU0RnB2bTIrajdVSVNh?=
 =?utf-8?B?OW5BY2M4dG5xSG9yWHdWN25IQ1cwZmlIU0NMTy93UHFnZWhwdVRDTzVUa0RX?=
 =?utf-8?B?d1AwMit2QzkzSHRxZUlDb0VWSDJvTk93TlhwVVo3bHRyY3doaHZuWXJWbktW?=
 =?utf-8?B?V3BzRUpEc1RScUMxdk02elRiK2Iyd0NBekFxY3V5V29ib0hBbXcwdXA3ODBR?=
 =?utf-8?B?SjlRUFFXRDFxTnF1cVMzNXQ5TFBVYU1veFBreVJOeTQ3eVVTbkNPY1ZEWDh3?=
 =?utf-8?B?c3YvcTRNUDY2M21HRlJjOUlYcHdta1JXeFp1RVpoNVVqRTZSQjNGMm1BUVFZ?=
 =?utf-8?B?TlVvbkxFY05UVFljeDAyMm5oNklIRTRwWDdsSENLcW5UZkE3Mk02VzVYM3Fx?=
 =?utf-8?B?V1p1YSsrVCtHK0lDblRtNEZiQXFRdEF5ZEk3TUZWb1paUlNpYkR1MjRZaHJy?=
 =?utf-8?B?REZ1VkNnakVJbTc0aWNJcVVmbVRYcFJlTTQvTjZWOXBvOGhSRkZScDhIdFA4?=
 =?utf-8?B?TGcwWXp2T2NMbXZabjRBRWFxbmt5YnJ3NHE3T05HK1UzTk5wemhQVGx5cUFB?=
 =?utf-8?B?Z0hBVVNvQXlNU1VORnEybFptbFliV1ROTEwxY1h6TUNXNzBoZjVsTzlmQ1dM?=
 =?utf-8?B?OGFFcWgva00xT1h6cjBEb0REYU5neHZLSUxhSVBpSmk2OUlKYnVCSndkREhT?=
 =?utf-8?B?ZEc0MnZuaHRKa1hwdDNxVERqelFRUnV5UmR4WHpVbVRFRkNRVmp5VHNHTGJY?=
 =?utf-8?B?STE2L25YTS9qUzZTb3hPNXdBUE52enovcjUybXRyc0V6bXBJL2tiSGR0SHI1?=
 =?utf-8?B?cGsxNHUzdVFwQ0FURFNvQlBFblNIU3YzSy9Lb0ZPbmsrWUdmVndWNGtRSTNx?=
 =?utf-8?B?OWZiZXFjNzY5WTRzaXp3R1FXbGQwZ0lKZ2s2QUs3QzBxeWFaem9FdEdPUEIv?=
 =?utf-8?B?RENTTGQ5OHMvNzNkbmRERlIzdmkzWVJNbjVCdXN2bHRBMlFOclh0cTA0djFr?=
 =?utf-8?B?VHhodGRGNE1iaGw3NGc3NkhSV0U1dDBPdFkrVS80cTd4dnlNZDdBQzY3TTRa?=
 =?utf-8?B?QkxZdWx3L1hNWi9PTm5xMHU1WDN3QmxaNitSY0JpNWU2L3g5ZkVCamNKM09H?=
 =?utf-8?B?TnNHQXN0elY2TkpLWXNYbXczcWR4N0hYR0ZaQk4xbzJsSXRQeFdrVnh1T1Yv?=
 =?utf-8?B?NEE5RXczKyszQ0NMdVZ4NmxzdjBOc0R4YjNxWnRyN3NNZDNIakQvMjJXSXlo?=
 =?utf-8?Q?9ZUXrBpR36L11ubOjqBC2Zo=3D?=
X-OriginatorOrg: urv.cat
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0fb664-696c-4a82-2216-08d9ab340c2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB4335.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 08:10:28.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f311296b-3e82-4c4e-82a9-a8e403a42b11
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRIi+W5A3J+7B4NM/EVfQ1hq5r1Q4qIMdZlPWBprR+9KEIQcAyInGzIfIYaU6tl0oBkAxqNPttsKga5HumRkgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB3774
Subject: Re: [Nouveau] [INVALID_ARG] mthd 0414
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 18/11/21 16:13, Karol Herbst wrote:
> On Thu, Nov 18, 2021 at 2:59 PM dmanye <dmanye@urv.cat> wrote:
>> hello,
>>
>> i have a problem and i think that it is in the nouveau driver. i hope
>> you can help me...
>>
>> i have 20 identical computers with debian bullseye (11) installed (only
>> "official" debian packages). sometimes some of them boot but the screen
>> is remains in black. if i connect remotely i can see that the X session
>> starts as expected (i have set a lightdm autologin). restarting lightdm
>> does not help, but rebooting the computer solves the problem but it
>> reappears here and there (when i boot all the computers, between 0 and 2
>> usually get the black screen).
>>
> What kind of connector are you using? I have a gk208B GPU here so I
> could see if I hit this bug if I just reboot often enough on 5.10

i'm using vga cables. when the bug appears i can confirm with other 
computer that is not a cable/monitor problema. should i try other 
connector when the bug appears in case it chooses other output by 
mistake...?

thanks.

>
>> i've noticed that this three lines appear always in dmesg when it fails:
>>
>> [    4.090415] nouveau 0000:07:00.0: disp: chid 0 stat 00004414 reason 4
>> [INVALID_ARG] mthd 0414 data 00000000 code 00000001
>> [    4.090430] nouveau 0000:07:00.0: disp: chid 0 stat 10004418 reason 4
>> [INVALID_ARG] mthd 0418 data 00000000 code 00000001
>> [    4.090445] nouveau 0000:07:00.0: disp: chid 0 stat 10004424 reason 4
>> [INVALID_ARG] mthd 0424 data 00000000 code 00000001
>>
>> i can solve it without rebooting by unloading and loading again the
>> nouveau driver
>>
>> kernel version is 5.10.46-4
>>
>> nouveau driver debian package is 1:1.0.17-1
>>
>> i attach dmesg log in case it could help.
>>
>> please don't hesitate to ask for more info if you need it.
>>
>> thank you in advance.
>>
>>

