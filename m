Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA48D0CF48
	for <lists+nouveau@lfdr.de>; Sat, 10 Jan 2026 05:52:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56ACB10E950;
	Sat, 10 Jan 2026 04:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SWRAgFMF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED76C44C4A;
	Sat, 10 Jan 2026 04:44:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768020243;
 b=Zz25wMGZ4GQ730J3E6JdBaiOMA+ObDmqrgafRzg7SOqn7M2lc3FQKrRqBm8J2Co1dxO09
 Ho3nsmmO/QpqGm59+bnd1ToUcmuUGHNUdOu3wlHvbCd62pHcXP+rFTwrKtGR9XZ4dJS4yuy
 mq+nGrhK7IdanWD5o34R909SOwfYznBNZjv2fnLa28ThwIX8OmStsX+z19D99qvhVoVWlkp
 0JbFFg007CBn1+wcZYohV1qESV/LpGKJ5ojFXnw8NlLs3a2WZq/rBISVvg9wFiIcESl2Qui
 eVabIWD8csrIPfap4GgZ6Z5KP7nMlzDrr3O30x7taok9atIhIE9xCFRiLjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768020243; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3PIKkZRZEIgFO2CrhDA8cuzhz/50nH4USZ92KUHWiZw=;
 b=j3qW6LvNa579VJl4w4xaWIv9oISaU0jBHnqBBNJ236/kPy2STae8EgLz56tdrQiEKrVU5
 WQfTL9wTYDWm5AMWcpd0RAm++CtkhyseOVUMT/r9fy9i/U0Fm84mEcZqJPAcPpkTgbKKKIo
 /Dm8W4mcUMJs3lvCDJ/UawOlyot6E+D2Tf6pcomgmM5VSK96+OWfSY0G+MiBzkCPAKNuh33
 6WWFEKV4N0xZxUXHOmLkSAfvPbgfiNNHkRvS8Hkf5yFTUHKK9qbfSwFs2BMI5iQeTP+oXQB
 pd41iLJZcmapx916y9A05xoTetT0+TT7d3zqV/d7VqVaY/xxdMwHhgjGVPRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=broadcom.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=broadcom.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5637344C4A
	for <nouveau@lists.freedesktop.org>; Sat, 10 Jan 2026 04:44:01 +0000 (UTC)
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com
 [209.85.222.228])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34210E37B
	for <nouveau@lists.freedesktop.org>; Sat, 10 Jan 2026 04:52:22 +0000 (UTC)
Received: by mail-qk1-f228.google.com with SMTP id
 af79cd13be357-8b1e54aefc5so432379285a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 20:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768020741; x=1768625541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PIKkZRZEIgFO2CrhDA8cuzhz/50nH4USZ92KUHWiZw=;
        b=Brla1Ketbz6qCpsj9WyW8UYHM4ZjMobyBmYNBNyCzoYSRxKSXoMqekEd/NAqwbb472
         AdMlvQwvaHk/QS2Y/fYFAFMhzMyTaqdTV+9wcCnUla5flSDw+6aeaSIM+9UCIXx5bRik
         2emOLNr0N8AEdLXdgog1my+b7S+Avqf3cPyozoKnZhIMhYww+7N/gB2jSj0iTNta9EZO
         ab2YY/tEV0TM93Py0+cft71us22VhsIbqor9WASXA5rRs0aM8XZFoqbovC3Ku+w33CEH
         pachcjUNjr0YQ3Y4uOcxJpzMliyBMnF5aWGdRXty/bpJSSbzX+ft0WHbJqC5Q3pUi4ct
         w6WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD2BdUGKCe0OrIxC7JAcVm+5iEeTtVrRtMaVv4VYbKLXRYesiKEIiyLIJzqkJerOrpKPUkQH5G@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkhxb/JPfJb+a9CSMtb84q9LhCBaNX+nRqIVRKUqnK7szdaaEb
	W9xBYv3qrKGs0bFOGxJ+WpWKNDYQM+1gM+3dJMUa1+1Kc8/jB7z0cv1VMFcUgVkIOh7YR2B4vBU
	Z+P+WBY9CYx/tSoHGC4a0IfvaS+GrjZes9v6QwcIPb95qTbiN64af5rrLhv983qHr/8dRbdUuM1
	Lp/mts+2Ofp7jqnCNxQqQroSwaKewEzRTX8uSS/6CqlqMhWKpA3y5fS46eIXWpMnyIOrs7s0kOc
	mmPy7FVLGfxfmK+Iw==
