Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD79316414
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 11:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968D76E1F1;
	Wed, 10 Feb 2021 10:42:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5D36E1F1
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/eHBnWCL7dJu5JPqq82Za4XQjPqjGWJ9qATNZntff6JoCwADjSa4Qjs7r1ejJRBGnudTvtNRlAFKeualnp8uepYFeSILfRzRWWMGD+dlgChlyKhFTIGQVrqtJNWaPgXK3gA08tY73k+0akAWgBJV6NEqHXUhRxGrMsscEm2YxfQgYdd1+ZPAR+y59AeWS39SPECVWlpdAeY5h9kYfsVVdDJo/4zcezOnP8axZTOEh2ePUxVWn2l6mqNvF6s+8OhPAxi5crEIEVnRR9WALVqXgvVm1lqPrl6ZAmn4PufmszoQvxT74tPJYebYswzrZQfV0oAvBZkwQutFdoFdNYf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfgWUUz7WRn+ggzEGA0Dtpg0D9R5rvlLO/oZFyW2dXU=;
 b=LLlWgx9zczdIl+ixIuUMdo9B5NcjIOSZg5QonaKlXvTj0mingjRs6OwhaoCTakVyFTnk0icq/w8jF1NUNUqjZJVL3nSrIz4kz3QzQydQWDm9xsR1ZUNtRIAQDYBEz4OulS607E0jE8xwIxd9koMWRWwJNzWkAjpwsoYuqlcpd507rGqHZ3hJ7oWAAdQhRwZ847kAqXc5VDbmyf+s8nWg00kV1MyNjLjjvdWP1LzumZh7gX99G8ux0ozneVSpCxulaAaiuUc0ovVwC/xoO6Lp20dc6hsRT8Sop6Jr1TpFlN8iczSLm8HCJBT4+qG/QnsX+FMKsfVKvnhv2xt2C32bIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfgWUUz7WRn+ggzEGA0Dtpg0D9R5rvlLO/oZFyW2dXU=;
 b=T34P1zXmKG/9O/yjrLzSeHXtqwVOS0t/qFj4hxLFEsB+z0PRgT254bcASlsJCAlAPxEUnap5L65ELCDAUHmC5Ynab+ZWq55ujvlPgzkimnUqgfnr/5ORPA+HQiJ+GFDq7wISeSmFIi09Ok85YhWv+gZGkllJ86NVN7kc1wOJpik=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4706.namprd12.prod.outlook.com (2603:10b6:208:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Wed, 10 Feb
 2021 10:42:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 10:42:33 +0000
To: Mike Galbraith <efault@gmx.de>, lkml <linux-kernel@vger.kernel.org>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
 <9d221e6160813fd188de26d3b56443129e9f8003.camel@gmx.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3104ceee-72b9-bc40-a5f6-2c5a7920e443@amd.com>
Date: Wed, 10 Feb 2021 11:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9d221e6160813fd188de26d3b56443129e9f8003.camel@gmx.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e1:ad6e:a509:1753]
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e1:ad6e:a509:1753]
 (2a02:908:1252:fb60:1e1:ad6e:a509:1753) by
 FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 10:42:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91561d1e-49e0-423d-be59-08d8cdb0927a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4706:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47066FE6848FBEAB6671AD9A838D9@BL0PR12MB4706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: duZhRfnDZrI8xKW+XEj8NJYpDWYQAmAE3hlkc8mHS/t3goo+fvu1vat4DrPAeA0WujoMWegZTc3mL7SWi/+shYZkUNxMDTAu2eiHcYiRWSTJQnxyqLsWZROTpDVh3FhDQXBC9ynAPTlQ2Yzh0nXXKpT8tdlFjkMeH0yXwSdvr9oVyKI/NHGcR7X1KEhjs/MWbF9IHTtdO3rZQtJOgbEcPc7Pdb5hbBIrWmzcpGCnPPc2jw6L/TSpJ+AL9E4IPRICXEijQ5doTlloSNtRDNaVA1Fv+XDFs+3ndey3wG1bROMwXrhSVzJQLbKFUiTvg2mIW1wKOpLPf11/L2K5xnHDUSiixykcYec2E2IUUpDi65AxPkSNeQpDmT3OJnKNRbTlLIzx4EawDt2fLS797oob7XbjFvZhU9JqQElU6A4YGnhLYOzb9qFFUsuaL1j1kqCsdEL4U76PKoscx7UF2dItuI8rm2TaavL1mBu4u4VUfqDEUI1VMDkjaAXmL0JcSAojKzvS1GZX2dRJG4qVBMSt20+osFplEl7h0XV31BnRAjdWlCKFpRTzQFQmAfO5zM1CSbQNtXUnc0rtwX3ZNoLz/T8IyBio57vWih0xjRItsuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(6666004)(54906003)(83380400001)(4326008)(8676002)(66946007)(66556008)(4744005)(316002)(16526019)(110136005)(186003)(31696002)(8936002)(2906002)(86362001)(2616005)(52116002)(36756003)(31686004)(478600001)(6486002)(5660300002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-15?Q?QGxpxCFAZRaNQvSKML7vbhVdKl0AY5P1Sqp6C4KPh7IVsv5AHBulU3+g7?=
 =?iso-8859-15?Q?kR9RjjUICddmX+ROgiEwfU2JwN84SW8LDCi4OWKXSxDWmOgbMmllFopnf?=
 =?iso-8859-15?Q?Vsd5oxOYhy/pxAYrvBtHSJM+W73UlQ7Iex5K0cB341T0fsR/djDEvCxVz?=
 =?iso-8859-15?Q?VGI8n04X8xIQjWzhNiwZQwbKJB+YhQ8NdnEQgNot+MtENelp8ncBo1eHw?=
 =?iso-8859-15?Q?ywIVACz+ouv06IvmyQMc4TltREF1F40PZwsEvNgMn0agxvZ7qtTg6JMdt?=
 =?iso-8859-15?Q?rsb/VkBQhQLR6Iqq8f/FBmGKyBLqaW9vBlwtSzPYyaL51mUPBVfZ8qcEA?=
 =?iso-8859-15?Q?cgRDKFE/tm1i1gN+SlH1xuRaiKgllpnHFMMiRsrCXevlABKpPfPFPJisF?=
 =?iso-8859-15?Q?7lMJAL3NhemVtcVbvmo7L1SHGXDP8Q6ZNduVcR2NoJtGv1mndy0vg5uh+?=
 =?iso-8859-15?Q?iZtSQj12J9Of47MZ6Nlb1fcmI8bzUhYipQ5vIrO9+WmLRTXEE1AswibzL?=
 =?iso-8859-15?Q?rHi2DTXfvReZN2ORqJ5plomalQ1HbtmatfSx+PIAtEPKcz3E5/juasCvf?=
 =?iso-8859-15?Q?yHR6+Ic3grVQsWDaQsFyoYgPtatbWetKv2VwLDNmTmtUvZM/OFSfEb8bw?=
 =?iso-8859-15?Q?rvGQie9/0mrZor7yH3Kj3HBxvdLfV49uTDJFe7oz2urcxOF4WZ26KBuJp?=
 =?iso-8859-15?Q?C15RaP0WPsquKdjtJ4SRMTXK1635OVatoKMSEzLi7rnyP0j3Z4pfgBYT4?=
 =?iso-8859-15?Q?yfTqSij2MiHS69CaugVqaFwfuSEvA6mVl7eNz7yIy3Ssz0As7FHAlzvTZ?=
 =?iso-8859-15?Q?MKKj1W09bS4oF+AZuTUXPCFFApOAAvDZqztJ63EyEjoKNSARwITaMCBvq?=
 =?iso-8859-15?Q?hOg7PaG50ziT8Z/vgwkx1aInHmryfmHjQwxrprHkzkU9VUBjFT0bQzUj8?=
 =?iso-8859-15?Q?HVkzwCdeHCc7UPbKP9LxWdDZlQV9xuhtf9wPPfRtBdTSy4z0OgQ4+TkW+?=
 =?iso-8859-15?Q?TSkK6Ce2C7m4IeNT3u5njNUnu1kNpu1BXyqzE9yCwxCxhDlzcjDjU7LkX?=
 =?iso-8859-15?Q?eeUu7tdU10brnHy0IHbVAIBRElPCfvQ8fODIDx07FmfYgATVExrw+2SmA?=
 =?iso-8859-15?Q?sFBFhOzodpCn280j/DryphVmnc/dfgbc+c4WG1fKXiPVQZtHzpmNFUiIC?=
 =?iso-8859-15?Q?RMg0mNBCP/Rd+GcDRSVQoxXTAZ3SR7V3KLieiZMq3mXmPVX0fSV+fX0kf?=
 =?iso-8859-15?Q?5HAyxqyQJ2pVkdnmoKOEAD3DGUgRz2GzpHmF8zo0DxG6uIGi6VCJxXleD?=
 =?iso-8859-15?Q?eKtUwPMBJWsixrTx3zXF1NVFH0hLc5KRjnMqrqsiIwuVJvEe5kC2/V588?=
 =?iso-8859-15?Q?cAomCCfM/M8mAKr6wCRganxv2BUUjk4vJL1nu9ZPPwX7e6msQtJiH0jQJ?=
 =?iso-8859-15?Q?jjK2vPZzrJTPz9NwOdTzHeSR27kcvTjE+Jln2Z5s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91561d1e-49e0-423d-be59-08d8cdb0927a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 10:42:33.0130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3Lf8a0pf43GT+pktOnjtjogl3RW7Ndxyf3mDc997rCXJIj3flt8taAgg9SHM2l3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4706
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



Am 10.02.21 um 11:40 schrieb Mike Galbraith:
> On Wed, 2021-02-10 at 11:34 +0100, Christian K=F6nig wrote:
>> Hi Mike,
>>
>> do you have more information than just system stuck in a loop?
> No, strace shows no syscalls but sched_yield().

Well you can try to comment out the call to register_shrinker() in =

ttm_pool.c, but apart from that I don't have much ideas.

Christian.

>
> 	-Mike
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
