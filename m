Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD75316572
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 12:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB21C6EC67;
	Wed, 10 Feb 2021 11:45:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047736EC65
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 11:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0aeefgH88KAS+mFZzz3s6GSJy3shj3jdtXAXQmJY6uPR3r5xZoV+H26x6LiSSRgH6rO+CQLkTUFSoRWeW/o8Pt+SSY/3v6TR4SEaZ/S1DeAinCsG/upp6O/Hj7RKQDHn+m8vJqUU685m2yq2HIZshuhOuakkorvqXSf42a55fKx3ww5z984JNuCRBgALrgbecw4aQzhlaxe8PNRWxVk8uVotM1kc/Mj6hcSl/i5Cm9jgkxckFwt92z/SZA3FHyOTfyF9GmuiLPq4qDUYUBpB/xQTNk7O0O3Q7/ardpvylN9VvVqZYpmqcCTEWJN4t61reMrbdtqN16xf5/sN+TNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7rrEVOPubpwLp6mYlB5O3vrNvtKdTG89i24FP4CmWA=;
 b=YWan1Y5tL7+IakugddnYQSvHvmZttjMM2g4cxX0nQKdfcnIer+DXtxfJZU7yAn7Mp5wTyw31T9q3aDmuhRL19awEXxDUzfck0JY+UmMxlAs6FDjj62DfaKpBXSvQMs7P4/jfq7TAYDGEL2BD3T5EPcsXbj2iedB90NKmfk3Y/CVZG0Wnn1ra7kFV9+pZE8DZ27NNfq/kLwWqIQPXXm2JmnaeVU34xRRd31zslJTO0fVzBIWJLIDZz7/+tpoBBK+k5bWKUj5+pQdXqqdsMqzQ1E5rHK5g2D8HHWd8BMPhf6JZbBYte/FVFDHCxaRDNI8arXvQeNX3tYxC4tu6DofmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7rrEVOPubpwLp6mYlB5O3vrNvtKdTG89i24FP4CmWA=;
 b=w/iRFv2mdn2cKaFeYrgQQ4CNhOo7hiZqMCWZ19NJjh7S9LxCI9S5mrcxaeDfN8fIQGekF81OmtCTpbFUMlnWXvMOGbB9PWJWtewzGa3jteqrqq5oti9YLdTlwiWqM0JOE+rrXW7eZIWeEXB+mdNWt8Him7QCkLJFAvF1I3xKLBs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4638.namprd12.prod.outlook.com (2603:10b6:208:ff::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Wed, 10 Feb
 2021 11:45:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 11:45:04 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <2793c200beb530ed4a8ac32c5eea0f5aaa53c7e8.camel@gmx.de>
 <bfd62492-e6a9-3899-dd7d-87b7800f45c7@amd.com>
 <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5df26bda-9ff8-168f-e5a3-0bb503ffcca9@amd.com>
Date: Wed, 10 Feb 2021 12:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <41cc52bd57a466f29ea81676d42f57a7b9da7dd8.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: AM0PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 AM0PR06CA0124.eurprd06.prod.outlook.com (2603:10a6:208:ab::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 11:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3fa07a43-4368-42d9-cd34-08d8cdb94e7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4638:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4638DCFF1701CB8CA7A05ABD838D9@MN2PR12MB4638.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAlIs2kCGcTP6rfUk6VcudilwbsrFmQwgTsCehm8i1Xg48jboP6/fHnfYaDQGjorRJgXtRNyVwIaBIsKbO55ofh8zhCOeqZgsie6PkV7kXqoynGHTH5TP37bgn04SgIuzowONL00tZKCDMfacIZRSXqlZi5eOckZTusOF73iqWHKH6Jg5W348IqTYcXaDPaxyIthOu/vQ2oxdyYkpRnmv1/pqR8R0Cg2HCRunzReHIb4IIAAtNB98PBh+HPzf6npYwBwOzsy9wesOaql9fCON7ho98inRj4Ok+7HMPMylINc4b7OH0LiKMPqav2T82XaP0EhXvr8BM471NM/8LMHhiMHn6Xvtr4SCyEyGohWxI+QMKWL6tmJzD5IR0jZQaCVJqI+1YlvOo0xfVgV9vn8L2B5idFn3MRb/0363ebOFybm+ad/ZOPP5fAsFlrq+zOKk2riNmzd0/7mwkxQ7pcGwOgwmETVaPwxE86wPyuysEdRWyCItyKKkv6arzC25wkOl/g0jXtSjY0QisI6A0vdiDM/s7pm5SEwDeIKawEcvWYhdvK4pOWos6yKu63WN3c08SusjFhqbVPtZD5fcMZb3jy1ytXmuTY/vMqFHxCO53o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(66574015)(86362001)(31686004)(4326008)(6486002)(66556008)(52116002)(66946007)(8676002)(8936002)(31696002)(478600001)(6666004)(16526019)(36756003)(66476007)(2616005)(54906003)(4744005)(186003)(5660300002)(83380400001)(2906002)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?kjASZ5mvhBN00keLwCsus31hZYpXWJo+1HsUfne+U9iAQlTf2ruLaPuIP?=
 =?iso-8859-15?Q?G5oFZt6LQRNit3qVlzPvpvm4NCyqOGFi9AAkQhKh2X3wJlh7ZiRo/2NYR?=
 =?iso-8859-15?Q?G3+I+cjRv/5DJsWzkpXfohOUyT8vjt+rmKUNCe9GhHGSwHxS5oovVx+a9?=
 =?iso-8859-15?Q?Jp1ujO+wvSBbaevekrgn7Of9d9dnas2YSgYZlKEg+4WNe64PAgTXKFyVZ?=
 =?iso-8859-15?Q?X2bFWn9IlpcXxPW/DnA9QBVLjg++V4555qxUkXJgeZW/aXDGJfpZQM5Dz?=
 =?iso-8859-15?Q?0AMYA+75u+7I/0oKeFXsBvAccps9oTeRoRUaOxHM/LD7u0nK2fvMSD6PC?=
 =?iso-8859-15?Q?uhWKl2+BUpAeie1+LOrRUK9f1Eq75TLXxJ3OFpHwjqoItQADB6CEPOouM?=
 =?iso-8859-15?Q?7iQGOdau278MagE7qto7BbQBmNENEeBdMhjw3VgTanUdhSRKG+VoXPieS?=
 =?iso-8859-15?Q?kBE7Ak/NMj8mt6QknklFIsCngVxWSQuGBeWcHPGYKv8SXJcYnJ5jqBLMd?=
 =?iso-8859-15?Q?PNcUD1pdBs2HZ1QMTRIswNgFrGyjSvFS9S4iS+D4H/jxISgmpvtjQXa0B?=
 =?iso-8859-15?Q?vaQ6udtokkFuxrmNRgy99eRCgJKfBZOaoKt79lzcTh9LAfuRVMdW0LG+B?=
 =?iso-8859-15?Q?eOcfrWxY9ivssgg8SgJ1eFAbvAhGu3KiWndr9akALjzNH7UgKbzik8v0W?=
 =?iso-8859-15?Q?auW5lUNfiZV9tdt01T18TPDeuCfY9itaRBNWtaRtxZhENs5cA/IrjZgkK?=
 =?iso-8859-15?Q?YJLV8uJGTcajH0J4S7T9EHTYL7DFBgq9rtej+LPdlCv4U++O/c/9Ra+Xs?=
 =?iso-8859-15?Q?pi3D+lkR2yKDCrUI3M/dtPsqMSUvMKu6F/7cVP0SZF686WD56shXwfXoL?=
 =?iso-8859-15?Q?FkKd+taZjy1Tqw/7HUHvjVrVp+L61FPzph08sdJz7sdpY4pG1/HMkkYHf?=
 =?iso-8859-15?Q?BjtHCfXjhmZ4jCEp18tUj78W1VOPpIoIWfhO2qYblpirRKsO+3cM0HrZb?=
 =?iso-8859-15?Q?3XdSre0k8jtS0FfNMOTEhE9p7RN2G+649/rf26LNcUeBRN3d52iUPdtpw?=
 =?iso-8859-15?Q?AtrOX78iYsNrCUHCbp0BvCvDLRQpzGHQrn3a9F0H6JNWh5CZ1e+xq9Ig6?=
 =?iso-8859-15?Q?YuhHFZ3RT8wOou3V2wH9uASa/sl5obfAyG+1T/ah+F3s8x7ZPvJlhkTgA?=
 =?iso-8859-15?Q?gE+jkSCUDMX7jg9XH37eLDdeLKs01KckpL4lFGk7CkxPTJ0L+fwVR5x47?=
 =?iso-8859-15?Q?JFTqRKfhnKii0yYMFJ0uXvJ+ND4775/KILc7nMY5FGwebpcr4NjUrU+cB?=
 =?iso-8859-15?Q?+Tzw/HuxdUUC7Q6uqFtqWEVKDzY1idkONLkkbnpHpdXMLqmj3qbrk09SL?=
 =?iso-8859-15?Q?BsnrTuTdstWd2+HiNtH5VmFkm6gMeP+ZK/FUtQuQlvOiA+k+PTpKvQ8y/?=
 =?iso-8859-15?Q?saUyJyMazER5KiH0V0QRvBzNefNW+y6HZnU55l7u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa07a43-4368-42d9-cd34-08d8cdb94e7d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 11:45:04.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5jITLQXRQoUFgKPXTk4sLLeYnae7LEv3fFZXuXBg3C65ctoq4DVASOEyY/glo/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4638
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

Please try to add a "return NULL" at the beginning of ttm_pool_type_take().

That should effectively disable using the pool.

Thanks for testing,
Christian.

Am 10.02.21 um 12:22 schrieb Mike Galbraith:
> On Wed, 2021-02-10 at 11:52 +0100, Christian K=F6nig wrote:
>>
>> You could try to replace the "for (order =3D min(MAX_ORDER - 1UL,
>> __fls(num_pages)); num_pages;" in ttm_pool_alloc() with "for (order =3D =
0;
>> num_pages;" to get the old behavior.
> That's a nogo too.
>
> 	-Mike
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
