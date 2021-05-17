Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19113836BD
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 17:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFFA6E233;
	Mon, 17 May 2021 15:34:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3646E507
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 15:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYD6dwx4CPuFNtn7Yl0+pBnNmM+/TsB17fWsnlGr9L6WlfAKSqacCThbw+FQKrNSUVKFtOEMWAt9N7chHUqpvCh/vHvwHcNFGrKKkZtCItT5Qu31L8LU8x+UPZy7haJWOIST2l6TykusWpdxbQS1gDmDqmS2fhcjAvKJbLB+Oog0tlvFaViyj0UK8GsCMOLeY4F2NlnuvQAESpRHf7cMHBCtwVPKzmynGhGdvW9dWgr0/+NNK9Sh9gqDoGBGm7C49PiM4PaAJqgcs4fdCJwaS7i7HmNip1NSwmmQdBZSEasdRCEB5ye6fJiK0RrQClH6M/0qPoqC0t977KUo+9af+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac4fnNUl3pX7WEoytpPJfSRg4lPQWhWGAf2vJGhuisg=;
 b=jtxqsIktnCC+CWK8+6ovNwQCqsyBBfdpYKWe0lUDj5IDoyihyhY+fbCq3bz/ZVaGuZz0Li2qzk4mXk+wnhvT5PJtFLv34bNYp4hxqU6dpWhXG1Aw+s2v94SN7avM9f3ALQOHqZCvXMiCza1lltM4HEVhHfOMhakUT/kNMSE17W95lOVTlHFCRvZ14w/dUvamxzIdLO8cbom33HwXVu5YQ3xzOwZNIqGB7WmpC7sCOtbxf+MlqwMKJTWf0NhnPxcdvt/zoMZgzHK8xKSkN2XO7bZ9qvgVD6KB8gDGqm8Iri5rqaefOF5JAG6y2uiZ9T1BbOAoo3GSWBjgOhkOuJNgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac4fnNUl3pX7WEoytpPJfSRg4lPQWhWGAf2vJGhuisg=;
 b=nZZTjh3VBk4a6N+NM9RFxkwSlcevG29+34JB7FZVgPRcvf1uAsC59KxgT8ROpZrs/pi6FS78vrTfeoMI8/nF8sIWsW3thY0OAGT+iO7LKofGLi++O6w1SapiDwJt/FH7jQ0bacwNhWsJBtoV1AfIV+DZA0ECA1kdVEgDGriMdEnKynWlEj4RjLflBPC5HSHbqJ9O3a4u01knhIAr4fBzQN84ow0+BDpvn7YUOB45E08qjSAHIS+WYN6kxm2CERb/wAh30akkj3JrVpU5ilQAAnxEpq66BXjJ8cpeS+Ls/vsqNzFRfTZAMqSQaiNyHhkCmAX6vhyJgz6uN5uas8ZhKw==
