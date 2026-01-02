Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA4CEEF5A
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 17:21:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7699A10E2B2;
	Fri,  2 Jan 2026 16:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKKYwXAy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E3C3544C8B;
	Fri,  2 Jan 2026 16:12:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767370376;
 b=SRFAW571RN2vH3LKL938KaI5d9/3iF6PCAh5i3t2IJA/DEV2s/aMeQP6M+5w0LmbJPdMo
 L4/gPzd40NQ5/wNNr4fb3iL6/IM8VHbcVpYCjo0H/AI2R/ynP3yV0gsZzOHXiADzWJJwh8j
 QPMRi9EiKd9pkYAfYaj1OQF57yWP3n8aqcoPWOBAg7Vw8Zr5g0IrvryVOMXMnNpIDz1Ac+U
 upWe72lgPvv17xfv11YXkEti4zXeAGqyp2s/GPPmruDPrufj5VqMoc0CYHZqilIiI59iggd
 O4qQBY1vQo6BO24H9rUqIyroSL2jUUonZ2Aum/Vxn9C11TxmTs4+6YmeyzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767370376; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9tu4+qvE4HVhlD3XFHpS0OFSs6sZmg8C8rk5ZdNmyzE=;
 b=V7dMXasq5QlXSOjAEW/bZCi2xjVBoRYh45QwfbjrRjNmtdbrC4jBVpeSLNH5Ntb2VGiDU
 dU91TBOlKDgr91wme3s4A73GGPr/8gtixRTAYjPccCk30faZlflVuA4rFxRoqkjm8qW3Kpi
 yX3UU6uPFX/JIVxBb7vVepKxptr3jkpneVVKcE+yt3SEOjN8L4JTgYx9P7Tfo8OggSkCeuC
 ryfenE1bhc7UVnRgdU3KLBWTV4S6I0cyrSt9wKtmcYUiStRO5DzDG5vpmBH4p+WRXaD/D+0
 3CS4SbWbMgMOc2BO5JT03T7jUq2rPESxosZ0841mrfSLqpDvU0qkdAPTQPJg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9CE4D44C41
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 06:09:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBD9F10E046
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 06:17:23 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c2a9a9b43b1so5230035a12.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 01 Jan 2026 22:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767334643; x=1767939443;
 darn=lists.freedesktop.org;
        h=mime-version:references:in-reply-to:date:user-agent:message-id
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tu4+qvE4HVhlD3XFHpS0OFSs6sZmg8C8rk5ZdNmyzE=;
        b=jKKYwXAyn0hEb5HkqOz94eDy+H/W1YuavH9hBqa4scsI7W+MCVeG1zTVv9LKSegprB
         XUDVE3eqoWSCQVnSpa8XkMT4poJuCguQs5Xc6Nq4x6v567TWlLXVrdeuwlxdHLZNzHLa
         doZF0j0ugpnI0BvjOqOj05dqMXHAfPBOH+PZv4CoGEepSDAJ7UicDfk9D1CDE7GYwSsE
         Ae45UVqpRZM5Rs9strb9pkXFdgKKFNkgVmHolfDbc3QcwXS2DJh0Pkv/cYVRLEf4EboX
         UKz9mVJHjKWecbrCUoP4idB50qc3FF/cUJbImlEgoTT9TQf1WpxQRSiSFkxnX4BM36vP
         fjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767334643; x=1767939443;
        h=mime-version:references:in-reply-to:date:user-agent:message-id
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9tu4+qvE4HVhlD3XFHpS0OFSs6sZmg8C8rk5ZdNmyzE=;
        b=nKh2x8PddGGeEyy85BMiQkIJ7uBffo9H0wjDqODp3CzGkURIKUEPM5ykm9Nw4nZybp
         N+iNb1tVB/5XrTdoikpc4iFnclK+/q/AI/Mo0Q3XENWnPXyQKYd8wNwga0hURDRWKSK6
         gp53IQX13NPFxFUghMuLtkaYxOzG/Qxrxq+2d75pAVYPPSID1LCswHjDWpnYPiKtbU/7
         jprRo3ZstiEcGe0GZw1kGY7k+3M6PTfCemKOOMQXkvKksdvcYYZ8+i4HQlBssC/w0D7j
         au+HBIyGR+7MRNKG8LSsK9jm4aPnodPRZbqr13q4y5UGB9peuRu2PADnmjInqOzx8U54
         ggBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMf2bNZ0kdwxw8R6fXuQEEp6maKuT/2SuD10cb5rWnHRyyvRvfuiAkT7FPgXwKKWv1mvrof5pW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ejyTRdxqbw7kBPbRst1XIFbaHvjHlhxe+xQ830e3/aMoVclf
	ZdagQAyZ4tuG3TWJyuDwqzJsE+R+bihP4kblSDNTZS5HzdaXKZhvtdkg
