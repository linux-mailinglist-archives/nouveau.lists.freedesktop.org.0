Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DA382808
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 11:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E286E919;
	Mon, 17 May 2021 09:17:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7EB6E919
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 09:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHHk8hVzPl4HbZ3w5UH+cNUkTw/ewcZrdN2kjemkcpR00rITdXMx4WO7Q7OlfpXO97Sy3983iJnPSEn0kLQdRh/WYcEWjIAJ01v1ybJ54PedMISkXZEfJMcFPzM35L1JG2pdho0ZiefN62HtkmCH193kUN1bOKylZiEOzX5bPiX0xvhwtSUda/IQda3YlO5SiRAoD7fBKfZkqght/mPBCWAOoOQ4jkmuARHzY7rGn05bFi/y+1QrLsDdU0zMDzaALK6OKuwudBCdTxkhP95jgB5zbYZWu5jEgsldr6iHQVMd4K8GtG3B9iL20JOWUtTjwAogRokR01V3/WPF6lyzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nesIBoQOMVQhW205xg8TERDIFVWTbIScY8ByC7nNauY=;
 b=U6u7p5QHN8yYeW64uKZ6ZdwOdODxS6xvGqslSRwhCK6JkmXFlWtmTW5nBI5UckR8AFI6jMm61gE11wezlrfnhvLSPAVuSWJMLb2JYoIav3Z7njYLcnSRZ9Dp6a5BLeepEurmlUSu38p3eJxamjqs9sQGbbOBrwNcewLZtGQTQPSdawxNeXSNCKZjkFRVPGB5BTtjbSQ+xCL+3jwGL9ut5TTibZJ0qdW6Y4hIGyDlOjydX38jKFU9lHhUS6GlD9IxAYGD1ihiAqB+zPHw/uUTNwHPJcmBLg50P+gTbmwc7UuBtrlUHlAppTDBNgubnCAqVKCRxXgQz3rxxc9EKcbsrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nesIBoQOMVQhW205xg8TERDIFVWTbIScY8ByC7nNauY=;
 b=Wg8WGqfVgf6SO+nze5GLb2gVp041jYjTaa/9FfYnd+zBINNwq35l0TC38h7Fi0eXUJEcosinVT8cRaDF5o8rdBZKJahmaXYozzUP5ocLNWHivSInpMzGWCQoMEubop0VB3b8qJi/F/Pzi4e1HIrZE+S8MlaWjv3Zd3P/2K2k/ZRYkccjqcimPUtrFYQ0Y0SXD0kr78Jc/KT8aUeR6HoiMkdR1nPX2n/9Sul/pcJA5AdoOOn34R73b8KkWdg7x/Fj2LvHycs/DsU/OsrNdH2Aybd3hR1V34UBpqL4qNuj+0ZoYfd0J9E9jq3s3gXSUHH9mV+csTcM66s+A4XWGou9OQ==
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by BYAPR12MB4711.namprd12.prod.outlook.com (2603:10b6:a03:95::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.29; Mon, 17 May
 2021 09:17:46 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::63) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Mon, 17 May 2021 09:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 09:17:46 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 09:17:44 +0000
Date: Mon, 17 May 2021 11:19:02 +0200
From: Thierry Reding <treding@nvidia.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YKI1Bp3vD5RFTy7h@orome.fritz.box>
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YKIvusHWjax1dSqf@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YKIvusHWjax1dSqf@orome.fritz.box>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a405d57-9ba1-4fa3-f9f9-08d91914a240
X-MS-TrafficTypeDiagnostic: BYAPR12MB4711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB47112D0D355FEA8B2A26521BCF2D9@BYAPR12MB4711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rkGsLj7mC86FjJXw1jFRA51ufzhA6OVuccoOHRoM68PiNftpZnVuasGQt10MywsxaqsUMNDHFEyvmccgWG5v6eBd8Qc/mIkq2WKn3QDkEQiD8Tj4WBbR2DJ9RzZ6/gVd3QD0DE8gDb2YCmnP3HOwsAaZtRo3HCtqbZUqYgh4PIwDJNCJMr6apbGwWpTH929Q1Cb8xT1aN/kRCMg1t9c39tkcZ7j6AgWhq/pf/26qpdQUg+sCfxof8E1Hu9aHhZRAzOoEa8mg+wBb+c7vnSUtewcW8o/ttjIxOLK4p+lWPuOWiyM9wHoNQnSUSozKscKfkaeqSdqV3Q64n8Z5AAEibBB33fcdYWUkqJFkn+9uXQ5M5Zi/7csHPxteOdS3XEjp+EVTMjHF4PNb3mbnD9ahfAwpT77a62KHiRkrcipprWHuZGqm6cd2pG/6kBrbrm1i5ymX9ltuvuDMQWQhDed/aZiNvRXvkjI5QztCUgUDryI8313zYoIMZ2YR9w90txc//fRqIs39GZZLWHhex3dFesyqGrNYW3ryp98xnEOXXZH+OEXyfTmZjaYlgLrUN+KotxcXLOPvMy0ipzptYSreRdtag5cpzpvE3QQx1Gup3Orky4JCvtNBfuGSWZ8HA+y3GmQZrvQrHe8srrnpnAFlLGxM4YLoWtJYGDhwEWStGhsCh21t3PBXoSgcUfPZe/x
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(46966006)(316002)(6916009)(86362001)(8676002)(54906003)(47076005)(16526019)(44144004)(36860700001)(426003)(6666004)(336012)(186003)(2906002)(26005)(8936002)(70586007)(4326008)(21480400003)(478600001)(9686003)(356005)(7636003)(83380400001)(82740400003)(82310400003)(5660300002)(36906005)(70206006)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 09:17:46.0014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a405d57-9ba1-4fa3-f9f9-08d91914a240
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4711
Subject: Re: [Nouveau] [PATCH] nouveau/gem: fix user-after-free in
 nouveau_gem_new
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
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1487267886=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1487267886==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VE3GsxeP+mHPiY9X"
Content-Disposition: inline