Received: from BN6PR18CA0006.namprd18.prod.outlook.com (2603:10b6:404:121::16)
 by DM6PR12MB3164.namprd12.prod.outlook.com (2603:10b6:5:188::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 15:34:44 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::51) by BN6PR18CA0006.outlook.office365.com
 (2603:10b6:404:121::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Mon, 17 May 2021 15:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 15:34:44 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 15:34:43 +0000
Date: Mon, 17 May 2021 17:36:01 +0200
From: Thierry Reding <treding@nvidia.com>
To: Jeremy Cline <jcline@redhat.com>
Message-ID: <YKKNYeZE2evxKJ6n@orome.fritz.box>
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YKIvusHWjax1dSqf@orome.fritz.box>
 <YKI1Bp3vD5RFTy7h@orome.fritz.box> <YKJwfJfES/LrJhgW@dev>
MIME-Version: 1.0
In-Reply-To: <YKJwfJfES/LrJhgW@dev>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff585298-8be5-4cec-9cfd-08d919494bc3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3164:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3164CD40A265A0054720F706CF2D9@DM6PR12MB3164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PsyPy28FD5yvLUJlvHM1DjKoJfK0yMicuKummhtDDLiGgEc/Ykm5IW+ESsPHwdkKdml6G2hQGY46VQJBma5as4UzFNl4DTz2bYH8/aJbj33pAH1sSdKcajBZgRW+5lbpRLT3i6aXuy7HCfdhSmw1S7qDF9+k1tNJbRrzfduRhCOmnhoNGu5uK1tURfsMqlCD1cxQvEvgmfcjnTvHKlmsm4DEeoGPfTMtbSdLOGOlCswNnzjEHyhSyJHRn2XG6Kakf57dMZ87kz8DZMf6sshAG5iW6G0VzOnoN59VcPtw4+9/iGdzbiYP4Ng43RDJk6ybDLwWr7KzBryuibuWLzk1BEQiKLaf6kDucIC+TbfsNR7DT35IKseZoi5Yk8cmaRGXwatb79+TP7R1/HiYYOnRo/unUe2mHG1kF8F60NVNTv/skFBKqdoCUpkI5XSmorZudg5tF4wVw/1H3OlpR/WMzE8/fhJ5MjAW5XDAbA8B7iuMAFP78PiD+OyRcn3k25LiCA3WH0pX+CKv9v0AonV2Oj3NGA63fjRGudEa82TWXscFB7Hot19A6dx0lp4l2IKLIbT4zT/JWMZsW/PTPJcVLcfvfPalqTjrYvVgRR/HU3RXm/ZOIflg8pHDEgWCWZH+zY/S1NqkrHwyEgrbH5sGC2uwRFd7n1i37KUJ4FnGMHbG6B35esU7UMfvxN8SOjJ
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(8676002)(47076005)(36860700001)(54906003)(36906005)(2906002)(9686003)(6666004)(336012)(5660300002)(16526019)(6916009)(478600001)(426003)(4326008)(86362001)(82310400003)(83380400001)(26005)(356005)(316002)(82740400003)(7636003)(186003)(21480400003)(8936002)(70206006)(44144004)(70586007)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 15:34:44.2004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff585298-8be5-4cec-9cfd-08d919494bc3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3164
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
Content-Type: multipart/mixed; boundary="===============0328149274=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0328149274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QrvmivFmxLDKYWRD"
Content-Disposition: inline

--QrvmivFmxLDKYWRD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 09:32:44AM -0400, Jeremy Cline wrote:
> On Mon, May 17, 2021 at 11:19:02AM +0200, Thierry Reding wrote:
> > On Mon, May 17, 2021 at 10:56:29AM +0200, Thierry Reding wrote:
> > > On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> > > > If ttm_bo_init fails it will already call ttm_bo_put, so we don't h=
ave to
> > > > do it through nouveau_bo_ref.
> > > >=20
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
> > > >=20
> > > > Use-after-free write at 0x000000004dc4663c (in kfence-#44):
> > > >  ttm_bo_put+0x11/0x40 [ttm]
> > > >  nouveau_gem_new+0xc1/0xf0 [nouveau]
> > > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > > >  drm_ioctl+0x215/0x390 [drm]
> > > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > > >  __x64_sys_ioctl+0x83/0xb0
> > > >  do_syscall_64+0x33/0x40
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >=20
> > > > kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=3D792, cach=
e=3Dkmalloc-1k] allocated by task 2657:
> > > >  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
> > > >  nouveau_gem_new+0x38/0xf0 [nouveau]
> > > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > > >  drm_ioctl+0x215/0x390 [drm]
> > > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > > >  __x64_sys_ioctl+0x83/0xb0
> > > >  do_syscall_64+0x33/0x40
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >=20
> > > > freed by task 2657:
> > > >  ttm_bo_release+0x1cc/0x300 [ttm]
> > > >  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
> > > >  ttm_bo_init+0x5e/0xd0 [ttm]
> > > >  nouveau_bo_init+0xaf/0xc0 [nouveau]
> > > >  nouveau_gem_new+0x7f/0xf0 [nouveau]
> > > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > > >  drm_ioctl+0x215/0x390 [drm]
> > > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > > >  __x64_sys_ioctl+0x83/0xb0
> > > >  do_syscall_64+0x33/0x40
> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >=20
> > > > Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM=
 object"
> > > > Cc: Thierry Reding <treding@nvidia.com>
> > > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/dr=
m/nouveau/nouveau_gem.c
> > > > index c88cbb85f101..1165ff990fb5 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 si=
ze, int align, uint32_t domain,
> > > > =20
> > > >  	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > > >  	if (ret) {
> > > > -		nouveau_bo_ref(NULL, &nvbo);
> > > >  		return ret;
> > > >  	}
> > >=20
> > > Looking at the surrounding code, I wonder if I just managed to jumble
> > > the cleanup paths for drm_gem_object_init() and nouveau_bo_init(). If
> > > drm_gem_object_init() fails, I don't think it's necessary (though it
> > > also doesn't look harmful) to call drm_gem_object_release().
> > >=20
> > > However, if nouveau_bo_init() fails, then I think we'd still need to
> > > call drm_gem_object_release(), to make sure to undo the effects of
> > > drm_gem_object_init().
> > >=20
> > > So I wonder if we need something like this instead:
> > >=20
> > > --- >8 ---
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/=
nouveau/nouveau_gem.c
> > > index c88cbb85f101..9b6055116f30 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > @@ -205,14 +205,13 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 si=
ze, int align, uint32_t domain,
> > >  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
> > >  	ret =3D drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> > >  	if (ret) {
> > > -		drm_gem_object_release(&nvbo->bo.base);
> > >  		kfree(nvbo);
> > >  		return ret;
> > >  	}
> > > =20
> > >  	ret =3D nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > >  	if (ret) {
> > > -		nouveau_bo_ref(NULL, &nvbo);
> > > +		drm_gem_object_release(&nvbo->bo.base);
> > >  		return ret;
> > >  	}
> > > =20
> > > --- >8 ---
> > >=20
> > > Thierry
> >=20
> > Adding Jeremy for visibility.
> >=20
>=20
> Admittedly I only skimmed the code so I'm not extremely confident in my
> analysis, but isn't that handled by the nouveau_bo_del_ttm() callback
> which should get called after the last reference is dropped with
> nouveau_bo_ref?

Yes, it should. But the point here is that we need to get rid of that
nouveau_bo_ref() call to avoid the use-after-free (which is actually
more like a use-before-init in this case, because at this point the
buffer object hasn't been fully initialized yet), so we won't actually
be dropping the reference.

Thierry

--QrvmivFmxLDKYWRD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCijV8ACgkQ3SOs138+
s6FoEg//aZABuv4nr+4HrkFWdRHK0s8e3oSv2pn0N4KEqPS57ybxGSt8CXD35Fj4
nL+muBRuAy/jpCQDOJ5YrDH78+U1SEB7rs/kkbSYRXxkvunj1DZvYu6YwG6VozlU
Z///kucdZV/ce9eBoC6jZjuc8tCyuI23ZgePaxewYnSY2YhU8KLaE+UoW7SohM5O
QjpKEGkmT5ihgEEmWB4pJe3wxEBG81vma6O2utE/BWie0DYgq51k5gaEJa2IWSZ5
EVLfhQHDDkfzshlzR90CAzJMN5UbGoG2j8TTR6N7v9q4ZEBSEHCKW2amxrplGjUZ
PDxDmVa65Vi4myKNp8KcsmlfTZlIkFlk7fZAowsHhJAFQCGrj5L4+FKOioCTb+jP
lSCDCg0Yxw62dfM8kJdGjLwMKf+TeC2lqga9xojmL1FEov7sk1tiCKn2QH/CEaXR
Lk9apnAXsyyahUxbFH4nvpNPmxfG3ClH8L5K/KI7FD9xbidUhio26q0R+tM8CB99
+0S1Q1KoophdhRaF3mQDM1aSlyz1hIN09MolMHTpHOmdXhRAlyTTBJtZJE2kgmNi
g6fDAc41IS9iwEw0CISBga6mB2XpDeVuVUrdSGyQG+POc9MJsk9LbIq84qmpi7LA
E3KS301kBLzDiK3vgf1Mi7R9PESlU8tgi5p/J9ETR1X+3sCUUmE=
=lPe5
-----END PGP SIGNATURE-----

--QrvmivFmxLDKYWRD--

--===============0328149274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0328149274==--