X-Gm-Gg: AY/fxX5Pj6vZ16+3w3duJpUI5QlMhFgSE195VjfrbvZcQzCycB8p9jGu4+8817wTLci
	9oVMiMYX21R6WFHCpf/ZCrKsUM/XtIgaii8brILVEtbix2XGFniN223Qr68/EQeCEaag0IGLjdx
	cj9qYIbpo8A3sRD3D+EpPaV+zWkBMDnlPGWMBG2A08vsCCIPyOHke1ItQL/u2FS2CpR8mTG173Y
	28rHEvEic6SGLtHcBgwQkbgxQWNzNpddf2JwtH5A+97BuB7QU6JCaW67bcz617PYnncGEVRmJXN
	hu8BCK21ZorCuE6HDOHQMG9O0t31GfVUKWGH4hLz0csiyYlSop1VEYd6ukMYVAsEpOaUqOF0sQw
	Z7ePpoPm1hjzzLAb9v6ljO5oOOIAsp5a/XkzawQDMF9D9nKB9lprTyiDSttlIiR8qOq+JPn/ykV
	tv+zPLTQH61RzRjOCAyo3rEDUIi/3eR6vN7ZvagJG8ePsq
X-Google-Smtp-Source: 
 AGHT+IFxr+gMestOFLJEIWI7jOo2Zb5XcaVDNWexcF375Rq/FECqN0xCdQfVB3hmBnlqhcrPW0qobIYbIFA4
X-Received: by 2002:a05:620a:2550:b0:8b2:dafb:9089 with SMTP id
 af79cd13be357-8c38940302cmr1697994685a.67.1768020740597;
        Fri, 09 Jan 2026 20:52:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-8c37f4bfaecsm139715185a.3.2026.01.09.20.52.20
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jan 2026 20:52:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-38317963123so10987261fa.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 20:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768020739; x=1768625539;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3PIKkZRZEIgFO2CrhDA8cuzhz/50nH4USZ92KUHWiZw=;
        b=SWRAgFMFYUQRFCIT27hN9jdCuBO1+e5orYFpE8J8G83517AqOGqtC+m9YOiZ4pQHu2
         5g3d05cZlBmSo0as5bbZY7le+Pju/HUYYs0UkgyBNohuAT0hncH0mGU3Pb05SzpHYS9s
         Q4MpLmdj7Xhhz3CM8OcSDzJ1ytAXkys3Uz6mQ=
X-Forwarded-Encrypted: i=1;
 AJvYcCXf9qZFJbUCREyQCmue4yJJSpk1/RWGIDs66bnbi8Tk5ohpHZHxqrc1TKlr67UTw2ohndujV+kw@lists.freedesktop.org
X-Received: by 2002:a05:6512:b05:b0:598:eb48:cdd7 with SMTP id
 2adb3069b0e04-59b6f036b6dmr3303282e87.32.1768020738334;
        Fri, 09 Jan 2026 20:52:18 -0800 (PST)
X-Received: by 2002:a05:6512:b05:b0:598:eb48:cdd7 with SMTP id
 2adb3069b0e04-59b6f036b6dmr3303240e87.32.1768020737789; Fri, 09 Jan 2026
 20:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
In-Reply-To: <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 9 Jan 2026 23:52:05 -0500
X-Gm-Features: AQt7F2p8B_T8ovfD5ZSr9MTIdbY91q6Tpr9PYo2oe7dWWszTv7Z59e7mmZ6IEig
Message-ID: 
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
To: Thomas Zimmermann <tzimmermann@suse.de>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="0000000000001d5ec106480168de"
Message-ID-Hash: K5LEADOW235MTJRITBLZJLLK4MXCBTKJ
X-Message-ID-Hash: K5LEADOW235MTJRITBLZJLLK4MXCBTKJ
X-MailFrom: zack.rusin@broadcom.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Ce Sun <cesun102@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K5LEADOW235MTJRITBLZJLLK4MXCBTKJ/>
Archived-At: 
 <https://lore.freedesktop.org/CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--0000000000001d5ec106480168de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:34=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 29.12.25 um 22:58 schrieb Zack Rusin:
