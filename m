Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5DB77F3FC
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 12:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC510E423;
	Thu, 17 Aug 2023 10:01:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5F10E41E
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692266461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxvFWtLfZHUU3yR6UuCUCdkToTTydlxIuObM2X2y+A0=;
 b=I74Jt8dgG2kPZwinPquctPlMt+MgCT1FuBH/yMRWbtY+Fyf55++fzz+o7NjpGREdlYfZg9
 JRNltwyI3PyNOJH9JOfJcDfYDkE2teCD5MpfUldEQpwwdQt/5ILKkKufwDoaPiRZROKtwP
 J6NPezDCNKh+hdPvMlyO+9N9dH3+siw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-zQrCnvLgNeqY2LUb-zKgjQ-1; Thu, 17 Aug 2023 06:01:00 -0400
X-MC-Unique: zQrCnvLgNeqY2LUb-zKgjQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b9d5bc6161so13735471fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692266458; x=1692871258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxvFWtLfZHUU3yR6UuCUCdkToTTydlxIuObM2X2y+A0=;
 b=f11RHtOjchTy+Fxy9sSAwCDvCz8pUlbBdP0thckSGnOoaf1ex5dR0VieC4lhV4ue5+
 JOiztjlBF7ggnbILU9gXW3lgNWqdRElAUcyn9XS8qFCXZpd0+aei776828aTKXlH2tUu
 Ua9vJggwKcGhloQCkRYiuCAg2vAz61kzO0JY7wpHgowkkAxA/R4ZqALs2VMRtdPtxRhV
 0u4caW1Pu4VMmqXwaMlXXc4thpVs6QwjFInwxZmkRWYr8kDBOPyZCA0QdNU1dX9KieKw
 nNRDim1Jr5GkG+JmkZN16HACZDnAzjsbweyGAI8R2lUZrXI+Fin93o3fZ6UCJQYC0o/z
 NdLA==
X-Gm-Message-State: AOJu0Yz7Fcc2pvqXLf/fjZ5IXWk9ZbBiwm/4XzHmJGbPXSSxXQAALEZR
 1KLJ+s7lSNV1ANA7nKgAQTm2uFxPFm6WZ3qJNqxJakuOqg9URG8zLgK5ZLEfh2BMhh74c5KJZMk
 BEs/U07SzFoaVVbdT4cBqX14i155xsDKFlSFggHZS6w==
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr3029745ljg.0.1692266458793; 
 Thu, 17 Aug 2023 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX6/54OJqwhp3VR3zAVcKja7LAQ8KhRaL+hfdqOgYduGmKxKWNx/Sz3QfKQ1PMt/yuW5leDc5yD5ItStaUNh0=
X-Received: by 2002:a2e:9043:0:b0:2b9:e10b:a511 with SMTP id
 n3-20020a2e9043000000b002b9e10ba511mr3029732ljg.0.1692266458510; Thu, 17 Aug
 2023 03:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
In-Reply-To: <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 12:00:47 +0200
Message-ID: <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 11:58=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> On Thu, Aug 17, 2023 at 10:10=E2=80=AFAM Borislav Petkov <bp@alien8.de> w=
rote:
> >
> > On Thu, Aug 17, 2023 at 01:18:12AM +0200, Karol Herbst wrote:
> > > do you have one of these? https://en.wikipedia.org/wiki/DMS-59
> >
> > Ah, DMS =3D=3D Dual Monitor Solution :-)
> >
> > Yap, that's exactly what the GPU has. And the Y-cable is 2xDVI. It is
> > a Dell workstation and it came this way, meaning I haven't done any
> > changes there.
> >
> > Thx.
>
> right.. seems like on my GPU with such a connector I'm not seeing any
> issues... let me dig further into the vbios and see if I can figure
> something out there.
>

btw, what would help is to know where `nvkm_uconn_uevent` actually
fails, or rather, are you running into this "/* TODO: support DP IRQ
on ANX9805 and remove this hack. */" condition?

> >
> > --
> > Regards/Gruss,
> >     Boris.
> >
> > https://people.kernel.org/tglx/notes-about-netiquette
> >

