Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB045B17B21
	for <lists+nouveau@lfdr.de>; Fri,  1 Aug 2025 04:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7CA10E2D5;
	Fri,  1 Aug 2025 02:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="v5Jx8MSw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A25910E28A
 for <nouveau@lists.freedesktop.org>; Fri,  1 Aug 2025 02:15:56 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-61589705b08so3236833a12.0
 for <nouveau@lists.freedesktop.org>; Thu, 31 Jul 2025 19:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754014554;
 x=1754619354; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ppf/vHIb0Abri4F+PeMzmW+LdmW8MhPB3OqpsCnahAk=;
 b=v5Jx8MSwN0X3F0MnvTjvTx+9PeUF3LTF3qbPRWn5loZiz7egfS2Gy5fgyl7gN03Q4l
 dnhFGSnQ9iNirIPgm02NfmwpnoHED8lkkZ5u4EUo8uHExFRuKNz6CSgYFmxvooj0Ic3g
 aAaw+nwJlIy+atBuiNzdKIDD+sh7BmPc1zPF65vvApC7lCJq79vo+4l0V3JUAPjBGZSs
 QIdUvlHZD9s5ULU5WUjP1gu7c285ya3ROb8BeEVUX/a/K69SIpf8XNAGxNMfG0fbwhfW
 I7Mo/jY4HsHQqLqMS89ewp6oJnxh++52bLAZU6XlLGwfAETDKtYvvkMOhCP2YE3dSbsd
 osvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754014554; x=1754619354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ppf/vHIb0Abri4F+PeMzmW+LdmW8MhPB3OqpsCnahAk=;
 b=kpk7XcFTzNGPEgGesuse2gr6IzQX267uyg3tVmNczPOcy/3pW+sy8jPLkNJo0dktxf
 qvc5vmF6jFukfcB4diPhEUZ/ch60dCmBno2GKST56sbxn6tMW6Kf8C4N4q+rfxbavoPK
 F/B4xfQf6quQdFmLKHUZwOk0bhAW7ttyTymG9ECBnemE28Xbi37H5BXTjQbSWrdieKfM
 j1TQk0xoTuzlYAcCDsbpWv30obLmgBnlIUx5qHgYS/QCNx/XijMnlzsSWDlPktkfQNhY
 Zv16HYricNtLfYXL9q/xcQxQGSVWoOk4o4IaxYcKmPMSxajzFrod3QS8pBsOSWKq/YO2
 l/xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU9D16hBitCYwh+tpvkCp6CGb4FuRjni+OyS/n+9ROdNmzJcBaPk+Tp3+pINkchaNnApU/LAOo@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/CM3cA+Vkal0Kq7BvzGWPLfpof8ln+1R9iEdYwDHk/mZTGc7x
 6cERxko6L9EXQaiIP47aKUeosK+hKseCVXj6+3Aj/R12+su8YOQLtkWsNtMSpiMwCa/zWYoJ5WR
 QE2Wr+LhiS+WlXzrF+PNdxeU9tQ9nT1jRL4gsnOoJh1RpGi3d5nSl
X-Gm-Gg: ASbGnctkF6hSEjpn1Y9GJlXM4dbEa8uOUGk6D3krqBdlvWCsqbJVnN98upd31koRj3T
 FDvgLwRIxhQjZtOTk/F1cvkvdy6ZnGSjWbHfJgNwW1zpVWiv3C8CP521GfpyFgiTUxr2B/+pkKp
 jfWyt5SkRNkjT3oDCkCVheZOmDqnMp6YIkBGn+DrckfZt2UdeRkMqD/5tcZ01mnvmwutb5UCuTu
 /GiiGE=
X-Google-Smtp-Source: AGHT+IHo5X0FLwScBjI2ozXxC3gyiudT7NfjkUK6chYTTx0UIYsj0I3sItU/ini5nQy4mJUwVBaOV8I78AWLjlw83t4=
X-Received: by 2002:a05:6402:26ca:b0:615:97fe:54c6 with SMTP id
 4fb4d7f45d1cf-61597fe5990mr8140844a12.31.1754014553917; Thu, 31 Jul 2025
 19:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
 <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
 <Z-VZlIc3E8ZQQmXa@cassiopeiae>
 <CAAgWFh2F-MH_U1V6SY_Z3nWz0_meyvAcWjfUiEoXzpW697oi7w@mail.gmail.com>
 <Z-aMlNW2-MvjETXV@pollux>
