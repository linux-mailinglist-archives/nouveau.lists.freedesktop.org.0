Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBA316452
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 11:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B1F6EC4F;
	Wed, 10 Feb 2021 10:52:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1106EC4F
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q57nNzybtx8IgoHaSCqePu2shiAldTzKTwdLeO63UoFEX4kJTCMDvln0dBH3t+I3ZM+lhkay6QyjqUcAXn0LNzD3yd2O+kxgVtgsZmHUHHp9uugsiQ9IRbm0IPLxhmlBArd9+4QBf7fOV0XlZaav33hEMoK5OUouQnj2lgeDmI614tizzMTZyxRjjMpUJLZ0hTF+8c8SNu2IFlb+K00SymuDQV3KhZTYehy+FxvJUXwgfiJa2ZvvHiWRCmtaIHo9exeZBSwZguo1f34ey+nem4FyEjx4qSKku1IHyGxCcLlYwQ/jciUcbncU95bSah2U/0TpyWTUYTVsA2vvnAsVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dRNM9/WedbS4Yekj8d6ZD+FQ+B4iVdh9VXS/bXxbfM=;
 b=RmptUaoroO1f8uwOqrk6rE3zxJzmCRIsobsx6BFCUCxfvstIeMhxtlGdGYPGRvJrhhmmOnkmT6pN4sGU9VOwaBk2OEFW8Db1NoO1Nr8YVRqUmLfgGkvaF2FK7RgUKaJ+iEY8ArrSVsvXG+TTImCAp7zPUUuuJwuSaXc0Sd0IyvjoBRW3cOaqTtHO5T4l2v3OqZiyfsJ3SL54Bijmv3C1PBuVjODYZx+6XGOZ/JXk/i0ZVePevrStQHKBz6I71eQg51tTJwt/F8ytDNAyHx1xkkigm5/l4HJcj54iov6aFo86V8RioZX02694CwXzLlQPEWkMnnsm+M8ULGVh3mmEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dRNM9/WedbS4Yekj8d6ZD+FQ+B4iVdh9VXS/bXxbfM=;
 b=bNIEkwoiBYnPEd69z7/AWYPVC2OKd7bhEetvnBNXtzVnXBNS7HXNolcbkMd0C+2j5rHs8GdOt3K/b1DajOLnlMqN9z7+SHqQ+i64OWao8DHVWV1lUQmG0B+/yG7Aqo8b1lcn6WWA3XqlGX2DRgfGfdX3e3UbUIV87XIM4U4m5BI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 10 Feb
 2021 10:52:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 10:52:17 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
