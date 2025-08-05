Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38298B1AE2C
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 08:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E8410E5E0;
	Tue,  5 Aug 2025 06:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F0uZNcob";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821910E5DD
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 06:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754375021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgJ72159TM3a8pDF8kOfKqK1Y6OK64QwEENdeXXTxak=;
 b=F0uZNcobGtc/7o3VsA7JA5nMpoB1LaMYsuam5RWzOT09kBEFomEDw79mn8ZxEX74hGFem7
 ORE8/frijrlWyJyszcNqW/rxd6uowD9IuaTr3uiOGuGFIFGCC9BesSyfL6seLu7RzPUFq/
 f5MX8ThM6zhDQTqIS34xVY4gM2Yp8uE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-YgFaQVbFP7KqGnhU5Jwueg-1; Tue, 05 Aug 2025 02:23:39 -0400
X-MC-Unique: YgFaQVbFP7KqGnhU5Jwueg-1
X-Mimecast-MFC-AGG-ID: YgFaQVbFP7KqGnhU5Jwueg_1754375019
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-61530559847so4777036a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 04 Aug 2025 23:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754375018; x=1754979818;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UeFt73RzQ/uweSYlOm2mtSs/Tm/j4qVUd2ADIHfcBQI=;
 b=Np1Wz4FfeH612VyGJEqNNucTcNMyJiPIo1gzl/R75UEDCWfuQAWbzuQOQwuAUYem/o
 fUurqA5UlaarEBgAXRR9InwRYWazbEFHAUlPiXwPiqd7odgSehS+iKntD1OUlw+6wjaV
 A3Q3Pswgtb5n5bxFlZP3YU7VGk3q9r33dHCuFy7XrVQaAPZ2cgBVF6SmNqk+pThpK3bm
 a6oaqUNyti3ZGKhgeaUAQGNJ8txp9K2qc2BYDZFbIGlwLVWF478SZM+Or+ZeBVZlh0zi
 AkoMzLVq+Atl9CO/PHPlLiTb0l861q7fy98xl8rhFB5vVHgEZsuzpjZ4AwWMiyqR2tn0
 Eq8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+AiSroQjG7e+hZmh95y7DpIeV86AlW3ddvml+n5E+0gwIwO4wRlNAzXz+1RgfK6pe8qbf6nWO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnBS3XXrm9yUO8IqBH7dUUgX7lSshMLBrQ7c9Ysd06/H1j8elX
 LNCB1ClB0GelNClFsKgAAzYyF1bGxzvnLNkRsMl4wAxb6pBMO5/2v2o7bF6WtFgUCx2naiEhXeV
 hKhirF22gSK4iLfKi+8ueR7dF1KufpNXVBdotdMxYeNn8B1R8Q2bY2nWi4v641a7PrjY=
X-Gm-Gg: ASbGncvnFwo7JxLTxgT3DcL0pZekS+viKv79yejTMOyVMaiDl3utFQH/mIS8gKRu+37
 O47dnbDsami0TThg3Ahq7s3F1SOepqpYTtbBiJUCFycdTfAvOS/Uwld24opWqPJaz3oaHDiP1zI
 ZogvrNSQri1sL85WaZCb7HEkXZklGNTBkVJO1xT7s+DO7QrVlhoPEZ0rR27iBIO9dSut/KyNMWO
 q54zIxTeY8Mz5wWOX2BQwm1D4DQZfNwSFpOKFI3vNyIXUkajMD4TolTaH9jWA7m7bvZcr7nTiBM
 YQpl+X1NqFcMwpHoxY86WjKwfCw+ljaX2cH7l534ETO28IWZWSXHDjdY9QZJNVRcuEgeLKgpxn1
 xwQPJ4oCucog=
X-Received: by 2002:a17:907:2da5:b0:af2:5a26:b32a with SMTP id
 a640c23a62f3a-af9401a7898mr1281048766b.30.1754375018532; 
 Mon, 04 Aug 2025 23:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWevmxdFJZDRfpqCJjxeyieFP+a9nS8vrGFjeAtKPO/WYQoD9uLDDSJikUDwLgaYr8pTZTDg==
X-Received: by 2002:a17:907:2da5:b0:af2:5a26:b32a with SMTP id
 a640c23a62f3a-af9401a7898mr1281046166b.30.1754375018055; 
 Mon, 04 Aug 2025 23:23:38 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d90:a700:522d:5615:dfb:4451?
 ([2001:16b8:3d90:a700:522d:5615:dfb:4451])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df08dsm836915666b.60.2025.08.04.23.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 23:23:37 -0700 (PDT)
Message-ID: <c43f01911f30ab13b2529856772ced4327420b52.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
From: Philipp Stanner <pstanner@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
Date: Tue, 05 Aug 2025 08:23:36 +0200
In-Reply-To: <20250804192601.10861-2-ttabi@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
 <20250804192601.10861-2-ttabi@nvidia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RazDuQ-hQP7qRd_0tH5h94W7Tqza4Rkzk7OEWebfSok_1754375019
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 2025-08-04 at 14:25 -0500, Timur Tabi wrote:
> Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails,
> but
> it never uses or returns 'ret' after that point.=C2=A0 We always need to
> release
> the firmware regardless, so do that and then check for error.
>=20
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting
> GSP-RM")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

That looks like a bug (leak?) to me.

+Cc stable?

P.

> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> index 52412965fac1..5b721bd9d799 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> @@ -209,11 +209,12 @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const
> char *name,
> =C2=A0=09fw->boot_addr =3D bld->start_tag << 8;
> =C2=A0=09fw->boot_size =3D bld->code_size;
> =C2=A0=09fw->boot =3D kmemdup(bl->data + hdr->data_offset + bld-
> >code_off, fw->boot_size, GFP_KERNEL);
> -=09if (!fw->boot)
> -=09=09ret =3D -ENOMEM;
> =C2=A0
> =C2=A0=09nvkm_firmware_put(bl);
> =C2=A0
> +=09if (!fw->boot)
> +=09=09return -ENOMEM;
> +
> =C2=A0=09/* Patch in interface data. */
> =C2=A0=09return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset,
> init_cmd);
> =C2=A0}