X-Gm-Gg: AY/fxX6207RVgMje+8sMcOGOi2IiCrW0g+p7TZ3jp/2uD6/RKvfAVk+wpvmtkC+cJPR
	ouwsSy1NRaBU1+0YuO5LyGdeoOx/FnbHzeD5HcI8YJvFqFP0bWI8zpvplbKnlkmbnSDtMJOjYV+
	m8rRjbG1hb4vfM11iTBkrKjVJJ562px8qCTgFpkjJjx73E/i0qHo2kTBNXCAelEjEpr/PlD6tKF
	sszsJHThoU5kAgv/ku3sVw2z0mHg3BopAU4S+vPUqpTYscYqMLy6koHHqbXBjtaeDjXcwwQyZ+7
	K7qG5mC7I/BsJgLeFJ5HvJHxowbIlcGx98FkL1YrAtLjenld4TsSs6hZRqwtTdhxsBSRivMwlbd
	Pj8tahNhCup5/GB4GtM4By1Wi/nPU9E75FwKB5HQhQFrA70w39uIVaE+0OH0UlqquIEB6lNtt7f
	U=
X-Google-Smtp-Source: 
 AGHT+IHFpVYh+rorOZKdQRWoZhugs0CHqY2P8dMbar8W2hgy3i7fuX7M+pBhDPEO+z8g5iSqn3uNwg==
X-Received: by 2002:a05:7022:e80c:b0:11d:f44d:34db with SMTP id
 a92af1059eb24-121722ec1a5mr33889693c88.35.1767334643190;
        Thu, 01 Jan 2026 22:17:23 -0800 (PST)
Received: from localhost ([2600:6c51:4c3f:8e93::cef])
        by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm159501293c88.0.2026.01.01.22.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 22:17:22 -0800 (PST)
From: Christopher Snowhill <kode54@gmail.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: Re: [PATCH] nouveau: don't attempt fwsec on sb on newer platforms.
Message-ID: <176733464054.3438.4631752218787568258@copycat>
User-Agent: Dodo
Date: Thu, 01 Jan 2026 22:17:20 -0800
In-Reply-To: <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
References: <20260102041829.2748009-1-airlied@gmail.com>
 <4ba1b583-8ae3-4698-8fde-0084f7f9cbf9@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha512"; boundary="===============8364432865010440589=="
X-MailFrom: kode54@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ICYXDY3QBGSS3OEAABLRUDJDIBBS4SA7
X-Message-ID-Hash: ICYXDY3QBGSS3OEAABLRUDJDIBBS4SA7
X-Mailman-Approved-At: Fri, 02 Jan 2026 16:12:55 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ICYXDY3QBGSS3OEAABLRUDJDIBBS4SA7/>
Archived-At: 
 <https://lore.freedesktop.org/176733464054.3438.4631752218787568258@copycat/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--===============8364432865010440589==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On Thu 01 Jan 2026 09:21:26 PM , Matthew Schwartz wrote:
> On 1/1/26 8:18 PM, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >=20
> > The changes to always loads fwsec sb causes problems on newer GPUs
> > which don't use this path.
> >=20
> > Add hooks and pass through the device specific layers.
> >=20
> > Fixes: da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot")
>=20
> Closes: https://lore.kernel.org/nouveau/59736756-d81b-41bb-84ba-a1b51057cdd=
4@linux.dev/
> Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>=20
> Thanks,
> Matt

Closes:
https://lore.kernel.org/all/176682185563.8256.115798774340102079@copycat/
Tested-by: Christopher Snowhill <chris@kode54.net>

My thanks as well,
Christopher

