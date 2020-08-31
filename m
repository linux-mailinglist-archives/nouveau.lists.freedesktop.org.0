Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE92578B5
	for <lists+nouveau@lfdr.de>; Mon, 31 Aug 2020 13:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DE86E15A;
	Mon, 31 Aug 2020 11:51:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75D6E15A
 for <nouveau@lists.freedesktop.org>; Mon, 31 Aug 2020 11:51:23 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4ce40c0000>; Mon, 31 Aug 2020 04:50:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 31 Aug 2020 04:51:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 31 Aug 2020 04:51:22 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 11:51:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 31 Aug 2020 11:51:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNdpwigkA6aoNvkOfQoUNLkDna49wm/6hQBsli71/mwjfA9WtP8jo0GjiUhV0T7AWLCtaSbmkvPZj+utv0E1qagg5WoaHBP+YRfOUThdiKOfa59fIanZdIyCR91tWJOmLk89blSpIH1g2pVkBUIs2VF5tRYyJ635wx36GcfhRkQnmUXkSpUUKpM+q7f/deEGFMA1gDctH5Z4e1kXaYKkOk9o9tK82lmRnhNcKkdpY2vnuwC2FzNrmyROBsDaSZ5i4QgobJ5wrsDa/XQ2nRjprHq31MFVjdIUspGvHeL8oXc1nmhvtZcAKbjTc9JFsWxeBlQUiYJtIAMCAsBEUOvSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9bB2T6vB7oAyFV4cZFOTevntVTBdVR21sxJ63Igwwo=;
 b=V3lT9p0Q18yauu+6eRodxctAObLnnylpPtSR1Q+yUOTi3lhuuwJcPFZJaEjAIMtMHG+o6nHAN6LFWBNHeSMWmiANykpyB4V0VCuQNEJTCJSx0fzRSLViGHHIt87xcfGadhILL6Za1isrv768Yf/NOQGnADpNpQpTaLwdRJ6b0Ln7d4KzhKvWcI8OpcGitxnfIdcFQ/ylmOe+ET6XcHVlYhuPyDfD2NwkLc4w0B0ckUQJNY7sjmufRMzPLnaFTbuI19J2NPC7eJv+L6iDvLCEPWAOeVHJTWWdAwXLN442giv7QO2arnINUZ1RNXkGK6k+QLv1ORhsbc466q8IVRrYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 11:51:19 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::2d79:7f96:6406:6c76]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::2d79:7f96:6406:6c76%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 11:51:19 +0000
