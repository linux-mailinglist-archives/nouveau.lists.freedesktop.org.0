Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7277F3F6
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 11:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4510E41D;
	Thu, 17 Aug 2023 09:58:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072C10E41D
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692266334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8LhOrW0WUa6CT60pjE8C+ol39HJMr426zMLoqg+/dY=;
 b=B+dqzvpmYeyHTkBI6yVuGmqWO/MNu6z4ZPF78vvVdSA/oIbnkIPxE+KtUpf7S4vECQLSFE
 t7sllDYJpJ8AdfgtnsqhFe7MSSlW3V8sLhg8/lqxNBD4/X1cmJPPFEnYmSezRseGSLAT3C
 rJyhbsz9h/4Oxsi/j9bpdGons+vD6rc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-KqlIA4c-NrW5uKXe9M4XtA-1; Thu, 17 Aug 2023 05:58:52 -0400
X-MC-Unique: KqlIA4c-NrW5uKXe9M4XtA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so13710631fa.1
 for <nouveau@lists.freedesktop.org>; Thu, 17 Aug 2023 02:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692266331; x=1692871131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8LhOrW0WUa6CT60pjE8C+ol39HJMr426zMLoqg+/dY=;
 b=Hfll98cbE1myY0pj+PYsykiwTtYvE3JnEulR24fYSkrbEyoRNI4jWIOD8Su9BTKJeR
 c51/fu0S284QyNCkk61DNmBa1I3SPhVghaSA4mjiVQeoO7Bv1BTBeY4aS/t4Rv6fYyvL
 THEhBEj638laj9nsZwtKLED6D3lspFBa4kTQjdzF9ElEheVDRtcnvZ7xp1Mj9DbQW02e
 hpXCuKlIpRjzRsBGeb2yiVawz5q6jgwuRe5zG9TIfePHdHhu9iYS2cYxspjAi7ruiM0C
 XdN1apzeV9/Nsi6lfacNZgtz3zVSOWW9GYRIwXwCnuD2pB3U1SKP/RsX5u/3o5LtDpSK
 0Hhw==
X-Gm-Message-State: AOJu0Yxq/2+I3BBBxMGpchziZ4EEwvVWsgbovDqSj7DGlZx8om2pk9qx
 1ewOj50pwx3YJrPXoW/tKYBUXhYmgWPlcNdKRqU3P2t7NcmombG3TOqtVF2g3dZifp1doU3PpQy
 nf5Nlj3lBxv0vWo8ieOrR5ikHDVtOrJxpjqMuATi+9w==
X-Received: by 2002:a2e:bba2:0:b0:2b6:7c3a:6adc with SMTP id
 y34-20020a2ebba2000000b002b67c3a6adcmr2639034lje.5.1692266331505; 
 Thu, 17 Aug 2023 02:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+OkqFqWypjUgZ0iljxcxYcRVfxwr2dkieuQVR8uoM+9sEf+VyJeMAJQEHmz2GuI9BiYnREEMjsnHLf9Gnm74=
X-Received: by 2002:a2e:bba2:0:b0:2b6:7c3a:6adc with SMTP id
 y34-20020a2ebba2000000b002b67c3a6adcmr2639023lje.5.1692266331198; Thu, 17 Aug
 2023 02:58:51 -0700 (PDT)
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
In-Reply-To: <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 11:58:40 +0200
Message-ID: <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
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

On Thu, Aug 17, 2023 at 10:10=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Aug 17, 2023 at 01:18:12AM +0200, Karol Herbst wrote:
> > do you have one of these? https://en.wikipedia.org/wiki/DMS-59
>
> Ah, DMS =3D=3D Dual Monitor Solution :-)
>
> Yap, that's exactly what the GPU has. And the Y-cable is 2xDVI. It is
> a Dell workstation and it came this way, meaning I haven't done any
> changes there.
>
> Thx.

right.. seems like on my GPU with such a connector I'm not seeing any
issues... let me dig further into the vbios and see if I can figure
something out there.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

