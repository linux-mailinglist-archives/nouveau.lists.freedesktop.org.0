Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C271A382793
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 10:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139EF6E900;
	Mon, 17 May 2021 08:55:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51456E900
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 08:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHWbPz7r5Tl9Io8+B9THoyNom/hmdsfE/R9uepMrhLxTjckO4JU0RTWQqF9ozyeCECQHKUnNsWLmSSf5c8NIdLIAUIaMVLKkxrgcnKYT6KHRIEGN8BYrKQAzOXCT0LdP/BoiEEYqtI3ZW4mYYKG53V3BVpgvh61EcLOXyxpTeJRsLkfkU7tlRwFWNs/0ZZP/Z51SZZegYMRUGJ/2nvSq5IB9srRsVoIBY8wAnmacDtjwwOggkXQtINNurRmzSKV5gk3l3L23utfpN2ME+xz1xLHAo3Ov3gpurrE7TIcL3bvtjGmArCMKz8UKTjoDjZZ7FuOhMxZM/EQKd8GJLmwpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBBr211N1lHoD4qs0eDTun1E7dEyeWRGW+ZwEK45FTE=;
 b=kmrPkbrhfDz1bmdYfDKMlWc9oI5ZwfMPuok0DD6PD7hegVublcLCCzS3f0iSPeHuHKzF6heVOYrlLZJQvr5Z2iSKA/b71QRDexr2oUg6QIzkOa/cEuVIYsrbCLNbB3wHZKT9/foYObLUKR6/gudQKUi2gmiFDhIQEeoxyRBFoQbDtg44XSSnnuyhhjz8hlH8Jo2vFof2Su115CpUmrNDX+hyowmcG2JIMSUSnRFYjQccvae8lLW+avc21fTL13FYvseKXgHDxvKCXxKls3iHDNwPGh7rd9f1dccGUwA6HkO4flKHohkPkmJb7WVAHScyO7tDOOT4Fjto+LNyZ1q4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBBr211N1lHoD4qs0eDTun1E7dEyeWRGW+ZwEK45FTE=;
 b=hlOnmu6dzeVCLxFn/VsHscVa5Z2456AGlY3Qesmir8Cx0lLLJAqsKlzdICq1otoTC8LizgC+Tl1R85rJ3TQziDg78qA1K7GGJg7CX3pRiPxO3vY9BxUEoDXdPQZM6WCuCBlTM+Sk/nTEvbZojbG2Kxl6Zeqct/W3OwI8+3Lbu7uLJbSKRX0ZBn10Bq52PZQIj9rxeZC1bB+vDrsB1JGjdIs1F7PJnG3oNeuZSmVzo/zLJd/XpEdUBqUrbjM2r+kGbHusBCLyy9juh6qg1LuAmh0PPu2vThh3D3+ZN+4H/lflNcQOg8EZggFkvR9VE89jFLg3toq5WXtmjrGtHL1Nbw==