In-Reply-To: <Z-aMlNW2-MvjETXV@pollux>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 31 Jul 2025 22:15:27 -0400
X-Gm-Features: Ac12FXzCKFr4ftuv7cwTomUyqRJMtDHPlIXsQW2gFn5E4-j_4OAQpY1XLlEXU28
Message-ID: <CAAgWFh3Zvgb_yXsV2WHytNFjRZ5KQraCdG3+-EXS5n+xaacDXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
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

On Fri, Mar 28, 2025 at 7:48=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, Mar 27, 2025 at 03:01:54PM -0400, M Henning wrote:
> > On Thu, Mar 27, 2025 at 9:58=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 07:00:57PM -0400, M Henning wrote:
> > > > This is a pointer in the gpu's virtual address space. It must be
> > > > aligned according to ctxsw_align and be at least ctxsw_size bytes
> > > > (where those values come from the nouveau_abi16_ioctl_get_zcull_inf=
o
> > > > structure). I'll change the description to say that much.
> > > >
> > > > Yes, this is GEM-backed. I'm actually not entirely sure what the
> > > > requirements are here, since this part is reverse-engineered. I thi=
nk
> > > > NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. =
The
> > > > proprietary driver allocates this buffer using
> > > > NV_ESC_RM_VID_HEAP_CONTROL and sets attr =3D NVOS32_ATTR_LOCATION_A=
NY |
> > > > NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, att=
r2
> > > > =3D NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC=
.
> > >
> > > (Please do not top post.)
> > >
> > > What I mean is how do you map the backing GEM into the GPU's virtual =
address
> > > space? Since it's bound to a channel, I assume that it must be ensure=
d it's
> > > properly mapped when work is pushed to the channel. Is it mapped thro=
ugh
> > > VM_BIND?
> >
> > Yes. The userspace code for this is here:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861/diffs?c=
ommit_id=3D0c4baab863730f9fc8b417834ffcbb400f11d617
> > It calls into the usual function for driver internal allocations
> > (nvkmd_dev_alloc_mem) which calls VM_BIND internally.
>
> BOs mapped through VM_BIND are prone to eviction, is this a problem here,=
 or is
> it fine if it is only ensured that this mapping is valid for the duration=
 of
> subsequent EXEC jobs?

I don't see the proprietary driver doing anything special related to
eviction in traces, which is to say that I think it's fine for it to
just be valid for subsequent EXEC jobs. That being said, I don't have
the deepest understanding of how memory mapping works in
open-gpu-kernel-modules so I might have missed something.

Is there a good way to test this code path? Can I eg. force the kernel
to evict everything in order to test that the context switching still
works?

> Does the mapping need to be valid when DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER=
 is
> called? If so, how is this ensured?

I don't think so. My understanding is that this call is just setting a poin=
ter.

> Can DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER be called in between multiple
> DRM_NOUVEAU_EXEC calls?

Yes, there's nothing that requires a specific ordering - we can use
the context normally before and after the
DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER call.

> Does it maybe need an async mode, such as EXEC and VM_BIND? (To me it doe=
sn't
> seem to be the case, but those questions still need an answer.)

I don't think so. Userspace calls it twice per context right now (once
for init, once for teardown), so I don't expect it to be especially
perf critical.

> I also think we should document those things.
>
> > I don't understand: why is this line of questioning important?
>
> By sending those patches you ask me as the maintainer of the project to t=
ake
> resposibility of your changes. In this case it even goes further. In fact=
, you
> ask me to take resposibility of a new interface, which, since it is a uAP=
I, can
> *never* be removed in the future after being released.
>
> It is part of my job to act responsibly, which includes understanding wha=
t the
> interface does, how it is intended to be used, whether it is sufficient f=
or its
> purpose or if it has any flaws.

Right, sorry about this - I didn't mean to question the purpose of you
asking questions at all. You of course have every right to ask
questions about a patch during code review. I was more just confused
about why you were asking me specifically about VM_BIND, although I
think that's a bit clearer to me now that you've asked questions about
eviction.