> > Almost a rite of passage for every DRM developer and most Linux users
> > is upgrading your DRM driver/updating boot flags/changing some config
> > and having DRM driver fail at probe resulting in a blank screen.
> >
> > Currently there's no way to recover from DRM driver probe failure. PCI
> > DRM driver explicitly throw out the existing sysfb to get exclusive
> > access to PCI resources so if the probe fails the system is left withou=
t
> > a functioning display driver.
> >
> > Add code to sysfb to recever system framebuffer when DRM driver's probe
> > fails. This means that a DRM driver that fails to load reloads the syst=
em
> > framebuffer driver.
> >
> > This works best with simpledrm. Without it Xorg won't recover because
> > it still tries to load the vendor specific driver which ends up usually
> > not working at all. With simpledrm the system recovers really nicely
> > ending up with a working console and not a blank screen.
> >
> > There's a caveat in that some hardware might require some special magic
> > register write to recover EFI display. I'd appreciate it a lot if
> > maintainers could introduce a temporary failure in their drivers
> > probe to validate that the sysfb recovers and they get a working consol=
e.
> > The easiest way to double check it is by adding:
> >   /* XXX: Temporary failure to test sysfb restore - REMOVE BEFORE COMMI=
T */
> >   dev_info(&pdev->dev, "Testing sysfb restore: forcing probe failure\n"=
);
> >   ret =3D -EINVAL;
> >   goto out_error;
> > or such right after the devm_aperture_remove_conflicting_pci_devices .
>
> Recovering the display like that is guess work and will at best work
> with simple discrete devices where the framebuffer is always located in
> a confined graphics aperture.
>
> But the problem you're trying to solve is a real one.
>
> What we'd want to do instead is to take the initial hardware state into
> account when we do the initial mode-setting operation.
>
> The first step is to move each driver's remove_conflicting_devices call
> to the latest possible location in the probe function. We usually do it
> first, because that's easy. But on most hardware, it could happen much
> later.

Well, some drivers (vbox, vmwgfx, bochs and currus-qemu) do it because
they request pci regions which is going to fail otherwise. Because
grabbining the pci resources is in general the very first thing that
those drivers need to do to setup anything, we
remove_conflicting_devices first or at least very early.

I also don't think it's possible or even desirable by some drivers to
reuse the initial state, good example here is vmwgfx where by default
some people will setup their vm's with e.g. 8mb ram, when the vmwgfx
loads we allow scanning out from system memory, so you can set your vm
up with 8mb of vram but still use 4k resolutions when the driver
loads, this way the suspend size of the vm is very predictable (tiny
vram plus whatever ram was setup) while still allowing a lot of
flexibility.

In general I think however this is planned it's two or three separate serie=
s:
1) infrastructure to reload the sysfb driver (what this series is)
2) making sure that drivers that do want to recover cleanly actually
clean out all the state on exit properly,
3) abstracting at least some of that cleanup in some driver independent way

z

--0000000000001d5ec106480168de
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEII5o
RGTEyV0XeAfpw/3EFhD4hnN34Z3brBUKW0xqk8cVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDExMDA0NTIxOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADOJfLGundEpNupx73GRaf9UjnLQiGLrOKetkdhD
FT9fwam/aySghA5qNhjLJUblW2pW2eBdA6bOtGZWpuLJP7TXPGcK6Zf5jEwGE+rPAxtv3fPVoogO
ggc5/a1x+33KNN8Lp3yBtY6YPLI9QZ6WDWhoojLGCI4orpZLYw5tPLlju+GzQ8aFbv1YSv1X5J+j
hlhA019dVwZlF0erUPfeOhDpQisaGeiB5bt9uxqL+gTc6g6NMxhguQCM/86+DwTLNLOnQqj5PW+j
S8x/UfNYZ5YyivYYG7HRmPclQqZNQAT7B/vOaUm+OauzM8wrmCBna2vEf5OghXxNyIhVCO+8YNA=
--0000000000001d5ec106480168de--