Date: Mon, 31 Aug 2020 08:51:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200831115117.GU1152540@nvidia.com>
References: <20200827213744.14074-1-rcampbell@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20200827213744.14074-1-rcampbell@nvidia.com>
X-ClientProxiedBy: MN2PR19CA0055.namprd19.prod.outlook.com
 (2603:10b6:208:19b::32) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 MN2PR19CA0055.namprd19.prod.outlook.com (2603:10b6:208:19b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 11:51:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kCiLF-002LjR-Vy; Mon, 31 Aug 2020 08:51:18 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec042b8-4cb3-4361-2d5a-08d84da42cd5
X-MS-TrafficTypeDiagnostic: DM6PR12MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB32097F522E27B21FEDB01650C2510@DM6PR12MB3209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxZdsDAmV3J+7y8DGMCUa/3KVOE/zbW55s7Op492fvR/HJKYVx0Q5N2ubXJCDDxOCp7bB0NWCy9lrHi6gWrUp4p+/rG9BHhnUmwzwfxM9WuvtOe5ZboN7oD5Q+UxrbtyQgVE48yT37nbjGkd/VI1VhAvmDCvODcpiEp6+2G1Yglt7zngpz3Vg0+97UqperUTbZgjvc+uDWvyWzjJL6wP8F+yNgYqVGwGVME8SrU+mG1OW0VWwywLiKJ07OmxxDN6mfxH+CSf7ejWa8ZXij0RAWR1KhQ+1GCfclAaHhb0wCprNZRCBumRpeZVQPfwNf5onOE8w5x33qUJUOidTqKItw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(66946007)(37006003)(9746002)(186003)(6862004)(36756003)(4326008)(54906003)(478600001)(86362001)(9786002)(26005)(2906002)(316002)(5660300002)(6636002)(66476007)(66556008)(426003)(8676002)(1076003)(8936002)(2616005)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zQfLcdGzZyJXITtux7csPEipo6tbnmk9fILXf5+pYf6tvJZNimYoAi8U6Gs4ZIM/Am8TmTyjYhXXriRD9hn7jV7hBYklL0hzrOFaGlbAy6XBi0KNFEl4ytuDSZlx+wocVv15/vtpy2nXkDpJxvgqs84i2GcVWKzKEPOu3V9VMrs9pYSBHCYCRJ6Tq6U2wc2AlL4e6oPa8nGUo5V/wftVo80Hp6DnEApByxE8ox8LRL+i/B4ttSoDWhtaYmM3ggGA516I0FK02PnU2Bk4cYJWlS3hYhtwwrIl9w1oUJD7dGGGuJyJ1PEvhtlh+KT0PiNL47gFr64nvI6xcOxWssDXQmaNHDaql01UfAaH3RbENr28lLt/l22sR4ULIs0XPRakyvnV11bo3tJusD5ltGKi0TEJorj89nNL9gSKcpXrZYIolqtrOBG/JsAJs1R9IeiVZkvhbCf3Kbwwv6EqN3/hnNn8CA/XrhoiNUugSyPT5/S+PXpBGvs7dQNVWP2WIOGXWl89vpMzaC2q3DyC2cqxJV8tLF3NpEJ0+L3duFrhAx6U9X1kO5iy64i5X1X00vyxJqscp3/lcj475ACBr2yX8rBVfgz4dwk0vz9Q2LfK7A1QlaQy//SZmuFgwqSjIYkIxM61wVh17jMy2DxjTF3yUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aec042b8-4cb3-4361-2d5a-08d84da42cd5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 11:51:19.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a90FM6qmxK91vwkjcTHaWld5xPQV3AIuTeHoyVJ8DfZ6FaB3RbUeUwZksVhlsCUE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598874636; bh=m9bB2T6vB7oAyFV4cZFOTevntVTBdVR21sxJ63Igwwo=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:Authentication-Results:Date:From:To:CC:
 Subject:Message-ID:References:Content-Type:Content-Disposition:
 In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Originating-IP:
 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-TrafficTypeDiagnostic:X-MS-Exchange-Transport-Forked:
 X-Microsoft-Antispam-PRVS:X-MS-Oob-TLC-OOBClassifiers:
 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=lfLiMA3CiB6UStXih02Q7/sM1LzGjqSkBcC7IbuYxTNsfhzh4a18/PEqW0hmCiOOL
 2ApIraaB2CSwn72593RJsLQ1yAq/k2geIVXSjBdV9/uek63Wggcqvdb20KLqlvyzXR
 hFQ/OvsOoTQkSaGkKjGTG6jcj0QZ1kEbqco3LMQA0xE4bQFs4EZtb1ufvihGr+winl
 szUJJ34sQCWZcI7NdeK1Q+lriYYsjAGMwW1XjYK+u9sDy32eKYHt1+xXmhfzOo+XfT
 XrmJxcdpkvNLQqPOLUf/zzNr5V/u5evTgq59UDLh1aWc9vjjrAlA60soiBhRG/NZpz
 oV/lWvGHm0Xhw==
Subject: Re: [Nouveau] [PATCH] nouveau: fix the start/end range for migration
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 02:37:44PM -0700, Ralph Campbell wrote:
> The user level OpenCL code shouldn't have to align start and end
> addresses to a page boundary. That is better handled in the nouveau
> driver. The npages field is also redundant since it can be computed
> from the start and end addresses.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> This is for Ben Skegg's nouveau tree.
> 
> I have been working with Karol Herbst on the OpenCL mesa changes for
> nouveau which will be merged upstream soon.
> With or without those changes, the user visible effect of this patch
> only extends the range by one page (round up vs. round down to page
> boundary).
> 
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 2df1c0460559..888aa0908c5a 100644
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -105,11 +105,14 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>  	struct nouveau_cli *cli = nouveau_cli(file_priv);
>  	struct drm_nouveau_svm_bind *args = data;
>  	unsigned target, cmd, priority;
> -	unsigned long addr, end, size;
> +	unsigned long addr, end;
>  	struct mm_struct *mm;
>  
>  	args->va_start &= PAGE_MASK;
> -	args->va_end &= PAGE_MASK;
> +	args->va_end = ALIGN(args->va_end, PAGE_SIZE);
> +	/* If no end address is given, assume a single page. */
> +	if (args->va_end == 0)
> +		args->va_end = args->va_start + PAGE_SIZE;

That is really weird, how is it useful for the kernel to map a region
of unknown size and alignment to the GPU?

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