>=20
> > Cc: <stable@vger.kernel.org> # v6.16+
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Timur Tabi <ttabi@nvidia.com>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   | 12 +++-------
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  3 +++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 23 +++++++++++++++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 15 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  3 +++
> >  7 files changed, 51 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > index 35d1fcef520bf..b3e994386334d 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
> > @@ -29,6 +29,9 @@ ad102_gsp =3D {
> >  	.sig_section =3D ".fwsignature_ad10x",
> > =20
> >  	.booter.ctor =3D ga102_gsp_booter_ctor,
> > +=09
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > =20
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > index 5037602466604..8d4f40a443ce4 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> > @@ -337,16 +337,10 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
> >  }
> > =20
> >  int
> > -nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp)
> >  {
> > -	return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> > -				   NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> > -}
> > -
> > -void
> > -nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > -{
> > -	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> > +       return nvkm_gsp_fwsec_init(gsp, &gsp->fws.falcon.sb, "fwsec-sb",
> > +                                  NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
> >  }
> > =20
> >  int
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > index d201e8697226b..27a13aeccd3cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> > @@ -47,6 +47,9 @@ ga100_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > index 917f7e2f6c466..a59fb74ef6315 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> > @@ -158,6 +158,9 @@ ga102_gsp_r535 =3D {
> > =20
> >  	.booter.ctor =3D ga102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +=09
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/priv.h
> > index 86bdd203bc107..9dd66a2e38017 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> > @@ -7,9 +7,8 @@ enum nvkm_acr_lsf_id;
> > =20
> >  int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
> > =20
> > -int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> >  int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
> > -void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> > +int nvkm_gsp_fwsec_sb_init(struct nvkm_gsp *gsp);
> > =20
> >  struct nvkm_gsp_fwif {
> >  	int version;
> > @@ -52,6 +51,11 @@ struct nvkm_gsp_func {
> >  			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
> >  	} booter;
> > =20
> > +	struct {
> > +		int (*ctor)(struct nvkm_gsp *);
> > +		void (*dtor)(struct nvkm_gsp *);
> > +	} fwsec_sb;
> > +
> >  	void (*dtor)(struct nvkm_gsp *);
> >  	int (*oneinit)(struct nvkm_gsp *);
> >  	int (*init)(struct nvkm_gsp *);
> > @@ -67,6 +71,8 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
> >  extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
> >  int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct =
firmware *,
> >  			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
> > +int tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *);
> > +void tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *);
> >  int tu102_gsp_oneinit(struct nvkm_gsp *);
> >  int tu102_gsp_init(struct nvkm_gsp *);
> >  int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
> > @@ -91,5 +97,18 @@ int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
> >  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, en=
um nvkm_subdev_type, int,
> >  		  struct nvkm_gsp **);
> > =20
> > +static inline int nvkm_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +{
> > +	if (gsp->func->fwsec_sb.ctor)
> > +		return gsp->func->fwsec_sb.ctor(gsp);
> > +	return 0;
> > +}
> > +
> > +static inline void nvkm_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > +{
> > +	if (gsp->func->fwsec_sb.dtor)
> > +		gsp->func->fwsec_sb.dtor(gsp);
> > +}
> > +
> >  extern const struct nvkm_gsp_func gv100_gsp;
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > index 81e56da0474a1..04b642a1f7305 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> > @@ -30,6 +30,18 @@
> >  #include <nvfw/fw.h>
> >  #include <nvfw/hs.h>
> > =20
> > +int
> > +tu102_gsp_fwsec_sb_ctor(struct nvkm_gsp *gsp)
> > +{
> > +	return nvkm_gsp_fwsec_sb_init(gsp);
> > +}
> > +
> > +void
> > +tu102_gsp_fwsec_sb_dtor(struct nvkm_gsp *gsp)
> > +{
> > +	nvkm_falcon_fw_dtor(&gsp->fws.falcon.sb);
> > +}
> > +
> >  static int
> >  tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
> >  {
> > @@ -370,6 +382,9 @@ tu102_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > index 97eb046c25d07..58cf258424218 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> > @@ -30,6 +30,9 @@ tu116_gsp =3D {
> > =20
> >  	.booter.ctor =3D tu102_gsp_booter_ctor,
> > =20
> > +	.fwsec_sb.ctor =3D tu102_gsp_fwsec_sb_ctor,
> > +	.fwsec_sb.dtor =3D tu102_gsp_fwsec_sb_dtor,
> > +
> >  	.dtor =3D r535_gsp_dtor,
> >  	.oneinit =3D tu102_gsp_oneinit,
> >  	.init =3D tu102_gsp_init,
>=20

--===============8364432865010440589==
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
MIME-Version: 1.0

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEdiLr51NrDwQ29PFjjWyYR59K3nEFAmlXYvAACgkQjWyYR59K
3nE1yQ/9EJVWTNypR4Qp9EdmQu8lGbilKZCbxy9izW/fLgrRyeZwT2NX7nDV67uC
lDT/6jsgs6BeCeKKnJeEwoH15fEuRkh9CnXQ4R0dl9Zea8nXWpaGBf5SAhSpZxdP
pYKTWN1XUUWDFrzEwiBkF9etrzQnEfnmY2SxO/fBXiQ0A4u94KxuWMZ3zEc6YoPQ
Lp2r2/N2trJII7wlhSTPGsVf7+X0eYUxFyzEEAJ7TsOyu4U4rFBBMaSClHXmPHTV
bVYIRyPtsRULdaNVxgrQQmbrstjUM7R9crBCo6WhIa7EAhOj7mRG/q+jRIyjr/g+
bFG1K8EUAcC04eTuLFAjPMW2mfUwDh6HVzQ6+Lzqc1ljbcbxpNkN3PgiQ/e7CyYA
fc8gPCYU0/yzpcIcriqH+Yu/t17Fxdr9EqVcLS5VcAUKifcGl++gauK0MO2R7UWq
5L1DXk3u2Y+d9gmOdOyrt3f/7dZSJTXz0IlLdZWb71oM0Vu+UeIhM8zG5qtz1ejO
ovMgReAoKwDc1tdIj5Uo9ERe6R6HAoJhEPQ2q7rPpKZO7+4MEoA1rRpssMEeRCtj
S0us+sSpwg/udEO8QyBkyQ9LyGln3KUd6hH78k7WEoJQhU1ukS19TifV7RAHLIOq
c47v0A68w2DI8txaU7N2tCDOkH0Ayce59RbVgzdT/hP0srJeMYY=
=7N2B
-----END PGP SIGNATURE-----

--===============8364432865010440589==--