--VE3GsxeP+mHPiY9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 10:56:29AM +0200, Thierry Reding wrote:
> On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> > If ttm_bo_init fails it will already call ttm_bo_put, so we don't have =
to
> > do it through nouveau_bo_ref.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
> >=20
> > Use-after-free write at 0x000000004dc4663c (in kfence-#44):
> >  ttm_bo_put+0x11/0x40 [ttm]
> >  nouveau_gem_new+0xc1/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >=20
> > kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=3D792, cache=3D=
kmalloc-1k] allocated by task 2657:
> >  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
> >  nouveau_gem_new+0x38/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >=20
> > freed by task 2657:
> >  ttm_bo_release+0x1cc/0x300 [ttm]
> >  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
> >  ttm_bo_init+0x5e/0xd0 [ttm]
> >  nouveau_bo_init+0xaf/0xc0 [nouveau]
> >  nouveau_gem_new+0x7f/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >=20
> > Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM obj=
ect"
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/no=
uveau/nouveau_gem.c
> > index c88cbb85f101..1165ff990fb5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, =
int align, uint32_t domain,
> > =20
> >  	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> >  	if (ret) {
> > -		nouveau_bo_ref(NULL, &nvbo);
> >  		return ret;
> >  	}
>=20
> Looking at the surrounding code, I wonder if I just managed to jumble
> the cleanup paths for drm_gem_object_init() and nouveau_bo_init(). If
> drm_gem_object_init() fails, I don't think it's necessary (though it
> also doesn't look harmful) to call drm_gem_object_release().
>=20
> However, if nouveau_bo_init() fails, then I think we'd still need to
> call drm_gem_object_release(), to make sure to undo the effects of
> drm_gem_object_init().
>=20
> So I wonder if we need something like this instead:
>=20
> --- >8 ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index c88cbb85f101..9b6055116f30 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -205,14 +205,13 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, =
int align, uint32_t domain,
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret =3D drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
>  	if (ret) {
> -		drm_gem_object_release(&nvbo->bo.base);
>  		kfree(nvbo);
>  		return ret;
>  	}
> =20
>  	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
>  	if (ret) {
> -		nouveau_bo_ref(NULL, &nvbo);
> +		drm_gem_object_release(&nvbo->bo.base);
>  		return ret;
>  	}
> =20
> --- >8 ---
>=20
> Thierry

Adding Jeremy for visibility.

Thierry

--VE3GsxeP+mHPiY9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCiNQQACgkQ3SOs138+
s6ETCw/8DDNg4E12PcN3UCt2c1d1yb8sJeYRP6xQJqSFpihiFIZHLvzpjttbdypn
1iwbrDACsyD8/MwIIYkAA8wYgf5f9Ioa5D5HoR+nMXIRldoDUNHFxFOC3i0VPJFs
Ezm1Puh/whYkGUpO15uCw4f2ZJgP9Zq0XcvJy1xt7ewzMybWobN6AWkbgRViZ0Uz
9gUOaQ1Bz0hZrVrtO9HCjE1sMSbxaHxaCBZWJfo48YIsgp2l7nJ0yvk1TyoSzsA/
0hlF0zKfywPLkgEkZI0p6ks7xQ5YZF3StLOQL+jfnwKvfZKYuZMdKVE7DmzGv0M5
xW2xRWwmLlPsEO0540n6tmpfu7i+JNHHzLMjDwQAb3z4bGwstu8NHPHZ85jzZj5q
MnCR7sto6i314iaA5Yb9f54R2/gsmZXxIOoWEBJtDGiQEn9CoPRYRTXLx8fcC1mG
h5Oz63nM9y+dAPtcksmu23Lp/tOqWGkEtZ1HHgUH4g5b/ZTIpv3PkkUDYdQpS/0H
DDqdrwyVsFTlaZB0v5LsbDlHhHmCjm3w1QPlySh9dAnC5bFpsSzJuKQspf6u6YiJ
XaPe5sfAnU1ooGEY/rEZdtnlxasleNddo+3JtJ18fWLyR+qvWxP3qMOsbANfCtwV
JEH3UvnAgKDIrmfmlvvyZNaqbWNyy8feCGdV8+d9BRLbAOF9h50=
=jDZ8
-----END PGP SIGNATURE-----

--VE3GsxeP+mHPiY9X--

--===============1487267886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1487267886==--