Date: Wed, 10 Feb 2021 11:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: AM0PR05CA0096.eurprd05.prod.outlook.com
 (2603:10a6:208:136::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 AM0PR05CA0096.eurprd05.prod.outlook.com (2603:10a6:208:136::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Wed, 10 Feb 2021 10:52:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce6f47c8-90b6-451a-d882-08d8cdb1ee7e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-Microsoft-Antispam-PRVS: <MN2PR12MB388639E1388C4ED7A64ADF6C838D9@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HX/dr+90tgKRP3i1JOs+FKoYDqXWs+Synh+OXpEnvDo5dreNUQCQ9+kPNykypobsMvgWXLLqy7epNSbOFfN60+DxxUgs6K5jFztoz57SsyXFkSogLc87tWLhN2fTkLs5/+JIBPBngm4r+/54wQEt8ebJ7quHIOo+c9dNZNtMUHqDfuzj2+3pixJV/B/+kY0A9IAhqf4B27bGeI/ZH2MP2fIOo0rfHcmvdbQR5kU3MuQxPhg2hy0mAaOlGqQep40nZtC/E24PxKU+fmn718Oup7sPuyd+KkMMdnJAzn4wVzfEUSxZu3GaxuiN0O88RKilbkR9Ss1vgXV4e8CoCI9/1smQS4iSYaVkDqVF/RRDwXwvWH+ne4es/VQ9yt9KHtWcJCiuRbLrntp/z1dozynRjMmKxCJCVzIchaW6JCDD2szY+59Lyoo1C6Q7zx2+Rd4upnTvtwjuxWM1mcgUe396evuxxB6nw+3Rg/fPWZAssVVP6q2CNqYo96HUedQK0u0k4HWH89dhy/b0ZKvJZrgLvdTFd8d1eYC9HoMz+0FYH0Tdea15sy2dy0ypSf8knSpLRYTLHyref/Au8BzAc6xSGA/W70gXjAfBPfGQSi+0lsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(83380400001)(66476007)(2906002)(6666004)(478600001)(5660300002)(66946007)(66574015)(86362001)(8676002)(31686004)(31696002)(52116002)(6486002)(4326008)(16526019)(186003)(110136005)(66556008)(316002)(54906003)(8936002)(4744005)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?ePbr2bJkV4Svth8RlidCKc3z2o01vlIeOpgVRC4C/tY6GvnfsjAsTVgMp?=
 =?iso-8859-15?Q?luOTZq09z1phL2zgDQn9G0pDXVqb2SNERqOfgoKZmVWERYgsStgwU/k/I?=
 =?iso-8859-15?Q?N0SQ/XcBtzWNvXfQvdcSxou4zCE0jlNv8GloW2V/XQFpbqvk0BZ8Q84pd?=
 =?iso-8859-15?Q?eiC9E595X48rsHIxDO7titZwnokQu8KDOKBWryCIgv7BQ9rlSHjfffm6D?=
 =?iso-8859-15?Q?6uW62p+cQstTCVNddtebAzOS74Kx+EWIALoyEpu9RDifRFS6rePB8e8Sy?=
 =?iso-8859-15?Q?PG+xuLJkvH/70eSBXmqSN5i+fMJuXbFoF/xV01HhMhHoEZxM8sW9bbyWm?=
 =?iso-8859-15?Q?PJdIn9DVex9TiIFjq9BxGMQq1gS7aMAu5e+ct7amMHJhcLyCn8h1Q8dJD?=
 =?iso-8859-15?Q?7T/x/XtaYdnWuYl9lhaxiV3GW5xZybw9+OU2057zPQaNoXP9zT6ta0A0U?=
 =?iso-8859-15?Q?jQ0BgaSmR4TMwGvm5MJgK6ZTMwQWLXZZmh3xTaExnm4skRgwnFYVcobPB?=
 =?iso-8859-15?Q?EsBGhVHiyCH4i67x9B6AF4MlAu18JerthCP/l1bW30PdElVBZAF2B0b/C?=
 =?iso-8859-15?Q?GrMo3kG30aRIrF2MIroKtA/svEmUq9uab+teeH2EWbfs+YigXEtZa/KtR?=
 =?iso-8859-15?Q?puKhpXDz1iAydrx2hVomFKCoyNQS3QPaHYvJcDXPvt2sPgHXTo0zZIdMT?=
 =?iso-8859-15?Q?5OhvZQks3xDW9oqESXojtBBTcBQS0axAlmn5cuK1mRKaR1QejxaNL0UwB?=
 =?iso-8859-15?Q?iYdGQIf+KZ0bFbQUey7JSYR8w4bI2kUijVQPIsCZAmEBHBq+8IYKx2cr1?=
 =?iso-8859-15?Q?lGnEOV6kUMKcKetWs6irUhBiQH9DveIlcNudfT7JAncu+f7O07LQTjRU4?=
 =?iso-8859-15?Q?dttUa1USrYDyUpOXIbmRlOPFKq3k8Vi3UjVe7W9HE0Zucrosge5OpMN8j?=
 =?iso-8859-15?Q?2OEOTFbK62LFYdGgXry7gMgh3m4O10ID2IDzGJ/ojxwxYRZqZIQ5dQfRq?=
 =?iso-8859-15?Q?NzCNz9elrS+FUMOoB2TkG/8DKGEDmmWQUoeI+34kzCMhqg9N90o8sNS8x?=
 =?iso-8859-15?Q?P/1EmLDd1nVHg/PYyZc3neecf9tQ4XERQRvzq3Yn3JwG5l7WD4BeomMmV?=
 =?iso-8859-15?Q?YZwMYdywjWdtA9iQ7y4KuEEjnK9puZJbhVPYTEoZvpYVuUR0ovrXnlD0H?=
 =?iso-8859-15?Q?iVJqSZsaUnlFp5vDglKDg+APTIzkzxmGTvF9p4y02XYN5wFrAYazvUs14?=
 =?iso-8859-15?Q?Luaa9taSMU3iQou+lV47uMr7l3Kz0SDINiRrIMtCXHOUeQGvTsofLMIwV?=
 =?iso-8859-15?Q?gGtCFsSM+v7MHyywsljwpJ8ZQ9U2X0sz2pwSg4B9ps+Kto8qdhzQHTzXz?=
 =?iso-8859-15?Q?GLRFa1sGt5WHc7Ixcmd2gQD9YBitr60SrQFBOcCy2DcPXrmkJjVE/w6qD?=
 =?iso-8859-15?Q?P3U/bzgBJj+uCTK18bQ2Pw5FtHRoyYIuIyXX1L0+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6f47c8-90b6-451a-d882-08d8cdb1ee7e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 10:52:17.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUSJOKxFcSN/ID+qWyvtwfk05xN611ZbTriMtcHMZxreaNby99G54BbBDC5Y7ipk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
Subject: Re: [Nouveau] drm/nouneau: 5.11 cycle regression bisected to
 461619f5c324 "drm/nouveau: switch to new allocator"
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Am 10.02.21 um 11:46 schrieb Mike Galbraith:
> On Wed, 2021-02-10 at 11:34 +0100, Christian K=F6nig wrote:
>> What seems to happen here is that your system is low on resources and we
>> just try to free up pages.
> FWIW, box has oodles generic ram free right after boot.

Then I have no idea what happens here.

The returned pages are identical, only the overhead to allocate them is =

reduced significantly.

The only other idea I have is that this somehow changes the timing and =

exposes a bug somewhere else.

You could try to replace the "for (order =3D min(MAX_ORDER - 1UL, =

__fls(num_pages)); num_pages;" in ttm_pool_alloc() with "for (order =3D 0; =

num_pages;" to get the old behavior.

Regards,
Christian.

>
> 	-Mike
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