Received: from MW4PR04CA0250.namprd04.prod.outlook.com (2603:10b6:303:88::15)
 by CY4PR12MB1320.namprd12.prod.outlook.com (2603:10b6:903:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 08:55:10 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::d) by MW4PR04CA0250.outlook.office365.com
 (2603:10b6:303:88::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Mon, 17 May 2021 08:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 08:55:09 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 08:55:08 +0000
Date: Mon, 17 May 2021 10:56:26 +0200
From: Thierry Reding <treding@nvidia.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YKIvusHWjax1dSqf@orome.fritz.box>
References: <20210511163553.2344244-1-kherbst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511163553.2344244-1-kherbst@redhat.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0828891-5692-476a-ccc9-08d9191179c4
X-MS-TrafficTypeDiagnostic: CY4PR12MB1320:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1320CC8FFB9E95A7B9EFFC53CF2D9@CY4PR12MB1320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFlMYg7Ibc4xKmPGeAecoKYs8nH1YDgmAC9S+vtCEV38Ah7onA4qXTBVSZCaEefMYK/iRwIwOYNRlcqfS+SFbPHwi9EI1jos+bb9+Xuge76UDhyXfK+br/HHePudWA9RPRt0PaHlmG6Y6rDukXVwJiiMlinLVjjT1NITsJ4zOx/c9xNnTTe3lIyMsjJjWJp0xqqZdXiXG4pAImXmpwqUg62+H3Go2Ibz0l4wsOdguUHthX0Qv89ObNE2+L6Zt/QmPBrNbahTVfIOmx/QGR9T/CzAsp/4nWPWJymlqI77qTgEEdoiQQMXNOBCRW+bRsLgn+q4le76W0/9qSidumCDVCg1OkeTY3tyGD1COvBfM5pwM0RRgIA2ZYMeIZulid6i3R4OT9ObTRJFl9QmVV4hGVC9G21RHxM/mqC/OKtAXUTeyp5DkhBRDmhOpbIpe73CTLkNJcsZmcvsqtRE0cY5FnuLyW2Sqs7SoJlBYVWGT0yOQzD1TC8LyPYi47K6rQHyFPDZm65yIndW0apdjWwwTJTTIDFDuPQu8NElWEqL+8qKsYv6gfzCJ1shbUTfvR8+cBVaz+LNG3OdCwcMDC8RkBkh9pBuqnANhpexjgvDG2N2nMEdLEfeA+gxIR1oNMxKQp9WNu37r388sQlyvTeAy6JZyvidXVAriQNCmXOTczdeb/a6ERoTlxFb0Fdrvx20
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(83380400001)(82310400003)(47076005)(86362001)(356005)(7636003)(26005)(21480400003)(478600001)(6666004)(8936002)(8676002)(426003)(336012)(6916009)(70206006)(70586007)(2906002)(36906005)(44144004)(316002)(16526019)(5660300002)(82740400003)(9686003)(36860700001)(4326008)(186003)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 08:55:09.6695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0828891-5692-476a-ccc9-08d9191179c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1320
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
Content-Type: multipart/mixed; boundary="===============1021471600=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1021471600==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iqIk3hJYFYOCSu6g"
Content-Disposition: inline

--iqIk3hJYFYOCSu6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> If ttm_bo_init fails it will already call ttm_bo_put, so we don't have to
> do it through nouveau_bo_ref.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
>=20
> Use-after-free write at 0x000000004dc4663c (in kfence-#44):
>  ttm_bo_put+0x11/0x40 [ttm]
>  nouveau_gem_new+0xc1/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>=20
> kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=3D792, cache=3Dkm=
alloc-1k] allocated by task 2657:
>  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
>  nouveau_gem_new+0x38/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>=20
> freed by task 2657:
>  ttm_bo_release+0x1cc/0x300 [ttm]
>  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
>  ttm_bo_init+0x5e/0xd0 [ttm]
>  nouveau_bo_init+0xaf/0xc0 [nouveau]
>  nouveau_gem_new+0x7f/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>=20
> Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM objec=
t"
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index c88cbb85f101..1165ff990fb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, in=
t align, uint32_t domain,
> =20
>  	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
>  	if (ret) {
> -		nouveau_bo_ref(NULL, &nvbo);
>  		return ret;
>  	}

Looking at the surrounding code, I wonder if I just managed to jumble
the cleanup paths for drm_gem_object_init() and nouveau_bo_init(). If
drm_gem_object_init() fails, I don't think it's necessary (though it
also doesn't look harmful) to call drm_gem_object_release().

However, if nouveau_bo_init() fails, then I think we'd still need to
call drm_gem_object_release(), to make sure to undo the effects of
drm_gem_object_init().

So I wonder if we need something like this instead:

--- >8 ---
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index c88cbb85f101..9b6055116f30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -205,14 +205,13 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, in=
t align, uint32_t domain,
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret =3D drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
 	if (ret) {
-		drm_gem_object_release(&nvbo->bo.base);
 		kfree(nvbo);
 		return ret;
 	}
=20
 	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+		drm_gem_object_release(&nvbo->bo.base);
 		return ret;
 	}
=20
--- >8 ---

Thierry

--iqIk3hJYFYOCSu6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCiL7cACgkQ3SOs138+
s6GwMQ//W7O4NsKtiMhJmMgh6yXdI/mwRLjDH2ld1nCe5A7S141iGXltdQpd4ET1
0ICYnUFs4Gagdmo6MrLtRDF7W9XHvAIfUgibBk2Y1KPw7E6OHYdNCPsEia1D3e4n
ChIAS61Dmkq5UuVVLYo7HyvCbboJSjdE8kK68GhmCUiIyAe2yXqG0Ed143onkmhm
a3sjJJANNWZ/n64EB0S/nvAt8YUTp4dE3/n2F5vqcMcttSPkSzkEluU6U2yqMqqF
PAv1W2VCcbENKaEtvjCf30Xx7gbDCYw5HbKfzbvcHVDom9hC9qaFMHLwWj5wLIYJ
5CdBDajRXN9sw1nfBJ2sLtwGu5CITq+xp8oiNokSgKCjRgcoXJj+yutFFCGsy7KG
sIR2n3ytt+Qo5MpAIBH7TKgk7I8h8Ym7Ft4yuI3dx28KbwavuhAKWm/00pQu5YU+
UqsBpH6g0lhBNqwZs9dtmGYwAPfqhGLFj5ZGNNbHVm8FPj5++8utxAEBOZ0C/Sfi
dlJE8Q2Elt9OtJx/lbeYzsFlYNu6GVms6VRKTrSpSiGyoqHxiZAcs/lCBOgRWrVH
kC/4nOYNtQVTBVLpMg7pedUrBsLdsJPgsnp1zcCzAa+wg56Sqn530SxnyfnFtkEG
4jAo2spWsTa0tDntq7absjVWtzNNP8ahu7b5TbFy+5eudCoCzM0=
=RnlY
-----END PGP SIGNATURE-----

--iqIk3hJYFYOCSu6g--

--===============1021471600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1021471600==--
