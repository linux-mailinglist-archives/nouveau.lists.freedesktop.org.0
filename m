Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72FD1B95B
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 23:27:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D21E10E560;
	Tue, 13 Jan 2026 22:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQm0BXLn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE3E444CAB;
	Tue, 13 Jan 2026 22:18:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768342713;
 b=SCQHhLpOmyxb+8ukFNsoNJcPurMYuOehCexwXSAJ0O5pW3WVcLVZSQusLYkceZU8aw9M9
 decjJnwbVvLJHd0+QwxuavC0DOnuwn/vHKPl71aOgm5BGzFdzAruU0ls0v7HMJY7qysKYq0
 HVSKRInrhgnv2BVXP9+U8Wvw67ZY3HS1DTUkARqQjX/ja7ebItzS++kxlvYFFhQRednoNpu
 5vDSMM3VENHehKbgZRc+DOnPkQiabHIswKw1Z6u2stCoA6CYu/vaWUF+tHP6ryng3/WZvTz
 cvLtzECFRm36U7UWCMCnKQS8TczYBwEys+HVRB+B0fy3x2pRWqJWWTTDzjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768342713; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FPbQrO6E6LNgt6h0c8k7RPbbRO6mI1IhumUT5S5hMUI=;
 b=NRN+nVXxrmroJFK0p98hPNtBDINXQFK6qkpIDE2+1M+e9raLXxVyrYJyZpuLikG1VRqV6
 zFe329C8Nk3thPD8Mt5E+WvsOxog7th8DE4k08W5QxbiZGhpvX13CcIRUxUgHs+oNhOuIsM
 jb3R2YRW4thV5mlFKw3eFE3BpysHynLWe47LL/0JTwrqc1/mmzcmi6xx6ti9W80xMrenHFs
 S5gu6HECA84XA/eWjLHqAIl1nXulT0d0ki59dYJOXM5eLktMUOD5tWTCSxZ7QLbZvPzBa2Y
 7Fc1Dg6oVQJh8UW0SVxOhOVMyjl/GLO/XqbzFyUKKRzOUSuk1jYHkh7C3LGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4ACB644C4D
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:18:31 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE710E361
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:27:00 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-88a35a00506so115934326d6.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 13 Jan 2026 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343219; x=1768948019;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPbQrO6E6LNgt6h0c8k7RPbbRO6mI1IhumUT5S5hMUI=;
        b=VQm0BXLntfJnhilZOZ3dJc4+I5+Y01exsxo9dln5mbq/Hxs0f+vGr3LfiDGstCjOVk
         AM/0jEbmrcmMwal34R0EjzcHIbYL7TwtQpb7A/79qAoKq+EfOOyQirdC75ABnKv5S29j
         VRwvx0A35Vw9JH7lYlMI7Lvtk1ssLcuccaECEvZ/tG27cHapPbKodNKz+ePF4TYPPGzy
         piKYsEFUmulpVocOHBtQWtvfbx7KUKK/pRiYHO3QlxZ7E3o3xMuJ5PsNs2k7UH/nuPAt
         RGB4t1CjuXyIbmG0Rmdnul9yOmnavQotjQBQO9fcfrzCh0Zc+lNkLGXyiecwAcgIxbZj
         MZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343219; x=1768948019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPbQrO6E6LNgt6h0c8k7RPbbRO6mI1IhumUT5S5hMUI=;
        b=ny2OSzyVXRQtXKWeCv4ksOp8j9RPcUuUsvkXT+clTgdaDdhsewERU2Q3uvMYbushCc
         97SflrzpMiHcTM1O9W6fRjJqN7yqBMxbBwf2bu5BD1A0AkLwJxkDnF9YE8+BUA6G3DdW
         zuSnIPD/8vN60NsKM/AFJdqgXqECVIXLOUozU+O5Au3AA8T7WkvrdvqEA8CdxmBF1CIx
         Wvj7qpnk9MFSConBt8ABgoRZd823IhhWn+kLP+UHBIjx1W/lZwFrOSVrC1CtrIiraWfi
         7/HeWYndYPWwc2qpmk8fbNOd6pQvPnkiWAPBpYl+03kUOBYrx9HGnJU/sGkY5Z+uihSf
         GcHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPeOWciYloaQ+wmNnh12wQyrIrj/wyJF53eIjYcGZJySP1Go4/GoJ0IJw9Cv/VqBIWz23Q1Q8e@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4D39t6xsZ9YohV+ltKfAQT87nuE3gjxz0F0G+shwIjp1vAeaj
	czmKrYFuNBAETKN9RNweA1zIgqFj+0b541uLUaffcv+rTydaThz/TkNUcFUApiSBUHIFvVpfbQ6
	RUft/4lA9L6PHU1++vudThrOCjTcLsOg=
X-Gm-Gg: AY/fxX6iQX9u5ybJSdPCMcGjXxzvuhcz4OD3xAnNzM98WQ+MxyzMSqAk/bysK1CSJOK
	P2Lcq8s3wscDRpUwY0moWgy3rQ1sla4nwuO7gsJlP3ObbdqWFDH9bAG/oMwe0miGfKdFpisMdQ1
	BX2Y8kR6mH9aPb3hQbfqrHggA9CJw8ypggiRhpv0T74OshJmvuYytMJc3ThIHMWoLH5+XToZR/Q
	2hIebRZzu+czM+kbkUxjdjFsnE7MGN+rHQZ+wW6359fYGvKGZ8GzuhVcJitbLc2iqAtzHkvWH6X
	xZ70FCO5+gy13cxbW14BONX+OEh+gxGry4VtXt0u9otmw/eiY6yngLNw4Q6nJ6tpCQ==
X-Received: by 2002:a05:6214:2623:b0:888:89fd:a727 with SMTP id
 6a1803df08f44-892743ef0ffmr6079486d6.49.1768343219612; Tue, 13 Jan 2026
 14:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20251219215344.170852-1-lyude@redhat.com>
In-Reply-To: <20251219215344.170852-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 14 Jan 2026 08:26:47 +1000
X-Gm-Features: AZwV_QitC4C9JKRt83ui2oLTLmZ5Ebkau-oI8dlyldv-clQuwlEdMkjnegGK9cI
Message-ID: 
 <CAPM=9txG1PSR_F7s=oRTVKEPOC_XwW_o5_EqOnvX-hqcYEOoYg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau: Fix cursor-related display hang
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: O3GJW2KZ5ZAVKWQAUJOYSFR65FOXF75W
X-Message-ID-Hash: O3GJW2KZ5ZAVKWQAUJOYSFR65FOXF75W
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O3GJW2KZ5ZAVKWQAUJOYSFR65FOXF75W/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txG1PSR_F7s=oRTVKEPOC_XwW_o5_EqOnvX-hqcYEOoYg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Both look good to me,

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Sat, 20 Dec 2025 at 07:53, Lyude Paul <lyude@redhat.com> wrote:
>
> This is a fix for one of the many issues I've been finding on my brand
> new desktop. This one in particular is easy to hit if you have a cursor
> with a continously updating surface between two displays, what fun!
>
> Reminds me of a another bug from long ago=E2=80=A6
>
> Lyude Paul (2):
>   drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
>   drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in
>     nv50_head_flush_*
>
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 5 +++++
>  2 files changed, 6 insertions(+)
>
>
> base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
> --
> 2.52.0
>
