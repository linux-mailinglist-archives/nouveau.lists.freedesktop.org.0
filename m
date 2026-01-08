Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5331DD0440D
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 17:16:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0655A10E79D;
	Thu,  8 Jan 2026 16:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XlJ+ejb/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 112C444C69;
	Thu,  8 Jan 2026 16:07:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767888471;
 b=mQloTUCWd5a0PPkDzrXbe1J2yTjgYf5l0H1v8ZrIW7frCZ4mzWzrHSJ4OL6xC+N9kSVyn
 yTUUyMrPgdAW1uCAbCOzSU8VDGf0/mZ84MCtwvN2clt89gJfC8N1NlDoGNgxef8vn0TiZpw
 h4gnU01wWzX6oWausrcBMR2jVaYv5YjGSOtZkn7U6OUjwvLwLBnEgdNF7VFBvXzkCBzODXq
 79nvAcItGXaOqWmW71BD6PGJwRT1XhHZ1xmD7dUPfw+/b9ruNwJ2jTcLzge7r/h62Rn1KbK
 eCWUgcCIw525kwPO00OCw4sMpz24IzgSnZJnb81UkeeGKmTkMOjj2nxsUXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767888471; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
 b=MTM0R/3RmrhqmgbpitBQIWwz7F66sJz4Ix5Fn2QgU6OMCCTqGPAx0gJhvHSZu1JNqQe12
 M+3PxaxS5T4FN9K2c8ryeli5ZmAH03Z7N5Xc2JGvkC8Ladujk6q6xK08jwLEyLNDnYDZUsq
 JRtGn5uq9vb2jhTIb8LLyORGiWDe4gZmyR5lq38wWoZAqSlTbGz6dv3d3OZvyIX49HAPJjz
 QmhTmd+UpmBUqhePW19k2hdd9zptilLXbobD1jdvF/XA8w+NmopLnPc5/PjYY4MJ9OlFrao
 lAdFSAHpoCFef7w0dbKtpgH0ndzvdmQ46c1DBy//klHWPfpUET2DObWGY5iQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5910C43AF7
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 16:07:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 156C710E798
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 16:16:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so1726496f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Jan 2026 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888965; x=1768493765;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=XlJ+ejb/F6Z9+Vo4ZX851LUZnHZhirxuNB3eYKtWQX7K6TRcL0Z5j9gnbfC/x+2OZt
         /k6Yz4L4YoNP+JKY7cxFfgK6A4PdSiODp4jvvI4QsIfJjmdQanCIrLqrSRXJCVorQebc
         lTbszpjX/lT8fbNQYtUH5xAEMcoxpjCLECPaClLnUqXsjH1AtD2qf03hSWyMTkWne9az
         L2Aba+du+8c9N29ZZASQHTVDrOUCmHiJON//OzhTKY4r+nj40jw5lJhPwCYMUri5TbdB
         UaHQ/TM2nOrk+itwX/WN4vfWY4V2SVwqaJcMdxULlEDRFwLU3J/UzH6VExVVsw2B5A3V
         XI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888965; x=1768493765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
        b=X+EYEdGa/rH4uc+WUXuUYIdv6UR2XjRP61wUodzMNlNEmhPpWjgBnu8XAbSe3wJKrI
         ON4gLWi9+5xV3eLfE+yJq06XrBqhF90KJfhSTanZA3OpRA6CM+0vh48ISV91FA0hmoE3
         ahLD8K4KXMBBAHoP33ZgnaR+QbZdw+i+GOUbsY0cGsNZg2dmfa8Bdqoe1mEdUUQWbg91
         nnTCAxwzEv9ScIOft3jAeBRLVnsj1S+WDCiYyJJ7RPmRz+7PcVqzaYReZIVcU6qNdEv/
         P4HC8z8/u10dVA5hF/tVz/u3vP1A6w6hOzwRvNhSh0016oA8MQpv2E2Me+Q6o68dzxlK
         3mrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8dyMn/mmYgaWj/8GQsQD2lJtm3DfsTBTHfMTD4FHLbAt1D+CHoCG7PewfR+InurNVrD3CboEO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzodaw4lkL3WxS+iADXaqfPEKtYl1rv7m5tOh4w8CMLbRB07klv
	8u8j1TSXzqR3cLUqXyn1RsE/2pb09+y/wAgAx5OCOSyfG7Sf+BHyz1Q6uvgC0Uwz0D9wlo3EVso
	vq4Ow6BB7Yjw24MV6fFENrL5gelQ2ii9LQ3tjhc8r
X-Gm-Gg: AY/fxX7ENkacXOPCeuTL6x8x4H7zP2InNr+RMGMgvg1W2o4Yrgoxachh+MFzB6P7Ld3
	WsSuNksHzJ47xRBaYyaG6JlIO6nVGtJzz97k2XIh/ykDKOtRbaj9oRryRZsGgixpoO2Jqu/evDZ
	Lnp7FKiTIKjj9Ew9QzFeZDILEF42eTXHTKa1YUYkjTtiO1UzLLCD+RhphfvSQf1XozFSBrKmXGY
	CrxnVhNkYr0YQU++pPTwhd3kiHjW15nTu4Iryn7Dnovs9MXgtWL6ird69Tun661SSFjZ+pgyYme
	T112LOLqQ6Jy5r3ytKo1Y+UJp+2JLvCwHCrnrkDFwXwQ7hDXdxOlDqDSrw==
X-Google-Smtp-Source: 
 AGHT+IFlwj7HPJoXMHh8QpN1Ab7H/UDknjidGuhXb0xbkpRQOk6X4xFeRXquaMOfNkP2YrRvaqkzOLHouDmVZwg+94c=
X-Received: by 2002:a05:6000:2311:b0:432:aa61:a06e with SMTP id
 ffacd0b85a97d-432c374fc59mr8831012f8f.32.1767888965176; Thu, 08 Jan 2026
 08:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 17:15:52 +0100
X-Gm-Features: AQt7F2pLnnImtkMgl2KE50d4CB3AXYote1UE4JeFi6pzxph4V_uj8MRfBo1vVss
Message-ID: 
 <CAH5fLgg36qSD7jCarKwipxTSUz4W2uiDDmL_Thqv-+8jBe5DTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NALSOYEFULEAZBSGGQG7NN4EZ3JIPAGD
X-Message-ID-Hash: NALSOYEFULEAZBSGGQG7NN4EZ3JIPAGD
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NALSOYEFULEAZBSGGQG7NN4EZ3JIPAGD/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLgg36qSD7jCarKwipxTSUz4W2uiDDmL_Thqv-+8jBe5DTw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jan 8, 2026 at 5:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> See v1 for the Rust code that uses these C changes.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - For this version, only the C prerequisites are included. Rust will be
>   sent as follow-up.

I forgot to fill out the changelog. Here it is:

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.

> - Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf2=
34e0@google.com
>
> ---
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
>       drm/gpuvm: use const for drm_gpuva_op_* ptrs
>
>  drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----=
------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
>  drivers/gpu/drm/xe/xe_vm.c             |  4 +-
>  include/drm/drm_gpuvm.h                | 12 ++---
>  8 files changed, 76 insertions(+), 49 deletions(-)
> ---
> base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
> change-id: 20251128-gpuvm-rust-b719cac27ad6
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
