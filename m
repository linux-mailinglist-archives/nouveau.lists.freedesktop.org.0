Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B353EBC31E4
	for <lists+nouveau@lfdr.de>; Wed, 08 Oct 2025 03:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E755D10E1D7;
	Wed,  8 Oct 2025 01:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jAZnJUB/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223910E1D7
 for <nouveau@lists.freedesktop.org>; Wed,  8 Oct 2025 01:48:12 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-78f30dac856so64956196d6.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 Oct 2025 18:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759888091; x=1760492891; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TPKNXPoVWIVapTzQ12kJf+A6Beka99KnxklQZoObnpI=;
 b=jAZnJUB/f0XeJ5Qt4ZvTyOLfc+H+F7InQkO4UDxrviffjC9S64rh6uF6jRP7VSq1XW
 GxcUL6qyQlazO06834cGSwadP9lSqSLc8fzCifINoRtprcwYioaPjLySBlf9no3HdTl+
 2CB+/wE4cfk012pO4QHzxhyTJqMi0c5IBmIHEs3+4+NdekpMNS34BSX2gjhnyqzcqg4F
 D3MTMFEDCBbTLc3YbsK+BivvRaEB7c+b4i92AxJluBlON0ypelOLl5dSMDyA0QmWTFJy
 J23VdadrlwyUVuWmMV67NJdpr6EsE8qvLu2WxG13E2hxhuhxn/RIb/X45r9JLMBWEH6v
 HHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759888091; x=1760492891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPKNXPoVWIVapTzQ12kJf+A6Beka99KnxklQZoObnpI=;
 b=UsHgheB8jlGQkBNYSV7j4/OrkPAwk2m/70eP+JC6sPxlWJyClqLXxw7rT0JSEnsq3X
 TT6CsEMeiJ0BwZchWTCfMGqmPnc/8WPhf5O6PyJrJ+/wGDLCKCTRvtpdn+dAx9FOnh3G
 016FwCl5cyHz+/H6q0N0TZq34dM4A1Mpxm5IX3yUMYBiD7mvm+sMwbaqGR5mfe0tCySx
 6OFF1G7JE+DOYg5IuK2f6I+XvD+LNI7vjznn+aEFYQFjiCjdSSB/qj/Lx3fjzN+sLZVL
 9F/CzHsUhwSaLU9jZJbwmoNY0bJJrGkr2TZlhiomTZvKlrqIMUgJpA2sgsf6+bk7QZ0x
 YT2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR2mK+EydxlZhrOVAwz/G3q4ZGLUq193cwWOxf5imDjf2OjwSugmX2+wwZaohXtZBqv5XppSyS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkqyJTtGkVRLYvlT7/6VPcHS99W/pH7gA6siuij2sxCuepg3VA
 LsoePS0Xv95JX9TGB8vn+lCv6scWE8LebRZ1cC2Th97rA12sVe+aFIt/ER7vzBDlKU3e+I3t+DS
 AMft6rUxrgr2IHKCRj9Aflm+Fka/vcZk=
X-Gm-Gg: ASbGncv8/OVREE4zo5mU3JIr1cTzpk1GVxYoyZ8Xb3okVvFFWW45a9fQcF9KACkJRMq
 BlTzDzlyP/ZVeYRtdIYxkL9U3RiXKnaU9NEZrkl05FUO6dMvWE5m1H6b8QMlfh3Ekt50YuylqOi
 Iw24dWqDT3bvVIR5LKktiAkm2wO2MPc3bI19HKU4Uktf6kBTiPPT/PrAIBRNFYE/a5qA4BhH0TI
 dbUwWJzb2mzeTp+/A5K/9jZ7bmoww==
X-Google-Smtp-Source: AGHT+IEGnXhIm9BuStpjqXqJRUabgz4e1Mr6JK83XrT6u8I1IOz+I9PAxqrpBgz508PzUTUm9A4df7MDDyGl/pntHkM=
X-Received: by 2002:a05:6214:29cc:b0:820:a83:eadb with SMTP id
 6a1803df08f44-87b2efb94c1mr20108616d6.43.1759888091325; Tue, 07 Oct 2025
 18:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
 <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
 <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
 <20251007152021.GA139177@pevik>
In-Reply-To: <20251007152021.GA139177@pevik>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 8 Oct 2025 11:48:00 +1000
X-Gm-Features: AS18NWA7zmxJqjASXvhMNIVKL0P3nrE-nPuonIDiJ2CeUr5S8JDkbtMk7nmiFLc
Message-ID: <CAPM=9tz_fnRxZm74C+JuxZjCbGEH66JbabN012zVNgKucrw8oA@mail.gmail.com>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
To: Petr Vorel <pvorel@suse.cz>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 8 Oct 2025 at 01:20, Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi all,
>
> > On Tue, 2025-10-07 at 13:31 +1000, Dave Airlie wrote:
> > > We can't do that, because if we moved to 580, and distros have this
> > > option on for 570, they would fail unless they had the 580 firmware,
> > > so it needs to be versioned.
>
> > Hmmm then how about making it a choice of which version to support:
>
> > choice
> >   prompt "Firmware version supported"
> >   default DRM_NOUVEAU_ANY
>
> You probably know it, in case you don't: DRM_NOUVEAU_ANY needs to be also as
> config:
>
> config DRM_NOUVEAU_ANY
>         bool "Support all firmware versions"
>         ...
>
> > config DRM_NOUVEAU_535_ONLY
> > ...
>
> > config DRM_NOUVEAU_535_ONLY
> > ...
>
> > endchoice
>
> +1
>
> > Or something like that.  I can't figure out how choices work, but the idea is that the defconfig
>
> Kind regards,
> Petr
>
> > defaults to allowing all versions, but you can pick a specific one.

I think that is getting a bit complicated for distros though. There is
no reason to ever want 535 only. We don't want to give people options
we don't actually support.

The options we have in the current driver, is you get 535 + 570, and
we give you the option to say I only need 570. If we add 580, we add
another option and fix it then, but I don't see the point in
overdesigning this for now.

Dave.

>
