Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD51316A49
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 16:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBFE6E1E8;
	Wed, 10 Feb 2021 15:34:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F866E1E8
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 15:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0TuV4Q031w2vHetK9et8nOmTERG7K8goenIIqtjsV/KqTeWx9O6RvqIDh232IjHsvedNLLTslrYR8+zIT2HHTY4+LAlLso139oddDNh/8LMP/6v74lDpwxRyNjhJQWnPsEBlC44wKBwvrz0SyqNixPF3jG9WQ/7lWI4NnyjhynPF0UWgRVzER/GzqRXv8rLaHf+QvISmSo8ho1jWq7mEwTEnOYhjYiS7jd82MGhiR6nbcXwTLqJJp8mXfJckpujNhGlmuzBk/gNJ5ygJ0rEWS/MwLFPN13LY6KT4gsQWVqjZVaRadgWBcgpX/JHgEROC6RbdwK8RP0cPIm2F+vK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+SnlSNrWJT67oOPYeSzM+X0yCBo40Em9fnwadcLJ/Q=;
 b=lDZEcH9wI8I4Wnvo/MWM1VLdCyUT22YNtsBWTAerCxLsHPTSUootHcvxXiTapMXyUyuKJpW3LkD8pvvkuAVqFQbOjpA0TkJiUqeuEOu3MBdZGIgImXC1ESRKaNZVlkgAuPd+Ln8wtPAZWWLX/rUnPlqMWN4duw76YyIhG+7YbM+IlN3ZX87q70MNBGW/pipQk49oZ2cZfgUC0TSwzQgNGJmC57jNOo+/vHW5S4JYAqkidCKJBHThz26JEDU/zmIPpchuTMT1Yi63LETBX4pBZ5IRVCFyzos+m8R4ZDjpZV2CCE36TyoueOmyUeC7RR/mjNj0sXBbgw9xQ79VmGeqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+SnlSNrWJT67oOPYeSzM+X0yCBo40Em9fnwadcLJ/Q=;
 b=bfIDh4h3pnHPnyREwG8l8p3/jku5h7rN/J7PHeO5USWF3qeJc6AeuVn8pMpx9rjVYtm6afF8mnK+wApE+AtA8La+JyaYBF9i0DGxjzMiuRsh1B7fe349uNavxcvvBfPlcQ4OX9i6W1FXQgufBb5V1nKRmd8DVB0YYiu3a7x5RL0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3790.namprd12.prod.outlook.com (2603:10b6:208:164::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 15:34:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 15:34:46 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
 <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
 <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
 <eeea2d002142ec7f8737b9d0fb5128b0cdb2ae58.camel@gmx.de>
 <468ec16b-d716-5bd4-db2b-fb79e6c72a4f@amd.com>
 <6b2fa70c333d49dee64fa3c96cd7b7c99e8a6e9b.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b72ee235-2a79-bf88-a220-6e34d30a4bbe@amd.com>
Date: Wed, 10 Feb 2021 16:34:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6b2fa70c333d49dee64fa3c96cd7b7c99e8a6e9b.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:843:1ceb:6ae0:4a57]
X-ClientProxiedBy: AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:843:1ceb:6ae0:4a57]
 (2a02:908:1252:fb60:843:1ceb:6ae0:4a57) by
 AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Wed, 10 Feb 2021 15:34:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aef481b1-22f4-4a04-d80d-08d8cdd96541
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:
X-Microsoft-Antispam-PRVS: <MN2PR12MB379056A1C17C21FCAB049ED1838D9@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GDi2zVAdK430qmtCgDI/DXW8sUZyC014ExiZS7rdvnCu8cYi3IBjjdfonzdjwh4fxEgXMsZ5rKeYEWeA/A2ulUxYvF0W97IJMUWjRlWmDW9GwX8aU/l0dx0wk8plku2i6yM9qc9Bx3rL7EMHwqm2j/+CC1GND2/k1ZWD7Qnl6uq1JBPFYh1vOEJ5aOPpK4J0DWgsu2THWX0WrwG/CrcC+Kw1oYUH7BRKESpzx1NImTq60qbmIbvP4Crri+ktvV6urF270KnmbcHFXc1bCfdb5pKokrKGaBeVIOLEfDh2U8/QJ4eXEush8vSeKpWShmkZ9NFB/YqPMSXM2Of58eWEg7umOVZGhR+UJ/UOKHCD8Xcp4V0fohtBMo6DV2KDqoY12yrUqj2+cfbqBAKg8KV+vsz0YIJUgJNxT4SUxO04nCCeQAUSfks6hTpM5NiPdFUtKgfJys3MBtzpmnrATLeuMwpLLLdZb2oRqLEfzUFUCuEJTAs0DW+/VAqPF5rWtUT3C27N9mmrZ3t31DuhfmVXFLUqkgL/3buWeTHCTA0pKclZvkrv5Q+402cQtYolWwiEnvxp9JMhozwCbacFkRWCqOBvc5MmOi/KNn3MRC2L9HA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(6666004)(31686004)(6486002)(5660300002)(16526019)(31696002)(86362001)(2616005)(186003)(316002)(110136005)(2906002)(54906003)(52116002)(8936002)(4326008)(478600001)(8676002)(36756003)(66556008)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?kb+KjCccwesJES9FRRTZBzQvGtHZeyjq60VNF9OGkzzmpjTza5Gg/EkxT?=
 =?iso-8859-15?Q?4iCFfilWa1qTtGYQXyP7UACg2I22knnoO9FIHvrU5Xeej6Vs4orHTzWGz?=
 =?iso-8859-15?Q?hFNaNlv6rWYK/MXU5vpFCcYs/dFETLR/6gX0sPT0qEVSnE7EKJSRVP+93?=
 =?iso-8859-15?Q?ItSr4K7H3ORXnGj5rBKl2fC0hZfYY6Peo39iCT3wTPPdw4q2De18l+nX6?=
 =?iso-8859-15?Q?3eDNHbgzVxeqXvSXxf1K4MMn50SlG0CPlTmoap18pCNdkL9naweXqoYx/?=
 =?iso-8859-15?Q?0pxIx7kl2RaeBelpa5Gu3tzBAW1Fy2IvJLs9OTI48uSkkIk/PzaKhSphU?=
 =?iso-8859-15?Q?lYhQxet7XzT1sVx3te/ilEghBDIVMghIrtbS0dzQ2URfY+6eyK9PvC6ZV?=
 =?iso-8859-15?Q?aULnRZbGMwaPVG908V16of9oFyxQAjwuqIuTB82gvJI2x3j+hmXh3sZmG?=
 =?iso-8859-15?Q?qwxaKbY1NobbxKsBxlw0haBufpyZ0/QnH9mQOXdGl8BwN+Q3+4q9WjFKL?=
 =?iso-8859-15?Q?Hos0YsvP4sWu0cHdQzgaFcwpkq+24q9Q1jD7nnzFX/duaGdeiApgi9BAQ?=
 =?iso-8859-15?Q?VnXKmshCoa4nolqAs9mAriYq/ul89f7RNuEelEjhaa3Gsr3Q4xUYmZRlG?=
 =?iso-8859-15?Q?k3P4idnooGGRShCP2AHJp0gzaM6JilA/teIx1kMFh4yi6lGn1AXsnVyfX?=
 =?iso-8859-15?Q?cZE3X3p+9trsdm9WGu+11QZgyEONIC1g6AadNIIHcWQPTOEd94awsEV6a?=
 =?iso-8859-15?Q?X9UxZPPuqM1jMSujFzvVpj5Y5EPKwevc0pNW/69G/UmLcDlsQJMwL8wTk?=
 =?iso-8859-15?Q?tOux0nvj5SakVPFDQRGKCrg4DyIxxeeTLBGQp/XPYI4UB3PfC4/OCMh0a?=
 =?iso-8859-15?Q?wbUtepDP7kobvaKMpC6i3BmmYhr8r9koWnACm9XuWIGb776hSxLRAtP0k?=
 =?iso-8859-15?Q?m6zBu+eRFwDMKxY+ejzZcL1sFzDimYpbGh+85K9m6MGdgeg/hRtBNapzR?=
 =?iso-8859-15?Q?n2i1qsxgn+y6ZXPDzqXVIQGWhrL7GZXDPt2836/eoj+00GhUT+2uF+sFr?=
 =?iso-8859-15?Q?/csUMafyLU70MstI2V7jqww6XhB/8Hfmobjc8vm+LJf/by5ecYzEeX5A1?=
 =?iso-8859-15?Q?IaMpMsmmEOdcIuKf8g5v2lm7onupA39gFZiGja0HXDru+ouaJfFBSMfgT?=
 =?iso-8859-15?Q?XxdeUFkIAxZJ8DZgr8pX86Qsa6lroI++aGz8US3cgmmJIV1Y4EjibMZ94?=
 =?iso-8859-15?Q?tUSkDI91OalvEhhJPoWmt3jmqkzggrweqFXXLksKrjZnb64+2vEQuEgmK?=
 =?iso-8859-15?Q?knX7ptXPNRxoVjmbKu1SPFLzEo8zpxNmxAlCeaIRr9gYb0H2GR46+Ht2R?=
 =?iso-8859-15?Q?oPytwAeN+VPGxi0ZNET0lCpSPYRNgH8jmRnbpCpkvJ+nF3vhVNUpecREj?=
 =?iso-8859-15?Q?5uip/Z4FtLQfoG+zS5HJFYNfcmbMkKIB1PTfYKzX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef481b1-22f4-4a04-d80d-08d8cdd96541
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 15:34:46.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7Xa+ZRLLFPcygTDrSDxFeiVA/eAeWEE0ntsvunhBL+ZXwuQK/zpnhjIZzWOuEwG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
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



Am 10.02.21 um 16:30 schrieb Mike Galbraith:
> On Wed, 2021-02-10 at 14:26 +0100, Christian K=F6nig wrote:
>> Am 10.02.21 um 13:22 schrieb Mike Galbraith:
>>> On Wed, 2021-02-10 at 12:44 +0100, Christian K=F6nig wrote:
>>>> Please try to add a "return NULL" at the beginning of ttm_pool_type_ta=
ke().
>>>>
>>>> That should effectively disable using the pool.
>>> That did away with the yield looping, but it doesn't take long for the
>>> display to freeze.  I ssh'd in from lappy, but there was nada in dmesg.
>> Yeah, that is expected. Without taking pages from the pool we leak
>> memory like sieve.
>>
>> At least we could narrow down the problem quite a bit with that.
>>
>> Can you test the attached patch and see if it helps?
> Yup, that seems to have fixed it all up.  Another one bites the dust ;)

Ah! So basically nouveau relies on that the pages are cleared.

Yeah, that wasn't consitently implemented before. Some code path was =

clearing the page, some wasn't.

Any objections that I add a Reported-and-tested-by: Mike Galbraith =

<efault@gmx.de> ?

Regards,
Christian.

>
> 	-Mike
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
